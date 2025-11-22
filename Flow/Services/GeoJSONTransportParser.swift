import Foundation
import CoreLocation

/// Parser pour les fichiers GeoJSON de lignes de transport
class GeoJSONTransportParser {
    
    // MARK: - Structures
    
    struct FeatureCollection: Codable {
        let type: String
        let features: [Feature]
    }
    
    struct Feature: Codable {
        let type: String
        let geometry: Geometry
        let properties: Properties
    }
    
    struct Geometry: Codable {
        let coordinates: [[[Double]]] // MultiLineString: array of LineStrings
        let type: String
    }
    
    struct Properties: Codable {
        let route_id: String
        let route_short_name: String
        let route_long_name: String
        let route_type: String
        let route_color: String
        
        enum CodingKeys: String, CodingKey {
            case route_id
            case route_short_name
            case route_long_name
            case route_type
            case route_color
        }
    }
    
    // MARK: - Parsing
    
    /// Parse un fichier GeoJSON et retourne un tableau de TransportLineTrace
    static func parseGeoJSON(from fileURL: URL) -> [TransportLineTrace] {
        var results: [TransportLineTrace] = []
        
        do {
            let data = try Data(contentsOf: fileURL)
            let collection = try JSONDecoder().decode(FeatureCollection.self, from: data)
            
            print("📊 Parsing \(fileURL.lastPathComponent): \(collection.features.count) features")
            
            for feature in collection.features {
                // Convertit le geometry en GeoJSONShape pour compatibilité
                let geoJSONShape = GeoJSONShape(
                    type: feature.geometry.type,
                    coordinates: feature.geometry.coordinates
                )
                
                // Encode le GeoJSONShape en string JSON pour storage
                if let shapeData = try? JSONEncoder().encode(geoJSONShape),
                   let shapeString = String(data: shapeData, encoding: .utf8) {
                    
                    let trace = TransportLineTrace(
                        routeId: feature.properties.route_id,
                        routeShortName: feature.properties.route_short_name,
                        routeLongName: feature.properties.route_long_name,
                        routeType: feature.properties.route_type,
                        routeColor: feature.properties.route_color,
                        shape: shapeString
                    )
                    
                    results.append(trace)
                }
            }
            
            print("✅ Parsé \(results.count) lignes depuis \(fileURL.lastPathComponent)")
            
        } catch {
            print("❌ Erreur parsing GeoJSON \(fileURL.lastPathComponent): \(error)")
        }
        
        return results
    }
    
    /// Parse tous les fichiers GeoJSON de transport depuis le bundle
    static func parseAllTransportGeoJSON() -> [TransportLineTrace] {
        var allLines: [TransportLineTrace] = []
        
        let fileNames = [
            "lignes_metro",
            "lignes_rer",
            "lignes_tram", 
            "lignes_transiliens"
        ]
        
        for fileName in fileNames {
            if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "geojson") {
                let lines = parseGeoJSON(from: fileURL)
                allLines.append(contentsOf: lines)
            } else {
                print("⚠️ Fichier non trouvé: \(fileName).geojson")
            }
        }
        
        print("📊 Total: \(allLines.count) lignes de transport chargées")
        return allLines
    }
}
