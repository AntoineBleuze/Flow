import Foundation

// MARK: - Structures de données légères CSA (Phase 1)

/// Arrêt ou station parente du graphe de transport local indexé par entier 32 bits.
struct Stop: Sendable, Equatable, Codable, Identifiable {
    let id: Int32
    let name: String
    let latitude: Double
    let longitude: Double
    let parentStationId: Int32?

    init(
        id: Int32,
        name: String,
        latitude: Double,
        longitude: Double,
        parentStationId: Int32? = nil
    ) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.parentStationId = parentStationId
    }
}

/// Connexion élémentaire entre deux arrêts consécutifs d'une même course (24 octets contigus).
/// Stockée dans un `ContiguousArray<Connection>` trié par `departureTime` croissant.
struct Connection: Sendable, Equatable, Codable {
    let departureStop: Int32
    let arrivalStop: Int32
    let departureTime: Int32 // Secondes depuis minuit (peut dépasser 86400 après minuit)
    let arrivalTime: Int32
    let tripId: Int32
    let lineId: Int32

    init(
        departureStop: Int32,
        arrivalStop: Int32,
        departureTime: Int32,
        arrivalTime: Int32,
        tripId: Int32,
        lineId: Int32
    ) {
        self.departureStop = departureStop
        self.arrivalStop = arrivalStop
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.tripId = tripId
        self.lineId = lineId
    }
}

/// Mode de transport compacté sur 1 octet.
enum CSATransportMode: UInt8, Sendable, Equatable, Codable {
    case tram = 0
    case metro = 1
    case rer = 2
    case transilien = 3
    case cable = 4
    case bus = 5

    var transportType: TransportType {
        switch self {
        case .tram: return .tram
        case .metro: return .metro
        case .rer: return .rer
        case .transilien: return .transilien
        case .cable: return .metro
        case .bus: return .bus
        }
    }
}

/// Métadonnées compactes d'une ligne indexée par `Int32`.
struct CSALine: Sendable, Equatable, Codable, Identifiable {
    let id: Int32
    let code: String
    let name: String
    let mode: CSATransportMode
    let colorHex: String
}

/// Correspondance piétonne orientée entre deux arrêts/quais, avec malus éventuel de confort.
struct CSAFootpath: Sendable, Equatable, Codable {
    let fromStop: Int32
    let toStop: Int32
    let durationSeconds: Int32
    let comfortPenaltySeconds: Int32

    init(
        fromStop: Int32,
        toStop: Int32,
        durationSeconds: Int32,
        comfortPenaltySeconds: Int32 = 0
    ) {
        self.fromStop = fromStop
        self.toStop = toStop
        self.durationSeconds = durationSeconds
        self.comfortPenaltySeconds = comfortPenaltySeconds
    }
}

// MARK: - Modèles de parcours reconstruit (Phases 2–4)

/// Tronçon effectué à bord d'un véhicule (même `tripId`).
struct CSARideLeg: Sendable, Equatable {
    let lineId: Int32
    let tripId: Int32
    let departureStop: Int32
    let arrivalStop: Int32
    let departureTime: Int32
    let arrivalTime: Int32
    let connections: [Connection]

    var durationSeconds: Int32 {
        arrivalTime - departureTime
    }

    var intermediateStopIds: [Int32] {
        guard connections.count > 1 else { return [] }
        return connections.dropLast().map(\.arrivalStop)
    }
}

/// Tronçon de marche / correspondance entre deux quais ou stations.
struct CSAFootpathLeg: Sendable, Equatable {
    let fromStop: Int32
    let toStop: Int32
    let departureTime: Int32
    let arrivalTime: Int32
    let durationSeconds: Int32
    let comfortPenaltySeconds: Int32

    init(
        fromStop: Int32,
        toStop: Int32,
        departureTime: Int32,
        arrivalTime: Int32,
        durationSeconds: Int32,
        comfortPenaltySeconds: Int32 = 0
    ) {
        self.fromStop = fromStop
        self.toStop = toStop
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.durationSeconds = durationSeconds
        self.comfortPenaltySeconds = comfortPenaltySeconds
    }
}

/// Étape élémentaire d'un itinéraire CSA.
enum CSAJourneyStep: Sendable, Equatable {
    case ride(CSARideLeg)
    case transfer(CSAFootpathLeg)

    var departureTime: Int32 {
        switch self {
        case .ride(let leg): return leg.departureTime
        case .transfer(let leg): return leg.departureTime
        }
    }

    var arrivalTime: Int32 {
        switch self {
        case .ride(let leg): return leg.arrivalTime
        case .transfer(let leg): return leg.arrivalTime
        }
    }
}

/// Itinéraire complet issu du moteur CSA.
struct CSAJourney: Sendable, Equatable {
    let originStop: Int32
    let destinationStop: Int32
    let queryDepartureTime: Int32
    let departureTime: Int32
    let arrivalTime: Int32
    let steps: [CSAJourneyStep]

    /// Durée effective du trajet entre le départ réel et l'arrivée ($T_{\text{total}}$).
    var totalDurationSeconds: Int32 {
        arrivalTime - departureTime
    }

    /// Temps total écoulé depuis l'heure de recherche demandée (attente initiale incluse).
    var elapsedSinceQuerySeconds: Int32 {
        arrivalTime - queryDepartureTime
    }

    /// Liste des tronçons ferrés/véhicules empruntés.
    var rideLegs: [CSARideLeg] {
        steps.compactMap { step in
            if case .ride(let leg) = step { return leg }
            return nil
        }
    }

    /// Nombre de correspondances entre véhicules ($N_{\text{corr}}$).
    var transferCount: Int {
        max(0, rideLegs.count - 1)
    }

    /// Cumul des temps physiques de marche en correspondance ($T_{\text{marche}}$, secondes).
    var totalWalkingSeconds: Int32 {
        steps.reduce(0) { acc, step in
            if case .transfer(let fp) = step {
                return acc + fp.durationSeconds
            }
            return acc
        }
    }

    /// Cumul des malus d'inconfort liés aux couloirs pénibles (secondes équivalentes).
    var totalComfortPenaltySeconds: Int32 {
        steps.reduce(0) { acc, step in
            if case .transfer(let fp) = step {
                return acc + fp.comfortPenaltySeconds
            }
            return acc
        }
    }

    /// Cumul des temps d'attente à quai ($T_{\text{attente}}$, secondes).
    var totalWaitingSeconds: Int32 {
        guard !steps.isEmpty else { return 0 }
        var wait: Int32 = max(0, steps[0].departureTime - queryDepartureTime)
        for index in 0..<(steps.count - 1) {
            let gap = steps[index + 1].departureTime - steps[index].arrivalTime
            if gap > 0 {
                wait += gap
            }
        }
        return wait
    }
}

// MARK: - Conteneur réseau en mémoire indexé O(1)

/// Réseau horaire complet optimisé pour le balayage linéaire CSA.
final class CSANetworkData: Sendable {
    let stops: ContiguousArray<Stop>
    let lines: ContiguousArray<CSALine>
    let transfers: ContiguousArray<CSAFootpath>
    /// Connexions triées strictement par `departureTime` croissant (prérequis CSA).
    let connections: ContiguousArray<Connection>

    /// Index O(1) : `childStopsByParent[parentId]` donne les quais rattachés à une station parente.
    let childStopsByParent: [[Int32]]
    /// Index O(1) : `outgoingFootpaths[stopId]` donne les correspondances sortantes de cet arrêt.
    let outgoingFootpaths: [[CSAFootpath]]
    /// Index O(1) : `primaryLineByStop[stopId]` identifie la ligne principale desservant un quai (`-1` si aucune ou multiple).
    let primaryLineByStop: [Int32]
    /// Nombre total de slots `tripId` à allouer lors du scan (`maxTripId + 1`).
    let tripSlotCount: Int
    /// Recherche rapide par nom de station normalisé.
    let stopIdsByNormalizedName: [String: [Int32]]
    /// Recherche rapide d'une ligne par code normalisé (`"m12"`, `"rera"`, `"4"`, etc.).
    let lineIdByNormalizedCode: [String: Int32]

    init(
        stops: ContiguousArray<Stop>,
        lines: ContiguousArray<CSALine>,
        transfers: ContiguousArray<CSAFootpath>,
        connections: ContiguousArray<Connection>,
        ensureSortedConnections: Bool = true
    ) {
        self.stops = stops
        self.lines = lines
        self.transfers = transfers

        if ensureSortedConnections && !CSANetworkData.isSortedByDeparture(connections) {
            let sorted = connections.sorted { lhs, rhs in
                if lhs.departureTime != rhs.departureTime {
                    return lhs.departureTime < rhs.departureTime
                }
                if lhs.arrivalTime != rhs.arrivalTime {
                    return lhs.arrivalTime < rhs.arrivalTime
                }
                return lhs.tripId < rhs.tripId
            }
            self.connections = ContiguousArray(sorted)
        } else {
            self.connections = connections
        }

        let stopCount = stops.count
        var children = Array(repeating: [Int32](), count: stopCount)
        var nameIndex: [String: [Int32]] = [:]

        for stop in stops {
            let idx = Int(stop.id)
            if let parentId = stop.parentStationId, parentId >= 0, Int(parentId) < stopCount {
                children[Int(parentId)].append(stop.id)
            }
            if idx >= 0 && idx < stopCount {
                let norm = CSANetworkData.normalizeName(stop.name)
                nameIndex[norm, default: []].append(stop.id)
            }
        }
        self.childStopsByParent = children
        self.stopIdsByNormalizedName = nameIndex

        var codeMap: [String: Int32] = [:]
        for line in lines {
            let compactCode = CSANetworkData.normalizeLineCode(line.code)
            codeMap[compactCode] = line.id
            // Alias pratiques (ex: "M4" -> "4", "RER A" -> "A")
            if line.mode == .metro && compactCode.hasPrefix("m") && compactCode.count > 1 {
                let stripped = String(compactCode.dropFirst())
                codeMap.updateValue(line.id, forKey: stripped)
            } else if line.mode == .rer && compactCode.hasPrefix("rer") && compactCode.count > 3 {
                let stripped = String(compactCode.dropFirst(3))
                codeMap.updateValue(line.id, forKey: stripped)
            }
        }
        self.lineIdByNormalizedCode = codeMap

        var footpaths = Array(repeating: [CSAFootpath](), count: stopCount)
        for fp in transfers {
            let fromIdx = Int(fp.fromStop)
            let toIdx = Int(fp.toStop)
            if fromIdx >= 0 && fromIdx < stopCount && toIdx >= 0 && toIdx < stopCount {
                footpaths[fromIdx].append(fp)
            }
        }
        self.outgoingFootpaths = footpaths

        // Détermination de la ligne associée à chaque quai (-1 si non desservi, -2 si partagé par plusieurs lignes)
        var stopLine = Array(repeating: Int32(-1), count: stopCount)
        var maxTrip: Int32 = -1
        for conn in self.connections {
            if conn.tripId > maxTrip {
                maxTrip = conn.tripId
            }
            for sid in [Int(conn.departureStop), Int(conn.arrivalStop)] where sid >= 0 && sid < stopCount {
                let existing = stopLine[sid]
                if existing == -1 {
                    stopLine[sid] = conn.lineId
                } else if existing != conn.lineId {
                    stopLine[sid] = -2
                }
            }
        }
        self.primaryLineByStop = stopLine
        self.tripSlotCount = max(0, Int(maxTrip) + 1)
    }

    /// Vérifie que le tableau `ContiguousArray<Connection>` est trié par `departureTime` croissant.
    static func isSortedByDeparture(_ connections: ContiguousArray<Connection>) -> Bool {
        guard connections.count > 1 else { return true }
        return connections.withUnsafeBufferPointer { buffer in
            for i in 0..<(buffer.count - 1) {
                if buffer[i].departureTime > buffer[i + 1].departureTime {
                    return false
                }
            }
            return true
        }
    }

    /// Recherche dichotomique O(log N) de la première connexion partant à `time` ou après.
    func firstConnectionIndex(departingAtOrAfter time: Int32) -> Int {
        connections.withUnsafeBufferPointer { buffer in
            var low = 0
            var high = buffer.count
            while low < high {
                let mid = low + (high - low) / 2
                if buffer[mid].departureTime < time {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
            return low
        }
    }

    /// Recherche l'identifiant d'une station parente (ou arrêt autonome) par nom.
    func findStationId(named query: String) -> Int32? {
        let norm = Self.normalizeName(query)
        if let ids = stopIdsByNormalizedName[norm] {
            if let parent = ids.first(where: { stops[Int($0)].parentStationId == nil }) {
                return parent
            }
            return ids.first
        }
        // Recherche déterministe en privilégiant le nom le plus proche en longueur
        let candidates = stopIdsByNormalizedName
            .filter { key, _ in key.contains(norm) || norm.contains(key) }
            .sorted { abs($0.key.count - norm.count) < abs($1.key.count - norm.count) }

        for (_, ids) in candidates {
            if let parent = ids.first(where: { stops[Int($0)].parentStationId == nil }) {
                return parent
            }
            if let first = ids.first {
                return first
            }
        }
        return nil
    }

    /// Recherche l'identifiant `Int32` d'une ligne à partir de son code (`"M12"`, `"12"`, `"RER A"`, `"T3a"`).
    func findLineId(coded code: String) -> Int32? {
        lineIdByNormalizedCode[Self.normalizeLineCode(code)]
    }

    static func normalizeLineCode(_ code: String) -> String {
        code
            .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: Locale(identifier: "fr_FR"))
            .lowercased()
            .unicodeScalars
            .filter { CharacterSet.alphanumerics.contains($0) }
            .map(String.init)
            .joined()
    }

    static func normalizeName(_ text: String) -> String {
        let folded = text
            .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: Locale(identifier: "fr_FR"))
            .lowercased()
        let cleaned = folded.unicodeScalars.map { scalar -> Character in
            if CharacterSet.alphanumerics.contains(scalar) {
                return Character(scalar)
            }
            return " "
        }
        return String(cleaned)
            .split(whereSeparator: \.isWhitespace)
            .joined(separator: " ")
    }
}
