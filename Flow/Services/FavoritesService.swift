import Combine
import Foundation

public class FavoritesService: ObservableObject {
    public static let shared = FavoritesService()

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

    public func toggleFavorite(stationId: String) {
        if favoriteStationIds.contains(stationId) {
            favoriteStationIds.remove(stationId)
        } else {
            favoriteStationIds.insert(stationId)
        }
        saveFavorites()
    }

    public func isFavorite(stationId: String) -> Bool {
        return favoriteStationIds.contains(stationId)
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteStationIds), forKey: favoritesKey)
    }
}
