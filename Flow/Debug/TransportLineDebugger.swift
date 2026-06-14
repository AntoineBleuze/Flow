import SwiftData
import Foundation
import MapKit

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

/// 🐛 Utilitaire de debugging pour la migration SwiftData des lignes de transport
class TransportLineDebugger {

    private let persistence = TransportLinePersistence.shared

    // MARK: - Diagnostic complet

    /// Lance un diagnostic complet du système
    func runFullDiagnostic() {
        print("🔍 === DIAGNOSTIC COMPLET === 🔍\n")

        // 1. Vérifie les dépendances
        checkDependencies()

        // 2. Vérifie SwiftData
        checkCoreDataStack()

        // 3. Vérifie le CSV
        checkCSVFile()

        // 4. Vérifie la base de données
        checkDatabase()

        print("\n✅ === FIN DU DIAGNOSTIC === ✅")
    }

    // MARK: - 1. Vérification des dépendances

    func checkDependencies() {
        print("📦 1. VÉRIFICATION DES DÉPENDANCES")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

        // Test UIColor extension (via PlatformColor)
        if let testColor = UIColor(hex: "FF0000") {
            print("✅ UIColor(hex:) fonctionne - Couleur test: \(testColor)")
        } else {
            print("❌ ERREUR: UIColor(hex:) ne fonctionne pas!")
        }

        // Test ColoredPolyline
        let testCoords = [CLLocationCoordinate2D(latitude: 48.8, longitude: 2.3)]
        let testPolyline = ColoredPolyline(coordinates: testCoords, count: testCoords.count)
        testPolyline.color = .red
        testPolyline.lineName = "TEST"
        print("✅ CustomPolyline créée: \(testPolyline.lineName)")

        // Test GeoJSONShape parsing
        let testJSON = """
            {"type": "MultiLineString", "coordinates": [[[2.365, 48.819], [2.368, 48.815]]]}
            """
        if let jsonData = testJSON.data(using: .utf8),
            let geoJSON = try? JSONDecoder().decode(GeoJSONShape.self, from: jsonData)
        {
            print("✅ GeoJSONShape parsing fonctionne - Type: \(geoJSON.type)")
        } else {
            print("❌ ERREUR: GeoJSONShape parsing échoue!")
        }

        print()
    }

    // MARK: - 2. Vérification SwiftData

    func checkCoreDataStack() {
        print("💾 2. VÉRIFICATION SWIFTDATA")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

        // Vérifie que le contexte est accessible
        let context = SwiftDataStack.shared.mainContext
        print("✅ Contexte SwiftData accessible")

        // Vérifie que les modèles sont définis
        let entityDescriptions = SwiftDataStack.shared.container.schema.entities
        print("📊 Modèles SwiftData disponibles:")
        for entity in entityDescriptions {
            print("   - \(entity.name)")
        }

        // Test de création d'entité
        let _ = TransportLineModel(
            routeId: "TEST_ID",
            routeShortName: "T0",
            routeLongName: "Test Line",
            routeType: "Tram",
            routeColor: "3C91DC"
        )
        print("✅ TransportLineModel peut être créé")

        // Rollback pour ne pas sauvegarder
        context.rollback()

        print()
    }

    // MARK: - 3. Vérification du fichier CSV

    func checkCSVFile() {
        print("📄 3. VÉRIFICATION DU FICHIER CSV")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

        // Liste des noms possibles pour le CSV
        let possibleNames = [
            "traces-des-lignes-de-transport-en-commun-idfm",
            "traces-des-lignes-de-transport-en-commun-idfm-2",
            "lignes-transport",
            "transport_lines",
        ]

        var found = false

        for name in possibleNames {
            if let path = Bundle.main.path(forResource: name, ofType: "csv") {
                print("✅ Fichier CSV trouvé: \(name).csv")
                print("   Chemin: \(path)")

                // Vérifie la taille
                if let fileSize = try? FileManager.default.attributesOfItem(atPath: path)[.size]
                    as? Int
                {
                    let sizeInMB = Double(fileSize) / 1_048_576.0
                    print("   Taille: \(String(format: "%.2f", sizeInMB)) MB")
                }

                // Essaie de lire le contenu
                if let content = try? String(contentsOfFile: path, encoding: .utf8) {
                    let lines = content.components(separatedBy: .newlines)
                    print("   Lignes dans le fichier: \(lines.count)")

                    // Affiche la première ligne (header)
                    if let firstLine = lines.first {
                        print("   Header: \(firstLine.prefix(100))...")
                    }

                    // Parse et affiche une ligne exemple
                    if lines.count > 1 {
                        let exampleLine = lines[1]
                        print("   Exemple ligne 1: \(exampleLine.prefix(150))...")
                    }

                    found = true
                    break
                } else {
                    print("⚠️ Fichier trouvé mais impossible de lire le contenu")
                }
            }
        }

        if !found {
            print("❌ AUCUN fichier CSV trouvé!")
            print("   Recherché: \(possibleNames)")
            print("   💡 Solution: Ajoutez le fichier CSV au bundle Xcode")
        }

        print()
    }

    // MARK: - 4. Vérification de la base de données

    func checkDatabase() {
        print("🗄️ 4. VÉRIFICATION DE LA BASE DE DONNÉES")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

        let isPopulated = persistence.isDatabasePopulated()
        print("Base de données peuplée: \(isPopulated ? "✅ OUI" : "❌ NON")")

        if isPopulated {
            // Statistiques de la base
            let allLines = persistence.fetchAllTransportLines()
            print("📊 Nombre total de lignes: \(allLines.count)")

            // Compte par type
            var typeCount: [String: Int] = [:]
            for line in allLines {
                let type = line.routeType
                typeCount[type, default: 0] += 1
            }

            print("\n📋 Lignes par type:")
            for (type, count) in typeCount.sorted(by: { $0.value > $1.value }) {
                print("   - \(type): \(count)")
            }

            // Affiche quelques exemples
            print("\n🔍 Exemples de lignes stockées:")
            for line in allLines.prefix(5) {
                let coordsCount = line.coordinates.count
                print(
                    "   - \(line.routeShortName): Type=\(line.routeType), Couleur=\(line.routeColor), Coords=\(coordsCount)"
                )
            }

            // Teste la conversion en polylines
            if let firstLine = allLines.first {
                print("\n🧪 Test de conversion en polylines:")
                let polylines = firstLine.toColoredPolylines()
                print("   Ligne: \(firstLine.routeShortName)")
                print("   Polylines générées: \(polylines.count)")
                for (index, polyline) in polylines.enumerated() {
                    print(
                        "      Polyline \(index): \(polyline.pointCount) points, couleur: \(polyline.color)"
                    )
                }
            }

        } else {
            print("💡 La base de données est vide")
            print("   Action requise: Lancer la migration depuis GeoJSON")
        }

        print()
    }

    // MARK: - Force Clear et Re-Migration

    /// Efface toutes les données et force une nouvelle migration
    func forceClearAndAlert() {
        print("🗑️ EFFACEMENT DE LA BASE DE DONNÉES")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        persistence.clearAllData()
        print("✅ Base de données effacée")
        print("💡 Relancez l'app pour déclencher une nouvelle migration")
        print()
    }
}
