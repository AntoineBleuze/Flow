import Foundation
import SwiftUI
import CoreLocation

class CSVParser {

    private struct LineMetadata {
        let shortName: String
        let mode: String
        let logoName: String
        let textColor: String
        let type: String
        let order: Int
    }

    private static func parseMetadata() -> [String: LineMetadata] {
        var metadataDict = [String: LineMetadata]()

        guard let path = Bundle.main.path(forResource: "referentiel-des-lignes", ofType: "csv") else {
            print("referentiel-des-lignes.csv not found")
            return metadataDict
        }

        do {
            let content = try String(contentsOfFile: path)
            let lines = content.split(separator: "\n")

            for (index, line) in lines.enumerated() {
                if index == 0 { continue } // Skip header

                let columns = line.split(separator: ";", omittingEmptySubsequences: false).map { String($0) }

                if columns.count > 21 {
                    let id = columns[0]
                    let shortName = columns[2]
                    let transportMode = columns[3]
                    let textColor = columns[5]
                    let type = columns[8]
                    let order = Int(columns[21]) ?? 0
                    let shortNameLower = shortName.lowercased()
                    var mode = transportMode.lowercased()
                    var logoName = ""

                    if mode == "metro" {
                        logoName = "metro\(shortNameLower)"
                    } else if mode == "tram" {
                        logoName = "T\(shortNameLower)"
                    } else if mode == "cableway" {
                        mode = "cable"
                        logoName = "cable\(shortNameLower.replacingOccurrences(of: "c", with: ""))"
                    } else if mode == "rail" {
                        if ["a", "b", "c", "d", "e"].contains(shortNameLower) {
                            mode = "rer"
                            logoName = "rer\(shortName.uppercased())"
                        } else {
                            mode = "train"
                            logoName = "transilien\(shortName.uppercased())"
                        }
                    } else {
                        logoName = ""
                    }

                    let metadata = LineMetadata(shortName: shortName, mode: mode, logoName: logoName, textColor: textColor, type: type, order: order)
                    metadataDict[id] = metadata
                }
            }
        } catch {
            print("Error reading referentiel-des-lignes.csv: \(error)")
        }

        return metadataDict
    }

    static func parseCSV() -> [Ligne] {
        let metadataDict = parseMetadata()
        var lignes = [Ligne]()

        guard let path = Bundle.main.path(forResource: "traces_filtrees_sans_bus", ofType: "csv") else {
            return lignes
        }

        do {
            let content = try String(contentsOfFile: path)
            let lines = content.split(separator: "\n")

            for (index, line) in lines.enumerated() {
                if index == 0 { continue }

                let columns = line.split(separator: ";", omittingEmptySubsequences: false).map { String($0) }

                if columns.count >= 7 {
                    let id = columns[0]

                    // Find metadata for this line
                    if let metadata = metadataDict[id] {
                        let name = columns[1]
                        let colorString = columns[4]
                        let shapeString = columns[6]
                        let stopPointsString = columns[5]


                        if !shapeString.isEmpty {
                            var routes = [CLLocationCoordinate2D]()
                            let jsonData = Data(shapeString.utf8)
                            let decoder = JSONDecoder()

                            do {
                                let coordinates = try decoder.decode([[[Double]]].self, from: jsonData)
                                for route in coordinates {
                                    for coordinate in route {
                                        if coordinate.count == 2 {
                                            routes.append(CLLocationCoordinate2D(latitude: coordinate[1], longitude: coordinate[0]))
                                        }
                                    }
                                }
                            } catch {
                                // print("Error decoding shape for line \(id): \(error)")
                            }

                            var stopPoints: [StopPoint] = []
                            if let stopPointsData = stopPointsString.data(using: .utf8), !stopPointsString.isEmpty {
                                do {
                                    stopPoints = try JSONDecoder().decode([StopPoint].self, from: stopPointsData)
                                } catch {
                                    stopPoints = []
                                }
                            }

                            let ligne = Ligne(
                                id: id,
                                name: name,
                                shortName: metadata.shortName,
                                type: metadata.type,
                                transportMode: metadata.mode,
                                color: colorString,
                                textColor: metadata.textColor,
                                order: metadata.order,
                                icon: metadata.logoName,
                                shape: routes,
                                stopPoints: stopPoints
                            )
                            lignes.append(ligne)
                        }
                    }
                }
            }
        } catch {
            print("Error reading traces_filtrees_sans_bus.csv: \(error)")
        }
        return lignes
    }
}

extension Color {

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
