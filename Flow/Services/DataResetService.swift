import Foundation
#if canImport(WidgetKit)
import WidgetKit
#endif

/// Service centralisant les statistiques de stockage local et les opérations de réinitialisation.
@MainActor
enum DataResetService {

    /// Instantané des volumes de données locales stockées par Flow.
    struct DataStats: Equatable {
        let favoriteStationsCount: Int
        let favoriteLinesCount: Int
        let searchHistoryCount: Int
        let elevatorCacheEntriesCount: Int
        let urlCacheBytes: Int

        var totalFavoritesCount: Int {
            favoriteStationsCount + favoriteLinesCount
        }
    }

    private static let elevatorCachePrefix = "elevator_cache_"

    private static let transportDatabaseFlagKeys = [
        "cached_data_version",
        "cached_traces_version",
        "didImportBusStops_SwiftData_v2",
        "didImportBusStops_SwiftData_v3",
        "didMigrateToJSONStations_SwiftData_v1"
    ]

    static func currentStats() -> DataStats {
        let elevatorKeysCount = UserDefaults.standard.dictionaryRepresentation().keys
            .filter { $0.hasPrefix(elevatorCachePrefix) }
            .count

        let cacheBytes = URLCache.shared.currentDiskUsage + URLCache.shared.currentMemoryUsage

        return DataStats(
            favoriteStationsCount: FavoritesService.shared.favoriteStationIds.count,
            favoriteLinesCount: FavoritesService.shared.favoriteLinesList.count,
            searchHistoryCount: SearchHistoryManager.shared.recentStations.count,
            elevatorCacheEntriesCount: elevatorKeysCount,
            urlCacheBytes: cacheBytes
        )
    }

    static func clearSearchHistory() {
        SearchHistoryManager.shared.clearHistory()
    }

    static func clearFavorites() {
        FavoritesService.shared.clearAllFavorites()
    }

    static func clearCaches() {
        let standardDefaults = UserDefaults.standard
        for key in standardDefaults.dictionaryRepresentation().keys where key.hasPrefix(elevatorCachePrefix) {
            standardDefaults.removeObject(forKey: key)
        }
        URLCache.shared.removeAllCachedResponses()
    }

    static func resetTransportDatabaseFlags() {
        let standardDefaults = UserDefaults.standard
        for key in transportDatabaseFlagKeys {
            standardDefaults.removeObject(forKey: key)
        }
    }

    static func resetPreferences() {
        UserPreferencesManager.shared.resetAllPreferences()
    }

    static func performFullReset() {
        clearSearchHistory()
        clearFavorites()
        clearCaches()
        resetTransportDatabaseFlags()
        resetPreferences()

        #if canImport(WidgetKit)
        WidgetCenter.shared.reloadAllTimelines()
        #endif
    }
}
