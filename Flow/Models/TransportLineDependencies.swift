import Foundation
import MapKit

/// 🔗 Fichier de consolidation de toutes les dépendances nécessaires
/// Copiez ce fichier dans votre projet si les dépendances sont manquantes
/// 
/// NOTE: GeoJSONShape est défini dans Flow/Services/GeoJSONModels.swift

// MARK: - TransportLineTrace Model (pour tracés CSV)
// Note: TransportLine dans TransportModels.swift est pour le trafic en temps réel

/// Représente une ligne de transport avec ses données de tracé géographique du CSV
struct TransportLineTrace {
    let routeId: String
    let routeShortName: String
    let routeLongName: String
    let routeType: String
    let routeColor: String
    let shape: String // GeoJSON en tant que String
}

// MARK: - CustomPolyline

class CustomPolyline: MKPolyline {
    var color: UIColor = .blue
    var lineName: String = ""
    
    convenience init(coordinates: [CLLocationCoordinate2D], color: UIColor, lineName: String) {
        let coords = coordinates
        self.init(coordinates: coords, count: coords.count)
        self.color = color
        self.lineName = lineName
    }
}

// MARK: - UIColor Extension (si manquant)

extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
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

// MARK: - TransportLineCSVParser (pour CoreData migration)
// Note: CSVParser existant dans exemple/Lignes/CSVParser.swift est différent

class TransportLineCSVParser {
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
        fields.append(currentField)
        
        return fields
    }
    
    static func parseTransportLinesCSV(csvContent: String) -> [TransportLineTrace] {
        var lines: [TransportLineTrace] = []
        let rows = csvContent.components(separatedBy: .newlines)
        
        for row in rows.dropFirst() where !row.isEmpty {
            let fields = parseCSVLine(row)
            
            guard fields.count >= 7 else { continue }
            
            let transportLine = TransportLineTrace(
                routeId: fields[0],
                routeShortName: fields[1],
                routeLongName: fields[2],
                routeType: fields[3],
                routeColor: fields[4],
                shape: fields[6]
            )
            
            lines.append(transportLine)
        }
        
        return lines
    }
}
