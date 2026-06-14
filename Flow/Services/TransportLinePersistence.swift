import SwiftData
import Foundation
import MapKit

/// Structure locale pour éviter les problèmes d'isolation d'acteur avec le modèle global
nonisolated private struct BackgroundGeoJSONShape: Codable, Sendable {
    let type: String
    let coordinates: [[[Double]]]
}

/// Service de persistence pour les lignes de transport
public class TransportLinePersistence {

    static let shared = TransportLinePersistence()

    private init() {}

    // MARK: - Check Migration

    /// Vérifie si la base de données a déjà été peuplée
    func isDatabasePopulated() -> Bool {
        let context = SwiftDataStack.shared.mainContext
        let fetchDescriptor = FetchDescriptor<TransportLineModel>()

        do {
            let count = try context.fetchCount(fetchDescriptor)
            return count > 0
        } catch {
            print("❌ Erreur de comptage: \(error)")
            return false
        }
    }

    // MARK: - Migration from GeoJSON

    /// Migre les données depuis les fichiers GeoJSON vers SwiftData (à faire une seule fois)
    func migrateFromGeoJSON(completion: @escaping (Bool) -> Void) {
        // Vérifie si déjà peuplé
        if isDatabasePopulated() {
            print("ℹ️ Base de données déjà peuplée, migration ignorée")
            completion(true)
            return
        }

        print("🔄 Début de la migration GeoJSON → SwiftData...")

        let container = SwiftDataStack.shared.container

        // Utilise un contexte background pour ne pas bloquer l'UI
        DispatchQueue.global(qos: .utility).async {
            let backgroundContext = ModelContext(container)
            backgroundContext.autosaveEnabled = false
            
            let transportLines = GeoJSONTransportParser.parseAllTransportGeoJSON()
            print("📊 \(transportLines.count) lignes à migrer")

            var migratedCount = 0

            for (index, line) in transportLines.enumerated() {
                // Crée le modèle TransportLineModel
                let model = TransportLineModel(
                    routeId: line.routeId,
                    routeShortName: line.routeShortName,
                    routeLongName: line.routeLongName,
                    routeType: line.routeType,
                    routeColor: line.routeColor
                )

                // Parse le GeoJSON (déjà propre depuis le parser)
                let geoJSONString = line.shape

                // 🐛 DEBUG: Log le format pour les premières lignes
                if index < 3 {
                    print("\n🔍 DEBUG Ligne \(index):")
                    print("   Route: \(line.routeId) - \(line.routeShortName)")
                    print("   Shape: \(geoJSONString.prefix(150))")
                }

                if let jsonData = geoJSONString.data(using: .utf8),
                    let geoJSON = try? JSONDecoder().decode(
                        BackgroundGeoJSONShape.self, from: jsonData)
                {
                    var coordinatePoints: [CoordinatePointModel] = []
                    
                    // Pour chaque segment (LineString) dans le MultiLineString
                    for (segmentIndex, lineString) in geoJSON.coordinates.enumerated() {
                        // Pour chaque point dans le segment
                        for point in lineString {
                            guard point.count >= 2 else { continue }

                            let coord = CoordinatePointModel(
                                latitude: point[1],
                                longitude: point[0],
                                segmentIndex: Int32(segmentIndex),
                                transportLine: model
                            )
                            coordinatePoints.append(coord)
                        }
                    }

                    model.coordinates = coordinatePoints
                    backgroundContext.insert(model)
                    migratedCount += 1
                } else {
                    if index < 10 {
                        print("⚠️ Ligne \(index) (\(line.routeShortName)): Échec parsing GeoJSON")
                    }
                }

                // Sauvegarde par batch tous les 50 éléments
                if index % 50 == 0 {
                    do {
                        try backgroundContext.save()
                        print("💾 Sauvegardé \(index)/\(transportLines.count) lignes")
                    } catch {
                        print("❌ Erreur de sauvegarde: \(error)")
                    }
                }
            }

            // Sauvegarde finale
            do {
                try backgroundContext.save()
                print("✅ Migration terminée: \(migratedCount) lignes migrées")

                DispatchQueue.main.async {
                    completion(true)
                }
            } catch {
                print("❌ Erreur de sauvegarde finale: \(error)")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }

    // MARK: - Fetch

    /// Récupère toutes les lignes de transport depuis SwiftData
    func fetchAllTransportLines() -> [TransportLineModel] {
        let context = SwiftDataStack.shared.mainContext
        let fetchDescriptor = FetchDescriptor<TransportLineModel>()

        do {
            let results = try context.fetch(fetchDescriptor)
            print("✅ Récupéré \(results.count) lignes depuis SwiftData")
            return results
        } catch {
            print("❌ Erreur de fetch: \(error)")
            return []
        }
    }

    /// Récupère une ligne spécifique par son ID
    func fetchTransportLine(byId routeId: String) -> TransportLineModel? {
        let context = SwiftDataStack.shared.mainContext
        let fetchDescriptor = FetchDescriptor<TransportLineModel>(
            predicate: #Predicate<TransportLineModel> { $0.routeId == routeId }
        )

        do {
            let results = try context.fetch(fetchDescriptor)
            return results.first
        } catch {
            print("❌ Erreur de fetch: \(error)")
            return nil
        }
    }

    /// Récupère les lignes par type (ex: "Metro", "Tram", "RER")
    func fetchTransportLines(byType type: String) -> [TransportLineModel] {
        let context = SwiftDataStack.shared.mainContext
        let fetchDescriptor = FetchDescriptor<TransportLineModel>(
            predicate: #Predicate<TransportLineModel> { $0.routeType == type }
        )

        do {
            let results = try context.fetch(fetchDescriptor)
            print("✅ Récupéré \(results.count) lignes de type '\(type)'")
            return results
        } catch {
            print("❌ Erreur de fetch: \(error)")
            return []
        }
    }

    // MARK: - Clear

    /// Efface toutes les données (utile pour debugging)
    func clearAllData() {
        let context = SwiftDataStack.shared.mainContext

        do {
            try context.delete(model: TransportLineModel.self)
            try context.save()
            print("🗑️ Toutes les données ont été effacées")
        } catch {
            print("❌ Erreur d'effacement: \(error)")
        }
    }
}
