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

    private struct GraphEdge {
        let toStationName: String
        let lineName: String
        let transportType: TransportType
        let weightSeconds: Int
    }

    private var adjacency: [String: [GraphEdge]] = [:]
    private var isInitialized = false
    private let lock = NSLock()

    private init() {}

    func buildGraphIfNeeded(stations: [MapStation]) {
        lock.lock()
        defer { lock.unlock() }

        guard !isInitialized else { return }

        // Build station map by normalized name
        var stationByName: [String: MapStation] = [:]
        for station in stations {
            let key = StationSuggestionEngine.normalize(station.name)
            if stationByName[key] == nil {
                stationByName[key] = station
            }
        }

        // 1. Traverse all lines from LocalDataService
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
                    let s1 = StationSuggestionEngine.normalize(lineStations[i].nom)
                    let s2 = StationSuggestionEngine.normalize(lineStations[i + 1].nom)

                    let edgeTime = 100 // Average ~100s between adjacent metro stations
                    addEdge(from: s1, to: s2, line: cleanLineName, type: tType, weight: edgeTime)
                    addEdge(from: s2, to: s1, line: cleanLineName, type: tType, weight: edgeTime)
                }
            }
        }

        // 2. Also build edges from MapStation.lines if linesstops.json is partial
        for station in stations {
            let sNorm = StationSuggestionEngine.normalize(station.name)
            for line in station.lines {
                let siblings = stations.filter { s in
                    s.lines.contains(where: { $0.name == line.name })
                }
                let sLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
                let sortedSiblings = siblings.filter { $0.id != station.id }.sorted {
                    sLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                    sLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
                }

                for close in sortedSiblings.prefix(2) {
                    let cNorm = StationSuggestionEngine.normalize(close.name)
                    let distMeters = sLoc.distance(from: CLLocation(latitude: close.latitude, longitude: close.longitude))
                    if distMeters < 2500 {
                        let weight = max(80, Int(distMeters / 11.0))
                        addEdge(from: sNorm, to: cNorm, line: line.name, type: line.type, weight: weight)
                        addEdge(from: cNorm, to: sNorm, line: line.name, type: line.type, weight: weight)
                    }
                }
            }
        }

        isInitialized = true
    }

    private func addEdge(from: String, to: String, line: String, type: TransportType, weight: Int) {
        if adjacency[from] == nil {
            adjacency[from] = []
        }
        if !adjacency[from]!.contains(where: { $0.toStationName == to && $0.lineName == line }) {
            adjacency[from]!.append(GraphEdge(toStationName: to, lineName: line, transportType: type, weightSeconds: weight))
        }
    }

    // MARK: - Route Search (Dijkstra with Transfer Penalty)

    func findOptimalRoute(from origin: MapStation, to destination: MapStation, allStations: [MapStation]) -> TransitRoute? {
        buildGraphIfNeeded(stations: allStations)

        let startKey = StationSuggestionEngine.normalize(origin.name)
        let endKey = StationSuggestionEngine.normalize(destination.name)

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
            let k = StationSuggestionEngine.normalize(s.name)
            if stationLookup[k] == nil {
                stationLookup[k] = s
            }
        }

        struct QueueItem: Comparable {
            let stationName: String
            let cost: Int
            let transfers: Int
            let currentLine: String?
            let path: [(stationName: String, line: String, type: TransportType, weight: Int)]

            static func < (lhs: QueueItem, rhs: QueueItem) -> Bool {
                if lhs.transfers != rhs.transfers {
                    return lhs.transfers < rhs.transfers
                }
                return lhs.cost < rhs.cost
            }

            static func == (lhs: QueueItem, rhs: QueueItem) -> Bool {
                lhs.stationName == rhs.stationName && lhs.cost == rhs.cost && lhs.transfers == rhs.transfers && lhs.currentLine == rhs.currentLine
            }
        }

        var visitedMinCost: [String: Int] = [:]
        var bestPath: [(stationName: String, line: String, type: TransportType, weight: Int)]?
        var bestTransfers = 999
        var bestDuration = 999999

        var queue = [
            QueueItem(stationName: startKey, cost: 0, transfers: 0, currentLine: nil, path: [])
        ]

        var iterations = 0
        let maxIterations = 3500

        while !queue.isEmpty && iterations < maxIterations {
            iterations += 1
            queue.sort()
            let current = queue.removeFirst()

            if current.stationName == endKey {
                bestPath = current.path
                bestTransfers = current.transfers
                bestDuration = current.cost
                break
            }

            let stateKey = "\(current.stationName)_\(current.currentLine ?? "none")"
            if let prev = visitedMinCost[stateKey], prev <= current.cost {
                continue
            }
            visitedMinCost[stateKey] = current.cost

            guard let edges = adjacency[current.stationName] else { continue }

            for edge in edges {
                let isTransfer = current.currentLine != nil && current.currentLine != edge.lineName
                let transferPenalty = isTransfer ? 240 : 0
                let nextTransfers = current.transfers + (isTransfer ? 1 : 0)

                if nextTransfers > 3 { continue }

                let nextCost = current.cost + edge.weightSeconds + transferPenalty
                var newPath = current.path
                newPath.append((stationName: edge.toStationName, line: edge.lineName, type: edge.transportType, weight: edge.weightSeconds))

                queue.append(
                    QueueItem(
                        stationName: edge.toStationName,
                        cost: nextCost,
                        transfers: nextTransfers,
                        currentLine: edge.lineName,
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

            if step.line == currentLineName {
                legDuration += step.weight
                if i == path.count - 1 {
                    legs.append(TransitLeg(
                        lineName: currentLineName,
                        transportType: currentType,
                        fromStation: currentFromStation,
                        toStation: stepStation,
                        intermediateStations: legIntermediate,
                        durationSeconds: max(60, legDuration),
                        direction: destination.name
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
                    direction: transferStation.name
                ))

                currentLineName = step.line
                currentType = step.type
                currentFromStation = transferStation
                legIntermediate = [stepStation]
                legDuration = step.weight

                if i == path.count - 1 {
                    legs.append(TransitLeg(
                        lineName: currentLineName,
                        transportType: currentType,
                        fromStation: currentFromStation,
                        toStation: stepStation,
                        intermediateStations: [],
                        durationSeconds: max(60, legDuration),
                        direction: destination.name
                    ))
                }
            }
        }

        return TransitRoute(
            originStation: origin,
            destinationStation: destination,
            legs: legs,
            totalDurationSeconds: bestDuration,
            numberOfTransfers: bestTransfers
        )
    }

    // MARK: - Convert TransitRoute to Journey
 
    func buildJourney(from route: TransitRoute, startCoord: CLLocationCoordinate2D?) -> Journey {
        var sections: [ItinerarySection] = []

        if let sCoord = startCoord {
            let oCoord = route.originStation.coordinate
            let dist = CLLocation(latitude: sCoord.latitude, longitude: sCoord.longitude)
                .distance(from: CLLocation(latitude: oCoord.latitude, longitude: oCoord.longitude))
            let walkSec = max(60, Int(ceil(dist / 1.3)))

            sections.append(
                ItinerarySection(
                    id: UUID().uuidString,
                    type: "street_network",
                    mode: "walking",
                    duration: walkSec,
                    from: ItineraryPlace(name: "Votre position", id: nil, coord: ItineraryCoord(lat: "\(sCoord.latitude)", lon: "\(sCoord.longitude)"), stop_point: nil),
                    to: ItineraryPlace(name: route.originStation.name, id: route.originStation.id, coord: ItineraryCoord(lat: "\(oCoord.latitude)", lon: "\(oCoord.longitude)"), stop_point: nil),
                    departure_date_time: nil,
                    arrival_date_time: nil,
                    display_informations: nil,
                    geojson: GeoJSON(type: "LineString", coordinates: [
                        [sCoord.longitude, sCoord.latitude],
                        [oCoord.longitude, oCoord.latitude]
                    ]),
                    stop_date_times: nil
                )
            )
        }

        for (idx, leg) in route.legs.enumerated() {
            var legCoords: [[Double]] = [
                [leg.fromStation.longitude, leg.fromStation.latitude]
            ]
            for inter in leg.intermediateStations {
                legCoords.append([inter.longitude, inter.latitude])
            }
            legCoords.append([leg.toStation.longitude, leg.toStation.latitude])

            let hexColor = resolveLineColor(leg.lineName, type: leg.transportType).toHex() ?? "0055A5"

            sections.append(
                ItinerarySection(
                    id: UUID().uuidString,
                    type: "public_transport",
                    mode: leg.transportType.rawValue.lowercased(),
                    duration: leg.durationSeconds,
                    from: ItineraryPlace(name: leg.fromStation.name, id: leg.fromStation.id, coord: ItineraryCoord(lat: "\(leg.fromStation.latitude)", lon: "\(leg.fromStation.longitude)"), stop_point: nil),
                    to: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                    departure_date_time: nil,
                    arrival_date_time: nil,
                    display_informations: DisplayInformation(
                        network: "IDFM",
                        code: leg.lineName,
                        label: leg.lineName,
                        color: hexColor,
                        text_color: "FFFFFF",
                        commercial_mode: leg.transportType.rawValue,
                        direction: leg.direction,
                        physical_mode: leg.transportType.rawValue.lowercased(),
                        line: nil
                    ),
                    geojson: GeoJSON(type: "LineString", coordinates: legCoords),
                    stop_date_times: nil
                )
            )

            if idx < route.legs.count - 1 {
                sections.append(
                    ItinerarySection(
                        id: UUID().uuidString,
                        type: "transfer",
                        mode: "walking",
                        duration: 180,
                        from: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                        to: ItineraryPlace(name: leg.toStation.name, id: leg.toStation.id, coord: ItineraryCoord(lat: "\(leg.toStation.latitude)", lon: "\(leg.toStation.longitude)"), stop_point: nil),
                        departure_date_time: nil,
                        arrival_date_time: nil,
                        display_informations: nil,
                        geojson: nil,
                        stop_date_times: nil
                    )
                )
            }
        }

        let journey = Journey(
            departure_date_time: nil,
            arrival_date_time: nil,
            duration: route.totalDurationSeconds,
            nb_transfers: route.numberOfTransfers,
            sections: sections
        )
        return TransitTraceService.shared.enrichJourney(journey)
    }
}
