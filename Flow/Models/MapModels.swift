import Combine
import SwiftData
import CoreLocation
import Foundation
import MapKit
import SwiftUI

#if canImport(UIKit)
    import UIKit
    public typealias MapPlatformColor = UIColor
#elseif canImport(AppKit)
    import AppKit
    public typealias MapPlatformColor = NSColor
#endif

// Classe personnalisée pour les polylines avec couleur et nom
nonisolated public class ColoredPolyline: MKPolyline, @unchecked Sendable {
    var color: MapPlatformColor = .blue
    var lineName: String = ""
    var isDashed: Bool = false
    var isCasing: Bool = false
    var status: LineStatus = .normal
    var type: TransportType = .metro
}

// Note: TransportType est déjà défini dans TransportModels.swift
// On utilise celui-là.

// Modèle pour un tracé de ligne
nonisolated struct LineTrace: Identifiable, @unchecked Sendable {
    let id: String
    let name: String
    let color: Color
    let polylines: [MKPolyline]  // Utilisation directe de MKPolyline
    let type: TransportType
    let isDashed: Bool

    nonisolated init(id: String, name: String, color: Color, polylines: [MKPolyline], type: TransportType, isDashed: Bool = false) {
        self.id = id
        self.name = name
        self.color = color
        self.polylines = polylines
        self.type = type
        self.isDashed = isDashed
    }
}

// Cache-friendly version of LineTrace (Codable)
nonisolated struct CacheableLineTrace: Codable, Sendable {
    let id: String
    let name: String
    let colorHex: String
    let typeRawValue: String
    let coordinates: [[[Double]]]  // Array of polylines, each polyline is array of [lon, lat]
    let isDashed: Bool?

    nonisolated init(from lineTrace: LineTrace) {
        self.id = lineTrace.id
        self.name = lineTrace.name
        self.colorHex = lineTrace.color.toHex() ?? "0000FF"
        self.typeRawValue = lineTrace.type.rawValue
        self.coordinates = lineTrace.polylines.map { polyline in
            (0..<polyline.pointCount).map { i in
                let coord = polyline.points()[i].coordinate
                return [coord.longitude, coord.latitude]
            }
        }
        self.isDashed = lineTrace.isDashed
    }

    nonisolated func toLineTrace() -> LineTrace {
        let polylines = coordinates.map { coords -> MKPolyline in
            let clCoords = coords.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
            return MKPolyline(coordinates: clCoords, count: clCoords.count)
        }
        return LineTrace(
            id: id,
            name: name,
            color: Color(hex: colorHex),
            polylines: polylines,
            type: TransportType(rawValue: typeRawValue) ?? .metro,
            isDashed: isDashed ?? false
        )
    }
}

// Modèle pour une ligne passant par une station
nonisolated struct StationLine: Hashable, Identifiable, Codable, Sendable {
    nonisolated var id: String { name + type.rawValue }
    let name: String
    let type: TransportType

    nonisolated init(name: String, type: TransportType) {
        self.name = name
        self.type = type
    }

    nonisolated var assetName: String {
        switch type {
        case .metro:
            var fixedId = name
            if name == "3B" || name == "3b" { fixedId = "3bis" }
            else if name == "7B" || name == "7b" { fixedId = "7bis" }
            return "metro\(fixedId)"
        case .tram:
            var fixedId = name
            if fixedId.uppercased() == "T3A" || fixedId.uppercased() == "3A" {
                fixedId = "3a"
            } else if fixedId.uppercased() == "T3B" || fixedId.uppercased() == "3B" {
                fixedId = "3b"
            }
            let cleanNumber = fixedId.replacingOccurrences(of: "T", with: "", options: .caseInsensitive)
            return "T\(cleanNumber)"
        case .rer:
            return "rer\(name.uppercased())"
        case .transilien, .train:
            return "transilien\(name.uppercased())"
        case .cable:
            if name.contains("1") {
                return "Cable1"
            }
            return "Cable"
        case .bus:
            return "bus\(name)"
        }
    }
}

// Modèle pour un arrêt (Quai individuel)
struct StopPoint: Identifiable, Codable, Sendable {
    let id: String  // UUID (Généré pour l'arrêt physique)
    let stopAreaId: String  // ID de la zone d'arrêt (pour API)
    let name: String
    let latitude: Double
    let longitude: Double
    let type: TransportType
    let lineName: String  // Nom de la ligne (ex: "1", "A")

    nonisolated var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    nonisolated init(id: String, stopAreaId: String, name: String, coordinate: CLLocationCoordinate2D, type: TransportType, lineName: String) {
        self.id = id
        self.stopAreaId = stopAreaId
        self.name = name
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.type = type
        self.lineName = lineName
    }
}

// Modèle pour une Station (Regroupement d'arrêts)
struct MapStation: Identifiable, Equatable, Codable, Sendable {
    let id: String  // ID de la zone d'arrêt (IDFM:Cxxxxx)
    let name: String
    let latitude: Double
    let longitude: Double
    let platforms: [StopPoint]  // Liste des quais
    let isHub: Bool
    let mainType: TransportType  // Type principal pour l'affichage (ex: Métro gagne sur Bus)
    let lines: [StationLine]  // Lignes desservant la station
    let city: String? // Ville de la station
    var prioritizedLine: StationLine? = nil  // Ligne cliquée à afficher en priorité

    nonisolated var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    nonisolated init(
        id: String,
        name: String,
        coordinate: CLLocationCoordinate2D,
        platforms: [StopPoint],
        isHub: Bool,
        mainType: TransportType,
        lines: [StationLine],
        city: String? = nil,
        prioritizedLine: StationLine? = nil
    ) {
        self.id = id
        self.name = name
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.platforms = platforms
        self.isHub = isHub
        self.mainType = mainType
        self.lines = lines
        self.city = city
        self.prioritizedLine = prioritizedLine
    }

    static func == (lhs: MapStation, rhs: MapStation) -> Bool {
        return lhs.id == rhs.id && lhs.prioritizedLine == rhs.prioritizedLine
    }
}

// Service de données pour la carte
@MainActor
class MapDataService: ObservableObject {
    static let shared = MapDataService()

    @Published var lines: [LineTrace] = []
    @Published var visibleStations: [MapStation] = []  // Stations visibles sur la carte
    @Published var majorHubs: [MapStation] = []  // Pôles majeurs regroupés
    @Published var hasCenteredOnUser: Bool = false
    @Published var externalSelection: MapStation?  // Pour déclencher une sélection depuis l'extérieur (Recherche)
    @Published var loadingProgress: Double = 0.0

    @Published var activeCategories: Set<String> = ["Métro", "RER / Train", "Tram", "Bus"]

    func isLineTypeEnabled(_ type: TransportType) -> Bool {
        switch type {
        case .metro:
            return activeCategories.contains("Métro")
        case .rer, .transilien, .train:
            return activeCategories.contains("RER / Train")
        case .tram:
            return activeCategories.contains("Tram")
        case .bus:
            return activeCategories.contains("Bus")
        case .cable:
            return true
        }
    }

    func selectStation(_ station: MapStation) {
        DispatchQueue.main.async {
            self.externalSelection = station
        }
    }

    // Stockage de toutes les stations pour le filtrage
    @Published var allStations: [MapStation] = []
    
    // Stockage de toutes les stations non fusionnées (pour zoom élevé)
    @Published var unmergedStations: [MapStation] = []

    // Compteur incrémenté après chaque mise à jour / snap des stations
    @Published var stationsRevision: Int = 0

    // Cache des couleurs de lignes (Nom -> Couleur)
    var lineColorCache: [String: Color] = [:]

    // Cache des overlays complets (Calculés une seule fois pour éviter le freeze au chargement)
    @Published var cachedOverlays: [ColoredPolyline] = []

    nonisolated private var cacheURL: URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent("lineTraces.json")
    }

    nonisolated private var stationsCacheURL: URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent("stationsCache_SwiftData_v4.json")
    }

    nonisolated private var colorsCacheURL: URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent("lineColorsCache.json")
    }

    private init() {
        // loadData() is called explicitly from the loading screen
    }

    // MARK: - Cache

    nonisolated struct CacheableStations: Codable {
        let unmergedStations: [MapStation]
        let allStations: [MapStation]
    }

    nonisolated private func loadStationsFromCache() -> Bool {
        guard FileManager.default.fileExists(atPath: stationsCacheURL.path) else { return false }
        do {
            let data = try Data(contentsOf: stationsCacheURL)
            let cached = try JSONDecoder().decode(CacheableStations.self, from: data)
            print("✅ Loaded stations from cache: \(cached.allStations.count) stations, \(cached.unmergedStations.count) unmerged")
            
            self.loadColorsFromCache()
            
            DispatchQueue.main.async {
                self.unmergedStations = cached.unmergedStations
                self.allStations = cached.allStations
                self.visibleStations = cached.allStations
                self.majorHubs = cached.allStations.filter { $0.isHub }
                self.stationsRevision += 1
            }
            return true
        } catch {
            print("⚠️ Cache stations read error: \(error)")
            return false
        }
    }

    func cacheColors(from departures: [Departure]) {
        var changed = false
        for dep in departures {
            guard let label = dep.displayInformations.label ?? dep.displayInformations.code,
                  let colorHex = dep.displayInformations.color else { continue }
            
            let cleanHex = colorHex.replacingOccurrences(of: "#", with: "").uppercased()
            if cleanHex == "FFFFFF" || cleanHex == "000000" || cleanHex == "808080" || cleanHex == "CECECE" || cleanHex == "CCCCCC" {
                continue
            }
            let color = Color(hex: cleanHex)
            if self.lineColorCache[label] != color {
                self.lineColorCache[label] = color
                changed = true
            }
        }
        if changed {
            self.saveColorsToCache()
        }
    }

    func cacheColorsFromDisruptions(_ disruptions: [Disruption]) {
        var changed = false
        for disruption in disruptions {
            guard let impactedObjects = disruption.impactedObjects else { continue }
            for obj in impactedObjects {
                guard let line = obj.ptObject?.line,
                      let label = line.code ?? line.name,
                      let colorHex = line.color else { continue }
                
                let cleanHex = colorHex.replacingOccurrences(of: "#", with: "").uppercased()
                if cleanHex == "FFFFFF" || cleanHex == "000000" || cleanHex == "808080" || cleanHex == "CECECE" || cleanHex == "CCCCCC" {
                    continue
                }
                let color = Color(hex: cleanHex)
                if self.lineColorCache[label] != color {
                    self.lineColorCache[label] = color
                    changed = true
                }
            }
        }
        if changed {
            self.saveColorsToCache()
        }
    }

    nonisolated private func loadColorsFromCache() {
        if FileManager.default.fileExists(atPath: colorsCacheURL.path) {
            do {
                let data = try Data(contentsOf: colorsCacheURL)
                let dict = try JSONDecoder().decode([String: String].self, from: data)
                var parsedColors: [String: Color] = [:]
                for (name, hex) in dict {
                    let cleanHex = hex.replacingOccurrences(of: "#", with: "").uppercased()
                    if cleanHex == "FFFFFF" || cleanHex == "000000" || cleanHex == "808080" || cleanHex == "CECECE" || cleanHex == "CCCCCC" {
                        continue
                    }
                    parsedColors[name] = Color(hex: hex)
                }
                DispatchQueue.main.async {
                    for (name, color) in parsedColors {
                        self.lineColorCache[name] = color
                    }
                    print("✅ Loaded \(dict.count) colors from cache")
                }
            } catch {
                print("⚠️ Colors cache read error: \(error)")
            }
        }
        
        // Toujours précharger les couleurs des bus
        self.preloadBusColors()
    }

    private func saveColorsToCache() {
        var dict: [String: String] = [:]
        for (name, color) in lineColorCache {
            if let hex = color.toHex() {
                dict[name] = hex
            }
        }
        do {
            let data = try JSONEncoder().encode(dict)
            try data.write(to: colorsCacheURL)
            print("✅ Saved \(dict.count) colors to cache")
        } catch {
            print("⚠️ Colors cache write error: \(error)")
        }
    }

    nonisolated private func preloadBusColors() {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = Bundle.main.url(forResource: "referentiel-des-lignes", withExtension: "geojson") else {
                print("⚠️ Fichier referentiel-des-lignes.geojson introuvable.")
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let referentiel = try JSONDecoder().decode(ReferentielLignes.self, from: data)
                
                // Groupes de couleurs prédéfinis
                struct PredefinedColor {
                    let hex: String
                    let color: Color
                    let r: Double
                    let g: Double
                    let b: Double
                    
                    init(hex: String) {
                        self.hex = hex
                        self.color = Color(hex: hex)
                        
                        let cleanHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
                        var int: UInt64 = 0
                        Scanner(string: cleanHex).scanHexInt64(&int)
                        self.r = Double((int >> 16) & 0xFF) / 255.0
                        self.g = Double((int >> 8) & 0xFF) / 255.0
                        self.b = Double(int & 0xFF) / 255.0
                    }
                }
                
                let colorGroups = [
                    PredefinedColor(hex: "008B5E"), // Bus Vert RATP (Standard)
                    PredefinedColor(hex: "0A1C3F"), // Bus Bleu Foncé (Noctilien)
                    PredefinedColor(hex: "3C91DC"), // Bus Bleu Clair (Express)
                    PredefinedColor(hex: "FF5A00"), // Bus Orange
                    PredefinedColor(hex: "E3051C"), // Bus Rouge
                    PredefinedColor(hex: "662583"), // Bus Violet
                    PredefinedColor(hex: "FFCD00"), // Bus Jaune
                    PredefinedColor(hex: "808080")  // Bus Gris
                ]
                
                func closestGroupColor(r: Double, g: Double, b: Double) -> Color {
                    var minDistance = Double.infinity
                    var closestColor = colorGroups[0].color
                    
                    for predefined in colorGroups {
                        let dr = predefined.r - r
                        let dg = predefined.g - g
                        let db = predefined.b - b
                        let distance = dr*dr + dg*dg + db*db
                        
                        if distance < minDistance {
                            minDistance = distance
                            closestColor = predefined.color
                        }
                    }
                    return closestColor
                }
                
                func parseRGB(from hexStr: String) -> (r: Double, g: Double, b: Double)? {
                    let cleanHex = hexStr.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
                    var int: UInt64 = 0
                    guard Scanner(string: cleanHex).scanHexInt64(&int) else { return nil }
                    
                    let r, g, b: UInt64
                    switch cleanHex.count {
                    case 3:
                        (r, g, b) = (((int >> 8) & 0xF) * 17, ((int >> 4) & 0xF) * 17, (int & 0xF) * 17)
                    case 6:
                        (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
                    default:
                        return nil
                    }
                    return (Double(r) / 255.0, Double(g) / 255.0, Double(b) / 255.0)
                }
                
                var tempColors: [String: Color] = [:]
                for feature in referentiel.features {
                    let props = feature.properties
                    guard let mode = props.transportmode, mode.lowercased() == "bus" else { continue }
                    guard let name = props.shortname_line, !name.isEmpty else { continue }
                    guard let hex = props.colourweb_hexa, !hex.isEmpty else { continue }
                    
                    if let rgb = parseRGB(from: hex) {
                        let upperHex = hex.uppercased().replacingOccurrences(of: "#", with: "")
                        let isNeutral = (rgb.r == rgb.g && rgb.g == rgb.b) || upperHex == "FFFFFF" || upperHex == "000000" || upperHex == "808080" || upperHex == "CECECE" || upperHex == "CCCCCC"
                        if !isNeutral {
                            let groupedColor = closestGroupColor(r: rgb.r, g: rgb.g, b: rgb.b)
                            tempColors[name] = groupedColor
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    var count = 0
                    for (name, color) in tempColors {
                        if self.lineColorCache[name] == nil {
                            self.lineColorCache[name] = color
                            count += 1
                        }
                    }
                    print("🚌 [Preload Colors] \(count) couleurs de lignes de bus préchargées et regroupées depuis le référentiel.")
                }
            } catch {
                print("⚠️ Erreur lors du préchargement des couleurs de bus: \(error)")
            }
        }
    }

    nonisolated static func clusterStops(_ stops: [StopPoint], maxDistance: CLLocationDistance) -> [[StopPoint]] {
        var clusters: [[StopPoint]] = []
        for stop in stops {
            var added = false
            for i in 0..<clusters.count {
                let clusterStops = clusters[i]
                let centroidLat = clusterStops.reduce(0.0) { $0 + $1.coordinate.latitude } / Double(clusterStops.count)
                let centroidLon = clusterStops.reduce(0.0) { $0 + $1.coordinate.longitude } / Double(clusterStops.count)
                
                let centroidLocation = CLLocation(latitude: centroidLat, longitude: centroidLon)
                let stopLocation = CLLocation(latitude: stop.coordinate.latitude, longitude: stop.coordinate.longitude)
                
                if stopLocation.distance(from: centroidLocation) < maxDistance {
                    clusters[i].append(stop)
                    added = true
                    break
                }
            }
            if !added {
                clusters.append([stop])
            }
        }
        return clusters
    }

    nonisolated private func loadTracesFromCache() -> Bool {
        guard FileManager.default.fileExists(atPath: cacheURL.path) else { return false }
        do {
            let data = try Data(contentsOf: cacheURL)
            let cached = try JSONDecoder().decode([CacheableLineTrace].self, from: data)
            let traces = cached.map { $0.toLineTrace() }
            print("✅ Loaded \(traces.count) lines from cache")
            
            DispatchQueue.main.async {
                self.lines = traces
                for line in traces {
                    self.lineColorCache[line.name] = line.color
                }
                // Inject hardcoded fallback colors
                for (name, hex) in self.hardcodedColors {
                    if self.lineColorCache[name] == nil {
                        self.lineColorCache[name] = Color(hex: hex)
                    }
                }
                // Déclencher le calcul des overlays
                Task {
                    await self.precalculateOverlays()
                }
            }
            return true
        } catch {
            print("⚠️ Cache read error: \(error)")
            return false
        }
    }

    private func saveTracesToCache(_ traces: [LineTrace]) {
        let cacheable = traces.map { CacheableLineTrace(from: $0) }
        do {
            let data = try JSONEncoder().encode(cacheable)
            try data.write(to: cacheURL)
            print("✅ Saved \(traces.count) lines to cache")
        } catch {
            print("⚠️ Cache write error: \(error)")
        }
    }

    func loadPreviewMockData() {
        let metro1Color = Color(hex: "FFCD00")
        let metro4Color = Color(hex: "CF009E")
        let metro14Color = Color(hex: "662583")
        let rerAColor = Color(hex: "E3051C")
        
        self.lineColorCache["1"] = metro1Color
        self.lineColorCache["4"] = metro4Color
        self.lineColorCache["14"] = metro14Color
        self.lineColorCache["A"] = rerAColor
        
        let l1 = StationLine(name: "1", type: .metro)
        let l4 = StationLine(name: "4", type: .metro)
        let l14 = StationLine(name: "14", type: .metro)
        let rera = StationLine(name: "A", type: .rer)
        
        let sampleStations: [MapStation] = [
            MapStation(
                id: "mock_chatelet",
                name: "Châtelet - Les Halles",
                coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3475),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l1, l4, l14, rera],
                city: "Paris"
            ),
            MapStation(
                id: "mock_gdl",
                name: "Gare de Lyon",
                coordinate: CLLocationCoordinate2D(latitude: 48.8448, longitude: 2.3735),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l1, l14, rera],
                city: "Paris"
            ),
            MapStation(
                id: "mock_bastille",
                name: "Bastille",
                coordinate: CLLocationCoordinate2D(latitude: 48.8531, longitude: 2.3698),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l1],
                city: "Paris"
            ),
            MapStation(
                id: "mock_hotel_de_ville",
                name: "Hôtel de Ville",
                coordinate: CLLocationCoordinate2D(latitude: 48.8574, longitude: 2.3524),
                platforms: [],
                isHub: false,
                mainType: .metro,
                lines: [l1],
                city: "Paris"
            ),
            MapStation(
                id: "mock_palais_royal",
                name: "Palais Royal - Musée du Louvre",
                coordinate: CLLocationCoordinate2D(latitude: 48.8625, longitude: 2.3364),
                platforms: [],
                isHub: false,
                mainType: .metro,
                lines: [l1],
                city: "Paris"
            ),
            MapStation(
                id: "mock_concorde",
                name: "Concorde",
                coordinate: CLLocationCoordinate2D(latitude: 48.8656, longitude: 2.3212),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l1],
                city: "Paris"
            ),
            MapStation(
                id: "mock_st_michel",
                name: "Saint-Michel Notre-Dame",
                coordinate: CLLocationCoordinate2D(latitude: 48.8534, longitude: 2.3444),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l4],
                city: "Paris"
            ),
            MapStation(
                id: "mock_odeon",
                name: "Odéon",
                coordinate: CLLocationCoordinate2D(latitude: 48.8522, longitude: 2.3386),
                platforms: [],
                isHub: false,
                mainType: .metro,
                lines: [l4],
                city: "Paris"
            ),
            MapStation(
                id: "mock_st_germain",
                name: "Saint-Germain-des-Prés",
                coordinate: CLLocationCoordinate2D(latitude: 48.8538, longitude: 2.3333),
                platforms: [],
                isHub: false,
                mainType: .metro,
                lines: [l4],
                city: "Paris"
            ),
            MapStation(
                id: "mock_montparnasse",
                name: "Montparnasse - Bienvenüe",
                coordinate: CLLocationCoordinate2D(latitude: 48.8421, longitude: 2.3219),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l4],
                city: "Paris"
            ),
            MapStation(
                id: "mock_st_lazare",
                name: "Gare Saint-Lazare",
                coordinate: CLLocationCoordinate2D(latitude: 48.8756, longitude: 2.3256),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l14],
                city: "Paris"
            ),
            MapStation(
                id: "mock_etoile",
                name: "Charles de Gaulle - Étoile",
                coordinate: CLLocationCoordinate2D(latitude: 48.8738, longitude: 2.2950),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l1, rera],
                city: "Paris"
            ),
            MapStation(
                id: "mock_defense",
                name: "La Défense",
                coordinate: CLLocationCoordinate2D(latitude: 48.8918, longitude: 2.2378),
                platforms: [],
                isHub: true,
                mainType: .rer,
                lines: [l1, rera],
                city: "Puteaux"
            ),
            MapStation(
                id: "mock_nation",
                name: "Nation",
                coordinate: CLLocationCoordinate2D(latitude: 48.8484, longitude: 2.3959),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [l1, rera],
                city: "Paris"
            )
        ]
        
        self.allStations = sampleStations
        self.unmergedStations = sampleStations
        self.visibleStations = sampleStations
        self.majorHubs = sampleStations.filter { $0.isHub }
        
        let m1Coords = [
            CLLocationCoordinate2D(latitude: 48.8918, longitude: 2.2378),
            CLLocationCoordinate2D(latitude: 48.8738, longitude: 2.2950),
            CLLocationCoordinate2D(latitude: 48.8656, longitude: 2.3212),
            CLLocationCoordinate2D(latitude: 48.8625, longitude: 2.3364),
            CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3475),
            CLLocationCoordinate2D(latitude: 48.8574, longitude: 2.3524),
            CLLocationCoordinate2D(latitude: 48.8531, longitude: 2.3698),
            CLLocationCoordinate2D(latitude: 48.8448, longitude: 2.3735),
            CLLocationCoordinate2D(latitude: 48.8484, longitude: 2.3959)
        ]
        let m4Coords = [
            CLLocationCoordinate2D(latitude: 48.8809, longitude: 2.3553),
            CLLocationCoordinate2D(latitude: 48.8697, longitude: 2.3537),
            CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3475),
            CLLocationCoordinate2D(latitude: 48.8534, longitude: 2.3444),
            CLLocationCoordinate2D(latitude: 48.8522, longitude: 2.3386),
            CLLocationCoordinate2D(latitude: 48.8538, longitude: 2.3333),
            CLLocationCoordinate2D(latitude: 48.8421, longitude: 2.3219)
        ]
        let m14Coords = [
            CLLocationCoordinate2D(latitude: 48.8756, longitude: 2.3256),
            CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3475),
            CLLocationCoordinate2D(latitude: 48.8448, longitude: 2.3735)
        ]
        let rerACoords = [
            CLLocationCoordinate2D(latitude: 48.8918, longitude: 2.2378),
            CLLocationCoordinate2D(latitude: 48.8738, longitude: 2.2950),
            CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3475),
            CLLocationCoordinate2D(latitude: 48.8448, longitude: 2.3735),
            CLLocationCoordinate2D(latitude: 48.8484, longitude: 2.3959)
        ]
        
        let p1 = ColoredPolyline(coordinates: m1Coords, count: m1Coords.count)
        p1.color = MapPlatformColor(metro1Color)
        p1.lineName = "1"
        p1.type = .metro
        
        let p4 = ColoredPolyline(coordinates: m4Coords, count: m4Coords.count)
        p4.color = MapPlatformColor(metro4Color)
        p4.lineName = "4"
        p4.type = .metro
        
        let p14 = ColoredPolyline(coordinates: m14Coords, count: m14Coords.count)
        p14.color = MapPlatformColor(metro14Color)
        p14.lineName = "14"
        p14.type = .metro
        
        let pra = ColoredPolyline(coordinates: rerACoords, count: rerACoords.count)
        pra.color = MapPlatformColor(rerAColor)
        pra.lineName = "A"
        pra.type = .rer
        
        self.cachedOverlays = [p1, p4, p14, pra]
        
        let t1 = LineTrace(id: "1", name: "1", color: metro1Color, polylines: [p1], type: .metro)
        let t4 = LineTrace(id: "4", name: "4", color: metro4Color, polylines: [p4], type: .metro)
        let t14 = LineTrace(id: "14", name: "14", color: metro14Color, polylines: [p14], type: .metro)
        let tra = LineTrace(id: "A", name: "A", color: rerAColor, polylines: [pra], type: .rer)
        self.lines = [t1, t4, t14, tra]
    }

    func loadData() {
        #if DEBUG
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            let tracesLoaded = self.loadTracesFromCache()
            let stationsLoaded = self.loadStationsFromCache()
            if !tracesLoaded || !stationsLoaded || self.allStations.isEmpty {
                self.loadPreviewMockData()
            }
            loadingProgress = 1.0
            return
        }
        #endif
        loadingProgress = 0.0
        
        // Précharger les couleurs de bus
        self.preloadBusColors()
        
        let container = SwiftDataStack.shared.container
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        let cachedVersion = UserDefaults.standard.string(forKey: "cached_data_version")
        let tracesVersion = "v7_parallel_crossings"
        let cachedTracesVersion = UserDefaults.standard.string(forKey: "cached_traces_version")
        if cachedVersion != appVersion || cachedTracesVersion != tracesVersion {
            print("🔄 Nouvelle version de l'application ou des tracés détectée (\(cachedVersion ?? "aucune") -> \(appVersion), \(cachedTracesVersion ?? "aucune") -> \(tracesVersion)). Purge du cache...")
            try? FileManager.default.removeItem(at: cacheURL)
            try? FileManager.default.removeItem(at: stationsCacheURL)
            UserDefaults.standard.set(appVersion, forKey: "cached_data_version")
            UserDefaults.standard.set(tracesVersion, forKey: "cached_traces_version")
        }

        DispatchQueue.global(qos: .userInitiated).async {
            // Tenter le chargement depuis le cache unifié
            let tracesLoaded = self.loadTracesFromCache()
            let stationsLoaded = self.loadStationsFromCache()
            
            if tracesLoaded && stationsLoaded {
                print("⚡️ Unified cache hit! Chargement instantané réussi.")
                DispatchQueue.main.async {
                    self.loadingProgress = 1.0
                }
                return
            }
            
            // Sinon, chargement froid complet
            print("⏳ Unified cache miss. Démarrage du chargement froid...")
            // S'assurer que les caches partiels sont nettoyés pour éviter des états incohérents
            try? FileManager.default.removeItem(at: self.cacheURL)
            try? FileManager.default.removeItem(at: self.stationsCacheURL)
            
            self.loadTracesCold()
            DispatchQueue.main.async {
                MapDataService.shared.loadingProgress = 0.2
            }
            self.loadAdditionalTracesCold()  // Chargement du Câble 1 depuis le CSV
            DispatchQueue.main.async {
                MapDataService.shared.loadingProgress = 0.3
            }
            self.loadStopsCold(container: container)
        }
    }

    private let hardcodedColors: [String: String] = [
        "A": "E3051C", "B": "5291CE", "C": "FFCE00", "D": "00643C", "E": "B2559C",
        "H": "8D5E2A", "J": "D5C900", "K": "9F9825", "L": "C9AED0", "N": "00A88F",
        "P": "F28E42", "R": "F3A4BA", "U": "B90845", "V": "9F9825",
        "1": "FFCD00", "2": "003CA6", "3": "837902", "3bis": "6EC4E8", "3BIS": "6EC4E8", "4": "CF009E",
        "5": "FF7E2E", "6": "6ECA97", "7": "FA9ABA", "7bis": "6ECA97", "7BIS": "6ECA97", "8": "E19BDF",
        "9": "B6BD00", "10": "C9910D", "11": "704B1C", "12": "007852", "13": "6EC4E8",
        "14": "62259D", "15": "A50034", "16": "FF82B4", "17": "D2D200", "18": "00A092",
    ]

    nonisolated private func loadTracesCold() {
        // Cache miss - parse from GeoJSON
        struct Feature: Codable {
            let geometry: Geometry
            let properties: Properties
        }

        struct Geometry: Codable {
            let coordinates: [[Double]]  // LineString: array de points [lon, lat]
            let type: String
        }

        struct Properties: Codable {
            let res_com: String  // Nom de la ligne (ex: "METRO 1", "RER A", "TRAM 3a")
            let colourweb_hexa: String?  // Couleur hex
            let mode: String?  // Type de transport
        }

        struct FeatureCollection: Codable {
            let features: [Feature]
        }

        // Charger le fichier réseau unifié
        guard
            let url = Bundle.main.url(
                forResource: "traces-du-reseau-ferre-idf", withExtension: "geojson")
        else {
            print("⚠️ Fichier traces-du-reseau-ferre-idf.geojson non trouvé")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let collection = try JSONDecoder().decode(FeatureCollection.self, from: data)

            print(
                "📊 Parsing traces-du-reseau-ferre-idf.geojson: \(collection.features.count) features"
            )

            // Dictionnaire pour regrouper par nom de ligne ET type
            // Clé: "TYPE_NOM" (ex: "METRO_7", "TRAM_7") pour éviter les conflits de couleur
            var lineGroups:
                [String: (color: String, type: String, lineName: String, polylines: [MKPolyline])] =
                    [:]

            for feature in collection.features {
                let fullName = feature.properties.res_com

                // Extraire le nom court de la ligne (ex: "METRO 1" -> "1", "RER A" -> "A")
                let components = fullName.components(separatedBy: " ")
                guard components.count >= 2 else { continue }

                let lineType = components[0]  // "METRO", "RER", "TRAM", "TRAIN"
                let lineName = components[1...].joined(separator: " ")  // "1", "A", "3a", etc.

                // Filtrer les lignes non IDF
                if fullName.contains("CDGVAL") || fullName.contains("ORLYVAL") {
                    continue
                }

                // Filtrer pour ne garder QUE Métro, RER, Tram et Transilien (H, J, K, L, N, P, R, U, V)
                // Tout ce qui est "TRAIN" ou "TER" générique non-Transilien dégage.
                let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]

                if lineType == "TRAIN" || lineType == "TER" {
                    if !allowedTransiliens.contains(lineName) {
                        continue
                    }
                }

                // Récupérer la couleur (priorité au hardcodé pour garantir les couleurs officielles)
                var hexColor = ""
                if lineType != "TRAM", let hardColor = hardcodedColors[lineName.uppercased()] {
                    hexColor = hardColor
                } else {
                    hexColor = feature.properties.colourweb_hexa ?? ""
                    hexColor = hexColor.replacingOccurrences(of: "#", with: "")
                }

                // Convertir le LineString en MKPolyline
                let coords = feature.geometry.coordinates.compactMap {
                    point -> CLLocationCoordinate2D? in
                    guard point.count >= 2 else { return nil }
                    return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                }

                guard !coords.isEmpty else { continue }
                let polyline = MKPolyline(coordinates: coords, count: coords.count)

                // Clé unique par type ET nom pour éviter les conflits (TRAM 7 vs METRO 7)
                let groupKey = "\(lineType)_\(lineName)"

                // Regrouper par clé unique
                if var existing = lineGroups[groupKey] {
                    existing.polylines.append(polyline)
                    lineGroups[groupKey] = existing
                } else {
                    lineGroups[groupKey] = (
                        color: hexColor, type: lineType, lineName: lineName, polylines: [polyline]
                    )
                }
            }

            // Créer les LineTrace à partir des groupes
            var newLines: [LineTrace] = []

            for (_, group) in lineGroups {
                guard !group.polylines.isEmpty else { continue }

                let type = self.mapTransportType(group.type, lineName: group.lineName)
                let finalName = (type == .tram && !group.lineName.uppercased().hasPrefix("T")) ? "T\(group.lineName)" : group.lineName
                let color = resolveLineColor(finalName, type: type)

                let line = LineTrace(
                    id: UUID().uuidString, name: finalName, color: color,
                    polylines: Self.stitchAndSmoothPolylines(group.polylines), type: type)
                newLines.append(line)

                // Debug spécifique
                if ["1", "A", "B", "E", "N", "3a", "7"].contains(group.lineName) {
                    print(
                        "🎨 Loaded \(group.type) \(group.lineName): #\(group.color) avec \(group.polylines.count) segments"
                    )
                }
            }

            DispatchQueue.main.async {
                self.lines = newLines
                // Remplissage du cache
                for line in newLines {
                    self.lineColorCache[line.name] = line.color
                }

                // Injecter les couleurs hardcodées manquantes
                for (name, hex) in self.hardcodedColors {
                    if self.lineColorCache[name] == nil {
                        self.lineColorCache[name] = Color(hex: hex)
                    }
                }

                print(
                    "✅ \(newLines.count) lignes chargées avec tracés réels détaillés (courbes du réseau ferré)"
                )
            }

        } catch {
            print("❌ Erreur parsing réseau ferré: \(error)")
        }
    }

    private func importBusStopsViaActor() async {
        print("🚌 [Bus Import] Démarrage de l'import des arrêts de bus via ModelActor...")
        guard let url = Bundle.main.url(forResource: "arrets-lignes-2", withExtension: "csv") else {
            print("⚠️ [Bus Import] Fichier arrets-lignes-2.csv introuvable.")
            return
        }
        
        let container = SwiftDataStack.shared.container
        let importer = TransportDataImporter(modelContainer: container)
        
        do {
            try await importer.importBusStops(csvUrl: url)
            UserDefaults.standard.set(true, forKey: "didImportBusStops_SwiftData_v2")
            print("✅ [Bus Import] Importation via ModelActor terminée avec succès !")
        } catch {
            print("❌ [Bus Import] Erreur lors de l'import via ModelActor: \(error)")
        }
    }

    nonisolated private func loadStopsCold(container: ModelContainer) {
        let context = ModelContext(container)

        // Import des bus en arrière-plan si pas encore fait
        let didImportBus = UserDefaults.standard.bool(forKey: "didImportBusStops_SwiftData_v2")
        if !didImportBus {
            Task {
                await self.importBusStopsViaActor()
            }
        }

        // Migration de l'ancien CSV vers le nouveau JSON
        let didMigrate = UserDefaults.standard.bool(forKey: "didMigrateToJSONStations_SwiftData_v1")
        if !didMigrate {
            print("🔄 Première exécution avec JSON : purge de la base locale...")
            self.clearStopPoints(in: context)
            UserDefaults.standard.set(true, forKey: "didMigrateToJSONStations_SwiftData_v1")
        }

        do {
            let fetchDescriptor = FetchDescriptor<StopPointModel>(
                predicate: #Predicate<StopPointModel> { $0.type != "Bus" }
            )
            let count = try context.fetchCount(fetchDescriptor)
            if count > 0 {
                print("💾 Chargement des arrêts depuis SwiftData (\(count) entités)...")
                let models = try context.fetch(fetchDescriptor)
                if let first = models.first, !first.id.isEmpty, !first.name.isEmpty {
                    self.processEntities(models)
                } else {
                    print("⚠️ Données SwiftData invalides, rechargement JSON...")
                    self.clearStopPoints(in: context)
                    self.loadStopsFromJSON(container: container)
                }
            } else {
                print("📂 SwiftData vide. Chargement depuis JSON...")
                self.loadStopsFromJSON(container: container)
            }
        } catch {
            print("❌ Erreur SwiftData: \(error)")
            self.loadStopsFromJSON(container: container)
        }
    }

    struct GeneralStationItem: Codable {
        struct GeoPoint2D: Codable {
            let lon: Double
            let lat: Double
        }
        let geo_point_2d: GeoPoint2D
        let nom_zdc: String?
        let nom_long: String?
        let res_com: String?
        let mode: String?
        let codeunique: Int?
        let objectid_1: Int?
        let id_ref_zdc: Int?
    }

    nonisolated private func loadStopsFromJSON(container: ModelContainer) {
        guard let url = Bundle.main.url(forResource: "gares-et-stations-du-reseau-ferre-dile-de-france-donnee-generalisee", withExtension: "json") else {
            print("⚠️ Fichier gares-et-stations-du-reseau-ferre-dile-de-france-donnee-generalisee.json introuvable.")
            self.loadStopsFromCSV(container: container)
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let items = try JSONDecoder().decode([GeneralStationItem].self, from: data)

            var groupedStops: [String: [StopPoint]] = [:]
            let context = ModelContext(container)

            print("📊 Parsing gares-et-stations-du-reseau-ferre-dile-de-france-donnee-generalisee.json: \(items.count) stations")

            for item in items {
                guard let rawName = item.nom_long ?? item.nom_zdc,
                      let res_com = item.res_com else { continue }
                let name = self.cleanStationName(rawName)
                
                let lat = item.geo_point_2d.lat
                let lon = item.geo_point_2d.lon
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                let codeVal = item.codeunique ?? item.objectid_1 ?? Int.random(in: 100000...999999)
                let code = String(codeVal)

                let lineParts = res_com.split(separator: "/").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                
                let stopAreaIdVal = item.id_ref_zdc != nil ? "IDFM:\(item.id_ref_zdc!)" : ""

                for part in lineParts {
                    let lineName: String
                    let type: TransportType
                    
                    if part.hasPrefix("METRO ") {
                        lineName = part.replacingOccurrences(of: "METRO ", with: "")
                        type = .metro
                    } else if part.hasPrefix("RER ") {
                        lineName = part.replacingOccurrences(of: "RER ", with: "")
                        type = .rer
                    } else if part.hasPrefix("TRAM ") {
                        lineName = part.replacingOccurrences(of: "TRAM ", with: "")
                        type = .tram
                    } else if part.hasPrefix("TRAIN ") {
                        lineName = part.replacingOccurrences(of: "TRAIN ", with: "")
                        type = .transilien
                    } else if part == "FUNICULAIRE MONTMARTRE" {
                        lineName = "Funi"
                        type = .metro
                    } else if part.hasPrefix("CABLE ") {
                        lineName = part.replacingOccurrences(of: "CABLE ", with: "")
                        type = .cable
                    } else if part == "ORLYVAL" {
                        lineName = "Orlyval"
                        type = .metro
                    } else if part == "CDGVAL" {
                        lineName = "Cdgval"
                        type = .metro
                    } else {
                        lineName = part
                        type = .transilien
                    }
                    
                    // Filtrage des lignes TER/Train non-Transilien
                    let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]
                    if type == .transilien || type == .train {
                        if !allowedTransiliens.contains(lineName) && lineName != "TER" {
                            continue
                        }
                    }
                    
                    let stopId = "\(code)_\(lineName)"
                    let stop = StopPoint(
                        id: stopId,
                        stopAreaId: stopAreaIdVal,
                        name: name,
                        coordinate: coordinate,
                        type: type,
                        lineName: lineName
                    )
                    
                    let key = "\(name)_" // Pas de commune dans le JSON
                    groupedStops[key, default: []].append(stop)
                    
                    // Sauvegarde dans SwiftData
                    let model = StopPointModel(
                        id: stopId,
                        stopAreaId: stopAreaIdVal,
                        city: "",
                        name: name,
                        latitude: lat,
                        longitude: lon,
                        type: type.rawValue,
                        lineName: lineName
                    )
                    context.insert(model)
                }
            }

            if context.hasChanges {
                do {
                    try context.save()
                    let totalStops = groupedStops.values.reduce(0) { $0 + $1.count }
                    print("✅ Sauvegarde SwiftData JSON terminée (\(totalStops) arrêts).")
                } catch {
                    print("❌ Erreur sauvegarde SwiftData JSON: \(error)")
                }
            }

            DispatchQueue.global(qos: .userInitiated).async {
                self.finalizeStations(groupedStops)
            }

        } catch {
            print("❌ Erreur de lecture/décodage du JSON des stations: \(error)")
            self.loadStopsFromCSV(container: container)
        }
    }

    nonisolated private func clearStopPoints(in context: ModelContext) {
        do {
            try context.delete(model: StopPointModel.self, where: #Predicate<StopPointModel> { $0.type != "Bus" })
            try context.save()
            print("✅ StopPointModel cleared.")
        } catch {
            print("❌ Error clearing StopPointModel: \(error)")
        }
    }

    nonisolated private func clearBusStopPoints(in context: ModelContext) {
        do {
            try context.delete(model: StopPointModel.self, where: #Predicate<StopPointModel> { $0.type == "Bus" })
            try context.save()
            print("✅ Bus StopPointModel cleared.")
        } catch {
            print("❌ Error clearing Bus StopPointModel: \(error)")
        }
    }

    nonisolated private func loadStopsFromCSV(container: ModelContainer) {
        guard let url = Bundle.main.url(forResource: "arrets-lignes", withExtension: "csv") else {
            print("⚠️ Fichier Arrêts CSV introuvable.")
            return
        }

        do {
            let data = try String(contentsOf: url, encoding: .utf8)
            let rows = data.components(separatedBy: .newlines)

            var groupedStops: [String: [StopPoint]] = [:]
            let context = ModelContext(container)

            let totalRows = rows.count
            for (index, row) in rows.enumerated() where index > 0 {
                if index % 1000 == 0 {
                    let progress = 0.3 + 0.5 * (Double(index) / Double(totalRows))
                    DispatchQueue.main.async {
                        MapDataService.shared.loadingProgress = progress
                    }
                }
                let columns = self.parseCSVLine(row)
                if columns.count > 10 {
                    let rawName = columns[3]
                    let name = self.cleanStationName(rawName)
                    let lonStr = columns[4]
                    let latStr = columns[5]
                    let modeStr = columns[8]
                    let city = columns[10]

                    if modeStr == "Bus" { continue }

                    if let lat = Double(latStr), let lon = Double(lonStr) {
                        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)

                        let stopId = columns[2]
                        let rawLineName = columns[7]
                        let lineName = rawLineName.uppercased()
                            .replacingOccurrences(of: "RER", with: "")
                            .replacingOccurrences(of: "TRANSILIEN", with: "")
                            .trimmingCharacters(in: .whitespacesAndNewlines)

                        let type = self.mapTransportType(modeStr, lineName: lineName)

                        let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]
                        if type == .transilien || type == .train {
                            if !allowedTransiliens.contains(lineName) {
                                continue
                            }
                        }

                        let stop = StopPoint(
                            id: stopId, stopAreaId: "", name: name, coordinate: coordinate,
                            type: type, lineName: lineName)

                        let key = "\(name)_\(city)"
                        groupedStops[key, default: []].append(stop)

                        let model = StopPointModel(
                            id: stopId,
                            stopAreaId: "",
                            city: city,
                            name: name,
                            latitude: lat,
                            longitude: lon,
                            type: type.rawValue,
                            lineName: lineName
                        )
                        context.insert(model)
                    }
                }
            }

            if context.hasChanges {
                do {
                    try context.save()
                    print("✅ Sauvegarde SwiftData terminée.")
                } catch {
                    print("❌ Erreur sauvegarde SwiftData: \(error)")
                }
            }

            DispatchQueue.global(qos: .userInitiated).async {
                self.finalizeStations(groupedStops)
            }

        } catch {
            print("❌ Erreur chargement arrêts CSV: \(error)")
        }
    }

    nonisolated private func processEntities(_ entities: [StopPointModel]) {
        var groupedStops: [String: [StopPoint]] = [:]

        let totalEntities = entities.count
        for (index, entity) in entities.enumerated() {
            if index % 500 == 0 {
                let progress = 0.3 + 0.5 * (Double(index) / Double(totalEntities))
                DispatchQueue.main.async {
                    MapDataService.shared.loadingProgress = progress
                }
            }
            let id = entity.id
            let rawName = entity.name
            let typeStr = entity.type
            let rawLineName = entity.lineName
            let city = entity.city

            let name = self.cleanStationName(rawName)

            let lineName = rawLineName.uppercased()
                .replacingOccurrences(of: "RER", with: "")
                .replacingOccurrences(of: "TRANSILIEN", with: "")
                .replacingOccurrences(of: "TRAIN", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)

            let type = self.mapTransportType(typeStr, lineName: lineName)

            let coordinate = CLLocationCoordinate2D(
                latitude: entity.latitude, longitude: entity.longitude)
            let stop = StopPoint(
                id: id, stopAreaId: entity.stopAreaId, name: name, coordinate: coordinate,
                type: type, lineName: lineName)

            let key = "\(name)_\(city)"
            groupedStops[key, default: []].append(stop)
        }

        DispatchQueue.global(qos: .userInitiated).async {
            self.finalizeStations(groupedStops)
        }
    }

    @MainActor
    private func updateStationsOnMainActor(initialStations: [MapStation], finalStations: [MapStation]) {
        self.unmergedStations = initialStations
        self.allStations = finalStations
        self.visibleStations = finalStations  // Initialement tout
        self.majorHubs = finalStations.filter { $0.isHub }
        self.stationsRevision += 1
        self.loadingProgress = 0.9
        print("✅ \(finalStations.count) stations finales (après fusion des pôles).")
        
        // Charger les données du Grand Paris Express une fois les stations de base prêtes
        self.loadGrandParisExpressCold()
    }

    nonisolated private func finalizeStations(_ groupedStops: [String: [StopPoint]]) {
        var initialStations: [MapStation] = []

        for (key, stops) in groupedStops {
            // Regrouper par proximité de 20m minimum
            let clusters = MapDataService.clusterStops(stops, maxDistance: 20.0)
            
            // Extraire la ville à partir de la clé
            let components = key.components(separatedBy: "_")
            let city = components.count > 1 ? components.last : nil

            for (clusterIndex, clusterStops) in clusters.enumerated() {
                guard let first = clusterStops.first else { continue }

                let isRepublique = first.name == "République"
                let center: CLLocationCoordinate2D
                if isRepublique {
                    center = CLLocationCoordinate2D(latitude: 48.8674, longitude: 2.3631)
                } else {
                    let totalLat = clusterStops.reduce(0.0) { $0 + $1.coordinate.latitude }
                    let totalLon = clusterStops.reduce(0.0) { $0 + $1.coordinate.longitude }
                    center = CLLocationCoordinate2D(
                        latitude: totalLat / Double(clusterStops.count),
                        longitude: totalLon / Double(clusterStops.count)
                    )
                }

                let mainType =
                    clusterStops.first { $0.type == .rer }?.type ?? clusterStops.first { $0.type == .metro }?.type
                    ?? clusterStops.first { $0.type == .transilien }?.type ?? first.type

                let uniqueLines = Set(clusterStops.map { StationLine(name: $0.lineName, type: $0.type) })
                let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }

                // ID unique pour chaque cluster s'il y en a plusieurs
                let stationId = clusters.count > 1 ? "\(first.id)_\(clusterIndex)" : first.id

                let station = MapStation(
                    id: stationId,
                    name: first.name,
                    coordinate: center,
                    platforms: clusterStops,
                    isHub: false,
                    mainType: mainType,
                    lines: sortedLines,
                    city: city
                )

                initialStations.append(station)
            }
        }

        var finalStations = self.mergeHubs(initialStations)
        
        // Specific user request: add RER A, B, D to Les Halles
        for i in 0..<finalStations.count {
            if finalStations[i].name == "Les Halles" {
                var updatedLines = finalStations[i].lines
                let rerA = StationLine(name: "A", type: .rer)
                let rerB = StationLine(name: "B", type: .rer)
                let rerD = StationLine(name: "D", type: .rer)
                if !updatedLines.contains(where: { $0.name == "A" && $0.type == .rer }) {
                    updatedLines.append(rerA)
                }
                if !updatedLines.contains(where: { $0.name == "B" && $0.type == .rer }) {
                    updatedLines.append(rerB)
                }
                if !updatedLines.contains(where: { $0.name == "D" && $0.type == .rer }) {
                    updatedLines.append(rerD)
                }
                updatedLines.sort { a, b in
                    let priorityA = a.type.priority
                    let priorityB = b.type.priority
                    if priorityA != priorityB {
                        return priorityA > priorityB
                    }
                    return a.name.localizedStandardCompare(b.name) == .orderedAscending
                }
                
                var updatedPlatforms = finalStations[i].platforms
                if let chatelet = finalStations.first(where: { $0.name == "Châtelet" }) {
                    let rerPlatforms = chatelet.platforms.filter { $0.type == .rer }
                    for plat in rerPlatforms {
                        if !updatedPlatforms.contains(where: { $0.id == plat.id }) {
                            updatedPlatforms.append(plat)
                        }
                    }
                }
                
                finalStations[i] = MapStation(
                    id: finalStations[i].id,
                    name: finalStations[i].name,
                    coordinate: finalStations[i].coordinate,
                    platforms: updatedPlatforms,
                    isHub: finalStations[i].isHub,
                    mainType: .rer,
                    lines: updatedLines,
                    city: finalStations[i].city
                )
            }
        }

        let finalInitialStations = initialStations
        let finalFinalStations = finalStations
        Task { @MainActor in
            self.updateStationsOnMainActor(initialStations: finalInitialStations, finalStations: finalFinalStations)
        }
    }

    // Helper to get normalized base name for clustering comparison
    nonisolated private func getNormalizedBaseName(_ name: String) -> String {
        Self.getNormalizedBaseNameStatic(name)
    }

    nonisolated private static func getNormalizedBaseNameStatic(_ name: String) -> String {
        // Replace long dashes with standard hyphens
        let cleanName = name
            .replacingOccurrences(of: "—", with: "-")
            .replacingOccurrences(of: "–", with: "-")
        
        // Split by " - " or "-" or "("
        let separators = [" - ", "-", "("]
        var base = cleanName
        for sep in separators {
            if let first = base.components(separatedBy: sep).first {
                base = first
            }
        }
        
        // Remove punctuation (like apostrophes), lowercase, and trim
        let allowedChars = CharacterSet.letters.union(CharacterSet.whitespaces)
        let filtered = base.unicodeScalars.filter { allowedChars.contains($0) }
        var result = String(String.UnicodeScalarView(filtered))
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Strip common prefixes/suffixes for transit node matching (e.g. "issy rer" -> "issy", "gare de lyon" -> "lyon")
        if result.hasPrefix("gare de ") {
            result = String(result.dropFirst(8))
        } else if result.hasPrefix("gare d") {
            result = String(result.dropFirst(6))
        }
        
        result = result
            .replacingOccurrences(of: " rer", with: "")
            .replacingOccurrences(of: " gare", with: "")
            .replacingOccurrences(of: " sncf", with: "")
            .replacingOccurrences(of: " metro", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        return result
    }


    // Helper to get clean name for a merged hub
    nonisolated private func cleanHubName(_ name: String) -> String {
        let cleanName = name
            .replacingOccurrences(of: "—", with: "-")
            .replacingOccurrences(of: "–", with: "-")
        
        let separators = [" - ", "("]
        var base = cleanName
        for sep in separators {
            if let first = base.components(separatedBy: sep).first {
                base = first
            }
        }
        return base.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // Helper to clean and reduce station names to their shortest/cleanest form
    nonisolated private func cleanStationName(_ name: String) -> String {
        Self.cleanStationNameStatic(name)
    }

    nonisolated private static func cleanStationNameStatic(_ name: String) -> String {
        var clean = name
            .replacingOccurrences(of: "—", with: "-")
            .replacingOccurrences(of: "–", with: "-")
        
        // 1. Supprimer les arrondissements (ex: " - 4ème Arrondissement", " 4e Arrondissement", " - 4e")
        if let regex = try? NSRegularExpression(pattern: "\\s*-\\s*\\d+(?:er|e|ème)?\\s*arrondissement.*", options: .caseInsensitive) {
            let range = NSRange(clean.startIndex..., in: clean)
            clean = regex.stringByReplacingMatches(in: clean, options: [], range: range, withTemplate: "")
        }
        if let regex = try? NSRegularExpression(pattern: "\\s+\\d+(?:er|e|ème)?\\s*arrondissement.*", options: .caseInsensitive) {
            let range = NSRange(clean.startIndex..., in: clean)
            clean = regex.stringByReplacingMatches(in: clean, options: [], range: range, withTemplate: "")
        }
        
        // 2. Simplifier "Hôtel de Ville de Paris" -> "Hôtel de Ville"
        if clean.lowercased().hasPrefix("hôtel de ville de paris") {
            clean = "Hôtel de Ville"
        }
        
        // 3. Traiter les barres obliques " / " décrivant des sous-noms secondaires (ex: "Auguste Perret / Cimetière Parisien de Thiais" -> "Auguste Perret")
        if clean.contains(" / ") {
            let parts = clean.components(separatedBy: " / ")
            if let first = parts.first, !first.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                clean = first
            }
        }
        
        // 4. Supprimer les parenthèses de description (ex: "Aéroport CDG 1 (Terminal 3)" -> "Aéroport CDG 1")
        if let regex = try? NSRegularExpression(pattern: "\\s*\\(.*\\)", options: []) {
            let range = NSRange(clean.startIndex..., in: clean)
            clean = regex.stringByReplacingMatches(in: clean, options: [], range: range, withTemplate: "")
        }
        
        return clean.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // Helper to create a single merged hub from a list of stations
    nonisolated private func createHub(from stations: [MapStation], name: String) -> MapStation {
        let allPlatforms = stations.flatMap { $0.platforms }
        
        // Prioritize structured rail/metro/gare platforms for centroid calculation to avoid skew from surrounding bus/tram stops
        let railPlatforms = allPlatforms.filter { $0.type == .rer || $0.type == .metro || $0.type == .transilien || $0.type == .train }
        let centroidPlatforms: [StopPoint]
        if !railPlatforms.isEmpty {
            centroidPlatforms = railPlatforms
        } else {
            let tramPlatforms = allPlatforms.filter { $0.type == .tram }
            if !tramPlatforms.isEmpty {
                centroidPlatforms = tramPlatforms
            } else {
                centroidPlatforms = allPlatforms
            }
        }
        
        // Centroïde
        let totalLat = centroidPlatforms.reduce(0.0) { $0 + $1.coordinate.latitude }
        let totalLon = centroidPlatforms.reduce(0.0) { $0 + $1.coordinate.longitude }
        let count = Double(max(1, centroidPlatforms.count))
        let center = CLLocationCoordinate2D(
            latitude: totalLat / count,
            longitude: totalLon / count
        )
        
        // Type principal
        let mainType: TransportType
        if allPlatforms.contains(where: { $0.type == .rer }) {
            mainType = .rer
        } else if allPlatforms.contains(where: { $0.type == .transilien || $0.type == .train }) {
            mainType = .transilien
        } else if allPlatforms.contains(where: { $0.type == .metro }) {
            mainType = .metro
        } else if allPlatforms.contains(where: { $0.type == .tram }) {
            mainType = .tram
        } else {
            mainType = allPlatforms.first?.type ?? .bus
        }
        
        // Agrégation unique des lignes
        let uniqueLines = Set(allPlatforms.map { StationLine(name: $0.lineName, type: $0.type) })
        let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }

        let city = stations.first(where: { $0.city != nil && !$0.city!.isEmpty })?.city
        
        return MapStation(
            id: stations.first?.id ?? UUID().uuidString,
            name: name,
            coordinate: center,
            platforms: allPlatforms,
            isHub: true,
            mainType: mainType,
            lines: sortedLines,
            city: city
        )
    }

    // Logique de fusion des pôles
    nonisolated private func mergeHubs(_ stations: [MapStation]) -> [MapStation] {
        var remainingStations = stations

        // 1. Définition des règles de fusion spécifiques (Nom du pôle -> Mots clés à chercher)
        let hubRules: [String: [String]] = [
            "Saint-Lazare": ["Saint-Lazare", "Haussmann Saint-Lazare"],
            "La Défense": ["La Défense"],
            "Gare du Nord": ["Gare du Nord", "Magenta"],
            "Gare de l'Est": ["Gare de l'Est"],
            "Montparnasse": ["Montparnasse", "Gaîté"],  // Gaîté est parfois séparé mais proche, restons sur Montparnasse
            "Châtelet": ["Châtelet"],
            "Nation": ["Nation"],
            "République": ["République"],
            "Bastille": ["Bastille"],
            "Issy - Val de Seine": ["Issy - Val de Seine", "Issy-Val de Seine"],
        ]

        var stationsToRemove: Set<String> = []
        var mergedHubs: [MapStation] = []

        for (hubName, keywords) in hubRules {
            // Trouver toutes les stations qui matchent les mots-clés
            let candidates = remainingStations.filter { station in
                if hubName == "Nation" && (station.name.localizedCaseInsensitiveContains("Assemblée") || station.name.localizedCaseInsensitiveContains("Nationale")) {
                    return false
                }
                if hubName == "République" && station.name.localizedCompare("République") != .orderedSame {
                    return false
                }
                if hubName == "Bastille" && station.name.localizedCompare("Bastille") != .orderedSame {
                    return false
                }
                if hubName == "La Défense" && station.name.localizedCaseInsensitiveContains("Esplanade") {
                    return false
                }

                return keywords.contains { keyword in
                    station.name.localizedCaseInsensitiveContains(keyword)
                }
            }

            if candidates.count > 1 {
                let hub = createHub(from: candidates, name: hubName)
                mergedHubs.append(hub)
                candidates.forEach { stationsToRemove.insert($0.id) }
            }
        }

        // Retirer les stations fusionnées spécifiquement
        remainingStations.removeAll { stationsToRemove.contains($0.id) }

        // 2. Fusion générique des autres pôles basés sur la similarité de nom et la proximité géographique
        var finalStations: [MapStation] = mergedHubs
        var visited = Set<String>()
        let maxMergeDistance: CLLocationDistance = 350.0 // 350 mètres max pour un pôle

        for station in remainingStations {
            if visited.contains(station.id) { continue }

            let stationNameBase = getNormalizedBaseName(station.name)
            visited.insert(station.id)

            // Trouver les autres stations non visitées avec le même nom de base et proches géographiquement
            var cluster = [station]
            let candidates = remainingStations.filter { other in
                if visited.contains(other.id) { return false }

                let otherNameBase = getNormalizedBaseName(other.name)
                guard otherNameBase == stationNameBase else { return false }

                let loc1 = CLLocation(latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
                let loc2 = CLLocation(latitude: other.coordinate.latitude, longitude: other.coordinate.longitude)
                return loc1.distance(from: loc2) < maxMergeDistance
            }

            cluster.append(contentsOf: candidates)
            candidates.forEach { visited.insert($0.id) }

            // Règle : ne pas fusionner si le pôle contient seulement 2 arrêts (ex: arrêts de bus opposés comme Roger Salengro)
            // SAUF si au moins l'un d'eux est un métro, RER, tram ou train (pour fusionner le bus et le rail au même pôle).
            let hasRailOrTram = cluster.contains { stat in
                stat.mainType == .metro || stat.mainType == .rer || stat.mainType == .tram || stat.mainType == .transilien || stat.mainType == .train
            }
            
            if cluster.count == 2 && !hasRailOrTram {
                finalStations.append(contentsOf: cluster)
            } else if cluster.count >= 3 || (cluster.count == 2 && hasRailOrTram) {
                let cleanName = cleanHubName(station.name)
                let mergedHub = createHub(from: cluster, name: cleanName)
                finalStations.append(mergedHub)
            } else {
                finalStations.append(station)
            }
        }

        // Post-process to ensure all multi-line rail stations are marked as hubs
        let processedStations = finalStations.map { station in
            let railLineCount = station.lines.filter { $0.type != .bus && $0.type != .cable }.count
            if railLineCount >= 2 && !station.isHub {
                return MapStation(
                    id: station.id,
                    name: station.name,
                    coordinate: station.coordinate,
                    platforms: station.platforms,
                    isHub: true,
                    mainType: station.mainType,
                    lines: station.lines,
                    city: station.city
                )
            }
            return station
        }

        return processedStations
    }

    // Helper pour parser le CSV proprement
    nonisolated private func parseCSVLine(_ line: String) -> [String] {
        Self.parseCSVLineStatic(line)
    }

    nonisolated private static func parseCSVLineStatic(_ line: String) -> [String] {
        var result: [String] = []
        var current = ""
        var insideQuotes = false

        for char in line {
            if char == "\"" {
                insideQuotes.toggle()
            } else if char == ";" && !insideQuotes {
                result.append(current)
                current = ""
            } else {
                current.append(char)
            }
        }
        result.append(current)

        // Nettoyage des guillemets
        return result.map { field in
            var clean = field.trimmingCharacters(in: .whitespaces)
            if clean.hasPrefix("\"") && clean.hasSuffix("\"") && clean.count >= 2 {
                clean.removeFirst()
                clean.removeLast()
            }
            return clean.replacingOccurrences(of: "\"\"", with: "\"")
        }
    }

    // Parseur GeoJSON (MultiLineString ou LineString)
    nonisolated private func parseGeoJSON(_ json: String) -> [MKPolyline] {
        // Le JSON semble valide d'après les tests, mais on garde un nettoyage minimal au cas où
        let cleanJson = json.replacingOccurrences(of: "\"\"", with: "\"")

        guard let data = cleanJson.data(using: .utf8) else { return [] }

        // Structure pour décoder soit MultiLineString soit LineString
        struct GeometryMulti: Decodable {
            let coordinates: [[[Double]]]
        }
        struct GeometryLine: Decodable {
            let coordinates: [[Double]]
        }

        do {
            // Essai MultiLineString
            let geom = try JSONDecoder().decode(GeometryMulti.self, from: data)
            return geom.coordinates.compactMap { segment in
                let coords = segment.compactMap { point -> CLLocationCoordinate2D? in
                    if point.count >= 2 {
                        return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                    }
                    return nil
                }
                if !coords.isEmpty {
                    return MKPolyline(coordinates: coords, count: coords.count)
                }
                return nil
            }
        } catch {
            // Essai LineString
            do {
                let geom = try JSONDecoder().decode(GeometryLine.self, from: data)
                let coords = geom.coordinates.compactMap { point -> CLLocationCoordinate2D? in
                    if point.count >= 2 {
                        return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                    }
                    return nil
                }
                if !coords.isEmpty {
                    return [MKPolyline(coordinates: coords, count: coords.count)]
                }
                return []
            } catch {
                print("❌ Erreur parsing GeoJSON: \(error)")
                return []
            }
        }
    }

    // Mapping des strings CSV vers l'enum TransportType existant
    nonisolated private func mapTransportType(_ typeString: String, lineName: String) -> TransportType {
        Self.mapTransportTypeStatic(typeString, lineName: lineName)
    }

    nonisolated private static func mapTransportTypeStatic(_ typeString: String, lineName: String) -> TransportType {
        // Nettoyage du nom pour la détection
        let cleanName = lineName.uppercased()
            .replacingOccurrences(of: "RER", with: "")
            .replacingOccurrences(of: "TRANSILIEN", with: "")
            .replacingOccurrences(of: "TRAIN", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        // Priorité au nom de ligne pour RER et Transilien (car le CSV indique parfois "Bus" ou "Metro")
        if ["A", "B", "C", "D", "E"].contains(cleanName) {
            return .rer
        } else if ["H", "J", "K", "L", "N", "P", "R", "U", "V"].contains(cleanName) {
            return .transilien
        }

        // Priorité au nom pour les Tramways (ex: T1, T3a)
        // On vérifie si ça commence par T suivi d'un chiffre
        if cleanName.starts(with: "T") && cleanName.count > 1
            && cleanName.dropFirst().first?.isNumber == true
        {
            return .tram
        }

        let normalizedType = typeString.lowercased()

        if normalizedType.contains("subway") || normalizedType.contains("metro") {
            return .metro
        } else if normalizedType.contains("tram") {
            return .tram
        } else if normalizedType.contains("rail") || normalizedType.contains("train")
            || normalizedType.contains("rer")
        {
            // Fallback si le nom n'a pas matché (ex: TER)
            return .transilien
        } else if normalizedType.contains("bus") {
            return .bus
        } else if normalizedType.contains("cable") || normalizedType.contains("funiculaire")
            || normalizedType.contains("suspendu")
        {
            return .cable
        }

        return .metro  // Fallback

    }

    // Chargement des tracés supplémentaires (ex: Câble 1) depuis le CSV
    nonisolated private func loadAdditionalTracesCold() {
        guard
            let url = Bundle.main.url(
                forResource: "traces-des-lignes-de-transport-en-commun-idfm-2", withExtension: "csv"
            )
        else {
            print("⚠️ Fichier traces-des-lignes-de-transport-en-commun-idfm-2.csv non trouvé")
            return
        }

        do {
            let data = try String(contentsOf: url, encoding: .utf8)
            let rows = data.components(separatedBy: .newlines)

            var newLines: [LineTrace] = []

            for (index, row) in rows.enumerated() where index > 0 {
                let columns = self.parseCSVLine(row)
                guard
                    let geoJsonIndex = columns.firstIndex(where: {
                        $0.contains("\"coordinates\"") || $0.contains("\"type\"")
                    })
                else {
                    continue
                }

                let lineName = columns.count > 1 ? columns[1] : "Inconnu"
                let mode = columns.count > 3 ? columns[3] : ""

                if mode == "Suspended cable car" || lineName == "C1" {
                    let geoJson = columns[geoJsonIndex]
                    let polylines = self.parseGeoJSON(geoJson)

                    if !polylines.isEmpty {
                        let type: TransportType = .cable
                        var color = Color.gray
                        if columns.count > 4, !columns[4].isEmpty {
                            color = Color(hex: columns[4])
                        }

                        let lineTrace = LineTrace(
                            id: UUID().uuidString,
                            name: lineName,
                            color: color,
                            polylines: Self.stitchAndSmoothPolylines(polylines),
                            type: type
                        )
                        newLines.append(lineTrace)
                        print("✅ Câble 1 chargé: \(polylines.count) segments")
                    }
                }
            }

            DispatchQueue.main.async {
                self.lines.append(contentsOf: newLines)
                for line in newLines {
                    self.lineColorCache[line.name] = line.color
                }
            }

        } catch {
            print("❌ Erreur chargement traces CSV supplémentaires: \(error)")
        }
    }

    func fetchBusStations(in minLat: Double, maxLat: Double, minLon: Double, maxLon: Double) async -> [MapStation] {
        let container = SwiftDataStack.shared.container
        let importer = TransportDataImporter(modelContainer: container)
        
        do {
            let entities = try await importer.fetchBusStops(minLat: minLat, maxLat: maxLat, minLon: minLon, maxLon: maxLon)
            var grouped: [String: [StopPoint]] = [:]
            for entity in entities {
                let id = entity.id
                let name = entity.name
                let lineName = entity.lineName
                let city = entity.city
                
                let coordinate = CLLocationCoordinate2D(latitude: entity.latitude, longitude: entity.longitude)
                let stop = StopPoint(
                    id: id,
                    stopAreaId: entity.stopAreaId,
                    name: name,
                    coordinate: coordinate,
                    type: .bus,
                    lineName: lineName
                )
                
                let key = "\(name)_\(city)"
                grouped[key, default: []].append(stop)
            }
            
            var busStations: [MapStation] = []
            for (_, stops) in grouped {
                let clusters = MapDataService.clusterStops(stops, maxDistance: 20.0)
                for (clusterIndex, clusterStops) in clusters.enumerated() {
                    guard let first = clusterStops.first else { continue }
                    let totalLat = clusterStops.reduce(0.0) { $0 + $1.coordinate.latitude }
                    let totalLon = clusterStops.reduce(0.0) { $0 + $1.coordinate.longitude }
                    let center = CLLocationCoordinate2D(
                        latitude: totalLat / Double(clusterStops.count),
                        longitude: totalLon / Double(clusterStops.count)
                    )
                    
                    let uniqueLines = Set(clusterStops.map { StationLine(name: $0.lineName, type: .bus) })
                    let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }
                    
                    let baseId = first.stopAreaId.isEmpty ? first.id : first.stopAreaId
                    let stationId = clusters.count > 1 ? "\(baseId)_\(clusterIndex)" : baseId
                    
                    let station = MapStation(
                        id: stationId,
                        name: first.name,
                        coordinate: center,
                        platforms: clusterStops,
                        isHub: false,
                        mainType: .bus,
                        lines: sortedLines
                    )
                    busStations.append(station)
                }
            }
            return busStations
        } catch {
            print("❌ [Bus Fetch] Error: \(error)")
            return []
        }
    }

    // Méthode asynchrone pour récupérer les stations dans une région (pour le bridge)
    func fetchStations(in region: MKCoordinateRegion) async -> [MapStation] {
        let center = region.center
        let span = region.span

        // Choix de la source de données :
        // 1. Dézoomé (delta >= 0.05) : pôles majeurs uniquement (majorHubs)
        // 2. Zoomé (delta < 0.05) : toutes les stations fusionnées (allStations)
        let source: [MapStation]
        if span.latitudeDelta < 0.05 || self.majorHubs.isEmpty {
            source = self.allStations
        } else {
            source = self.majorHubs
        }

        let margin = 0.006
        let minLat = center.latitude - span.latitudeDelta / 2 - margin
        let maxLat = center.latitude + span.latitudeDelta / 2 + margin
        let minLon = center.longitude - span.longitudeDelta / 2 - margin
        let maxLon = center.longitude + span.longitudeDelta / 2 + margin

        var filtered = source.filter { station in
            let lat = station.coordinate.latitude
            let lon = station.coordinate.longitude
            return lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon
        }

        // Si le zoom est très élevé, on ajoute les arrêts de bus
        if span.latitudeDelta < 0.012 {
            let busStations = await fetchBusStations(in: minLat, maxLat: maxLat, minLon: minLon, maxLon: maxLon)
            filtered = self.mergeBusStationsIntoRailStations(railStations: filtered, busStations: busStations)
        }

        return filtered.filter { station in
            FavoritesService.shared.isFavorite(stationId: station.id) ||
            station.lines.contains { self.isLineTypeEnabled($0.type) }
        }
    }

    // Méthode asynchrone pour mettre à jour les stations visibles
    func updateVisibleStations(in region: MKCoordinateRegion) {
        let center = region.center
        let span = region.span
        let delta = span.latitudeDelta

        // On utilise une Task détachée pour ne pas bloquer le thread appelant
        Task.detached(priority: .userInitiated) {
            let source: [MapStation]
            if delta < 0.05 {
                source = await self.allStations
            } else {
                source = await self.majorHubs
            }

            let margin = 0.006
            let minLat = center.latitude - span.latitudeDelta / 2 - margin
            let maxLat = center.latitude + span.latitudeDelta / 2 + margin
            let minLon = center.longitude - span.longitudeDelta / 2 - margin
            let maxLon = center.longitude + span.longitudeDelta / 2 + margin

            var filtered = source.filter { station in
                let lat = station.coordinate.latitude
                let lon = station.coordinate.longitude
                return lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon
            }

            if delta < 0.012 {
                let busStations = await self.fetchBusStations(in: minLat, maxLat: maxLat, minLon: minLon, maxLon: maxLon)
                filtered = self.mergeBusStationsIntoRailStations(railStations: filtered, busStations: busStations)
            }

            let finalVisible = filtered
            await MainActor.run {
                self.visibleStations = finalVisible
            }
        }
    }

    /// Rattache les arrêts de bus proches (< 250 m) partageant le même nom de base aux stations ferrées
    /// tout en préservant les coordonnées exactes des quais ferrés.
    nonisolated private func mergeBusStationsIntoRailStations(railStations: [MapStation], busStations: [MapStation]) -> [MapStation] {
        var result = railStations
        var unmergedBuses: [MapStation] = []

        for busStation in busStations {
            let busBase = getNormalizedBaseName(busStation.name)
            let busLoc = CLLocation(latitude: busStation.coordinate.latitude, longitude: busStation.coordinate.longitude)

            if let idx = result.firstIndex(where: { rail in
                guard rail.mainType != .bus else { return false }
                guard getNormalizedBaseName(rail.name) == busBase else { return false }
                let railLoc = CLLocation(latitude: rail.coordinate.latitude, longitude: rail.coordinate.longitude)
                return railLoc.distance(from: busLoc) < 250.0
            }) {
                let rail = result[idx]
                let mergedPlatforms = rail.platforms + busStation.platforms
                let mergedLines = Array(Set(rail.lines + busStation.lines)).sorted { $0.name < $1.name }
                result[idx] = MapStation(
                    id: rail.id,
                    name: rail.name,
                    coordinate: rail.coordinate,
                    platforms: mergedPlatforms,
                    isHub: true,
                    mainType: rail.mainType,
                    lines: mergedLines,
                    city: rail.city ?? busStation.city,
                    prioritizedLine: rail.prioritizedLine
                )
            } else {
                unmergedBuses.append(busStation)
            }
        }

        result.append(contentsOf: unmergedBuses)
        return result
    }

    // Helper pour récupérer toutes les stations (pour le bridge si besoin)
    func getAllStations() async -> [MapStation] {
        return allStations
    }

    func getAllStationsSync() -> [MapStation] {
        return allStations
    }

    // MARK: - Overlay Precalculation (Anti-Freeze)

    func precalculateOverlays() async {
        print("⚙️ Initialisation du calcul des overlays, décalages parallèles et lissage des tracés...")
        let linesToProcess = self.lines
        let currentAllStations = self.allStations
        let currentMajorHubs = self.majorHubs

        // Ce calcul est lourd, on le fait hors du MainActor
        let (calculatedOverlays, snappedAll, snappedHubs) = await Task.detached(priority: .userInitiated) {
            let sortedLines = linesToProcess.sorted { $0.type.priority < $1.type.priority }
            let offsetLines = MapDataService.applyParallelCorridorOffsets(to: sortedLines)

            var casingOverlays: [ColoredPolyline] = []
            var fillOverlays: [ColoredPolyline] = []

            for line in offsetLines {
                let isDashedLine = line.isDashed || ["15", "16", "17", "18"].contains(line.name)
                let platformColor = MapPlatformColor(line.color)

                for polyline in line.polylines {
                    if !isDashedLine {
                        let casing = ColoredPolyline(
                            points: polyline.points(), count: polyline.pointCount)
                        casing.color = platformColor
                        casing.lineName = line.name
                        casing.type = line.type
                        casing.isDashed = false
                        casing.isCasing = true
                        casingOverlays.append(casing)
                    }

                    let colored = ColoredPolyline(
                        points: polyline.points(), count: polyline.pointCount)
                    colored.color = platformColor
                    colored.lineName = line.name
                    colored.type = line.type
                    colored.isDashed = isDashedLine
                    colored.isCasing = false
                    fillOverlays.append(colored)
                }
            }

            let results = casingOverlays + fillOverlays
            let snappedAllStations = MapDataService.snapStationsToPolylines(currentAllStations, lines: offsetLines)
            let snappedMajorHubs = MapDataService.snapStationsToPolylines(currentMajorHubs, lines: offsetLines)

            return (results, snappedAllStations, snappedMajorHubs)
        }.value

        print("✅ Calcul des overlays terminé: \(calculatedOverlays.count) segments prêts.")

        await MainActor.run {
            self.cachedOverlays = calculatedOverlays
            self.allStations = snappedAll
            self.majorHubs = snappedHubs
            self.visibleStations = snappedAll
            self.stationsRevision += 1
        }
    }

    // MARK: - Parallel Corridor Offsetting & Crossing Handling

    nonisolated private struct SpatialSeg: Sendable {
        let lineKey: String
        let lat1: Double
        let lon1: Double
        let lat2: Double
        let lon2: Double
        let tx: Double
        let ty: Double
    }

    nonisolated private struct GridKey: Hashable, Sendable {
        let ix: Int
        let iy: Int
    }

    nonisolated private static func subdivideLongSegments(_ coords: [CLLocationCoordinate2D], maxStepMeters: Double = 32.0) -> [CLLocationCoordinate2D] {
        guard coords.count >= 2 else { return coords }
        var out: [CLLocationCoordinate2D] = []
        out.reserveCapacity(coords.count * 2)
        out.append(coords[0])

        for i in 0..<(coords.count - 1) {
            let a = coords[i]
            let b = coords[i + 1]
            let dist = approxMetersDistance(a, b)
            if dist > maxStepMeters {
                let steps = min(32, Int(ceil(dist / maxStepMeters)))
                if steps > 1 {
                    for s in 1..<steps {
                        let t = Double(s) / Double(steps)
                        out.append(CLLocationCoordinate2D(
                            latitude: a.latitude + (b.latitude - a.latitude) * t,
                            longitude: a.longitude + (b.longitude - a.longitude) * t
                        ))
                    }
                }
            }
            out.append(b)
        }
        return out
    }

    nonisolated private static func pointToSegmentDistanceMeters(
        lat: Double, lon: Double,
        lat1: Double, lon1: Double,
        lat2: Double, lon2: Double,
        latScale: Double
    ) -> Double {
        let px = (lon - lon1) * latScale
        let py = lat - lat1
        let dx = (lon2 - lon1) * latScale
        let dy = lat2 - lat1
        let lenSq = dx * dx + dy * dy
        let projX: Double
        let projY: Double
        if lenSq > 0 {
            let t = max(0.0, min(1.0, (px * dx + py * dy) / lenSq))
            projX = t * dx
            projY = t * dy
        } else {
            projX = 0
            projY = 0
        }
        let dLonMeters = (px - projX) * 111319.5
        let dLatMeters = (py - projY) * 111319.5
        return sqrt(dLonMeters * dLonMeters + dLatMeters * dLatMeters)
    }

    /// Applique un décalage parallèle propre et lissé aux tronçons partagés par plusieurs lignes,
    /// en orientant la normale de manière cohérente même si les tracés sont en sens opposé.
    nonisolated static func applyParallelCorridorOffsets(to lines: [LineTrace]) -> [LineTrace] {
        guard !lines.isEmpty else { return lines }

        let cellSize = 0.0005
        var preparedLines: [(line: LineTrace, key: String, chains: [[CLLocationCoordinate2D]])] = []
        preparedLines.reserveCapacity(lines.count)

        var grid: [GridKey: [SpatialSeg]] = [:]

        for line in lines {
            let lineKey = "\(line.type.rawValue)_\(normalizeLineKeyName(line.name, type: line.type))"
            let chains = line.polylines.map { subdivideLongSegments(extractCoordinates(from: $0), maxStepMeters: 32.0) }
            preparedLines.append((line: line, key: lineKey, chains: chains))

            for chain in chains where chain.count >= 2 {
                for i in 0..<(chain.count - 1) {
                    let a = chain[i]
                    let b = chain[i + 1]
                    let latMid = (a.latitude + b.latitude) * 0.5
                    let latScale = cos(latMid * .pi / 180.0)
                    let dx = (b.longitude - a.longitude) * latScale
                    let dy = b.latitude - a.latitude
                    let len = sqrt(dx * dx + dy * dy)
                    guard len > 1e-9 else { continue }
                    let tx = dx / len
                    let ty = dy / len

                    let seg = SpatialSeg(
                        lineKey: lineKey,
                        lat1: a.latitude, lon1: a.longitude,
                        lat2: b.latitude, lon2: b.longitude,
                        tx: tx, ty: ty
                    )

                    let minIx = Int(floor(min(a.longitude, b.longitude) / cellSize))
                    let maxIx = Int(floor(max(a.longitude, b.longitude) / cellSize))
                    let minIy = Int(floor(min(a.latitude, b.latitude) / cellSize))
                    let maxIy = Int(floor(max(a.latitude, b.latitude) / cellSize))

                    for ix in minIx...maxIx {
                        for iy in minIy...maxIy {
                            grid[GridKey(ix: ix, iy: iy), default: []].append(seg)
                        }
                    }
                }
            }
        }

        let parallelCosThreshold = 0.72
        let corridorRadiusMeters = 15.0
        let laneSpacingMeters = 5.0

        var resultLines: [LineTrace] = []
        resultLines.reserveCapacity(preparedLines.count)

        for entry in preparedLines {
            var newPolylines: [MKPolyline] = []
            newPolylines.reserveCapacity(entry.chains.count)

            for chain in entry.chains {
                guard chain.count >= 2 else { continue }

                var dxMeters = [Double](repeating: 0.0, count: chain.count)
                var dyMeters = [Double](repeating: 0.0, count: chain.count)
                var hasAnyOffset = false

                for i in 0..<chain.count {
                    let pt = chain[i]
                    let prevPt = chain[max(0, i - 1)]
                    let nextPt = chain[min(chain.count - 1, i + 1)]
                    let latScale = cos(pt.latitude * .pi / 180.0)

                    let vx = (nextPt.longitude - prevPt.longitude) * latScale
                    let vy = nextPt.latitude - prevPt.latitude
                    let vLen = sqrt(vx * vx + vy * vy)
                    guard vLen > 1e-9 else { continue }
                    let tx = vx / vLen
                    let ty = vy / vLen

                    let cx = Int(floor(pt.longitude / cellSize))
                    let cy = Int(floor(pt.latitude / cellSize))

                    var matchingLeaders: [String: (tx: Double, ty: Double, dist: Double)] = [:]

                    for ix in (cx - 1)...(cx + 1) {
                        for iy in (cy - 1)...(cy + 1) {
                            guard let cellSegs = grid[GridKey(ix: ix, iy: iy)] else { continue }
                            for seg in cellSegs {
                                guard seg.lineKey != entry.key else { continue }
                                let dot = tx * seg.tx + ty * seg.ty
                                guard abs(dot) >= parallelCosThreshold else { continue }

                                let dist = pointToSegmentDistanceMeters(
                                    lat: pt.latitude, lon: pt.longitude,
                                    lat1: seg.lat1, lon1: seg.lon1,
                                    lat2: seg.lat2, lon2: seg.lon2,
                                    latScale: latScale
                                )
                                if dist <= corridorRadiusMeters {
                                    if let existing = matchingLeaders[seg.lineKey] {
                                        if dist < existing.dist {
                                            matchingLeaders[seg.lineKey] = (seg.tx, seg.ty, dist)
                                        }
                                    } else {
                                        matchingLeaders[seg.lineKey] = (seg.tx, seg.ty, dist)
                                    }
                                }
                            }
                        }
                    }

                    guard !matchingLeaders.isEmpty else { continue }

                    var sharedKeys = [entry.key]
                    sharedKeys.append(contentsOf: matchingLeaders.keys)
                    sharedKeys.sort()

                    guard let myRank = sharedKeys.firstIndex(of: entry.key),
                          let leaderKey = sharedKeys.first else { continue }

                    // Tangente de référence déterminée par le leader (sharedKeys[0]) pour orienter la normale de façon identique
                    var refTx = tx
                    var refTy = ty
                    if leaderKey != entry.key, let leaderTangent = matchingLeaders[leaderKey] {
                        refTx = leaderTangent.tx
                        refTy = leaderTangent.ty
                    }

                    // Si le leader est un autre tracé et pointe en sens inverse, inverser notre tangente locale
                    var orientedTx = tx
                    var orientedTy = ty
                    if orientedTx * refTx + orientedTy * refTy < 0 {
                        orientedTx = -orientedTx
                        orientedTy = -orientedTy
                    }

                    // Normale perpendiculaire à la tangente orientée
                    let nx = -orientedTy
                    let ny = orientedTx

                    let rankOffset = (Double(myRank) - Double(sharedKeys.count - 1) / 2.0) * laneSpacingMeters
                    dxMeters[i] = nx * rankOffset
                    dyMeters[i] = ny * rankOffset
                    hasAnyOffset = true
                }

                if hasAnyOffset {
                    // Lissage en 2 passes des vecteurs de décalage pour une transition fluide entrée/sortie de couloir
                    for _ in 0..<2 {
                        var smoothDx = dxMeters
                        var smoothDy = dyMeters
                        for i in 1..<(chain.count - 1) {
                            smoothDx[i] = 0.25 * dxMeters[i - 1] + 0.50 * dxMeters[i] + 0.25 * dxMeters[i + 1]
                            smoothDy[i] = 0.25 * dyMeters[i - 1] + 0.50 * dyMeters[i] + 0.25 * dyMeters[i + 1]
                        }
                        dxMeters = smoothDx
                        dyMeters = smoothDy
                    }

                    var shiftedCoords: [CLLocationCoordinate2D] = []
                    shiftedCoords.reserveCapacity(chain.count)
                    for i in 0..<chain.count {
                        let pt = chain[i]
                        if abs(dxMeters[i]) < 0.01 && abs(dyMeters[i]) < 0.01 {
                            shiftedCoords.append(pt)
                        } else {
                            let latScale = max(0.01, cos(pt.latitude * .pi / 180.0))
                            let dLat = dyMeters[i] / 111319.5
                            let dLon = dxMeters[i] / (111319.5 * latScale)
                            shiftedCoords.append(CLLocationCoordinate2D(latitude: pt.latitude + dLat, longitude: pt.longitude + dLon))
                        }
                    }

                    let finalCoords = smoothCoordinates(shiftedCoords, passes: 1, maxCornerOffsetMeters: 16.0)
                    if finalCoords.count >= 2 {
                        newPolylines.append(MKPolyline(coordinates: finalCoords, count: finalCoords.count))
                    }
                } else {
                    newPolylines.append(MKPolyline(coordinates: chain, count: chain.count))
                }
            }

            resultLines.append(LineTrace(
                id: entry.line.id,
                name: entry.line.name,
                color: entry.line.color,
                polylines: newPolylines.isEmpty ? entry.line.polylines : newPolylines,
                type: entry.line.type,
                isDashed: entry.line.isDashed
            ))
        }

        return resultLines
    }

    // MARK: - Geometry Helpers (Chaînage, Lissage & Snap)

    nonisolated private static func approxMetersDistance(_ c1: CLLocationCoordinate2D, _ c2: CLLocationCoordinate2D) -> Double {
        let latMid = (c1.latitude + c2.latitude) * 0.5 * .pi / 180.0
        let dLon = (c2.longitude - c1.longitude) * cos(latMid) * 111319.5
        let dLat = (c2.latitude - c1.latitude) * 111319.5
        return sqrt(dLon * dLon + dLat * dLat)
    }

    nonisolated private static func extractCoordinates(from polyline: MKPolyline) -> [CLLocationCoordinate2D] {
        let ptr = polyline.points()
        let count = polyline.pointCount
        var coords: [CLLocationCoordinate2D] = []
        coords.reserveCapacity(count)
        for i in 0..<count {
            coords.append(ptr[i].coordinate)
        }
        return coords
    }

    /// Fusionne les segments contigus dont les extrémités sont à moins de `stitchThresholdMeters` et lisse les courbes.
    nonisolated static func stitchAndSmoothPolylines(
        _ polylines: [MKPolyline],
        isDashed: Bool = false,
        stitchThresholdMeters: Double = 18.0
    ) -> [MKPolyline] {
        var chains = polylines.map { extractCoordinates(from: $0) }.filter { $0.count >= 2 }
        guard !chains.isEmpty else { return polylines }

        // Chaînage glouton des tronçons contigus pour éviter les cassures entre segments GeoJSON
        var didMerge = true
        while didMerge {
            didMerge = false
            var i = 0
            while i < chains.count {
                var current = chains[i]
                var j = i + 1
                var mergedCurrent = false

                while j < chains.count {
                    let other = chains[j]
                    guard let cFirst = current.first, let cLast = current.last,
                          let oFirst = other.first, let oLast = other.last else {
                        j += 1
                        continue
                    }

                    if approxMetersDistance(cLast, oFirst) <= stitchThresholdMeters {
                        current.append(contentsOf: other.dropFirst())
                        chains[i] = current
                        chains.remove(at: j)
                        didMerge = true
                        mergedCurrent = true
                        break
                    } else if approxMetersDistance(cLast, oLast) <= stitchThresholdMeters {
                        current.append(contentsOf: other.reversed().dropFirst())
                        chains[i] = current
                        chains.remove(at: j)
                        didMerge = true
                        mergedCurrent = true
                        break
                    } else if approxMetersDistance(cFirst, oLast) <= stitchThresholdMeters {
                        current = Array(other) + Array(current.dropFirst())
                        chains[i] = current
                        chains.remove(at: j)
                        didMerge = true
                        mergedCurrent = true
                        break
                    } else if approxMetersDistance(cFirst, oFirst) <= stitchThresholdMeters {
                        current = Array(other.reversed()) + Array(current.dropFirst())
                        chains[i] = current
                        chains.remove(at: j)
                        didMerge = true
                        mergedCurrent = true
                        break
                    }
                    j += 1
                }

                if !mergedCurrent {
                    i += 1
                }
            }
        }

        return chains.compactMap { coords -> MKPolyline? in
            let finalCoords = smoothCoordinates(coords, passes: isDashed ? 1 : 2, maxCornerOffsetMeters: 22.0)
            guard finalCoords.count >= 2 else { return nil }
            return MKPolyline(coordinates: finalCoords, count: finalCoords.count)
        }
    }

    /// Lissage de Chaikin borné : arrondit les angles marqués tout en restant fidèle à la géométrie des voies.
    nonisolated static func smoothCoordinates(
        _ coordinates: [CLLocationCoordinate2D],
        passes: Int = 2,
        maxCornerOffsetMeters: Double = 22.0
    ) -> [CLLocationCoordinate2D] {
        guard coordinates.count > 2, passes > 0 else { return coordinates }

        // Déduplication préalable des points quasi confondus (< 1.5 m)
        var deduped: [CLLocationCoordinate2D] = []
        deduped.reserveCapacity(coordinates.count)
        for pt in coordinates {
            if let last = deduped.last, approxMetersDistance(last, pt) < 1.5 {
                continue
            }
            deduped.append(pt)
        }
        if deduped.count <= 2 { return deduped }

        let cosFlatThreshold = cos(2.0 * .pi / 180.0)
        var current = deduped

        for _ in 0..<passes {
            guard current.count > 2 else { break }
            var next: [CLLocationCoordinate2D] = []
            next.reserveCapacity(current.count * 2)
            next.append(current[0])

            for i in 1..<(current.count - 1) {
                let prev = current[i - 1]
                let curr = current[i]
                let after = current[i + 1]

                let len1 = approxMetersDistance(prev, curr)
                let len2 = approxMetersDistance(curr, after)

                guard len1 > 0.5 && len2 > 0.5 else {
                    next.append(curr)
                    continue
                }

                let latScale = cos(curr.latitude * .pi / 180.0)
                let v1x = (curr.longitude - prev.longitude) * latScale
                let v1y = curr.latitude - prev.latitude
                let v2x = (after.longitude - curr.longitude) * latScale
                let v2y = after.latitude - curr.latitude

                let n1 = sqrt(v1x * v1x + v1y * v1y)
                let n2 = sqrt(v2x * v2x + v2y * v2y)

                if n1 > 0 && n2 > 0 {
                    let dot = (v1x * v2x + v1y * v2y) / (n1 * n2)
                    // Angle quasi plat (< 2°) : conserver le sommet tel quel
                    if dot >= cosFlatThreshold {
                        next.append(curr)
                        continue
                    }
                }

                let d1 = min(0.25 * len1, maxCornerOffsetMeters)
                let d2 = min(0.25 * len2, maxCornerOffsetMeters)
                let t1 = d1 / len1
                let t2 = d2 / len2

                let q = CLLocationCoordinate2D(
                    latitude: curr.latitude + (prev.latitude - curr.latitude) * t1,
                    longitude: curr.longitude + (prev.longitude - curr.longitude) * t1
                )
                let r = CLLocationCoordinate2D(
                    latitude: curr.latitude + (after.latitude - curr.latitude) * t2,
                    longitude: curr.longitude + (after.longitude - curr.longitude) * t2
                )
                next.append(q)
                next.append(r)
            }

            if let last = current.last {
                next.append(last)
            }
            current = next
        }

        return current
    }

    nonisolated private static func normalizeLineKeyName(_ name: String, type: TransportType) -> String {
        let upper = name.uppercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if type == .tram && upper.hasPrefix("T") && upper.count > 1 {
            return String(upper.dropFirst())
        }
        return upper
    }

    nonisolated private static let stopWordsForMatching: Set<String> = [
        "de", "du", "des", "la", "le", "les", "et", "en", "sur", "sous",
        "aux", "au", "d", "l", "gare", "station", "rer", "metro", "train", "tram", "sncf", "paris"
    ]

    nonisolated private static func extractNormalizedWords(_ name: String) -> Set<String> {
        let folded = name.folding(options: .diacriticInsensitive, locale: .current).lowercased()
        let cleaned = folded.replacingOccurrences(of: "[^a-z0-9]+", with: " ", options: .regularExpression)
        let parts = cleaned.split(separator: " ").map(String.init)
        return Set(parts.filter { $0.count >= 2 && !stopWordsForMatching.contains($0) })
    }

    /// Charge les coordonnées précises par ligne depuis `arrets-lignes.csv` (hors bus), indexées avec mots normalisés.
    nonisolated private static func loadPlatformCoordinatesLookup() -> [String: [(words: Set<String>, coord: CLLocationCoordinate2D)]] {
        guard let url = Bundle.main.url(forResource: "arrets-lignes", withExtension: "csv"),
              let content = try? String(contentsOf: url, encoding: .utf8) else {
            return [:]
        }

        var lookup: [String: [(words: Set<String>, coord: CLLocationCoordinate2D)]] = [:]
        let rows = content.components(separatedBy: .newlines)

        for (index, row) in rows.enumerated() where index > 0 {
            guard !row.isEmpty else { continue }
            let columns = parseCSVLineStatic(row)
            guard columns.count > 8 else { continue }

            let modeStr = columns[8]
            if modeStr == "Bus" { continue }

            guard let lat = Double(columns[5]), let lon = Double(columns[4]) else { continue }

            let words = extractNormalizedWords(columns[3])
            let lineName = columns[7].uppercased()
                .replacingOccurrences(of: "RER", with: "")
                .replacingOccurrences(of: "TRANSILIEN", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)

            let type = mapTransportTypeStatic(modeStr, lineName: lineName)
            let normLine = normalizeLineKeyName(lineName, type: type)
            let key = "\(type.rawValue)_\(normLine)"
            lookup[key, default: []].append((words: words, coord: CLLocationCoordinate2D(latitude: lat, longitude: lon)))
        }

        return lookup
    }

    /// Fait glisser une coordonnée projetée le long de sa propre polyline de `distanceMeters` (positif ou négatif).
    nonisolated private static func slideAlongPolyline(
        _ coord: CLLocationCoordinate2D,
        polylines: [MKPolyline],
        distanceMeters: Double
    ) -> CLLocationCoordinate2D {
        let targetPoint = MKMapPoint(coord)
        var bestPolyline: MKPolyline?
        var bestSegIndex = 0
        var bestT = 0.0
        var bestDistance = Double.infinity

        for polyline in polylines {
            let count = polyline.pointCount
            guard count >= 2 else { continue }
            let pts = polyline.points()

            for i in 0..<(count - 1) {
                let a = pts[i]
                let b = pts[i + 1]
                let dx = b.x - a.x
                let dy = b.y - a.y
                let lenSq = dx * dx + dy * dy
                let t = lenSq > 0 ? max(0.0, min(1.0, ((targetPoint.x - a.x) * dx + (targetPoint.y - a.y) * dy) / lenSq)) : 0.0
                let proj = MKMapPoint(x: a.x + t * dx, y: a.y + t * dy)
                let dist = targetPoint.distance(to: proj)
                if dist < bestDistance {
                    bestDistance = dist
                    bestPolyline = polyline
                    bestSegIndex = i
                    bestT = t
                }
            }
        }

        guard let poly = bestPolyline, poly.pointCount >= 2 else { return coord }
        let pts = poly.points()
        let count = poly.pointCount
        var remaining = abs(distanceMeters)

        if distanceMeters >= 0 {
            var segIdx = bestSegIndex
            var currentPt = MKMapPoint(
                x: pts[segIdx].x + bestT * (pts[segIdx + 1].x - pts[segIdx].x),
                y: pts[segIdx].y + bestT * (pts[segIdx + 1].y - pts[segIdx].y)
            )
            while segIdx < count - 1 {
                let nextPt = pts[segIdx + 1]
                let segDist = currentPt.distance(to: nextPt)
                if remaining <= segDist && segDist > 1e-6 {
                    let ratio = remaining / segDist
                    return MKMapPoint(
                        x: currentPt.x + (nextPt.x - currentPt.x) * ratio,
                        y: currentPt.y + (nextPt.y - currentPt.y) * ratio
                    ).coordinate
                }
                remaining -= segDist
                segIdx += 1
                currentPt = pts[segIdx]
            }
            return pts[count - 1].coordinate
        } else {
            var segIdx = bestSegIndex
            var currentPt = MKMapPoint(
                x: pts[segIdx].x + bestT * (pts[segIdx + 1].x - pts[segIdx].x),
                y: pts[segIdx].y + bestT * (pts[segIdx + 1].y - pts[segIdx].y)
            )
            while segIdx >= 0 {
                let prevPt = pts[segIdx]
                let segDist = currentPt.distance(to: prevPt)
                if remaining <= segDist && segDist > 1e-6 {
                    let ratio = remaining / segDist
                    return MKMapPoint(
                        x: currentPt.x + (prevPt.x - currentPt.x) * ratio,
                        y: currentPt.y + (prevPt.y - currentPt.y) * ratio
                    ).coordinate
                }
                remaining -= segDist
                segIdx -= 1
                if segIdx >= 0 {
                    currentPt = pts[segIdx + 1]
                }
            }
            return pts[0].coordinate
        }
    }

    /// Projette chaque quai ferré sur le tracé de sa propre ligne (enrichi par les coordonnées réelles de quais CSV).
    nonisolated static func snapStationsToPolylines(_ stations: [MapStation], lines: [LineTrace]) -> [MapStation] {
        guard !stations.isEmpty, !lines.isEmpty else { return stations }

        let maxSnapDistance: Double = 260.0
        var polylinesByKey: [String: [MKPolyline]] = [:]
        for line in lines {
            let normName = normalizeLineKeyName(line.name, type: line.type)
            let key = "\(line.type.rawValue)_\(normName)"
            polylinesByKey[key, default: []].append(contentsOf: line.polylines)
        }

        let platformLookup = loadPlatformCoordinatesLookup()

        func closestPointOnPolylines(_ coord: CLLocationCoordinate2D, polylines: [MKPolyline], maxDist: Double) -> CLLocationCoordinate2D? {
            let mapPoint = MKMapPoint(coord)
            var bestPoint: MKMapPoint?
            var bestDistance = maxDist

            for polyline in polylines {
                let count = polyline.pointCount
                guard count >= 2 else { continue }
                let pts = polyline.points()

                for i in 0..<(count - 1) {
                    let a = pts[i]
                    let b = pts[i + 1]
                    let dx = b.x - a.x
                    let dy = b.y - a.y
                    let lenSq = dx * dx + dy * dy
                    let proj: MKMapPoint
                    if lenSq > 0 {
                        let t = max(0.0, min(1.0, ((mapPoint.x - a.x) * dx + (mapPoint.y - a.y) * dy) / lenSq))
                        proj = MKMapPoint(x: a.x + t * dx, y: a.y + t * dy)
                    } else {
                        proj = a
                    }

                    let dist = mapPoint.distance(to: proj)
                    if dist < bestDistance {
                        bestDistance = dist
                        bestPoint = proj
                    }
                }
            }
            return bestPoint?.coordinate
        }

        return stations.map { station in
            let railLines = station.lines.filter {
                $0.type == .metro || $0.type == .rer || $0.type == .tram || $0.type == .transilien || $0.type == .cable
            }
            guard !railLines.isEmpty else { return station }

            var stationWords = extractNormalizedWords(station.name)
            if stationWords.contains("halles") {
                stationWords.insert("chatelet")
            }

            var updatedPlatforms: [StopPoint] = []
            updatedPlatforms.reserveCapacity(station.platforms.count)
            var placedByLineKey: [String: CLLocationCoordinate2D] = [:]

            for platform in station.platforms {
                guard platform.type != .bus else {
                    updatedPlatforms.append(platform)
                    continue
                }

                let normLine = normalizeLineKeyName(platform.lineName, type: platform.type)
                let lineKey = "\(platform.type.rawValue)_\(normLine)"

                if let alreadyPlaced = placedByLineKey[lineKey] {
                    updatedPlatforms.append(StopPoint(
                        id: platform.id,
                        stopAreaId: platform.stopAreaId,
                        name: platform.name,
                        coordinate: alreadyPlaced,
                        type: platform.type,
                        lineName: platform.lineName
                    ))
                    continue
                }

                var seedCoord = platform.coordinate
                if let entries = platformLookup[lineKey] {
                    let nearbyMatches = entries.filter { entry in
                        approxMetersDistance(entry.coord, station.coordinate) <= 550.0 &&
                        !stationWords.isDisjoint(with: entry.words)
                    }
                    if !nearbyMatches.isEmpty {
                        let avgLat = nearbyMatches.reduce(0.0) { $0 + $1.coord.latitude } / Double(nearbyMatches.count)
                        let avgLon = nearbyMatches.reduce(0.0) { $0 + $1.coord.longitude } / Double(nearbyMatches.count)
                        seedCoord = CLLocationCoordinate2D(latitude: avgLat, longitude: avgLon)
                    }
                }

                let matchingPolylines = polylinesByKey[lineKey] ?? []
                var finalCoord: CLLocationCoordinate2D
                if !matchingPolylines.isEmpty,
                   let snapped = closestPointOnPolylines(seedCoord, polylines: matchingPolylines, maxDist: maxSnapDistance) {
                    finalCoord = snapped
                } else {
                    finalCoord = seedCoord
                }

                // Si ce point est à < 18 m d'un autre quai déjà placé sur une autre ligne de cette station,
                // faire glisser le marqueur le long de sa propre polyline pour éviter la collision aux croisements.
                let collisionCount = placedByLineKey.values.filter {
                    approxMetersDistance($0, finalCoord) < 18.0
                }.count
                if collisionCount > 0 && !matchingPolylines.isEmpty {
                    let stepSign = (collisionCount % 2 == 1) ? 1.0 : -1.0
                    let stepMagnitude = 14.0 * Double((collisionCount + 1) / 2)
                    finalCoord = slideAlongPolyline(finalCoord, polylines: matchingPolylines, distanceMeters: stepSign * stepMagnitude)
                }

                placedByLineKey[lineKey] = finalCoord
                updatedPlatforms.append(StopPoint(
                    id: platform.id,
                    stopAreaId: platform.stopAreaId,
                    name: platform.name,
                    coordinate: finalCoord,
                    type: platform.type,
                    lineName: platform.lineName
                ))
            }

            let primaryCoord: CLLocationCoordinate2D
            if let primaryPlatform = updatedPlatforms.first(where: { $0.type == station.mainType }) ?? updatedPlatforms.first(where: { $0.type != .bus }) {
                primaryCoord = primaryPlatform.coordinate
            } else {
                primaryCoord = station.coordinate
            }

            return MapStation(
                id: station.id,
                name: station.name,
                coordinate: primaryCoord,
                platforms: updatedPlatforms,
                isHub: station.isHub,
                mainType: station.mainType,
                lines: station.lines,
                city: station.city,
                prioritizedLine: station.prioritizedLine
            )
        }
    }

    // MARK: - Grand Paris Express Loader

    struct GPEStationFeature: Codable {
        struct Geometry: Codable {
            let coordinates: [Double]
            let type: String
        }
        struct Properties: Codable {
            let libelle: String?
            let code: String?
            let ligne: String?
        }
        let geometry: Geometry
        let properties: Properties
    }

    struct GPEFeatureCollection: Codable {
        let features: [GPEStationFeature]
    }

    private func loadGrandParisExpressCold() {
        guard let url = Bundle.main.url(forResource: "point-de-localisation-des-gares-du-grand-paris-express", withExtension: "geojson") else {
            print("⚠️ point-de-localisation-des-gares-du-grand-paris-express.geojson non trouvé dans le bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let collection = try JSONDecoder().decode(GPEFeatureCollection.self, from: data)
            
            var parsedStations: [MapStation] = []
            var stationsByLine: [String: [(name: String, code: String, coord: CLLocationCoordinate2D)]] = [:]
            
            for feature in collection.features {
                guard var name = feature.properties.libelle,
                      let code = feature.properties.code,
                      let lineStr = feature.properties.ligne,
                      feature.geometry.coordinates.count >= 2 else { continue }
                
                let coords = feature.geometry.coordinates
                var coordinate = CLLocationCoordinate2D(latitude: coords[1], longitude: coords[0])
                
                // Relocate and rename Line 15 Bagneux station to Bagneux - Lucie Aubrac
                if name == "Bagneux" && lineStr.contains("15") {
                    name = "Bagneux - Lucie Aubrac"
                    coordinate = CLLocationCoordinate2D(latitude: 48.80353046920307, longitude: 2.317499440854107)
                }
                
                let lineParts = lineStr.split(separator: "/").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                var stationLines: [StationLine] = []
                
                for part in lineParts {
                    let normLine = part.replacingOccurrences(of: "L", with: "")
                    let type: TransportType = .metro
                    stationLines.append(StationLine(name: normLine, type: type))
                    
                    if stationsByLine[normLine] == nil {
                        stationsByLine[normLine] = []
                    }
                    stationsByLine[normLine]?.append((name: name, code: code, coord: coordinate))
                }
                
                let stopPoints = stationLines.map { sLine in
                    StopPoint(
                        id: "\(code)_\(sLine.name)",
                        stopAreaId: "",
                        name: name,
                        coordinate: coordinate,
                        type: .metro,
                        lineName: sLine.name
                    )
                }
                
                let isHub = stationLines.count > 1
                let station = MapStation(
                    id: code,
                    name: name,
                    coordinate: coordinate,
                    platforms: stopPoints,
                    isHub: isHub,
                    mainType: .metro,
                    lines: stationLines.sorted(by: { $0.name < $1.name })
                )
                
                parsedStations.append(station)
            }
            
            var newLines: [LineTrace] = []
            
            // Structures pour décoder projets_lignes_idf.geojson (tracés affinés GPE)
            struct ProjetIDFGeometry: Decodable {
                let type: String
                let lineCoordinates: [[[Double]]]
                
                enum CodingKeys: String, CodingKey {
                    case type, coordinates
                }
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.type = try container.decode(String.self, forKey: .type)
                    if self.type == "LineString" {
                        let coords = try container.decode([[Double]].self, forKey: .coordinates)
                        self.lineCoordinates = [coords]
                    } else if self.type == "MultiLineString" {
                        let coords = try container.decode([[[Double]]].self, forKey: .coordinates)
                        self.lineCoordinates = coords
                    } else {
                        self.lineCoordinates = []
                    }
                }
            }

            struct ProjetIDFProperties: Decodable {
                let indice: String?
                let nom_projet: String?
                let operation: String?
                let statut: String?
                let rvb: String?
                let res_com: String?
                let mode: String?
            }

            struct ProjetIDFFeature: Decodable {
                let properties: ProjetIDFProperties
                let geometry: ProjetIDFGeometry
            }

            struct ProjetIDFCollection: Decodable {
                let features: [ProjetIDFFeature]
            }
            
            var gpePolylinesByLine: [String: [MKPolyline]] = [:]
            var gpeColorsByLine: [String: Color] = [:]
            var gpeIsDashedByLine: [String: Bool] = [:]

            if let projetsUrl = Bundle.main.url(forResource: "projets_lignes_idf", withExtension: "geojson") {
                do {
                    let data = try Data(contentsOf: projetsUrl)
                    let collection = try JSONDecoder().decode(ProjetIDFCollection.self, from: data)
                    
                    for feature in collection.features {
                        guard let indice = feature.properties.indice,
                              ["15", "16", "17", "18"].contains(indice) else { continue }
                        
                        // Couleur officielle depuis le GeoJSON
                        if gpeColorsByLine[indice] == nil, let rvb = feature.properties.rvb {
                            gpeColorsByLine[indice] = Color(rgbString: rvb)
                        }
                        
                        // Tronçons en travaux -> affichage en pointillés
                        let isTravaux = (feature.properties.statut?.localizedCaseInsensitiveContains("travaux") ?? true)
                        if isTravaux {
                            gpeIsDashedByLine[indice] = true
                        }
                        
                        for lineCoords in feature.geometry.lineCoordinates {
                            let clCoords = lineCoords.compactMap { pt -> CLLocationCoordinate2D? in
                                guard pt.count >= 2 else { return nil }
                                return CLLocationCoordinate2D(latitude: pt[1], longitude: pt[0])
                            }
                            if clCoords.count > 1 {
                                let polyline = MKPolyline(coordinates: clCoords, count: clCoords.count)
                                gpePolylinesByLine[indice, default: []].append(polyline)
                            }
                        }
                    }
                    print("✅ [GPE] Tracés affinés chargés depuis projets_lignes_idf.geojson: 15 (\(gpePolylinesByLine["15"]?.count ?? 0) tronçons), 16 (\(gpePolylinesByLine["16"]?.count ?? 0) tronçons), 17 (\(gpePolylinesByLine["17"]?.count ?? 0) tronçons), 18 (\(gpePolylinesByLine["18"]?.count ?? 0) tronçons)")
                } catch {
                    print("⚠️ [GPE] Erreur lors du décodage de projets_lignes_idf.geojson: \(error)")
                }
            }
            
            // Fallback pour ligne 15 Sud si projets_lignes_idf non disponible
            var fallbackLine15SudPolylines: [MKPolyline] = []
            if (gpePolylinesByLine["15"] ?? []).isEmpty,
               let trace15SudUrl = Bundle.main.url(forResource: "ligne-15-sud-trace-et-localisation-des-gares", withExtension: "geojson") {
                if let traceData = try? Data(contentsOf: trace15SudUrl) {
                    struct TraceFeature: Codable {
                        struct Geometry: Codable {
                            let coordinates: [[Double]]
                            let type: String
                        }
                        struct Properties: Codable {
                            let niv_type: String?
                        }
                        let geometry: Geometry
                        let properties: Properties
                    }
                    struct TraceCollection: Codable {
                        let features: [TraceFeature]
                    }
                    if let traceColl = try? JSONDecoder().decode(TraceCollection.self, from: traceData) {
                        for feat in traceColl.features where feat.properties.niv_type == "Axe ligne" {
                            let clCoords = feat.geometry.coordinates.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
                            if !clCoords.isEmpty {
                                fallbackLine15SudPolylines.append(MKPolyline(coordinates: clCoords, count: clCoords.count))
                            }
                        }
                    }
                }
            }
            
            for lineName in ["15", "16", "17", "18"] {
                var polylines = gpePolylinesByLine[lineName] ?? []
                
                if polylines.isEmpty {
                    if lineName == "15", !fallbackLine15SudPolylines.isEmpty {
                        polylines = fallbackLine15SudPolylines
                    } else if let stationsInfo = stationsByLine[lineName] {
                        var coords = stationsInfo.map { $0.coord }
                        if coords.count > 1 {
                            polylines.append(MKPolyline(coordinates: &coords, count: coords.count))
                        }
                    }
                }
                
                guard !polylines.isEmpty else { continue }
                
                let color = gpeColorsByLine[lineName] ?? resolveLineColor(lineName, type: .metro)
                let isDashed = gpeIsDashedByLine[lineName] ?? true
                
                let line = LineTrace(
                    id: "GPE_\(lineName)",
                    name: lineName,
                    color: color,
                    polylines: Self.stitchAndSmoothPolylines(polylines, isDashed: isDashed),
                    type: .metro,
                    isDashed: isDashed
                )
                newLines.append(line)
            }
            
            DispatchQueue.main.async {
                self.lines.append(contentsOf: newLines)
                for line in newLines {
                    self.lineColorCache[line.name] = line.color
                }
                
                var updatedAll = self.allStations
                var updatedUnmerged = self.unmergedStations
                
                for newStat in parsedStations {
                    let newBase = self.getNormalizedBaseName(newStat.name)
                    let newLoc = CLLocation(latitude: newStat.coordinate.latitude, longitude: newStat.coordinate.longitude)

                    if let index = updatedAll.firstIndex(where: { existing in
                        if existing.name.lowercased().trimmingCharacters(in: .whitespaces) == newStat.name.lowercased().trimmingCharacters(in: .whitespaces) {
                            return true
                        }
                        guard self.getNormalizedBaseName(existing.name) == newBase else { return false }
                        let existingLoc = CLLocation(latitude: existing.coordinate.latitude, longitude: existing.coordinate.longitude)
                        return existingLoc.distance(from: newLoc) < 400.0
                    }) {
                        let existing = updatedAll[index]
                        let mergedLines = Array(Set(existing.lines + newStat.lines)).sorted(by: { $0.name < $1.name })
                        let mergedPlatforms = existing.platforms + newStat.platforms
                        
                        let mergedStation = MapStation(
                            id: existing.id,
                            name: existing.name,
                            coordinate: existing.coordinate,
                            platforms: mergedPlatforms,
                            isHub: true,
                            mainType: existing.mainType,
                            lines: mergedLines,
                            city: existing.city
                        )
                        updatedAll[index] = mergedStation
                    } else {
                        updatedAll.append(newStat)
                    }
                    
                    if let index = updatedUnmerged.firstIndex(where: { existing in
                        if existing.name.lowercased().trimmingCharacters(in: .whitespaces) == newStat.name.lowercased().trimmingCharacters(in: .whitespaces) {
                            return true
                        }
                        guard self.getNormalizedBaseName(existing.name) == newBase else { return false }
                        let existingLoc = CLLocation(latitude: existing.coordinate.latitude, longitude: existing.coordinate.longitude)
                        return existingLoc.distance(from: newLoc) < 400.0
                    }) {
                        let existing = updatedUnmerged[index]
                        let mergedLines = Array(Set(existing.lines + newStat.lines)).sorted(by: { $0.name < $1.name })
                        let mergedPlatforms = existing.platforms + newStat.platforms
                        
                        let mergedStation = MapStation(
                            id: existing.id,
                            name: existing.name,
                            coordinate: existing.coordinate,
                            platforms: mergedPlatforms,
                            isHub: true,
                            mainType: existing.mainType,
                            lines: mergedLines,
                            city: existing.city
                        )
                        updatedUnmerged[index] = mergedStation
                    } else {
                        updatedUnmerged.append(newStat)
                    }
                }
                
                self.allStations = updatedAll
                self.unmergedStations = updatedUnmerged
                self.visibleStations = updatedAll
                self.majorHubs = updatedAll.filter { $0.isHub }
                self.stationsRevision += 1
                self.loadingProgress = 1.0
                
                print("🚇 [GPE] Chargement de \(parsedStations.count) gares et \(newLines.count) tracés du Grand Paris Express terminés.")
                
                // --- SAUVEGARDE DU CACHE UNIFIÉ ---
                self.saveTracesToCache(self.lines)
                
                let cacheObj = CacheableStations(unmergedStations: self.unmergedStations, allStations: self.allStations)
                if let data = try? JSONEncoder().encode(cacheObj) {
                    do {
                        try data.write(to: self.stationsCacheURL)
                        print("✅ [Cache Stations] Enregistré avec succès après GPE: \(self.allStations.count) gares.")
                    } catch {
                        print("⚠️ [Cache Stations] Erreur d'écriture: \(error)")
                    }
                }
                
                Task {
                    await self.precalculateOverlays()
                }
            }
            
        } catch {
            print("❌ Erreur lors du chargement des données Grand Paris Express: \(error)")
        }
    }

}

// Extension Couleur Hexadécimale (si pas déjà définie ailleurs)
extension Color {
    nonisolated init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a: UInt64
        let r: UInt64
        let g: UInt64
        let b: UInt64
        switch hex.count {
        case 3:  // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:  // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:  // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 1, 0, 1)  // Magenta opaque pour débogage (au lieu de transparent)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    /// Initialize Color from CSS rgb string like "rgb(165,0,52)"
    nonisolated init(rgbString: String) {
        let cleaned = rgbString
            .replacingOccurrences(of: "rgb(", with: "")
            .replacingOccurrences(of: ")", with: "")
        let components = cleaned.split(separator: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
        if components.count == 3 {
            self.init(
                .sRGB,
                red: components[0] / 255.0,
                green: components[1] / 255.0,
                blue: components[2] / 255.0,
                opacity: 1.0
            )
        } else {
            self.init(.gray)
        }
    }

    /// Convert Color to hex string for caching
    nonisolated func toHex() -> String? {
        guard let components = MapPlatformColor(self).cgColor.components else { return nil }
        let r = components.count > 0 ? components[0] : 0
        let g = components.count > 1 ? components[1] : 0
        let b = components.count > 2 ? components[2] : 0
        return String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }

    /// Convert "rgb(165,0,52)" to hex string "A50034"
    nonisolated static func hexFromRgbString(_ rgbString: String) -> String? {
        let cleaned = rgbString
            .replacingOccurrences(of: "rgb(", with: "")
            .replacingOccurrences(of: ")", with: "")
        let components = cleaned.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        guard components.count == 3 else { return nil }
        return String(format: "%02X%02X%02X", components[0], components[1], components[2])
    }
}

nonisolated struct ReferentielLignes: Decodable, Sendable {
    nonisolated struct Feature: Decodable, Sendable {
        nonisolated struct Properties: Decodable, Sendable {
            let shortname_line: String?
            let transportmode: String?
            let colourweb_hexa: String?
        }
        let properties: Properties
    }
    let features: [Feature]
}
