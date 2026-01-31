import Combine
import Foundation

class SearchHistoryManager: ObservableObject {
    static let shared = SearchHistoryManager()

    @Published var recentStations: [MapStation] = []

    private let maxHistorySize = 10
    private let historyKey = "SearchHistory"

    private init() {
        loadHistory()
    }

    func addSearch(_ station: MapStation) {
        // Remove existing if present to move it to top
        recentStations.removeAll { $0.id == station.id }

        // Insert at beginning
        recentStations.insert(station, at: 0)

        // Trim to max size
        if recentStations.count > maxHistorySize {
            recentStations = Array(recentStations.prefix(maxHistorySize))
        }

        saveHistory()
    }

    private func saveHistory() {
        let ids = recentStations.map { $0.id }
        UserDefaults.standard.set(ids, forKey: historyKey)
    }

    func loadHistory() {
        guard let ids = UserDefaults.standard.stringArray(forKey: historyKey) else { return }

        // We need to fetch the actual MapStation objects from MapDataService
        let allStations = MapDataService.shared.getAllStationsSync()

        self.recentStations = ids.compactMap { id in
            allStations.first { $0.id == id }
        }
    }

    // Call this when MapDataService is ready to refresh the history objects
    func refreshHistory() {
        loadHistory()
    }
}
