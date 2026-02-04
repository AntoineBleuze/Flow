import CoreData
import Foundation
import MapKit

/// Service de persistence pour les lignes de transport
public class TransportLinePersistence {

    static let shared = TransportLinePersistence()

    // MARK: - CoreData Stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TransportLines")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("❌ Erreur de chargement CoreData: \(error)")
            }
            print("✅ CoreData chargé: \(description)")
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Save

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("✅ Contexte CoreData sauvegardé")
            } catch {
                print("❌ Erreur de sauvegarde: \(error)")
            }
        }
    }

    // MARK: - Check Migration

    /// Vérifie si la base de données a déjà été peuplée
    func isDatabasePopulated() -> Bool {
        let fetchRequest: NSFetchRequest<TransportLineEntity> = TransportLineEntity.fetchRequest()
        fetchRequest.fetchLimit = 1

        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("❌ Erreur de comptage: \(error)")
            return false
        }
    }

    // MARK: - Migration from GeoJSON

    /// Migre les données depuis les fichiers GeoJSON vers CoreData (à faire une seule fois)
    func migrateFromGeoJSON(completion: @escaping (Bool) -> Void) {
        // FORCE RELOAD: On ignore la vérification isDatabasePopulated pour forcer la mise à jour
        // avec le nouveau fichier traces-du-reseau-ferre-idf.geojson
        // TODO: Retirer ce contournement après validation si nécessaire
        /*
        if isDatabasePopulated() {
            print("ℹ️ Base de données déjà peuplée, migration ignorée")
            completion(true)
            return
        }
         */

        print("🔄 Début de la migration GeoJSON → CoreData...")

        // Utilise un contexte background pour ne pas bloquer l'UI
        persistentContainer.performBackgroundTask { backgroundContext in
            // 1. Nettoyage préventif (Clear All Data en background)
            print("🧹 Suppression des anciennes données...")
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(
                entityName: "TransportLineEntity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

            do {
                try backgroundContext.execute(deleteRequest)
                try backgroundContext.save()
                print("✅ Anciennes données supprimées.")
            } catch {
                print("❌ Erreur lors du nettoyage de la base: \(error)")
                // On continue quand même, au risque de doublons (mais peu probable avec un batch delete)
            }

            // 2. Chargement des nouvelles données
            // Parse les fichiers GeoJSON (GeoJSONTransportParser utilise maintenant traces-du-reseau-ferre-idf.geojson)
            let transportLines = GeoJSONTransportParser.parseAllTransportGeoJSON()
            print("📊 \(transportLines.count) lignes à migrer")

            var migratedCount = 0

            for (index, line) in transportLines.enumerated() {
                // Crée l'entité TransportLineEntity
                let entity = TransportLineEntity(context: backgroundContext)
                entity.routeId = line.routeId
                entity.routeShortName = line.shortName
                entity.routeLongName = line.longName
                entity.routeType = line.type
                entity.routeColor = line.color

                // Plus besoin de parser le string GeoJSON, on a déjà les coordonnées structurées
                for (segmentIndex, segment) in line.coordinates.enumerated() {
                    for point in segment {
                        let coordEntity = CoordinatePointEntity(context: backgroundContext)
                        coordEntity.latitude = point.latitude
                        coordEntity.longitude = point.longitude
                        coordEntity.segmentIndex = Int32(segmentIndex)
                        coordEntity.transportLine = entity
                    }
                }

                migratedCount += 1

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

    /// Récupère toutes les lignes de transport depuis CoreData
    func fetchAllTransportLines() -> [TransportLineEntity] {
        let fetchRequest: NSFetchRequest<TransportLineEntity> = TransportLineEntity.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            print("✅ Récupéré \(results.count) lignes depuis CoreData")
            return results
        } catch {
            print("❌ Erreur de fetch: \(error)")
            return []
        }
    }

    /// Récupère une ligne spécifique par son ID
    func fetchTransportLine(byId routeId: String) -> TransportLineEntity? {
        let fetchRequest: NSFetchRequest<TransportLineEntity> = TransportLineEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "routeId == %@", routeId)
        fetchRequest.fetchLimit = 1

        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            print("❌ Erreur de fetch: \(error)")
            return nil
        }
    }

    /// Récupère les lignes par type (ex: "Metro", "Tram", "RER")
    func fetchTransportLines(byType type: String) -> [TransportLineEntity] {
        let fetchRequest: NSFetchRequest<TransportLineEntity> = TransportLineEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "routeType == %@", type)

        do {
            let results = try context.fetch(fetchRequest)
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
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = TransportLineEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            try context.save()
            print("🗑️ Toutes les données ont été effacées")
        } catch {
            print("❌ Erreur d'effacement: \(error)")
        }
    }
}
