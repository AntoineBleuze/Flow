import CoreData

class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Flow")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        let loadStores = {
            self.container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    print("❌ Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("⚠️ Failed to load Core Data store: \(error). Attempting to recreate...")
                
                // En cas d'erreur (ex: migration impossible), on supprime le store et on réessaie
                if let url = storeDescription.url {
                    do {
                        try self.container.persistentStoreCoordinator.destroyPersistentStore(at: url, ofType: storeDescription.type, options: nil)
                        print("✅ Store destroyed successfully.")
                        loadStores() // Retry loading
                    } catch {
                        print("❌ Failed to destroy persistent store: \(error)")
                    }
                }
            }
        })
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
