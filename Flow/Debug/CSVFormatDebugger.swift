import Foundation

/// 🔍 Outil pour diagnostiquer le format exact du CSV
class CSVFormatDebugger {
    
    static func analyzeCsvFormat(csvPath: String) {
        guard let content = try? String(contentsOfFile: csvPath) else {
            print("❌ Impossible de lire le fichier CSV")
            return
        }
        
        let lines = content.components(separatedBy: .newlines)
        print("📊 Analyse du format CSV")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print("Nombre de lignes: \(lines.count)")
        
        // Header
        if let header = lines.first {
            print("\n📝 Header:")
            print(header)
            
            let columns = header.split(separator: ";")
            print("\n📋 Colonnes (\(columns.count)):")
            for (index, col) in columns.enumerated() {
                print("  [\(index)] \(col)")
            }
        }
        
        // Analyse des 3 premières lignes de données
        print("\n🔍 Analyse des premières lignes de données:")
        for (index, line) in lines.dropFirst().prefix(3).enumerated() {
            print("\n━━━━ LIGNE \(index + 1) ━━━━")
            
            // Parsing manuel pour voir ce qui se passe
            var fields: [String] = []
            var currentField = ""
            var insideQuotes = false
            var charCount = 0
            
            for char in line {
                charCount += 1
                
                if char == "\"" {
                    insideQuotes.toggle()
                    currentField.append(char)
                } else if char == ";" && !insideQuotes {
                    fields.append(currentField)
                    print("  Champ [\(fields.count - 1)]: \(currentField.prefix(80))...")
                    currentField = ""
                } else {
                    currentField.append(char)
                }
            }
            fields.append(currentField)
            print("  Champ [\(fields.count - 1)]: \(currentField.prefix(80))...")
            
            // Focus sur la colonne shape (index 6)
            if fields.count >= 7 {
                let shapeRaw = fields[6]
                print("\n  🎯 COLONNE SHAPE (brute):")
                print("     Longueur: \(shapeRaw.count) caractères")
                print("     Premiers 200 caractères:")
                print("     \(shapeRaw.prefix(200))")
                
                print("\n  🧹 Après nettoyage standard:")
                let cleaned = shapeRaw
                    .replacingOccurrences(of: "\"\"", with: "\"")
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                print("     Premiers 200 caractères:")
                print("     \(cleaned.prefix(200))")
                
                // Test différents nettoyages
                print("\n  🧪 Tests de nettoyage alternatifs:")
                
                // Option 1: Retirer les guillemets de début et fin
                if shapeRaw.hasPrefix("\"") && shapeRaw.hasSuffix("\"") {
                    let option1 = String(shapeRaw.dropFirst().dropLast())
                        .replacingOccurrences(of: "\"\"", with: "\"")
                    print("     Option 1 (enlever guillemets externes):")
                    print("     \(option1.prefix(200))")
                }
                
                // Option 2: Juste les guillemets doubles
                let option2 = shapeRaw
                    .replacingOccurrences(of: "\"\"", with: "\"")
                print("     Option 2 (remplacer \"\" par \"):")
                print("     \(option2.prefix(200))")
            }
        }
    }
    
    static func testParsing(csvPath: String) {
        guard let content = try? String(contentsOfFile: csvPath) else {
            print("❌ Impossible de lire le fichier CSV")
            return
        }
        
        let lines = content.components(separatedBy: .newlines)
        
        print("\n🧪 TEST DE PARSING")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        
        for (index, line) in lines.dropFirst().prefix(3).enumerated() {
            print("\n🔬 Ligne \(index + 1):")
            
            let fields = TransportLineCSVParser.parseCSVLine(line)
            
            if fields.count >= 7 {
                let routeId = fields[0]
                let routeShortName = fields[1]
                let shapeRaw = fields[6]
                
                print("  ID: \(routeId)")
                print("  Nom: \(routeShortName)")
                print("  Shape brut: \(shapeRaw.prefix(100))...")
                
                // Test de différents nettoyages
                let cleanings = [
                    ("Standard", shapeRaw.replacingOccurrences(of: "\"\"", with: "\"").trimmingCharacters(in: .whitespacesAndNewlines)),
                    ("Sans guillemets externes", shapeRaw.hasPrefix("\"") && shapeRaw.hasSuffix("\"") ? String(shapeRaw.dropFirst().dropLast()).replacingOccurrences(of: "\"\"", with: "\"") : shapeRaw)
                ]
                
                for (name, cleaned) in cleanings {
                    print("\n  Test \(name):")
                    print("    Premier 100 chars: \(cleaned.prefix(100))")
                    
                    if let jsonData = cleaned.data(using: .utf8) {
                        do {
                            let geoJSON = try JSONDecoder().decode(GeoJSONShape.self, from: jsonData)
                            print("    ✅ Parsing réussi! Type: \(geoJSON.type), Segments: \(geoJSON.coordinates.count)")
                            break // Si ça marche, on sort
                        } catch {
                            print("    ❌ Erreur: \(error)")
                        }
                    }
                }
            }
        }
    }
}
