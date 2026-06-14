import Combine
import Foundation

class FavoritesService: ObservableObject {
    static let shared = FavoritesService()

    @Published var favoriteLineKeys: Set<String> = []

    private let favoritesKey = "favorite_station_lines"

    var favoriteStationIds: Set<String> {
        Set(favoriteLineKeys.compactMap { $0.components(separatedBy: "|").first })
    }

    var favoriteStations: [MapStation] {
        let allStations = MapDataService.shared.allStations
        let ids = favoriteStationIds
        return ids.compactMap { id in
            allStations.first { $0.id == id }
        }
    }

    private init() {
        loadFavorites()
        loadFavoriteLines()
    }

    func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            favoriteLineKeys = Set(saved)
        } else {
            // Migration check: if they had old favorite stations
            if let oldSaved = UserDefaults.standard.array(forKey: "favorite_stations") as? [String] {
                // If MapDataService isn't loaded yet, we can register to migrate when it's ready, or do a best effort.
                // We'll migrate the next time favoriteStations is requested or immediately if allStations is populated.
                let allStations = MapDataService.shared.allStations
                if !allStations.isEmpty {
                    var newKeys = Set<String>()
                    for stationId in oldSaved {
                        if let station = allStations.first(where: { $0.id == stationId }) {
                            for line in station.lines {
                                newKeys.insert("\(stationId)|\(line.name)")
                            }
                        }
                    }
                    favoriteLineKeys = newKeys
                    saveFavorites()
                    UserDefaults.standard.removeObject(forKey: "favorite_stations")
                } else {
                    // Fallback: just store the station IDs in favoriteLineKeys temporarily as stationId|
                    // and we will clean it up later if we want, or let's just use stationId|migrated.
                    favoriteLineKeys = Set(oldSaved.map { "\($0)|" })
                    saveFavorites()
                    UserDefaults.standard.removeObject(forKey: "favorite_stations")
                }
            }
        }
        
        // Clean up any temporary migration keys of type "stationId|" if allStations is now populated
        let allStations = MapDataService.shared.allStations
        if !allStations.isEmpty {
            var updated = false
            var currentKeys = favoriteLineKeys
            for key in currentKeys {
                if key.endsWith("|") {
                    let stationId = String(key.dropLast())
                    currentKeys.remove(key)
                    if let station = allStations.first(where: { $0.id == stationId }) {
                        for line in station.lines {
                            currentKeys.insert("\(stationId)|\(line.name)")
                        }
                    }
                    updated = true
                }
            }
            if updated {
                favoriteLineKeys = currentKeys
                saveFavorites()
            }
        }
    }

    func toggleFavorite(stationId: String, lineLabel: String) {
        let key = "\(stationId)|\(lineLabel)"
        if favoriteLineKeys.contains(key) {
            favoriteLineKeys.remove(key)
        } else {
            favoriteLineKeys.insert(key)
        }
        saveFavorites()
    }

    func isFavorite(stationId: String, lineLabel: String) -> Bool {
        let key = "\(stationId)|\(lineLabel)"
        return favoriteLineKeys.contains(key)
    }

    // Backward compatibility helper
    func toggleFavorite(stationId: String) {
        let allStations = MapDataService.shared.allStations
        if let station = allStations.first(where: { $0.id == stationId }) {
            let isFav = isFavorite(stationId: stationId)
            for line in station.lines {
                let key = "\(stationId)|\(line.name)"
                if isFav {
                    favoriteLineKeys.remove(key)
                } else {
                    favoriteLineKeys.insert(key)
                }
            }
            saveFavorites()
        }
    }

    // Backward compatibility helper
    func isFavorite(stationId: String) -> Bool {
        return favoriteStationIds.contains(stationId)
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteLineKeys), forKey: favoritesKey)
    }

    // Transit lines favorites
    @Published var favoriteLinesList: Set<String> = []
    private let favoriteLinesKey = "favorite_transit_lines"

    func toggleFavoriteLine(
        lineId: String,
        type: TransportType,
        stationId: String? = nil,
        stationName: String? = nil,
        color: String? = nil,
        textColor: String? = nil
    ) {
        let key: String
        if let stationId = stationId, let stationName = stationName {
            let col = color ?? ""
            let textCol = textColor ?? ""
            key = "\(lineId)|\(type.rawValue)|\(stationId)|\(stationName)|\(col)|\(textCol)"
        } else {
            key = "\(lineId)|\(type.rawValue)"
        }
        
        if let stationId = stationId {
            let prefix = "\(lineId)|\(type.rawValue)|\(stationId)|"
            if let existingKey = favoriteLinesList.first(where: { $0.hasPrefix(prefix) }) {
                favoriteLinesList.remove(existingKey)
            } else {
                favoriteLinesList.insert(key)
            }
        } else {
            let exactKey = "\(lineId)|\(type.rawValue)"
            if favoriteLinesList.contains(exactKey) {
                favoriteLinesList.remove(exactKey)
            } else {
                favoriteLinesList.insert(exactKey)
            }
        }
        saveFavoriteLines()
    }

    func isFavoriteLine(lineId: String, type: TransportType, stationId: String? = nil) -> Bool {
        if let stationId = stationId {
            let prefix = "\(lineId)|\(type.rawValue)|\(stationId)|"
            return favoriteLinesList.contains(where: { $0.hasPrefix(prefix) })
        } else {
            let key = "\(lineId)|\(type.rawValue)"
            return favoriteLinesList.contains(key)
        }
    }

    func loadFavoriteLines() {
        if let saved = UserDefaults.standard.array(forKey: favoriteLinesKey) as? [String] {
            favoriteLinesList = Set(saved)
        } else {
            favoriteLinesList = []
        }
    }

    private func saveFavoriteLines() {
        UserDefaults.standard.set(Array(favoriteLinesList), forKey: favoriteLinesKey)
    }
}

struct FavoriteLineEntry: Identifiable, Hashable {
    var id: String { key }
    let key: String
    let lineId: String
    let type: TransportType
    let stationId: String?
    let stationName: String?
    let color: String?
    let textColor: String?

    init?(key: String) {
        let components = key.components(separatedBy: "|")
        guard components.count >= 2 else { return nil }
        self.key = key
        self.lineId = components[0]
        guard let type = TransportType(rawValue: components[1]) else { return nil }
        self.type = type
        
        if components.count >= 4 {
            self.stationId = components[2]
            self.stationName = components[3]
        } else {
            self.stationId = nil
            self.stationName = nil
        }
        
        if components.count >= 5 {
            self.color = components[4].isEmpty ? nil : components[4]
        } else {
            self.color = nil
        }
        
        if components.count >= 6 {
            self.textColor = components[5].isEmpty ? nil : components[5]
        } else {
            self.textColor = nil
        }
    }
}

// Simple extension helper
extension String {
    func endsWith(_ suffix: String) -> Bool {
        return self.hasSuffix(suffix)
    }
}
