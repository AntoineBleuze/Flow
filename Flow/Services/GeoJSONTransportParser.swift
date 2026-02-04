import CoreLocation
import Foundation

/// Structure pour représenter une trace de ligne de transport
public struct TransportLineTrace: Identifiable {
    public let id = UUID()
    public let routeId: String
    public let shortName: String
    public let longName: String
    public let type: String  // "Subway", "Tram", "Rail", "Bus"
    public let color: String  // Hex string
    public let coordinates: [[CLLocationCoordinate2D]]  // Array of polylines (segments)

    public init(
        routeId: String, shortName: String, longName: String, type: String, color: String,
        coordinates: [[CLLocationCoordinate2D]]
    ) {
        self.routeId = routeId
        self.shortName = shortName
        self.longName = longName
        self.type = type
        self.color = color
        self.coordinates = coordinates
    }
}

class GeoJSONTransportParser {

    // Structures internes pour le décodage JSON
    private struct FeatureCollection: Codable {
        let type: String
        let features: [Feature]
    }

    private struct Feature: Codable {
        let type: String
        let geometry: Geometry
        let properties: Properties
    }

    private struct Geometry: Codable {
        let type: String
        let multiLineStringCoordinates: [[[Double]]]?
        let lineStringCoordinates: [[Double]]?

        enum CodingKeys: String, CodingKey {
            case type, coordinates
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            type = try container.decode(String.self, forKey: .type)

            if type == "MultiLineString" {
                multiLineStringCoordinates = try container.decode(
                    [[[Double]]].self, forKey: .coordinates)
                lineStringCoordinates = nil
            } else if type == "LineString" {
                lineStringCoordinates = try container.decode([[Double]].self, forKey: .coordinates)
                multiLineStringCoordinates = nil
            } else {
                multiLineStringCoordinates = nil
                lineStringCoordinates = nil
            }
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            if let multi = multiLineStringCoordinates {
                try container.encode(multi, forKey: .coordinates)
            } else if let line = lineStringCoordinates {
                try container.encode(line, forKey: .coordinates)
            }
        }
    }

    private struct Properties: Codable {
        // Anciennes clés (lignes_metro.geojson etc)
        let route_id: String?
        let route_short_name: String?
        let route_long_name: String?
        let route_type: String?
        let route_color: String?

        // Nouvelles clés (traces-du-reseau-ferre-idf.geojson)
        let idrefligc: String?
        let indice_lig: String?
        let res_com: String?
        let mode: String?
        let colourweb_hexa: String?
    }

    static func parseGeoJSON(from url: URL) -> [TransportLineTrace] {
        guard let data = try? Data(contentsOf: url) else {
            print("❌ Erreur lecture fichier: \(url.lastPathComponent)")
            return []
        }

        do {
            let featureCollection = try JSONDecoder().decode(FeatureCollection.self, from: data)
            var traces: [TransportLineTrace] = []

            for feature in featureCollection.features {
                // Determine properties based on available keys
                var routeId = feature.properties.route_id
                var shortName = feature.properties.route_short_name
                var longName = feature.properties.route_long_name
                var rawType = feature.properties.route_type
                var color = feature.properties.route_color

                // Mappings pour le nouveau fichier
                if let newId = feature.properties.idrefligc {
                    routeId = "IDFM:" + newId
                }
                if let newShortName = feature.properties.indice_lig {
                    shortName = newShortName
                }
                if let newLongName = feature.properties.res_com {
                    longName = newLongName
                }
                if let newMode = feature.properties.mode {
                    // Mapping des modes
                    // "METRO" -> "Subway"
                    // "RER" -> "Rail"
                    // "TRAIN" -> "Rail" (Transilien)
                    // "TRAMWAY" -> "Tram"
                    // "VAL" -> "Subway" (Orlyval)
                    // "TER" -> Ignorer
                    switch newMode {
                    case "METRO", "VAL": rawType = "Subway"
                    case "RER", "TRAIN": rawType = "Rail"
                    case "TRAMWAY": rawType = "Tram"
                    case "TER": continue  // Skip TER lines
                    default: rawType = "Bus"  // Fallback but unlikely for ferre
                    }
                }
                if let newColor = feature.properties.colourweb_hexa {
                    color = newColor
                }

                // Secondary check for TER in res_com just in case
                if let lName = longName, lName.contains("TER") {
                    continue
                }

                guard let rId = routeId,
                    let sName = shortName,
                    let lName = longName,
                    let rType = rawType,
                    let rColor = color
                else {
                    continue
                }

                // Extract coordinates
                var segments: [[[Double]]] = []
                if let multi = feature.geometry.multiLineStringCoordinates {
                    segments = multi
                } else if let line = feature.geometry.lineStringCoordinates {
                    segments = [line]
                }

                var polyLines: [[CLLocationCoordinate2D]] = []
                for segment in segments {
                    var segmentCoords: [CLLocationCoordinate2D] = []
                    for point in segment {
                        if point.count >= 2 {
                            // GeoJSON est [lon, lat]
                            segmentCoords.append(
                                CLLocationCoordinate2D(latitude: point[1], longitude: point[0]))
                        }
                    }
                    if !segmentCoords.isEmpty {
                        polyLines.append(segmentCoords)
                    }
                }

                if !polyLines.isEmpty {
                    let trace = TransportLineTrace(
                        routeId: rId,
                        shortName: sName,
                        longName: lName,
                        type: rType,
                        color: rColor,
                        coordinates: polyLines
                    )
                    traces.append(trace)
                }
            }

            return traces

        } catch {
            print("❌ Erreur décodage GeoJSON (\(url.lastPathComponent)): \(error)")
            return []
        }
    }

    static func parseAllTransportGeoJSON() -> [TransportLineTrace] {
        var allLines: [TransportLineTrace] = []

        // On utilise uniquement le nouveau fichier complet
        let fileNames = [
            "traces-du-reseau-ferre-idf"
        ]

        for fileName in fileNames {
            if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "geojson") {
                let lines = parseGeoJSON(from: fileURL)
                allLines.append(contentsOf: lines)
            } else {
                print("⚠️ Fichier non trouvé: \(fileName).geojson")
            }
        }

        print("📊 Total: \(allLines.count) lignes de transport chargées depuis \(fileNames)")
        return allLines
    }
}
