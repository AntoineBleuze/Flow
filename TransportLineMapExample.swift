import UIKit
import MapKit

// MARK: - Models

/// Représente une ligne de transport avec ses données brutes du CSV (tracé géographique)
struct TransportLineTrace {
    let routeId: String
    let routeShortName: String
    let routeLongName: String
    let routeType: String
    let routeColor: String
    let shape: String // GeoJSON en tant que String
}

// MARK: - Custom Polyline

/// CustomPolyline qui stocke la couleur pour chaque ligne de transport
class CustomPolyline: MKPolyline {
    var color: UIColor = .blue
    var lineName: String = ""
    
    /// Créer une CustomPolyline avec couleur et nom
    convenience init(coordinates: [CLLocationCoordinate2D], color: UIColor, lineName: String) {
        let coords = coordinates
        self.init(coordinates: coords, count: coords.count)
        self.color = color
        self.lineName = lineName
    }
}

// MARK: - UIColor Extension

extension UIColor {
    /// Initialise une UIColor depuis une chaîne hexadécimale (sans le #)
    /// Exemple: UIColor(hex: "3C91DC")
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Retire le # si présent
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        // Vérifie que la longueur est correcte
        guard hexString.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// MARK: - GeoJSON Parser

class GeoJSONParser {
    /// Convertit une chaîne GeoJSON en tableau de CustomPolyline
    /// IMPORTANT: Inverse les coordonnées de [lon, lat] vers [lat, lon] pour MapKit
    static func parseMultiLineString(
        geoJSONString: String,
        color: UIColor,
        lineName: String
    ) -> [CustomPolyline] {
        var polylines: [CustomPolyline] = []
        
        // Nettoie la chaîne si nécessaire (retire les échappements supplémentaires)
        let cleanedJSON = geoJSONString
            .replacingOccurrences(of: "\"\"", with: "\"")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let jsonData = cleanedJSON.data(using: .utf8) else {
            print("❌ Impossible de convertir la chaîne en Data")
            return polylines
        }
        
        do {
            let geoJSON = try JSONDecoder().decode(GeoJSONShape.self, from: jsonData)
            
            // Vérifie que c'est bien un MultiLineString
            guard geoJSON.type == "MultiLineString" else {
                print("⚠️ Type GeoJSON non supporté: \(geoJSON.type)")
                return polylines
            }
            
            // Parcourt chaque LineString dans le MultiLineString
            for lineString in geoJSON.coordinates {
                var coordinates: [CLLocationCoordinate2D] = []
                
                // Convertit chaque paire [longitude, latitude] en CLLocationCoordinate2D
                for point in lineString {
                    guard point.count >= 2 else { continue }
                    
                    let longitude = point[0]
                    let latitude = point[1]
                    
                    // ⚠️ IMPORTANT: Inversion des coordonnées GeoJSON vers MapKit
                    // GeoJSON: [longitude, latitude]
                    // MapKit: (latitude, longitude)
                    let coordinate = CLLocationCoordinate2D(
                        latitude: latitude,
                        longitude: longitude
                    )
                    coordinates.append(coordinate)
                }
                
                // Crée la CustomPolyline si on a au moins 2 points
                if coordinates.count >= 2 {
                    let polyline = CustomPolyline(
                        coordinates: coordinates,
                        color: color,
                        lineName: lineName
                    )
                    polylines.append(polyline)
                }
            }
            
            print("✅ Parsé \(polylines.count) polyline(s) pour la ligne \(lineName)")
            
        } catch {
            print("❌ Erreur de décodage JSON: \(error)")
        }
        
        return polylines
    }
}

// MARK: - CSV Parser

class TransportLineCSVParser {
    /// Parse une ligne CSV en tenant compte des guillemets et virgules échappées
    static func parseCSVLine(_ line: String) -> [String] {
        var fields: [String] = []
        var currentField = ""
        var insideQuotes = false
        
        for char in line {
            if char == "\"" {
                insideQuotes.toggle()
            } else if char == ";" && !insideQuotes {
                fields.append(currentField)
                currentField = ""
            } else {
                currentField.append(char)
            }
        }
        fields.append(currentField) // Dernier champ
        
        return fields
    }
    
    /// Parse le fichier CSV complet et retourne un tableau de TransportLineTrace
    static func parseTransportLinesCSV(csvContent: String) -> [TransportLineTrace] {
        var lines: [TransportLineTrace] = []
        let rows = csvContent.components(separatedBy: .newlines)
        
        // Ignore la première ligne (header) et les lignes vides
        for row in rows.dropFirst() where !row.isEmpty {
            let fields = parseCSVLine(row)
            
            // Vérifie qu'on a assez de colonnes
            guard fields.count >= 7 else { continue }
            
            let transportLine = TransportLineTrace(
                routeId: fields[0],
                routeShortName: fields[1],
                routeLongName: fields[2],
                routeType: fields[3],
                routeColor: fields[4],
                shape: fields[6] // Colonne 7 (index 6)
            )
            
            lines.append(transportLine)
        }
        
        return lines
    }
}

// MARK: - Map View Controller

class TransportMapViewController: UIViewController {
    
    private let mapView = MKMapView()
    private var transportLines: [TransportLineTrace] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        
        // 🎯 SIMULATION: Charge une ligne de démonstration
        loadSimulatedData()
    }
    
    // MARK: - Setup
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mapView.delegate = self
        
        // Centre sur Paris
        let parisCoordinate = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let region = MKCoordinateRegion(
            center: parisCoordinate,
            latitudinalMeters: 15000,
            longitudinalMeters: 15000
        )
        mapView.setRegion(region, animated: false)
    }
    
    // MARK: - Data Loading
    
    /// Simulation avec une ligne hardcodée pour démonstration
    private func loadSimulatedData() {
        // Exemple de ligne T9 du CSV
        let simulatedGeoJSON = """
        {"coordinates": [[[2.365, 48.819], [2.368, 48.815], [2.370, 48.812]]], "type": "MultiLineString"}
        """
        
        let simulatedLine = TransportLineTrace(
            routeId: "IDFM:C02317",
            routeShortName: "T9",
            routeLongName: "T9",
            routeType: "Tram",
            routeColor: "3C91DC",
            shape: simulatedGeoJSON
        )
        
        transportLines = [simulatedLine]
        
        // Affiche les lignes sur la carte
        displayTransportLines()
    }
    
    /// Méthode alternative pour charger depuis un fichier CSV réel
    private func loadFromCSVFile(named fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "csv"),
              let csvContent = try? String(contentsOfFile: path) else {
            print("❌ Impossible de lire le fichier CSV")
            return
        }
        
        transportLines = TransportLineCSVParser.parseTransportLinesCSV(csvContent: csvContent)
        displayTransportLines()
    }
    
    // MARK: - Display
    
    /// Affiche toutes les lignes de transport sur la carte
    private func displayTransportLines() {
        for line in transportLines {
            // Récupère la couleur
            let color = UIColor(hex: line.routeColor) ?? .blue
            
            // Parse le GeoJSON et crée les polylines
            let polylines = GeoJSONParser.parseMultiLineString(
                geoJSONString: line.shape,
                color: color,
                lineName: line.routeShortName
            )
            
            // Ajoute les polylines à la carte
            mapView.addOverlays(polylines)
        }
    }
}

// MARK: - MKMapViewDelegate

extension TransportMapViewController: MKMapViewDelegate {
    
    /// Configure le renderer pour chaque overlay (polyline)
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let customPolyline = overlay as? CustomPolyline {
            let renderer = MKPolylineRenderer(polyline: customPolyline)
            renderer.strokeColor = customPolyline.color
            renderer.lineWidth = 4.0
            renderer.lineCap = .round
            renderer.lineJoin = .round
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}

// MARK: - Usage Example in AppDelegate or SceneDelegate

/*
 Pour utiliser ce code dans votre app:
 
 1. Dans SceneDelegate.swift ou AppDelegate.swift:
 
    let mapVC = TransportMapViewController()
    window?.rootViewController = UINavigationController(rootViewController: mapVC)
 
 2. Pour charger depuis un vrai fichier CSV:
 
    // Dans viewDidLoad(), remplacez loadSimulatedData() par:
    loadFromCSVFile(named: "traces-des-lignes-de-transport-en-commun-idfm")
 
 3. Assurez-vous d'ajouter le fichier CSV à votre bundle Xcode
 */
