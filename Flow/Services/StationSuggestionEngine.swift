import Foundation
import CoreLocation
import SwiftUI

/// Moteur intelligent de calcul de pertinence et de proximité pour les suggestions et la recherche de stations.
struct StationSuggestionEngine {

    private nonisolated final class NormalizationCache: @unchecked Sendable {
        static let shared = NormalizationCache()
        private let lock = NSLock()
        private var entries: [String: (folded: String, words: [String])] = [:]

        func entry(for str: String) -> (folded: String, words: [String]) {
            lock.lock()
            if let cached = entries[str] {
                lock.unlock()
                return cached
            }
            lock.unlock()

            let folded = str.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                .replacingOccurrences(of: "-", with: " ")
                .replacingOccurrences(of: "'", with: " ")
                .replacingOccurrences(of: "’", with: " ")
                .replacingOccurrences(of: ".", with: " ")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            let words = folded.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
            let value = (folded: folded, words: words)

            lock.lock()
            if entries.count > 12_000 {
                entries.removeAll(keepingCapacity: true)
            }
            entries[str] = value
            lock.unlock()
            return value
        }
    }

    // MARK: - Normalization
    nonisolated static func normalize(_ str: String) -> String {
        NormalizationCache.shared.entry(for: str).folded
    }

    /// Vérifie si une chaîne contient toutes les composantes de la recherche sans tenir compte des accents ni de la casse.
    nonisolated static func matchesQuery(text: String, tokens: [String]) -> Bool {
        let normText = normalize(text)
        return tokens.allSatisfy { token in
            let normToken = normalize(token)
            return normToken.isEmpty || normText.contains(normToken)
        }
    }

    /// Regroupe des `StopPoint` issus de SwiftData en `MapStation` tout en filtrant sur tous les tokens.
    nonisolated static func buildStations(
        from stops: [StopPoint],
        tokens: [String],
        includePlatformsAndLines: Bool = true
    ) -> [MapStation] {
        let filtered = stops.filter { stop in
            matchesQuery(text: stop.name, tokens: tokens)
        }
        let grouped = Dictionary(grouping: filtered) { stop in
            stop.stopAreaId.isEmpty ? stop.name : "\(stop.name)_\(stop.stopAreaId)"
        }

        return grouped.compactMap { (_, groupStops) -> MapStation? in
            guard let first = groupStops.first else { return nil }
            let totalLat = groupStops.reduce(0.0) { $0 + $1.coordinate.latitude }
            let totalLon = groupStops.reduce(0.0) { $0 + $1.coordinate.longitude }
            let count = Double(groupStops.count)
            let center = CLLocationCoordinate2D(latitude: totalLat / count, longitude: totalLon / count)

            let mainType = groupStops.max { $0.type.priority < $1.type.priority }?.type ?? first.type
            let stationId = first.stopAreaId.isEmpty ? first.id : first.stopAreaId

            if includePlatformsAndLines {
                let uniqueLines = Set(groupStops.map { StationLine(name: $0.lineName, type: $0.type) })
                let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }
                return MapStation(
                    id: stationId,
                    name: first.name,
                    coordinate: center,
                    platforms: groupStops,
                    isHub: false,
                    mainType: mainType,
                    lines: sortedLines,
                    city: "Paris"
                )
            } else {
                return MapStation(
                    id: stationId,
                    name: first.name,
                    coordinate: center,
                    platforms: [],
                    isHub: false,
                    mainType: mainType,
                    lines: []
                )
            }
        }
    }

    /// Génère les variantes accentuées courantes en français pour un mot/préfixe
    /// Permet aux requêtes SwiftData d'attraper les arrêts accentués même si l'utilisateur tape sans accent
    nonisolated static func accentVariants(for token: String) -> [String] {
        var variants: Set<String> = [token, token.lowercased(), token.capitalized]
        
        // Substitutions de voyelles accentuées courantes
        let map: [(String, [String])] = [
            ("e", ["e", "é", "è", "ê", "ë"]),
            ("a", ["a", "à", "â"]),
            ("i", ["i", "î", "ï"]),
            ("o", ["o", "ô"]),
            ("u", ["u", "ù", "û", "ü"]),
            ("c", ["c", "ç"])
        ]
        
        let lower = token.lowercased()
        for (base, accented) in map {
            if lower.contains(base) {
                for acc in accented {
                    let replaced = lower.replacingOccurrences(of: base, with: acc)
                    variants.insert(replaced)
                    variants.insert(replaced.capitalized)
                }
            }
        }
        
        return Array(variants)
    }

    // MARK: - Scoring Model
    /// Calcule un score pondéré pour une station selon la requête de recherche, la proximité géographique et la pertinence réseau.
    /// Plus le score est élevé, plus la station apparaîtra en haut des suggestions.
    nonisolated static func score(
        station: MapStation,
        query: String,
        tokens: [String],
        userLocation: CLLocationCoordinate2D?,
        isFavorite: Bool,
        isRecent: Bool
    ) -> Double {
        var score: Double = 0.0

        let normQuery = normalize(query)
        let nameEntry = NormalizationCache.shared.entry(for: station.name)
        let normName = nameEntry.folded
        let nameWords = nameEntry.words

        // -------------------------------------------------------------
        // 1. PERTINENCE TEXTUELLE (0 - 1500 pts)
        // -------------------------------------------------------------
        if normName == normQuery {
            // Correspondance exacte du nom (ex: "Nation" -> "Nation")
            score += 1500.0
        } else if normName.hasPrefix(normQuery) {
            // Début exact du nom (ex: "Châte" -> "Châtelet")
            score += 900.0
        } else if nameWords.contains(where: { $0.hasPrefix(normQuery) }) {
            // Un mot du nom commence par la requête (ex: "Lyon" -> "Gare de Lyon")
            score += 650.0
        } else {
            // Correspondance par tokens multiples
            var prefixMatches = 0
            var substringMatches = 0
            for token in tokens {
                let normToken = normalize(token)
                guard !normToken.isEmpty else { continue }
                if nameWords.contains(where: { $0.hasPrefix(normToken) }) {
                    prefixMatches += 1
                } else if normName.contains(normToken) {
                    substringMatches += 1
                }
            }
            if !tokens.isEmpty && prefixMatches == tokens.count {
                score += 500.0
            } else {
                score += Double(prefixMatches) * 150.0 + Double(substringMatches) * 60.0
            }
        }

        // Correspondance sur la ville / sous-titre
        if let city = station.city {
            let normCity = normalize(city)
            if normCity.contains(normQuery) {
                score += 80.0
            }
        }

        // Ratio de longueur pour favoriser les noms concis quand la requête est courte
        if !normName.isEmpty && !normQuery.isEmpty {
            let lengthRatio = Double(normQuery.count) / Double(normName.count)
            score += lengthRatio * 100.0
        }

        // -------------------------------------------------------------
        // 2. IMPORTANCE RÉSEAU & HIÉRARCHIE (0 - 350 pts)
        // -------------------------------------------------------------
        if station.isHub {
            score += 200.0
        }

        switch station.mainType {
        case .rer:
            score += 140.0
        case .metro:
            score += 120.0
        case .transilien, .train:
            score += 100.0
        case .tram:
            score += 70.0
        case .cable:
            score += 40.0
        case .bus:
            score += 10.0
        }

        // Nombre de lignes en correspondance (jusqu'à +90 pts)
        score += min(Double(station.lines.count) * 15.0, 90.0)

        // -------------------------------------------------------------
        // 3. PERSONNALISATION (0 - 350 pts)
        // -------------------------------------------------------------
        if isFavorite {
            score += 250.0
        }
        if isRecent {
            score += 120.0
        }

        // -------------------------------------------------------------
        // 4. PROXIMITÉ GÉOGRAPHIQUE & BOOST DISTANCE (0 - 450 pts)
        // -------------------------------------------------------------
        if let userCoord = userLocation, isValidCoordinate(userCoord) {
            let userLoc = CLLocation(latitude: userCoord.latitude, longitude: userCoord.longitude)
            let stationLoc = CLLocation(latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
            let distanceMeters = userLoc.distance(from: stationLoc)

            if distanceMeters <= 400 {
                // Immédiatement accessible à pied (< 5 min)
                score += 450.0
            } else if distanceMeters <= 1000 {
                // Marche courte (< 12 min)
                score += 350.0
            } else if distanceMeters <= 2500 {
                // Proximité moyenne (< 2.5 km)
                score += 240.0
            } else if distanceMeters <= 5000 {
                // 2.5 - 5 km
                score += 150.0
            } else if distanceMeters <= 10000 {
                // 5 - 10 km
                score += 80.0
            } else if distanceMeters <= 25000 {
                // 10 - 25 km
                score += 30.0
            }

            // Bonus continu pour départager les stations proches
            if distanceMeters < 20000 {
                score += max(0, (20000.0 - distanceMeters) / 400.0)
            }
        }

        return score
    }

    private nonisolated static func isValidCoordinate(_ coord: CLLocationCoordinate2D) -> Bool {
        return coord.latitude >= -90 && coord.latitude <= 90 &&
               coord.longitude >= -180 && coord.longitude <= 180 &&
               (coord.latitude != 0 || coord.longitude != 0)
    }

    // MARK: - Ranking Method
    /// Trie et classe une liste de stations selon la pertinence et la proximité.
    nonisolated static func rank(
        stations: [MapStation],
        query: String,
        userLocation: CLLocationCoordinate2D?,
        favoriteIds: Set<String>,
        recentIds: Set<String>
    ) -> [MapStation] {
        FlowPerformanceProfiler.measure("RankStations", detail: "count=\(stations.count)") {
            let normQuery = normalize(query)
            let tokens = normQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }

            let scored = stations.map { station in
                (
                    station: station,
                    score: score(
                        station: station,
                        query: normQuery,
                        tokens: tokens,
                        userLocation: userLocation,
                        isFavorite: favoriteIds.contains(station.id),
                        isRecent: recentIds.contains(station.id)
                    )
                )
            }

            return scored.sorted {
                if $0.score != $1.score {
                    return $0.score > $1.score
                }
                return $0.station.name.localizedStandardCompare($1.station.name) == .orderedAscending
            }.map { $0.station }
        }
    }

    // MARK: - Nearby Suggestions
    /// Récupère les stations les plus proches de l'utilisateur lorsque le champ de recherche est vide.
    nonisolated static func nearbySuggestions(
        from allStations: [MapStation],
        userLocation: CLLocationCoordinate2D?,
        maxResults: Int = 5
    ) -> [MapStation] {
        guard let userCoord = userLocation, isValidCoordinate(userCoord) else { return [] }
        let userLoc = CLLocation(latitude: userCoord.latitude, longitude: userCoord.longitude)

        var withDistance: [(station: MapStation, distanceMeters: Double)] = []
        for station in allStations {
            let stationLoc = CLLocation(latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
            let distance = userLoc.distance(from: stationLoc)
            // Seuil raisonnable (ex: < 10 km)
            if distance <= 10000 {
                withDistance.append((station, distance))
            }
        }

        withDistance.sort { lhs, rhs in
            if abs(lhs.distanceMeters - rhs.distanceMeters) > 100 {
                return lhs.distanceMeters < rhs.distanceMeters
            }
            // En cas de distance équivalente, favoriser les stations ferroviaires/hubs
            let lhsPriority = lhs.station.mainType.priority
            let rhsPriority = rhs.station.mainType.priority
            if lhsPriority != rhsPriority {
                return lhsPriority > rhsPriority
            }
            return lhs.distanceMeters < rhs.distanceMeters
        }

        return withDistance.prefix(maxResults).map { $0.station }
    }
}
