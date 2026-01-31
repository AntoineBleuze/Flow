import Foundation

/// Modèle représentant une ligne de transport telle que lue depuis le fichier CSV.
public struct CSVTransportLine {
    let routeId: String
    let routeShortName: String
    let routeLongName: String
    let routeType: String
    let routeColor: String
    /// La forme de la ligne, représentée par une chaîne de caractères GeoJSON (MultiLineString).
    let shape: String
}

/// Un parseur pour les fichiers CSV contenant des lignes de transport.
public enum CSVParser {

    /// Parse le contenu d'un fichier CSV pour en extraire les lignes de transport.
    /// - Parameter csvContent: Le contenu du fichier CSV sous forme de chaîne de caractères.
    /// - Returns: Un tableau de `CSVTransportLine`.
    public static func parseTransportLinesCSV(csvContent: String) -> [CSVTransportLine] {
        var transportLines: [CSVTransportLine] = []

        let rows = csvContent.components(separatedBy: .newlines)

        // On suppose que la première ligne est l'en-tête.
        guard !rows.isEmpty else { return [] }
        let header = rows.first!

        // Crée une correspondance entre les noms de colonnes et leurs indices
        // pour rendre le parsing plus robuste.
        let columnMapping = mapHeaders(header: header)

        // Vérifie que les colonnes nécessaires sont présentes.
        let requiredColumns = [
            "route_id", "route_short_name", "route_long_name", "route_type", "route_color", "shape",
        ]
        for column in requiredColumns {
            if columnMapping[column] == nil {
                print("❌ En-tête CSV invalide. Colonne manquante: \(column)")
                return []
            }
        }

        for row in rows.dropFirst() {
            if row.isEmpty { continue }

            // NOTE: Ceci est un parseur CSV très simple. Une solution plus robuste
            // gérerait les virgules à l'intérieur des champs entre guillemets.
            let columns = row.components(separatedBy: ",")

            guard columns.count == columnMapping.count else {
                print("⚠️ Ligne CSV ignorée (nombre de colonnes incorrect): \(row)")
                continue
            }

            let routeId = columns[columnMapping["route_id"]!].trimmed()
            let routeShortName = columns[columnMapping["route_short_name"]!].trimmed()
            let routeLongName = columns[columnMapping["route_long_name"]!].trimmed()
            let routeType = columns[columnMapping["route_type"]!].trimmed()
            let routeColor = columns[columnMapping["route_color"]!].trimmed()
            let shape = columns[columnMapping["shape"]!].trimmed()

            let line = CSVTransportLine(
                routeId: routeId,
                routeShortName: routeShortName,
                routeLongName: routeLongName,
                routeType: routeType,
                routeColor: routeColor,
                shape: shape
            )
            transportLines.append(line)
        }

        return transportLines
    }

    /// Crée un dictionnaire qui mappe les noms d'en-tête de colonne à leurs indices.
    private static func mapHeaders(header: String) -> [String: Int] {
        let columnNames = header.components(separatedBy: ",")
        var mapping: [String: Int] = [:]
        for (index, name) in columnNames.enumerated() {
            mapping[name.trimmed()] = index
        }
        return mapping
    }
}

extension String {
    /// Supprime les espaces et les guillemets au début et à la fin de la chaîne.
    fileprivate func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndQuotes)
    }
}

extension CharacterSet {
    /// Un ensemble de caractères contenant les espaces et les guillemets.
    fileprivate static let whitespacesAndQuotes = CharacterSet.whitespaces.union(
        CharacterSet(charactersIn: "\""))
}
