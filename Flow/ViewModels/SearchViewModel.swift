import Foundation
import Combine
import CoreData
import CoreLocation

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [Station] = []
    @Published var recentSearches: [Station] = [] // Could be persisted later
    
    private var cancellables = Set<AnyCancellable>()
    private let context = PersistenceController.shared.container.viewContext
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.performSearch(query: text)
            }
            .store(in: &cancellables)
    }
    
    func getMyPositionStation(location: CLLocationCoordinate2D) -> Station {
        return Station(
            id: "MY_POSITION",
            name: "Ma position",
            coordinate: location,
            platforms: [],
            isHub: false,
            mainType: .bus, // Default type, icon will be handled in UI
            lines: []
        )
    }
    
    func performSearch(query: String) {
        guard !query.isEmpty else {
            self.searchResults = []
            return
        }
        
        let request: NSFetchRequest<StopPointEntity> = StopPointEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", query)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.fetchLimit = 50
        
        do {
            let results = try context.fetch(request)
            // Group by name and city to create unique Stations (similar to MapDataService logic but simplified for search)
            let grouped = Dictionary(grouping: results) { "\($0.name ?? "")_\($0.city ?? "")" }
            
            let stations: [Station] = grouped.compactMap { (_, stops) in
                guard let first = stops.first,
                      let name = first.name,
                      let city = first.city else { return nil }
                
                // Calculate center
                let totalLat = stops.reduce(0.0) { $0 + $1.latitude }
                let totalLon = stops.reduce(0.0) { $0 + $1.longitude }
                let count = Double(stops.count)
                let center = CLLocationCoordinate2D(latitude: totalLat / count, longitude: totalLon / count)
                
                // Determine main type
                let types = stops.compactMap { $0.type }
                let mainTypeStr = types.first(where: { $0 == "RER" }) ??
                                  types.first(where: { $0 == "Transilien" }) ??
                                  types.first(where: { $0 == "Metro" }) ??
                                  types.first ?? "Bus"
                
                // Map string type to TransportType enum (reusing logic from MapDataService would be better but for now simple mapping)
                let type = self.mapType(mainTypeStr)
                
                // Create simplified Station for search result
                return Station(
                    id: first.id ?? UUID().uuidString,
                    name: name,
                    coordinate: center,
                    platforms: [], // We don't need full details here
                    isHub: false,
                    mainType: type,
                    lines: [] // We could populate this if needed
                )
            }
            
            DispatchQueue.main.async {
                self.searchResults = stations.sorted { $0.name < $1.name }
            }
            
        } catch {
            print("❌ Search error: \(error)")
        }
    }
    
    private func mapType(_ typeStr: String) -> TransportType {
        // Simple mapping, ideally share this logic
        let lower = typeStr.lowercased()
        if lower.contains("rer") { return .rer }
        if lower.contains("metro") { return .metro }
        if lower.contains("tram") { return .tram }
        if lower.contains("train") || lower.contains("transilien") { return .transilien }
        return .bus
    }
}
