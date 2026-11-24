import Foundation
import CoreLocation
import MapKit

struct TransitLeg: Sendable {
    let lineName: String
    let transportType: TransportType
    let fromStation: MapStation
    let toStation: MapStation
    let intermediateStations: [MapStation]
    let durationSeconds: Int
    let direction: String
    let isWalkTransfer: Bool

    init(
        lineName: String,
        transportType: TransportType,
        fromStation: MapStation,
        toStation: MapStation,
        intermediateStations: [MapStation],
        durationSeconds: Int,
        direction: String,
        isWalkTransfer: Bool = false
    ) {
        self.lineName = lineName
        self.transportType = transportType
        self.fromStation = fromStation
        self.toStation = toStation
        self.intermediateStations = intermediateStations
        self.durationSeconds = durationSeconds
        self.direction = direction
        self.isWalkTransfer = isWalkTransfer
    }
}

struct TransitRoute: Sendable {
    let originStation: MapStation
    let destinationStation: MapStation
    let legs: [TransitLeg]
    let totalDurationSeconds: Int
    let numberOfTransfers: Int
}

final class TransitGraphRouter: @unchecked Sendable {
    static let shared = TransitGraphRouter()
    static let gpeLineNames: Set<String> = ["15", "16", "17", "18"]
    private static let walkTransferLine = "WALK_TRANSFER"

    private static func normalizeKey(_ str: String) -> String {
        let folded = str.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .replacingOccurrences(of: "-", with: " ")
            .replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")
            .replacingOccurrences(of: ".", with: " ")
            .replacingOccurrences(of: "\"", with: " ")
        return folded.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
    }

    private struct GraphEdge {
        let toStationName: String
        let lineName: String
        let transportType: TransportType
        let weightSeconds: Int
        let isGPE: Bool
        let isWalkTransfer: Bool
    }

    private var adjacency: [String: [GraphEdge]] = [:]
    private var isInitialized = false
    private var builtWithGPE = false
    private let lock = NSLock()

    private init() {}

    func buildGraphIfNeeded(stations: [MapStation]) {
        lock.lock()
        defer { lock.unlock() }

        let stationsHaveGPE = stations.contains { station in
            station.lines.contains { Self.gpeLineNames.contains($0.name) }
        }

        if isInitialized && (!stationsHaveGPE || builtWithGPE) {
            return
        }

        adjacency.removeAll()

        // Build station map by normalized name
        var stationByName: [String: MapStation] = [:]
        for station in stations {
            let key = Self.normalizeKey(station.name)
            if stationByName[key] == nil {
                stationByName[key] = station
            }
        }

        // 1. Traverse all existing lines from LocalDataService
        if let network = LocalDataService.shared.networkData {
            for line in network.lignes {
                let cleanLineName = line.id
                    .replacingOccurrences(of: "M", with: "")
                    .replacingOccurrences(of: "RER ", with: "")
                    .replacingOccurrences(of: "T", with: "")

                let tType: TransportType
                if line.id.starts(with: "RER") {
                    tType = .rer
                } else if line.id.starts(with: "T") {
                    tType = .tram
                } else if ["H", "J", "K", "L", "N", "P", "R", "U", "V"].contains(cleanLineName) {
                    tType = .transilien
                } else {
                    tType = .metro
                }

                let lineStations = line.allStations
                guard lineStations.count >= 2 else { continue }

                for i in 0..<(lineStations.count - 1) {
                    let s1 = Self.normalizeKey(lineStations[i].nom)
                    let s2 = Self.normalizeKey(lineStations[i + 1].nom)

                    let edgeTime = (tType == .rer || tType == .transilien) ? 150 : 100
                    addEdge(from: s1, to: s2, line: cleanLineName, type: tType, weight: edgeTime, isGPE: false)
                    addEdge(from: s2, to: s1, line: cleanLineName, type: tType, weight: edgeTime, isGPE: false)
                }
            }
        }

        // 2. Also build edges from MapStation.lines if linesstops.json is partial (excluding GPE, handled separately)
        for station in stations {
            let sNorm = Self.normalizeKey(station.name)
            for line in station.lines where !Self.gpeLineNames.contains(line.name) {
                let siblings = stations.filter { s in
                    s.lines.contains(where: { $0.name == line.name })
                }
                let sLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
                let sortedSiblings = siblings.filter { $0.id != station.id }.sorted {
                    sLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                    sLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
                }

                for close in sortedSiblings.prefix(2) {
                    let cNorm = Self.normalizeKey(close.name)
                    let distMeters = sLoc.distance(from: CLLocation(latitude: close.latitude, longitude: close.longitude))
                    if distMeters < 2500 {
                        let weight = max(80, Int(distMeters / 11.0))
                        addEdge(from: sNorm, to: cNorm, line: line.name, type: line.type, weight: weight, isGPE: false)
                        addEdge(from: cNorm, to: sNorm, line: line.name, type: line.type, weight: weight, isGPE: false)
                    }
                }
            }
        }

        // 3. Build exact Grand Paris Express topology (Lines 15, 16, 17, 18)
        if stationsHaveGPE {
            buildGPEEdges(stations: stations)
            buildWalkingTransferEdges(stations: stations)
        }

        isInitialized = true
        builtWithGPE = stationsHaveGPE
    }

    /// Construit la topologie exacte des lignes 15, 16, 17 et 18 du Grand Paris Express.
    private func buildGPEEdges(stations: [MapStation]) {
        let gpeSequences: [(line: String, stops: [String])] = [
            // Ligne 15 (boucle complète Sud + Est + Ouest)
            ("15", [
                "Pont de Sèvres", "Issy RER", "Fort d'Issy - Vanves - Clamart",
                "Châtillon - Montrouge", "Bagneux - Lucie Aubrac", "Arcueil - Cachan",
                "Villejuif Institut Gustave Roussy", "Villejuif Louis Aragon", "Vitry Centre",
                "Les Ardoines", "Le Vert de Maisons", "Créteil L'Echat",
                "Saint-Maur - Créteil", "Champigny Centre", "Nogent - Le Perreux",
                "Val de Fontenay", "Rosny Bois-Perrier", "Bondy", "Pont de Bondy",
                "Bobigny Pablo Picasso", "Drancy - Bobigny", "Fort d'Aubervilliers",
                "Mairie d'Aubervilliers", "Stade de France", "Saint-Denis Pleyel",
                "Les Grésillons", "Les Agnettes", "Bois-Colombes", "Bécon-les-Bruyères",
                "La Défense", "Nanterre La Folie", "Nanterre La Boule",
                "Rueil - Suresnes \"Mont-Valérien\"", "Saint-Cloud", "Pont de Sèvres"
            ]),
            // Ligne 15 Sud branche Est (Champigny Centre -> Noisy - Champs)
            ("15", [
                "Champigny Centre", "Bry - Villiers - Champigny", "Noisy - Champs"
            ]),
            // Ligne 16
            ("16", [
                "Saint-Denis Pleyel", "La Courneuve \"Six Routes\"", "Le Bourget RER",
                "Le Blanc-Mesnil", "Aulnay", "Sevran - Beaudottes", "Sevran - Livry",
                "Clichy - Montfermeil", "Chelles", "Noisy - Champs"
            ]),
            // Ligne 17
            ("17", [
                "Saint-Denis Pleyel", "La Courneuve \"Six Routes\"", "Le Bourget RER",
                "Le Bourget Aéroport", "Triangle de Gonesse", "Parc des Expositions",
                "Aéroport Charles de Gaulle T2", "Aéroport Charles de Gaulle T4", "Le Mesnil-Amelot"
            ]),
            // Ligne 18
            ("18", [
                "Aéroport d'Orly", "Antonypôle", "Massy Opéra", "Massy - Palaiseau",
                "Palaiseau", "Orsay - Gif", "CEA Saint-Aubin", "Saint-Quentin Est",
                "Satory", "Versailles Chantiers"
            ])
        ]

        for (lineName, stopNames) in gpeSequences {
            let lineStations = stations.filter { $0.lines.contains(where: { $0.name == lineName }) }
            guard !lineStations.isEmpty else { continue }

            func resolveStation(_ targetName: String) -> MapStation? {
                let targetNorm = Self.normalizeKey(targetName)
                if let exact = lineStations.first(where: { Self.normalizeKey($0.name) == targetNorm }) {
                    return exact
                }
                return lineStations.first(where: {
                    let sNorm = Self.normalizeKey($0.name)
                    return sNorm.contains(targetNorm) || targetNorm.contains(sNorm)
                })
            }

            let resolved = stopNames.compactMap { resolveStation($0) }
            guard resolved.count >= 2 else { continue }

            for i in 0..<(resolved.count - 1) {
                let s1 = resolved[i]
                let s2 = resolved[i + 1]
                let n1 = Self.normalizeKey(s1.name)
                let n2 = Self.normalizeKey(s2.name)
                guard n1 != n2 else { continue }

                let distMeters = CLLocation(latitude: s1.latitude, longitude: s1.longitude)
                    .distance(from: CLLocation(latitude: s2.latitude, longitude: s2.longitude))
                // Vitesse commerciale GPE (~60 km/h = 16.67 m/s) + ~25s d'arrêt en station
                let travelSeconds = max(75, Int(distMeters / 16.67) + 25)

                addEdge(from: n1, to: n2, line: lineName, type: .metro, weight: travelSeconds, isGPE: true)
                addEdge(from: n2, to: n1, line: lineName, type: .metro, weight: travelSeconds, isGPE: true)
            }
        }
    }

    /// Ajoute des correspondances piétonnes (< 400 m) entre gares GPE et gares existantes de noms différents.
    private func buildWalkingTransferEdges(stations: [MapStation]) {
        let cellSize = 0.005 // ~500m
        struct GridKey: Hashable { let lat: Int; let lon: Int }

        var grid: [GridKey: [MapStation]] = [:]
        for station in stations {
            let key = GridKey(
                lat: Int(floor(station.latitude / cellSize)),
                lon: Int(floor(station.longitude / cellSize))
            )
            grid[key, default: []].append(station)
        }

        let gpeStations = stations.filter { station in
            station.lines.contains { Self.gpeLineNames.contains($0.name) }
        }

        for gpeStation in gpeStations {
            let gpeNorm = Self.normalizeKey(gpeStation.name)
            let gpeLoc = CLLocation(latitude: gpeStation.latitude, longitude: gpeStation.longitude)
            let baseLat = Int(floor(gpeStation.latitude / cellSize))
            let baseLon = Int(floor(gpeStation.longitude / cellSize))

            for dLat in -1...1 {
                for dLon in -1...1 {
                    guard let neighbors = grid[GridKey(lat: baseLat + dLat, lon: baseLon + dLon)] else { continue }
                    for neighbor in neighbors {
                        let neighNorm = Self.normalizeKey(neighbor.name)
                        guard neighNorm != gpeNorm else { continue }

                        let dist = gpeLoc.distance(from: CLLocation(latitude: neighbor.latitude, longitude: neighbor.longitude))
                        if dist <= 400.0 {
                            let walkSec = max(120, Int(dist / 1.1) + 60)
                            addEdge(from: gpeNorm, to: neighNorm, line: Self.walkTransferLine, type: .metro, weight: walkSec, isGPE: false, isWalkTransfer: true)
                            addEdge(from: neighNorm, to: gpeNorm, line: Self.walkTransferLine, type: .metro, weight: walkSec, isGPE: false, isWalkTransfer: true)
                        }
                    }
                }
            }
        }
    }

    private func addEdge(
        from: String,
        to: String,
        line: String,
        type: TransportType,
        weight: Int,
        isGPE: Bool,
        isWalkTransfer: Bool = false
    ) {
        if adjacency[from] == nil {
            adjacency[from] = []
        }
        if !adjacency[from]!.contains(where: { $0.toStationName == to && $0.lineName == line }) {
            adjacency[from]!.append(
                GraphEdge(
                    toStationName: to,
                    lineName: line,
                    transportType: type,
                    weightSeconds: weight,
                    isGPE: isGPE,
                    isWalkTransfer: isWalkTransfer
                )
            )
        }
    }

    // MARK: - Route Search (Dijkstra with Transfer Penalty)

    func findOptimalRoute(
        from origin: MapStation,
        to destination: MapStation,
        allStations: [MapStation],
        includeGPE: Bool = false,
        preferGPE: Bool = false,
        avoidedLines: Set<String> = [],
        avoidedModes: Set<String> = [],
        avoidedStationNames: Set<String> = []
    ) -> TransitRoute? {
        buildGraphIfNeeded(stations: allStations)

        let startKey = Self.normalizeKey(origin.name)
        let endKey = Self.normalizeKey(destination.name)

        if startKey == endKey {
            return TransitRoute(
                originStation: origin,
                destinationStation: destination,
                legs: [],
                totalDurationSeconds: 0,
                numberOfTransfers: 0
            )
        }

        var stationLookup: [String: MapStation] = [:]
        for s in allStations {
            let k = Self.normalizeKey(s.name)
            if stationLookup[k] == nil {
                stationLookup[k] = s
            }
        }

        struct PathStep {
            let stationName: String
            let line: String
            let type: TransportType
            let weight: Int
            let isWalkTransfer: Bool
        }

        struct QueueItem: Comparable {
            let stationName: String
            let score: Int
            let actualDuration: Int
            let transfers: Int
            let currentLine: String?
            let lastWasWalk: Bool
            let path: [PathStep]

            static func < (lhs: QueueItem, rhs: QueueItem) -> Bool {
                if lhs.score != rhs.score {
                    return lhs.score < rhs.score
                }
                return lhs.transfers < rhs.transfers
            }

            static func == (lhs: QueueItem, rhs: QueueItem) -> Bool {
                lhs.stationName == rhs.stationName && lhs.score == rhs.score && lhs.transfers == rhs.transfers && lhs.currentLine == rhs.currentLine
            }
        }

        var visitedMinScore: [String: Int] = [:]
        var bestPath: [PathStep]?
        var bestDuration = 999999

        var queue = [
            QueueItem(stationName: startKey, score: 0, actualDuration: 0, transfers: 0, currentLine: nil, lastWasWalk: false, path: [])
        ]

        var iterations = 0
        let maxIterations = 8000

        while !queue.isEmpty && iterations < maxIterations {
            iterations += 1
            queue.sort()
            let current = queue.removeFirst()

            if current.stationName == endKey {
                bestPath = current.path
                bestDuration = current.actualDuration
                break
            }

            let stateKey = "\(current.stationName)_\(current.currentLine ?? "none")"
            if let prev = visitedMinScore[stateKey], prev <= current.score {
                continue
            }
            visitedMinScore[stateKey] = current.score

            guard let edges = adjacency[current.stationName] else { continue }

            for edge in edges {
                if !includeGPE && edge.isGPE { continue }
                if edge.isWalkTransfer && current.lastWasWalk { continue }
                if avoidedStationNames.contains(edge.toStationName) && edge.toStationName != endKey { continue }
                if !edge.isWalkTransfer && isLineAvoided(edge.lineName, type: edge.transportType, avoidedLines: avoidedLines, avoidedModes: avoidedModes) {
                    continue
                }

                let isTransfer = !edge.isWalkTransfer && current.currentLine != nil && current.currentLine != edge.lineName && current.currentLine != Self.walkTransferLine
                let transferDuration = isTransfer ? 180 : 0
                let transferScorePenalty = isTransfer ? 300 : 0
                let nextTransfers = current.transfers + (isTransfer ? 1 : 0)

                if nextTransfers > 4 { continue }

                // En mode préférence GPE, on favorise légèrement les tronçons GPE pour proposer l'alternative GPE
                let gpeScoreAdjustment = (preferGPE && !edge.isGPE && !edge.isWalkTransfer) ? 120 : 0

                let nextActualDuration = current.actualDuration + edge.weightSeconds + transferDuration
                let nextScore = current.score + edge.weightSeconds + transferScorePenalty + gpeScoreAdjustment

                var newPath = current.path
                newPath.append(PathStep(
                    stationName: edge.toStationName,
                    line: edge.lineName,
                    type: edge.transportType,
                    weight: edge.weightSeconds,
                    isWalkTransfer: edge.isWalkTransfer
                ))

                queue.append(
                    QueueItem(
                        stationName: edge.toStationName,
                        score: nextScore,
                        actualDuration: nextActualDuration,
                        transfers: nextTransfers,
                        currentLine: edge.isWalkTransfer ? Self.walkTransferLine : edge.lineName,
                        lastWasWalk: edge.isWalkTransfer,
                        path: newPath
                    )
                )
            }
        }

        guard let path = bestPath, !path.isEmpty else {
            return nil
        }

        var legs: [TransitLeg] = []
        var currentLineName = path[0].line
        var currentType = path[0].type
        var currentIsWalk = path[0].isWalkTransfer
        var currentFromStation = origin
        var legIntermediate: [MapStation] = []
        var legDuration = 0

        for i in 0..<path.count {
            let step = path[i]
            let stepStation = stationLookup[step.stationName] ?? MapStation(
                id: UUID().uuidString,
                name: step.stationName.capitalized,
                coordinate: origin.coordinate,
                platforms: [],
                isHub: false,
                mainType: step.type,
                lines: []
            )

            if step.line == currentLineName && step.isWalkTransfer == currentIsWalk {
                legDuration += step.weight
                if i == path.count - 1 {
                    legs.append(TransitLeg(
                        lineName: currentLineName,
                        transportType: currentType,
                        fromStation: currentFromStation,
                        toStation: stepStation,
                        intermediateStations: legIntermediate,
                        durationSeconds: max(60, legDuration),
                        direction: stepStation.name,
                        isWalkTransfer: currentIsWalk
                    ))
                } else {
                    legIntermediate.append(stepStation)
                }
            } else {
                let transferStation = legIntermediate.last ?? currentFromStation
                legs.append(TransitLeg(
                    lineName: currentLineName,
                    transportType: currentType,
                    fromStation: currentFromStation,
                    toStation: transferStation,
                    intermediateStations: Array(legIntermediate.dropLast()),
                    durationSeconds: max(60, legDuration),
                    direction: transferStation.name,
                    isWalkTransfer: currentIsWalk
                ))

                currentLineName = step.line
                currentType = step.type
                currentIsWalk = step.isWalkTransfer
                currentFromStation = transferStation
                legIntermediate = []
                legDuration = step.weight

                if i == path.count - 1 {
                    legs.append(TransitLeg(
                        lineName: currentLineName,
                        transportType: currentType,
                        fromStation: currentFromStation,
                        toStation: stepStation,
                        intermediateStations: [],
                        durationSeconds: max(60, legDuration),
                        direction: stepStation.name,
                        isWalkTransfer: currentIsWalk
                    ))
                } else {
                    legIntermediate.append(stepStation)
                }
            }
        }

        let actualTransfers = max(0, legs.filter { !$0.isWalkTransfer }.count - 1)
        return TransitRoute(
            originStation: origin,
            destinationStation: destination,
            legs: legs,
            totalDurationSeconds: bestDuration,
            numberOfTransfers: actualTransfers
        )
    }

    private func isLineAvoided(
        _ lineName: String,
        type: TransportType,
        avoidedLines: Set<String>,
        avoidedModes: Set<String>
    ) -> Bool {
        if avoidedLines.contains(where: { avoided in
            avoided == lineName || avoided.hasSuffix(":\(lineName)") || avoided.localizedCaseInsensitiveContains(":\(lineName)")
        }) {
            return true
        }
        switch type {
        case .metro: return avoidedModes.contains("physical_mode:Metro")
        case .rer: return avoidedModes.contains("physical_mode:RapidTransit")
        case .tram: return avoidedModes.contains("physical_mode:Tramway")
        case .transilien, .train: return avoidedModes.contains("physical_mode:LocalTrain")
        case .bus: return avoidedModes.contains("physical_mode:Bus")
        case .cable: return avoidedModes.contains("physical_mode:Cableway")
        }
    }

    // MARK: - Simulated Grand Paris Express Multi-Route Search

    /// Calcule plusieurs itinéraires simulés intégrant les lignes 15, 16, 17 et 18 du Grand Paris Express.
    func findSimulatedGPERoutes(
        from startCoord: CLLocationCoordinate2D,
        to destination: MapStation,
        allStations: [MapStation],
        departureDate: Date = Date(),
        isArrival: Bool = false,
        avoidedStations: [MapStation] = [],
        avoidedLines: Set<String> = [],
        avoidedModes: Set<String> = []
    ) -> [Journey] {
        buildGraphIfNeeded(stations: allStations)

        let startLoc = CLLocation(latitude: startCoord.latitude, longitude: startCoord.longitude)
        let sortedOrigins = allStations.sorted {
            startLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
            startLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
        }

        var originCandidates: [MapStation] = []
        for s in sortedOrigins.prefix(8) {
            let d = startLoc.distance(from: CLLocation(latitude: s.latitude, longitude: s.longitude))
            if originCandidates.isEmpty || d <= 1200 {
                originCandidates.append(s)
            }
            if originCandidates.count >= 3 { break }
        }
        if let nearestGPEOrigin = allStations
            .filter({ $0.lines.contains(where: { Self.gpeLineNames.contains($0.name) }) })
            .min(by: {
                startLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                startLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
            }) {
            let d = startLoc.distance(from: CLLocation(latitude: nearestGPEOrigin.latitude, longitude: nearestGPEOrigin.longitude))
            if d <= 1800, !originCandidates.contains(where: { $0.id == nearestGPEOrigin.id }) {
                originCandidates.append(nearestGPEOrigin)
            }
        }
        guard !originCandidates.isEmpty else { return [] }

        let destLoc = CLLocation(latitude: destination.latitude, longitude: destination.longitude)
        var destinationCandidates: [MapStation] = [destination]
        if let nearestGPEDest = allStations
            .filter({ $0.lines.contains(where: { Self.gpeLineNames.contains($0.name) }) })
            .min(by: {
                destLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                destLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
            }) {
            let d = destLoc.distance(from: CLLocation(latitude: nearestGPEDest.latitude, longitude: nearestGPEDest.longitude))
            if d <= 1500, Self.normalizeKey(nearestGPEDest.name) != Self.normalizeKey(destination.name) {
                destinationCandidates.append(nearestGPEDest)
            }
        }

        let avoidedNames = Set(avoidedStations.map { Self.normalizeKey($0.name) })

        var candidateRoutes: [TransitRoute] = []

        for origin in originCandidates {
            for destCandidate in destinationCandidates {
                if let standard = findOptimalRoute(
                    from: origin,
                    to: destCandidate,
                    allStations: allStations,
                    includeGPE: true,
                    preferGPE: false,
                    avoidedLines: avoidedLines,
                    avoidedModes: avoidedModes,
                    avoidedStationNames: avoidedNames
                ) {
                    candidateRoutes.append(standard)
                }

                if let gpePreferred = findOptimalRoute(
                    from: origin,
                    to: destCandidate,
                    allStations: allStations,
                    includeGPE: true,
                    preferGPE: true,
                    avoidedLines: avoidedLines,
                    avoidedModes: avoidedModes,
                    avoidedStationNames: avoidedNames
                ) {
                    candidateRoutes.append(gpePreferred)
                }
            }
        }

        // Déduplication par séquence de lignes + tri par durée totale (incluant marche initiale et finale)
        var seenSignatures = Set<String>()
        var uniqueJourneys: [Journey] = []

        let sortedRoutes = candidateRoutes.sorted { lhs, rhs in
            let lhsStartWalk = Int(startLoc.distance(from: CLLocation(latitude: lhs.originStation.latitude, longitude: lhs.originStation.longitude)) / 1.3)
            let lhsEndWalk = Int(destLoc.distance(from: CLLocation(latitude: lhs.destinationStation.latitude, longitude: lhs.destinationStation.longitude)) / 1.3)
            let rhsStartWalk = Int(startLoc.distance(from: CLLocation(latitude: rhs.originStation.latitude, longitude: rhs.originStation.longitude)) / 1.3)
            let rhsEndWalk = Int(destLoc.distance(from: CLLocation(latitude: rhs.destinationStation.latitude, longitude: rhs.destinationStation.longitude)) / 1.3)
            return (lhs.totalDurationSeconds + lhsStartWalk + lhsEndWalk) < (rhs.totalDurationSeconds + rhsStartWalk + rhsEndWalk)
        }

        for route in sortedRoutes {
            let sig = route.legs.filter { !$0.isWalkTransfer }.map { "\($0.lineName):\($0.fromStation.name)->\($0.toStation.name)" }.joined(separator: "|")
            guard !sig.isEmpty, !seenSignatures.contains(sig) else { continue }
            seenSignatures.insert(sig)

            let journey = buildJourney(
                from: route,
                startCoord: startCoord,
                endCoord: destination.coordinate,
                endName: destination.name,
                referenceDate: departureDate,
                isArrival: isArrival
            )
            uniqueJourneys.append(journey)
            if uniqueJourneys.count >= 4 { break }
        }

        // Mettre en avant les itinéraires empruntant le Grand Paris Express
        return uniqueJourneys.sorted { lhs, rhs in
            if lhs.usesGrandParisExpress != rhs.usesGrandParisExpress {
                return lhs.usesGrandParisExpress && !rhs.usesGrandParisExpress
            }
            return (lhs.duration ?? Int.max) < (rhs.duration ?? Int.max)
        }
    }

    // MARK: - Convert TransitRoute to Journey

    func buildJourney(
        from route: TransitRoute,
        startCoord: CLLocationCoordinate2D?,
        endCoord: CLLocationCoordinate2D? = nil,
        endName: String? = nil,
        referenceDate: Date = Date(),
        isArrival: Bool = false
    ) -> Journey {
        let navitiaFormatter = DateFormatter()
        navitiaFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        navitiaFormatter.locale = Locale(identifier: "en_US_POSIX")

        // Calculer la durée totale (marche initiale + trajets + correspondances + marche finale)
        var initialWalkSec = 0
        if let sCoord = startCoord {
            let oCoord = route.originStation.coordinate
            let dist = CLLocation(latitude: sCoord.latitude, longitude: sCoord.longitude)
                .distance(from: CLLocation(latitude: oCoord.latitude, longitude: oCoord.longitude))
            if dist > 35 {
                initialWalkSec = max(60, Int(ceil(dist / 1.3)))
            }
        }

        var finalWalkSec = 0
        if let eCoord = endCoord {
            let dCoord = route.destinationStation.coordinate
            let dist = CLLocation(latitude: dCoord.latitude, longitude: dCoord.longitude)
                .distance(from: CLLocation(latitude: eCoord.latitude, longitude: eCoord.longitude))
            if dist > 35 {
                finalWalkSec = max(60, Int(ceil(dist / 1.3)))
            }
        }

        var legsTotalSec = 0
        for (idx, leg) in route.legs.enumerated() {
            legsTotalSec += leg.durationSeconds
            if !leg.isWalkTransfer, idx < route.legs.count - 1, !route.legs[idx + 1].isWalkTransfer {
                legsTotalSec += 180
            }
        }

        let totalJourneySec = initialWalkSec + legsTotalSec + finalWalkSec
        let startTime = isArrival ? referenceDate.addingTimeInterval(-TimeInterval(totalJourneySec)) : referenceDate
        var cursorDate = startTime

        var sections: [ItinerarySection] = []

        if let sCoord = startCoord, initialWalkSec > 0 {
            let oCoord = route.originStation.coordinate
            let walkEnd = cursorDate.addingTimeInterval(TimeInterval(initialWalkSec))
            sections.append(
                ItinerarySection(
                    id: UUID().uuidString,
                    type: "street_network",
                    mode: "walking",
                    duration: initialWalkSec,
                    from: ItineraryPlace(name: "Votre position", id: nil, coord: ItineraryCoord(lat: "\(sCoord.latitude)", lon: "\(sCoord.longitude)"), stop_point: nil),
                    to: ItineraryPlace(name: route.originStation.name, id: route.originStation.id, coord: ItineraryCoord(lat: "\(oCoord.latitude)", lon: "\(oCoord.longitude)"), stop_point: nil),
                    departure_date_time: navitiaFormatter.string(from: cursorDate),
                    arrival_date_time: navitiaFormatter.string(from: walkEnd),
                    display_informations: nil,
                    geojson: GeoJSON(type: "LineString", coordinates: [
                        [sCoord.longitude, sCoord.latitude],
                        [oCoord.longitude, oCoord.latitude]
                    ]),
                    stop_date_times: nil
                )
            )
            cursorDate = walkEnd
        }

        for (idx, leg) in route.legs.enumerated() {
            let legEnd = cursorDate.addingTimeInterval(TimeInterval(leg.durationSeconds))

            if leg.isWalkTransfer {
                sections.append(
                    ItinerarySection(
                        id: UUID().uuidString,
                        type: "transfer",
                        mode: "walking",
                        duration: leg.durationSeconds,
                        from: ItineraryPlace(name: leg.fromStation.name, id: leg.fromStation.id, coord: ItineraryCoord(lat: "\(leg.fromStation.latitude)", lon: "\(leg.fromStation.longitude)"), stop_point: nil),
                        to: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                        departure_date_time: navitiaFormatter.string(from: cursorDate),
                        arrival_date_time: navitiaFormatter.string(from: legEnd),
                        display_informations: nil,
                        geojson: GeoJSON(type: "LineString", coordinates: [
                            [leg.fromStation.longitude, leg.fromStation.latitude],
                            [leg.toStation.longitude, leg.toStation.latitude]
                        ]),
                        stop_date_times: nil
                    )
                )
                cursorDate = legEnd
                continue
            }

            let allStopsInLeg = [leg.fromStation] + leg.intermediateStations + [leg.toStation]
            let legCoords = allStopsInLeg.map { [$0.longitude, $0.latitude] }

            // Générer les stop_date_times pour afficher tous les arrêts intermédiaires et horaires simulés
            var stopDateTimes: [ItineraryStopDateTime] = []
            let stopCount = max(1, allStopsInLeg.count - 1)
            for (sIdx, st) in allStopsInLeg.enumerated() {
                let fraction = Double(sIdx) / Double(stopCount)
                let stopTime = cursorDate.addingTimeInterval(TimeInterval(leg.durationSeconds) * fraction)
                let timeStr = navitiaFormatter.string(from: stopTime)
                stopDateTimes.append(
                    ItineraryStopDateTime(
                        stop_point: ItineraryPlace.StopPoint(
                            name: st.name,
                            id: st.id,
                            coord: ItineraryCoord(lat: "\(st.latitude)", lon: "\(st.longitude)")
                        ),
                        arrival_date_time: timeStr,
                        departure_date_time: timeStr
                    )
                )
            }

            let hexColor = resolveLineColor(leg.lineName, type: leg.transportType).toHex() ?? "0055A5"
            let textColor = (leg.lineName == "17") ? "000000" : "FFFFFF"
            let isGPE = Self.gpeLineNames.contains(leg.lineName)
            let commercialMode = commercialModeName(for: leg.transportType)

            sections.append(
                ItinerarySection(
                    id: UUID().uuidString,
                    type: "public_transport",
                    mode: leg.transportType.rawValue.lowercased(),
                    duration: leg.durationSeconds,
                    from: ItineraryPlace(name: leg.fromStation.name, id: leg.fromStation.id, coord: ItineraryCoord(lat: "\(leg.fromStation.latitude)", lon: "\(leg.fromStation.longitude)"), stop_point: nil),
                    to: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                    departure_date_time: navitiaFormatter.string(from: cursorDate),
                    arrival_date_time: navitiaFormatter.string(from: legEnd),
                    display_informations: DisplayInformation(
                        network: isGPE ? "Grand Paris Express" : "IDFM",
                        code: leg.lineName,
                        label: leg.lineName,
                        color: hexColor,
                        text_color: textColor,
                        commercial_mode: commercialMode,
                        direction: leg.direction,
                        physical_mode: leg.transportType.rawValue.lowercased(),
                        line: nil
                    ),
                    geojson: GeoJSON(type: "LineString", coordinates: legCoords),
                    stop_date_times: stopDateTimes
                )
            )
            cursorDate = legEnd

            if idx < route.legs.count - 1 && !route.legs[idx + 1].isWalkTransfer {
                let transferEnd = cursorDate.addingTimeInterval(180)
                sections.append(
                    ItinerarySection(
                        id: UUID().uuidString,
                        type: "transfer",
                        mode: "walking",
                        duration: 180,
                        from: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                        to: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                        departure_date_time: navitiaFormatter.string(from: cursorDate),
                        arrival_date_time: navitiaFormatter.string(from: transferEnd),
                        display_informations: nil,
                        geojson: nil,
                        stop_date_times: nil
                    )
                )
                cursorDate = transferEnd
            }
        }

        if let eCoord = endCoord, finalWalkSec > 0 {
            let dCoord = route.destinationStation.coordinate
            let walkEnd = cursorDate.addingTimeInterval(TimeInterval(finalWalkSec))
            sections.append(
                ItinerarySection(
                    id: UUID().uuidString,
                    type: "street_network",
                    mode: "walking",
                    duration: finalWalkSec,
                    from: ItineraryPlace(name: route.destinationStation.name, id: route.destinationStation.id, coord: ItineraryCoord(lat: "\(dCoord.latitude)", lon: "\(dCoord.longitude)"), stop_point: nil),
                    to: ItineraryPlace(name: endName ?? route.destinationStation.name, id: nil, coord: ItineraryCoord(lat: "\(eCoord.latitude)", lon: "\(eCoord.longitude)"), stop_point: nil),
                    departure_date_time: navitiaFormatter.string(from: cursorDate),
                    arrival_date_time: navitiaFormatter.string(from: walkEnd),
                    display_informations: nil,
                    geojson: GeoJSON(type: "LineString", coordinates: [
                        [dCoord.longitude, dCoord.latitude],
                        [eCoord.longitude, eCoord.latitude]
                    ]),
                    stop_date_times: nil
                )
            )
            cursorDate = walkEnd
        }

        let journey = Journey(
            departure_date_time: navitiaFormatter.string(from: startTime),
            arrival_date_time: navitiaFormatter.string(from: cursorDate),
            duration: totalJourneySec,
            nb_transfers: route.numberOfTransfers,
            sections: sections
        )
        return TransitTraceService.shared.enrichJourney(journey)
    }

    private func commercialModeName(for type: TransportType) -> String {
        type.rawValue
    }
}
