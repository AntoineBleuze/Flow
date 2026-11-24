import Foundation

/// Moteur de calcul d'itinéraires local basé sur le Connection Scan Algorithm (CSA — Phase 2).
final class TransitRouter: Sendable {
    let network: CSANetworkData

    init(network: CSANetworkData) {
        self.network = network
    }

    /// Instancie un routeur CSA à partir du binaire horaire embarqué (`transit_schedule.bin`).
    static func makeBundled(resourceName: String = "transit_schedule") throws -> TransitRouter {
        let data = try CSADataLoader.loadBundledNetwork(resourceName: resourceName)
        return TransitRouter(network: data)
    }

    // MARK: - Pointeurs de reconstruction (Backtracking)

    enum BacktrackPointer: Sendable, Equatable {
        case none
        case origin
        case ride(enterConnectionIndex: Int32, exitConnectionIndex: Int32)
        case footpath(fromStop: Int32, toStop: Int32, departureTime: Int32, arrivalTime: Int32)
        case parentArrival(platformStop: Int32)
    }

    /// Résultat complet d'un balayage linéaire CSA depuis une origine donnée.
    struct ScanResult: Sendable {
        let originStopId: Int32
        let departureTime: Int32
        /// Tableau des meilleurs temps d'arrivée par station (`Int32.max` si inatteignable).
        let earliestArrival: [Int32]
        let minRides: [Int32]
        let pointers: [BacktrackPointer]
    }

    // MARK: - API Principale

    /// Calcule le meilleur itinéraire au plus tôt entre deux arrêts ou stations parentes.
    func computeJourney(
        from originStopId: Int32,
        to destinationStopId: Int32,
        departureTime: Int32
    ) -> CSAJourney? {
        let stopCount = network.stops.count
        guard originStopId >= 0, Int(originStopId) < stopCount,
              destinationStopId >= 0, Int(destinationStopId) < stopCount else {
            return nil
        }

        let scanResult = scanConnections(
            from: originStopId,
            departureTime: departureTime,
            targetStopId: destinationStopId
        )
        return reconstructJourney(to: destinationStopId, from: scanResult)
    }

    // MARK: - Balayage Linéaire CSA (Connection Scan)

    /// Exécute le balayage linéaire sur `ContiguousArray<Connection>` trié par `departureTime` croissant.
    func scanConnections(
        from originStopId: Int32,
        departureTime: Int32,
        targetStopId: Int32? = nil
    ) -> ScanResult {
        let stopCount = network.stops.count
        var earliestArrival: [Int32] = Array(repeating: Int32.max, count: stopCount)
        var minRides: [Int32] = Array(repeating: Int32.max, count: stopCount)
        var pointers: [BacktrackPointer] = Array(repeating: .none, count: stopCount)

        guard originStopId >= 0, Int(originStopId) < stopCount else {
            return ScanResult(
                originStopId: originStopId,
                departureTime: departureTime,
                earliestArrival: earliestArrival,
                minRides: minRides,
                pointers: pointers
            )
        }

        // 1. Initialisation des arrêts d'origine (station parente + ses quais éventuels)
        let originStops = expandedStops(for: originStopId)
        for stopId in originStops {
            let idx = Int(stopId)
            earliestArrival[idx] = departureTime
            minRides[idx] = 0
            pointers[idx] = .origin
        }

        // Propagation des correspondances initiales depuis l'origine
        for stopId in originStops {
            for fp in network.outgoingFootpaths[Int(stopId)] where fp.fromStop != fp.toStop {
                let targetIdx = Int(fp.toStop)
                let walkArrival = saturatingAdd(departureTime, fp.durationSeconds)
                if walkArrival < earliestArrival[targetIdx] {
                    earliestArrival[targetIdx] = walkArrival
                    minRides[targetIdx] = 0
                    pointers[targetIdx] = .footpath(
                        fromStop: fp.fromStop,
                        toStop: fp.toStop,
                        departureTime: departureTime,
                        arrivalTime: walkArrival
                    )
                }
            }
        }

        // Marquage rapide des arrêts cibles pour l'arrêt anticipé (early-stopping)
        // Note : on utilise `>` strict (`conn.departureTime > bestTargetArrival`) afin de permettre
        // le départage par nombre minimal de correspondances à heure d'arrivée égale.
        var isTargetStop = [Bool]()
        var bestTargetArrival: Int32 = Int32.max
        if let targetId = targetStopId, targetId >= 0, Int(targetId) < stopCount {
            isTargetStop = Array(repeating: false, count: stopCount)
            for tStop in expandedStops(for: targetId) {
                let idx = Int(tStop)
                isTargetStop[idx] = true
                if earliestArrival[idx] < bestTargetArrival {
                    bestTargetArrival = earliestArrival[idx]
                }
            }
        }

        // `tripEnterConnection[tripId]` stocke l'indice de la connexion où l'usager est monté (-1 sinon)
        var tripEnterConnection = Array(repeating: Int32(-1), count: network.tripSlotCount)
        var tripRideCount = Array(repeating: Int32.max, count: network.tripSlotCount)

        let startIndex = network.firstConnectionIndex(departingAtOrAfter: departureTime)
        let stops = network.stops
        let footpathsByStop = network.outgoingFootpaths
        let hasTarget = !isTargetStop.isEmpty

        // 2. Boucle de balayage linéaire (Scan) sur ContiguousArray<Connection>
        network.connections.withUnsafeBufferPointer { buffer in
            guard startIndex < buffer.count else { return }

            for connIdx in startIndex..<buffer.count {
                let conn = buffer[connIdx]

                // Les connexions partant strictement après la meilleure arrivée cible ne peuvent plus l'égaler ni la battre
                if hasTarget && conn.departureTime > bestTargetArrival {
                    break
                }

                if conn.departureStop == conn.arrivalStop {
                    continue
                }

                let depIdx = Int(conn.departureStop)
                let arrIdx = Int(conn.arrivalStop)
                let tripIdx = Int(conn.tripId)

                var enterConnIdx = tripEnterConnection[tripIdx]
                var currentRideCount = tripRideCount[tripIdx]

                // Peut-on monter dans ce train à l'arrêt A (t_dép >= earliestArrival[A]) avec moins de correspondances ?
                let readyTimeAtDep = earliestArrival[depIdx]
                if readyTimeAtDep <= conn.departureTime {
                    let candidateRides = saturatingAdd(minRides[depIdx], 1)
                    if enterConnIdx == -1 || candidateRides < currentRideCount {
                        enterConnIdx = Int32(connIdx)
                        currentRideCount = candidateRides
                        tripEnterConnection[tripIdx] = enterConnIdx
                        tripRideCount[tripIdx] = currentRideCount
                    }
                }

                guard enterConnIdx != -1 else { continue }

                // Mise à jour si arrivée strictement plus tôt, ou à la même seconde avec moins de correspondances
                let prevArrival = earliestArrival[arrIdx]
                let improvesArrival = conn.arrivalTime < prevArrival
                let improvesTransfersOnTie = (conn.arrivalTime == prevArrival && currentRideCount < minRides[arrIdx])

                if improvesArrival || improvesTransfersOnTie {
                    earliestArrival[arrIdx] = conn.arrivalTime
                    minRides[arrIdx] = currentRideCount
                    pointers[arrIdx] = .ride(
                        enterConnectionIndex: enterConnIdx,
                        exitConnectionIndex: Int32(connIdx)
                    )

                    if hasTarget && isTargetStop[arrIdx] && conn.arrivalTime < bestTargetArrival {
                        bestTargetArrival = conn.arrivalTime
                    }

                    // Mise à jour informative de la station parente si le quai appartient à un pôle
                    if let parentId = stops[arrIdx].parentStationId {
                        let pIdx = Int(parentId)
                        let pPrevArr = earliestArrival[pIdx]
                        if conn.arrivalTime < pPrevArr || (conn.arrivalTime == pPrevArr && currentRideCount < minRides[pIdx]) {
                            earliestArrival[pIdx] = conn.arrivalTime
                            minRides[pIdx] = currentRideCount
                            pointers[pIdx] = .parentArrival(platformStop: conn.arrivalStop)
                            if hasTarget && isTargetStop[pIdx] && conn.arrivalTime < bestTargetArrival {
                                bestTargetArrival = conn.arrivalTime
                            }
                        }
                    }

                    // Relaxation des correspondances piétonnes sortantes de B
                    let outgoing = footpathsByStop[arrIdx]
                    if !outgoing.isEmpty {
                        for fp in outgoing where fp.fromStop != fp.toStop {
                            let fpTargetIdx = Int(fp.toStop)
                            let walkArrival = saturatingAdd(conn.arrivalTime, fp.durationSeconds)
                            let prevFpArr = earliestArrival[fpTargetIdx]
                            if walkArrival < prevFpArr || (walkArrival == prevFpArr && currentRideCount < minRides[fpTargetIdx]) {
                                earliestArrival[fpTargetIdx] = walkArrival
                                minRides[fpTargetIdx] = currentRideCount
                                pointers[fpTargetIdx] = .footpath(
                                    fromStop: fp.fromStop,
                                    toStop: fp.toStop,
                                    departureTime: conn.arrivalTime,
                                    arrivalTime: walkArrival
                                )
                                if hasTarget && isTargetStop[fpTargetIdx] && walkArrival < bestTargetArrival {
                                    bestTargetArrival = walkArrival
                                }
                            }
                        }
                    }
                }
            }
        }

        return ScanResult(
            originStopId: originStopId,
            departureTime: departureTime,
            earliestArrival: earliestArrival,
            minRides: minRides,
            pointers: pointers
        )
    }

    // MARK: - Reconstruction du parcours (Backtracking)

    /// Reconstruit l'itinéraire complet vers `destinationStopId` à partir des pointeurs du scan CSA.
    func reconstructJourney(
        to destinationStopId: Int32,
        from scanResult: ScanResult
    ) -> CSAJourney? {
        let stopCount = network.stops.count
        guard destinationStopId >= 0, Int(destinationStopId) < stopCount else {
            return nil
        }

        let candidateStops = expandedStops(for: destinationStopId)
        var bestStop: Int32 = -1
        var bestArrival: Int32 = Int32.max
        var bestRides: Int32 = Int32.max

        // Choisir le quai minimisant (heure d'arrivée, nombre de correspondances), en privilégiant les quais réels
        for stopId in candidateStops {
            let idx = Int(stopId)
            let arr = scanResult.earliestArrival[idx]
            let rides = scanResult.minRides[idx]
            guard arr < Int32.max else { continue }

            if arr < bestArrival || (arr == bestArrival && rides < bestRides) {
                bestArrival = arr
                bestRides = rides
                bestStop = stopId
            } else if arr == bestArrival && rides == bestRides && bestStop >= 0 {
                if case .parentArrival = scanResult.pointers[Int(bestStop)] {
                    bestStop = stopId
                }
            }
        }

        guard bestStop >= 0, bestArrival < Int32.max else {
            return nil
        }

        // Cas départ == arrivée
        if case .origin = scanResult.pointers[Int(bestStop)] {
            return CSAJourney(
                originStop: scanResult.originStopId,
                destinationStop: destinationStopId,
                queryDepartureTime: scanResult.departureTime,
                departureTime: scanResult.departureTime,
                arrivalTime: scanResult.departureTime,
                steps: []
            )
        }

        var reversedSteps: [CSAJourneyStep] = []
        var currentStop = bestStop
        var safetyCounter = 0
        let maxIterations = stopCount + 4

        while safetyCounter < maxIterations {
            safetyCounter += 1
            let pointer = scanResult.pointers[Int(currentStop)]

            switch pointer {
            case .origin:
                let steps = Array(reversedSteps.reversed())
                let actualDeparture = steps.first?.departureTime ?? scanResult.departureTime
                let actualArrival = steps.last?.arrivalTime ?? bestArrival
                return CSAJourney(
                    originStop: scanResult.originStopId,
                    destinationStop: destinationStopId,
                    queryDepartureTime: scanResult.departureTime,
                    departureTime: actualDeparture,
                    arrivalTime: actualArrival,
                    steps: steps
                )

            case .none:
                return nil

            case .parentArrival(let platformStop):
                currentStop = platformStop

            case .footpath(let fromStop, let toStop, let depTime, let arrTime):
                let leg = CSAFootpathLeg(
                    fromStop: fromStop,
                    toStop: toStop,
                    departureTime: depTime,
                    arrivalTime: arrTime,
                    durationSeconds: arrTime - depTime
                )
                reversedSteps.append(.transfer(leg))
                currentStop = fromStop

            case .ride(let enterIdx, let exitIdx):
                let rideConnections = extractTripConnections(
                    enterIndex: Int(enterIdx),
                    exitIndex: Int(exitIdx)
                )
                guard let firstConn = rideConnections.first,
                      let lastConn = rideConnections.last else {
                    return nil
                }
                let rideLeg = CSARideLeg(
                    lineId: firstConn.lineId,
                    tripId: firstConn.tripId,
                    departureStop: firstConn.departureStop,
                    arrivalStop: lastConn.arrivalStop,
                    departureTime: firstConn.departureTime,
                    arrivalTime: lastConn.arrivalTime,
                    connections: rideConnections
                )
                reversedSteps.append(.ride(rideLeg))
                currentStop = firstConn.departureStop
            }
        }

        return nil
    }

    // MARK: - Utilitaires internes

    /// Retourne l'arrêt demandé accompagné de ses quais enfants s'il s'agit d'une station parente.
    private func expandedStops(for stopId: Int32) -> [Int32] {
        let children = network.childStopsByParent[Int(stopId)]
        if children.isEmpty {
            return [stopId]
        }
        var result = [Int32]()
        result.reserveCapacity(1 + children.count)
        result.append(stopId)
        result.append(contentsOf: children)
        return result
    }

    /// Extrait la séquence exacte de `Connection` d'une course entre `enterIndex` et `exitIndex`.
    private func extractTripConnections(enterIndex: Int, exitIndex: Int) -> [Connection] {
        guard enterIndex >= 0,
              exitIndex >= enterIndex,
              exitIndex < network.connections.count else {
            return []
        }

        let enterConn = network.connections[enterIndex]
        if enterIndex == exitIndex {
            return [enterConn]
        }

        let targetTripId = enterConn.tripId
        var chain: [Connection] = [enterConn]
        var expectedStop = enterConn.arrivalStop

        for idx in (enterIndex + 1)...exitIndex {
            let candidate = network.connections[idx]
            if candidate.tripId == targetTripId && candidate.departureStop == expectedStop {
                chain.append(candidate)
                expectedStop = candidate.arrivalStop
            }
        }

        return chain
    }

    @inline(__always)
    private func saturatingAdd(_ a: Int32, _ b: Int32) -> Int32 {
        let (sum, overflow) = a.addingReportingOverflow(b)
        return overflow ? Int32.max : sum
    }
}
