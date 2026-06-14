import SwiftData
import Foundation

@MainActor
class SwiftDataStack {
    static let shared = SwiftDataStack()
    
    let container: ModelContainer
    let mainContext: ModelContext
    
    private init() {
        do {
            let schema = Schema([
                StopPointModel.self,
                TransportLineModel.self,
                CoordinatePointModel.self
            ])
            let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            self.container = try ModelContainer(for: schema, configurations: [config])
            self.mainContext = ModelContext(container)
        } catch {
            fatalError("❌ Failed to initialize SwiftData container: \(error)")
        }
    }
}
