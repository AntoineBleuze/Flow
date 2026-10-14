//
//  TransitTraceService.swift
//  Flow
//
//  Service d'extraction et de correspondance des tracés précis du réseau ferré IDF
//  (Métro, RER, Transilien H, J, K, L, N, P, R, U, V, Tramway) issus de traces-du-reseau-ferre-idf.geojson.
//  Permet de recalculer et d'enrichir les géométries des itinéraires pour afficher
//  les vraies courbes ferroviaires (notamment la ligne R et tous les Transiliens)
//  au lieu de segments droits lorsque l'API Navitia/IDFM ne fournit que les coordonnées des gares.
//

import CoreLocation
import Foundation
import MapKit

final class TransitTraceService: @unchecked Sendable {
    static let shared = TransitTraceService()

    private struct TrackSegment: Sendable {
        let coordinates: [CLLocationCoordinate2D]
        let startNode: Int
        let endNode: Int
        let cost: Double
    }

    private struct LineGraph: Sendable {
        let lineKey: String
        let lineName: String
        let type: TransportType
        let nodes: [CLLocationCoordinate2D]
        let segments: [TrackSegment]
        // nodeIndex -> [(neighborNode, segmentIndex, isReversed, cost)]
        let adjacency: [Int: [(neighborNode: Int, segmentIndex: Int, isReversed: Bool, cost: Double)]]
    }

    private var lineGraphs: [String: LineGraph] = [:]
    private var aliasToKey: [String: String] = [:]
    private let lock = NSLock()
    private var isLoaded = false

    private init() {
        loadGraphsIfNeeded()
    }

    // MARK: - Initialisation & Parsing

    func loadGraphsIfNeeded() {
        lock.lock()
        defer { lock.unlock() }

        guard !isLoaded else { return }

        // Essai via Bundle.main pour traces-du-reseau-ferre-idf.geojson
        guard let url = Bundle.main.url(forResource: "traces-du-reseau-ferre-idf", withExtension: "geojson") ??
                Bundle.main.url(forResource: "traces-du-reseau-ferre-idf", withExtension: "geojson", subdirectory: "Data") ??
                Bundle.main.url(forResource: "traces-du-reseau-ferre-idf", withExtension: "geojson", subdirectory: "Flow/Data") else {
            print("⚠️ [TransitTraceService] traces-du-reseau-ferre-idf.geojson introuvable dans le Bundle")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            buildGraphs(from: data)
            isLoaded = true
            print("✅ [TransitTraceService] \(lineGraphs.count) graphes de lignes ferrées chargés avec succès")
        } catch {
            print("❌ [TransitTraceService] Erreur lors du chargement des traces: \(error)")
        }
    }

    private struct FeatureCollectionDTO: Decodable {
        let features: [FeatureDTO]
    }

    private struct FeatureDTO: Decodable {
        let properties: PropertiesDTO
        let geometry: GeometryDTO
    }

    private struct PropertiesDTO: Decodable {
        let res_com: String?
    }

    private struct GeometryDTO: Decodable {
        let type: String?
        let coordinates: [[Double]]?
    }

    private func buildGraphs(from data: Data) {
        guard let collection = try? JSONDecoder().decode(FeatureCollectionDTO.self, from: data) else {
            print("❌ [TransitTraceService] Impossible de décoder FeatureCollection")
            return
        }

        // Regrouper les segments par clé de ligne normalisée (ex: "TRAIN_R", "METRO_1", "RER_A", "TRAM_1")
        var rawSegmentsByLine: [String: [[CLLocationCoordinate2D]]] = [:]

        for feature in collection.features {
            guard let fullName = feature.properties.res_com,
                  let rawCoords = feature.geometry.coordinates,
                  rawCoords.count >= 2 else { continue }

            let components = fullName.components(separatedBy: " ")
            guard components.count >= 2 else { continue }

            let lineType = components[0].uppercased()
            let lineName = components[1...].joined(separator: " ")

            if fullName.contains("CDGVAL") || fullName.contains("ORLYVAL") || lineType.hasPrefix("TER") {
                continue
            }

            let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]
            if (lineType == "TRAIN" || lineType == "TER") && !allowedTransiliens.contains(lineName) {
                continue
            }

            let groupKey = "\(lineType)_\(lineName)"

            var segCoords: [CLLocationCoordinate2D] = []
            segCoords.reserveCapacity(rawCoords.count)
            for pt in rawCoords where pt.count >= 2 {
                segCoords.append(CLLocationCoordinate2D(latitude: pt[1], longitude: pt[0]))
            }

            guard segCoords.count >= 2 else { continue }
            rawSegmentsByLine[groupKey, default: []].append(segCoords)
        }

        // Construire les graphes pour chaque ligne
        for (groupKey, segments) in rawSegmentsByLine {
            let components = groupKey.components(separatedBy: "_")
            let lineTypeStr = components[0]
            let lineName = components.count > 1 ? components[1...].joined(separator: "_") : ""

            let transportType: TransportType
            switch lineTypeStr {
            case "METRO": transportType = .metro
            case "RER": transportType = .rer
            case "TRAIN": transportType = .transilien
            case "TRAM": transportType = .tram
            default: transportType = .metro
            }

            var nodes: [CLLocationCoordinate2D] = []
            let nodeEpsilonDegrees = 0.001 // ~70-100m pour fusionner les aiguillages et stations

            func getOrCreateNode(for coord: CLLocationCoordinate2D) -> Int {
                for (idx, node) in nodes.enumerated() {
                    let dLon = abs(node.longitude - coord.longitude)
                    let dLat = abs(node.latitude - coord.latitude)
                    if dLon < nodeEpsilonDegrees && dLat < nodeEpsilonDegrees {
                        return idx
                    }
                }
                nodes.append(coord)
                return nodes.count - 1
            }

            var trackSegments: [TrackSegment] = []
            var adjacency: [Int: [(neighborNode: Int, segmentIndex: Int, isReversed: Bool, cost: Double)]] = [:]

            for segCoords in segments {
                guard let first = segCoords.first, let last = segCoords.last else { continue }
                let startNode = getOrCreateNode(for: first)
                let endNode = getOrCreateNode(for: last)

                var cost: Double = 0
                for i in 0..<(segCoords.count - 1) {
                    cost += distanceMeters(from: segCoords[i], to: segCoords[i+1])
                }
                if cost <= 0 { cost = 1.0 }

                let segIndex = trackSegments.count
                trackSegments.append(TrackSegment(
                    coordinates: segCoords,
                    startNode: startNode,
                    endNode: endNode,
                    cost: cost
                ))

                adjacency[startNode, default: []].append((endNode, segIndex, false, cost))
                adjacency[endNode, default: []].append((startNode, segIndex, true, cost))
            }

            let graph = LineGraph(
                lineKey: groupKey,
                lineName: lineName,
                type: transportType,
                nodes: nodes,
                segments: trackSegments,
                adjacency: adjacency
            )
            lineGraphs[groupKey] = graph

            // Enregistrer les alias
            registerAliases(groupKey: groupKey, lineType: lineTypeStr, lineName: lineName)
        }
    }

    private func registerAliases(groupKey: String, lineType: String, lineName: String) {
        let nameUpper = lineName.uppercased()

        // Alias direct avec type
        aliasToKey[groupKey.uppercased()] = groupKey
        aliasToKey["\(lineType) \(nameUpper)"] = groupKey

        switch lineType {
        case "TRAIN":
            aliasToKey[nameUpper] = groupKey
            aliasToKey["TRAIN_\(nameUpper)"] = groupKey
            aliasToKey["TRAIN \(nameUpper)"] = groupKey
            aliasToKey["TRANSILIEN_\(nameUpper)"] = groupKey
            aliasToKey["TRANSILIEN \(nameUpper)"] = groupKey
            aliasToKey["LIGNE \(nameUpper)"] = groupKey
        case "RER":
            aliasToKey[nameUpper] = groupKey
            aliasToKey["RER_\(nameUpper)"] = groupKey
            aliasToKey["RER \(nameUpper)"] = groupKey
            aliasToKey["RER\(nameUpper)"] = groupKey
        case "METRO":
            aliasToKey[nameUpper] = groupKey
            aliasToKey["M\(nameUpper)"] = groupKey
            aliasToKey["METRO_\(nameUpper)"] = groupKey
            aliasToKey["METRO \(nameUpper)"] = groupKey
        case "TRAM":
            let cleanTram = nameUpper.hasPrefix("T") ? String(nameUpper.dropFirst()) : nameUpper
            aliasToKey["T\(cleanTram)"] = groupKey
            aliasToKey["TRAM_\(cleanTram)"] = groupKey
            aliasToKey["TRAM \(cleanTram)"] = groupKey
            aliasToKey["TRAMWAY \(cleanTram)"] = groupKey
        default:
            aliasToKey[nameUpper] = groupKey
        }
    }

    // MARK: - Résolution de la clé de ligne

    func resolveLineKey(
        lineCode: String,
        commercialMode: String? = nil,
        physicalMode: String? = nil
    ) -> String? {
        let clean = lineCode.uppercased()
            .replacingOccurrences(of: "LIGNE", with: "")
            .replacingOccurrences(of: "LINE", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        let mode = (commercialMode ?? physicalMode ?? "").lowercased()

        if mode.contains("tram") {
            let tramCode = clean.hasPrefix("T") ? String(clean.dropFirst()) : clean
            if let key = aliasToKey["T\(tramCode)"] ?? aliasToKey["TRAM_\(tramCode)"] {
                return key
            }
        }

        if mode.contains("train") || mode.contains("transilien") {
            if let key = aliasToKey["TRAIN_\(clean)"] ?? aliasToKey[clean] {
                return key
            }
        }

        if mode.contains("rer") {
            if let key = aliasToKey["RER_\(clean)"] ?? aliasToKey[clean] {
                return key
            }
        }

        if mode.contains("metro") || mode.contains("subway") {
            if let key = aliasToKey["METRO_\(clean)"] ?? aliasToKey[clean] {
                return key
            }
        }

        // Vérification par alias direct
        if let key = aliasToKey[clean] {
            return key
        }

        // Essais avec préfixes courants
        if let key = aliasToKey["TRAIN_\(clean)"] ??
                     aliasToKey["RER_\(clean)"] ??
                     aliasToKey["METRO_\(clean)"] ??
                     aliasToKey["TRAM_\(clean)"] {
            return key
        }

        return nil
    }

    // MARK: - Recherche de Tracé Précis

    func getPreciseCoordinates(
        forLine lineCode: String,
        commercialMode: String? = nil,
        physicalMode: String? = nil,
        from: CLLocationCoordinate2D,
        to: CLLocationCoordinate2D,
        intermediates: [CLLocationCoordinate2D] = []
    ) -> [CLLocationCoordinate2D]? {
        loadGraphsIfNeeded()

        guard let lineKey = resolveLineKey(
            lineCode: lineCode,
            commercialMode: commercialMode,
            physicalMode: physicalMode
        ), let graph = lineGraphs[lineKey] else {
            return nil
        }

        // Si des arrêts intermédiaires sont fournis, découper le trajet en étapes consécutives
        if !intermediates.isEmpty {
            var waypoints = [from]
            waypoints.append(contentsOf: intermediates)
            waypoints.append(to)

            var stitched: [CLLocationCoordinate2D] = []
            var allSucceeded = true

            for i in 0..<(waypoints.count - 1) {
                if let leg = findPath(in: graph, from: waypoints[i], to: waypoints[i+1]) {
                    if stitched.isEmpty {
                        stitched.append(contentsOf: leg)
                    } else {
                        for pt in leg {
                            if let last = stitched.last, distanceMeters(from: last, to: pt) < 5 {
                                continue
                            }
                            stitched.append(pt)
                        }
                    }
                } else {
                    allSucceeded = false
                    break
                }
            }

            if allSucceeded && stitched.count > 2 {
                return stitched
            }
        }

        // Sinon ou en cas d'échec sur les intermédiaires, chercher le chemin direct from -> to sur le réseau ferré
        return findPath(in: graph, from: from, to: to)
    }

    private func findPath(
        in graph: LineGraph,
        from: CLLocationCoordinate2D,
        to: CLLocationCoordinate2D
    ) -> [CLLocationCoordinate2D]? {
        guard !graph.nodes.isEmpty else { return nil }

        let startNode = findClosestNodeIndex(to: from, in: graph.nodes)
        let endNode = findClosestNodeIndex(to: to, in: graph.nodes)

        // Si les deux gares sont associées au même nœud (très proches)
        if startNode == endNode {
            return [from, to]
        }

        // Algorithme de Dijkstra
        var distances: [Int: Double] = [:]
        var previous: [Int: (prevNode: Int, segmentIndex: Int, isReversed: Bool)] = [:]
        var pq = PriorityQueue<(node: Int, cost: Double)>(sort: { $0.cost < $1.cost })

        distances[startNode] = 0.0
        pq.push((node: startNode, cost: 0.0))

        while let current = pq.pop() {
            if current.node == endNode {
                break
            }
            if current.cost > (distances[current.node] ?? .infinity) {
                continue
            }

            guard let edges = graph.adjacency[current.node] else { continue }
            for edge in edges {
                let newCost = current.cost + edge.cost
                if newCost < (distances[edge.neighborNode] ?? .infinity) {
                    distances[edge.neighborNode] = newCost
                    previous[edge.neighborNode] = (current.node, edge.segmentIndex, edge.isReversed)
                    pq.push((node: edge.neighborNode, cost: newCost))
                }
            }
        }

        guard distances[endNode] != nil else {
            // Aucun chemin trouvé dans le graphe pour cette ligne
            return nil
        }

        // Reconstruire les segments dans l'ordre
        var segmentsInOrder: [(segmentIndex: Int, isReversed: Bool)] = []
        var curr = endNode
        while curr != startNode {
            guard let step = previous[curr] else { break }
            segmentsInOrder.append((step.segmentIndex, step.isReversed))
            curr = step.prevNode
        }
        segmentsInOrder.reverse()

        // Assembler les coordonnées
        var result: [CLLocationCoordinate2D] = []
        result.append(from)

        for step in segmentsInOrder {
            let seg = graph.segments[step.segmentIndex]
            let coords = step.isReversed ? seg.coordinates.reversed() : seg.coordinates

            for pt in coords {
                if let last = result.last, distanceMeters(from: last, to: pt) < 5 {
                    continue
                }
                result.append(pt)
            }
        }

        if let last = result.last, distanceMeters(from: last, to: to) >= 5 {
            result.append(to)
        }

        return result
    }

    private func findClosestNodeIndex(to target: CLLocationCoordinate2D, in nodes: [CLLocationCoordinate2D]) -> Int {
        var bestIndex = 0
        var bestDist = Double.infinity

        for (idx, node) in nodes.enumerated() {
            let d = distanceMeters(from: target, to: node)
            if d < bestDist {
                bestDist = d
                bestIndex = idx
            }
        }
        return bestIndex
    }

    private func distanceMeters(from c1: CLLocationCoordinate2D, to c2: CLLocationCoordinate2D) -> Double {
        let latMid = (c1.latitude + c2.latitude) * 0.5 * .pi / 180.0
        let dLon = (c2.longitude - c1.longitude) * cos(latMid) * 111319.5
        let dLat = (c2.latitude - c1.latitude) * 111319.5
        return sqrt(dLon * dLon + dLat * dLat)
    }

    // MARK: - Enrichissement de Voyage (Itinéraire)

    func enrichJourney(_ journey: Journey) -> Journey {
        guard let sections = journey.sections, !sections.isEmpty else { return journey }

        var enrichedSections: [ItinerarySection] = []
        var didEnrich = false

        for section in sections {
            guard section.type == "public_transport",
                  let display = section.display_informations,
                  let fromCoord = section.from?.coordinate,
                  let toCoord = section.to?.coordinate else {
                enrichedSections.append(section)
                continue
            }

            let lineCode = display.code ?? display.label ?? ""
            let intermediates = section.stop_date_times?.compactMap { $0.stop_point.coordinate } ?? []
            let existingCoordsCount = section.geojson?.coordinates?.count ?? 0

            // Vérifier si cette ligne ferrée est connue dans traces-du-reseau-ferre-idf
            if let trackCoords = getPreciseCoordinates(
                forLine: lineCode,
                commercialMode: display.commercial_mode,
                physicalMode: display.physical_mode,
                from: fromCoord,
                to: toCoord,
                intermediates: intermediates
            ) {
                // Enrichir si:
                // 1. Coordonnées actuelles <= 2 (ex: ligne R, N, J où Navitia ne donne que départ et arrivée)
                // 2. Ou coordonnées actuelles <= arrêts + 2 (segments droits entre gares)
                // 3. Ou le tracé ferré officiel possède une résolution nettement supérieure
                let shouldReplace = existingCoordsCount <= max(2, intermediates.count + 2) ||
                                    trackCoords.count > (existingCoordsCount * 2)

                if shouldReplace && trackCoords.count > 2 {
                    let coordArrays = trackCoords.map { [$0.longitude, $0.latitude] }
                    let enrichedGeoJSON = GeoJSON(type: "LineString", coordinates: coordArrays)
                    var updatedSection = section
                    updatedSection.geojson = enrichedGeoJSON
                    enrichedSections.append(updatedSection)
                    didEnrich = true
                    print("🚆 [TransitTraceService] Section \(lineCode) enrichie avec \(trackCoords.count) points de tracé précis (auparavant: \(existingCoordsCount))")
                    continue
                }
            }

            enrichedSections.append(section)
        }

        if didEnrich {
            var updatedJourney = journey
            updatedJourney.sections = enrichedSections
            return updatedJourney
        }

        return journey
    }

    // Helper pour un segment de transport public individuel
    func getPreciseCoordinates(for section: ItinerarySection) -> [CLLocationCoordinate2D]? {
        guard section.type == "public_transport",
              let display = section.display_informations,
              let fromCoord = section.from?.coordinate,
              let toCoord = section.to?.coordinate else {
            return nil
        }

        let lineCode = display.code ?? display.label ?? ""
        let intermediates = section.stop_date_times?.compactMap { $0.stop_point.coordinate } ?? []

        return getPreciseCoordinates(
            forLine: lineCode,
            commercialMode: display.commercial_mode,
            physicalMode: display.physical_mode,
            from: fromCoord,
            to: toCoord,
            intermediates: intermediates
        )
    }

    // MARK: - File de priorité pour Dijkstra

    private struct PriorityQueue<T> {
        private var elements: [T] = []
        private let areInIncreasingOrder: (T, T) -> Bool

        init(sort: @escaping (T, T) -> Bool) {
            self.areInIncreasingOrder = sort
        }

        var isEmpty: Bool { elements.isEmpty }

        mutating func push(_ element: T) {
            elements.append(element)
            siftUp(elements.count - 1)
        }

        mutating func pop() -> T? {
            guard !elements.isEmpty else { return nil }
            if elements.count == 1 { return elements.removeLast() }
            let first = elements[0]
            elements[0] = elements.removeLast()
            siftDown(0)
            return first
        }

        private mutating func siftUp(_ index: Int) {
            var child = index
            var parent = (child - 1) / 2
            while child > 0 && areInIncreasingOrder(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
                parent = (child - 1) / 2
            }
        }

        private mutating func siftDown(_ index: Int) {
            var parent = index
            while true {
                let left = 2 * parent + 1
                let right = left + 1
                var candidate = parent

                if left < elements.count && areInIncreasingOrder(elements[left], elements[candidate]) {
                    candidate = left
                }
                if right < elements.count && areInIncreasingOrder(elements[right], elements[candidate]) {
                    candidate = right
                }
                if candidate == parent { return }
                elements.swapAt(parent, candidate)
                parent = candidate
            }
        }
    }
}
