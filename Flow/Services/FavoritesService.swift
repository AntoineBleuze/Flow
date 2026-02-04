import Combine
import Foundation

class FavoritesService: ObservableObject {
    static let shared = FavoritesService()

    @Published var favoriteStationIds: Set<String> = []

    var favoriteStations: [MapStation] {
        let allStations = MapDataService.shared.allStations
        return favoriteStationIds.compactMap { id in
            allStations.first { $0.id == id }
        }
    }

    private let favoritesKey = "favorite_stations"

    private init() {
        loadFavorites()
    }

    func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            favoriteStationIds = Set(saved)
        }
    }

    func toggleFavorite(stationId: String) {
        if favoriteStationIds.contains(stationId) {
            favoriteStationIds.remove(stationId)
        } else {
            favoriteStationIds.insert(stationId)
        }
        saveFavorites()
    }

    func isFavorite(stationId: String) -> Bool {
        return favoriteStationIds.contains(stationId)
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteStationIds), forKey: favoritesKey)
    }
}
