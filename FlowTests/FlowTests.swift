import Foundation
import CoreLocation
import MapKit
import SwiftUI
import Testing
@testable import Flow

struct TransitRouterCSATests {

    // MARK: - Jeu de données minimal de référence (5 stations, 2 lignes, 1 correspondance)

    /// Réseau minimal :
    ///   Ligne 0 (M12) : [0] Issy -> [1] Montparnasse -> [2] Saint-Lazare
    ///   Ligne 1 (M4)  : [1] Montparnasse -> [3] Odéon -> [4] Châtelet
    private func makeMinimalFiveStationNetwork() -> CSANetworkData {
        let stops: ContiguousArray<Stop> = [
            Stop(id: 0, name: "Issy", latitude: 48.824, longitude: 2.273, parentStationId: nil),
            Stop(id: 1, name: "Montparnasse", latitude: 48.842, longitude: 2.322, parentStationId: nil),
            Stop(id: 2, name: "Saint-Lazare", latitude: 48.875, longitude: 2.325, parentStationId: nil),
            Stop(id: 3, name: "Odéon", latitude: 48.852, longitude: 2.338, parentStationId: nil),
            Stop(id: 4, name: "Châtelet", latitude: 48.858, longitude: 2.347, parentStationId: nil)
        ]

        let lines: ContiguousArray<CSALine> = [
            CSALine(id: 0, code: "M12", name: "Ligne 12", mode: .metro, colorHex: "#00814F"),
            CSALine(id: 1, code: "M4", name: "Ligne 4", mode: .metro, colorHex: "#CF009E")
        ]

        // Horaires en secondes depuis minuit (08:00:00 = 28_800)
        // Course 100 (M12) : Issy (08:00) -> Montparnasse (08:05) -> Saint-Lazare (08:11)
        // Course 101 (M12) : Issy (08:10) -> Montparnasse (08:15) -> Saint-Lazare (08:21)
        // Course 200 (M4)  : Montparnasse (08:04:59 = 29_099) -> Odéon (08:08) -> Châtelet (08:11) [1s trop tôt pour Course 100 !]
        // Course 201 (M4)  : Montparnasse (08:05:00 = 29_100) -> Odéon (08:08) -> Châtelet (08:11) [Borne exacte >= 08:05:00]
        // Course 202 (M4)  : Montparnasse (08:12:00 = 29_520) -> Odéon (08:15) -> Châtelet (08:18)
        // Course 300 (M12 nocturne après minuit) : Issy (24:10 = 87_000) -> Montparnasse (24:15 = 87_300)
        // Course 301 (M4 nocturne après minuit)  : Montparnasse (24:16 = 87_360) -> Odéon (24:19 = 87_540) -> Châtelet (24:22 = 87_720)
        let unsortedConnections: ContiguousArray<Connection> = [
            // Volontairement dans le désordre pour vérifier le tri automatique de CSANetworkData
            Connection(departureStop: 1, arrivalStop: 3, departureTime: 29_520, arrivalTime: 29_700, tripId: 202, lineId: 1),
            Connection(departureStop: 3, arrivalStop: 4, departureTime: 29_700, arrivalTime: 29_880, tripId: 202, lineId: 1),

            Connection(departureStop: 0, arrivalStop: 1, departureTime: 28_800, arrivalTime: 29_100, tripId: 100, lineId: 0),
            Connection(departureStop: 1, arrivalStop: 2, departureTime: 29_130, arrivalTime: 29_460, tripId: 100, lineId: 0),

            Connection(departureStop: 1, arrivalStop: 3, departureTime: 29_099, arrivalTime: 29_280, tripId: 200, lineId: 1),
            Connection(departureStop: 3, arrivalStop: 4, departureTime: 29_280, arrivalTime: 29_460, tripId: 200, lineId: 1),

            Connection(departureStop: 1, arrivalStop: 3, departureTime: 29_100, arrivalTime: 29_280, tripId: 201, lineId: 1),
            Connection(departureStop: 3, arrivalStop: 4, departureTime: 29_280, arrivalTime: 29_460, tripId: 201, lineId: 1),

            Connection(departureStop: 0, arrivalStop: 1, departureTime: 29_400, arrivalTime: 29_700, tripId: 101, lineId: 0),
            Connection(departureStop: 1, arrivalStop: 2, departureTime: 29_730, arrivalTime: 30_060, tripId: 101, lineId: 0),

            Connection(departureStop: 0, arrivalStop: 1, departureTime: 87_000, arrivalTime: 87_300, tripId: 300, lineId: 0),
            Connection(departureStop: 1, arrivalStop: 3, departureTime: 87_360, arrivalTime: 87_540, tripId: 301, lineId: 1),
            Connection(departureStop: 3, arrivalStop: 4, departureTime: 87_540, arrivalTime: 87_720, tripId: 301, lineId: 1)
        ]

        return CSANetworkData(
            stops: stops,
            lines: lines,
            transfers: [],
            connections: unsortedConnections
        )
    }

    // MARK: - Tests Phase 1 : Structures mémoire & Sérialisation

    @Test("Compacité mémoire de Connection (24 octets) et tri strict par departureTime")
    func memoryLayoutAndSortingInvariant() {
        #expect(MemoryLayout<Connection>.size == 24)
        #expect(MemoryLayout<Connection>.stride == 24)

        let network = makeMinimalFiveStationNetwork()
        #expect(network.stops.count == 5)
        #expect(network.lines.count == 2)
        #expect(CSANetworkData.isSortedByDeparture(network.connections))
    }

    @Test("Sérialisation et désérialisation binaire plate FCSA sans perte")
    func binaryRoundTripSerialization() throws {
        let original = makeMinimalFiveStationNetwork()
        let encoded = CSADataLoader.encodeBinary(original)
        let decoded = try CSADataLoader.decodeBinary(encoded)

        #expect(decoded.stops == original.stops)
        #expect(decoded.lines == original.lines)
        #expect(decoded.transfers == original.transfers)
        #expect(decoded.connections == original.connections)
    }

    @Test("Décodage du format JSON compact indexé par Int32")
    func compactJSONDecoding() throws {
        let json = """
        {
          "version": 1,
          "lines": [{"id":0,"code":"M1","name":"Ligne 1","mode":1,"colorHex":"#FFCD00"}],
          "stops": [
            {"id":0,"name":"Bastille","latitude":48.853,"longitude":2.369,"parentStationId":null},
            {"id":1,"name":"Nation","latitude":48.848,"longitude":2.395,"parentStationId":null}
          ],
          "transfers": [],
          "connections": [[0, 1, 30000, 30180, 0, 0]]
        }
        """
        let decoded = try CSADataLoader.decodeCompactJSON(Data(json.utf8))
        #expect(decoded.stops.count == 2)
        #expect(decoded.lines.count == 1)
        #expect(decoded.connections.count == 1)
        #expect(decoded.connections[0].departureTime == 30_000)
        #expect(decoded.connections[0].arrivalTime == 30_180)
    }

    // MARK: - Tests Phase 2 : Algorithme CSA & Reconstruction

    @Test("Trajet direct sur une seule ligne sans correspondance")
    func directJourneySameTrip() throws {
        let router = TransitRouter(network: makeMinimalFiveStationNetwork())

        // Départ demandé à 07:58 (28_680) de Issy (0) vers Saint-Lazare (2)
        let journey = try #require(
            router.computeJourney(from: 0, to: 2, departureTime: 28_680)
        )

        #expect(journey.departureTime == 28_800) // Monte à 08:00:00
        #expect(journey.arrivalTime == 29_460)   // Arrive à 08:11:00
        #expect(journey.transferCount == 0)
        #expect(journey.rideLegs.count == 1)

        let leg = journey.rideLegs[0]
        #expect(leg.lineId == 0)
        #expect(leg.tripId == 100)
        #expect(leg.departureStop == 0)
        #expect(leg.arrivalStop == 2)
        #expect(leg.connections.count == 2)
        #expect(leg.intermediateStopIds == [1])
    }

    @Test("Trajet avec 1 correspondance et respect exact de la borne horaire (t_dép >= earliestArrival)")
    func oneTransferJourneyAndExactBoundary() throws {
        let router = TransitRouter(network: makeMinimalFiveStationNetwork())

        // Départ à 08:00:00 (28_800) de Issy (0) vers Châtelet (4) :
        // - Course 100 arrive à Montparnasse (1) à 29_100 (08:05:00)
        // - Course 200 part à 29_099 (08:04:59) -> DOIT être ignorée (manquée d'1 seconde)
        // - Course 201 part à 29_100 (08:05:00) -> DOIT être prise (borne exacte >=)
        let journey = try #require(
            router.computeJourney(from: 0, to: 4, departureTime: 28_800)
        )

        #expect(journey.departureTime == 28_800)
        #expect(journey.arrivalTime == 29_460)
        #expect(journey.transferCount == 1)
        #expect(journey.rideLegs.count == 2)

        let firstLeg = journey.rideLegs[0]
        #expect(firstLeg.lineId == 0)
        #expect(firstLeg.tripId == 100)
        #expect(firstLeg.departureStop == 0)
        #expect(firstLeg.arrivalStop == 1)

        let secondLeg = journey.rideLegs[1]
        #expect(secondLeg.lineId == 1)
        #expect(secondLeg.tripId == 201) // Bien la course 201 et non 200 !
        #expect(secondLeg.departureStop == 1)
        #expect(secondLeg.arrivalStop == 4)
        #expect(secondLeg.intermediateStopIds == [3])
    }

    @Test("Correspondance manquée d'une seconde bascule sur le train suivant")
    func missedTransferByOneSecondCatchesNextTrain() throws {
        let router = TransitRouter(network: makeMinimalFiveStationNetwork())

        // Départ de Issy à 08:00:01 (28_801) :
        // - Course 100 (08:00:00) est manquée d'1s -> prend Course 101 (08:10 -> 08:15 = 29_700 à Montparnasse)
        // - À Montparnasse à 08:15 (29_700), Course 202 (08:12 = 29_520) est déjà partie !
        // - Le seul train suivant vers Châtelet est le service de nuit Course 301 (24:16 -> 24:22 = 87_720)
        let journey = try #require(
            router.computeJourney(from: 0, to: 4, departureTime: 28_801)
        )

        #expect(journey.rideLegs.count == 2)
        #expect(journey.rideLegs[0].tripId == 101)
        #expect(journey.rideLegs[1].tripId == 301)
        #expect(journey.arrivalTime == 87_720)
    }

    @Test("Horaires limites : après minuit (> 86400s), après dernier train, et origine == destination")
    func boundaryScheduleEdgeCases() throws {
        let router = TransitRouter(network: makeMinimalFiveStationNetwork())

        // 1. Service après minuit (24:05 = 86_700s)
        let nightJourney = try #require(
            router.computeJourney(from: 0, to: 4, departureTime: 86_700)
        )
        #expect(nightJourney.departureTime == 87_000)
        #expect(nightJourney.arrivalTime == 87_720)
        #expect(nightJourney.transferCount == 1)

        // 2. Départ après le tout dernier train de la journée (25:00 = 90_000s) -> aucun trajet
        let afterLastTrain = router.computeJourney(from: 0, to: 4, departureTime: 90_000)
        #expect(afterLastTrain == nil)

        // 3. Origine identique à la destination -> trajet instantané vide
        let sameStop = try #require(
            router.computeJourney(from: 1, to: 1, departureTime: 30_000)
        )
        #expect(sameStop.steps.isEmpty)
        #expect(sameStop.departureTime == 30_000)
        #expect(sameStop.arrivalTime == 30_000)
        #expect(sameStop.transferCount == 0)
    }

    @Test("Correspondance intra-station avec quais enfants et temps de marche (parentStationId)")
    func hierarchicalParentStationWithFootpathTransfer() throws {
        // Station parente [1] Montparnasse avec Quai M12 [5] et Quai M4 [6] reliés par 120s de marche
        let stops: ContiguousArray<Stop> = [
            Stop(id: 0, name: "Issy", latitude: 48.824, longitude: 2.273, parentStationId: nil),
            Stop(id: 1, name: "Montparnasse", latitude: 48.842, longitude: 2.322, parentStationId: nil),
            Stop(id: 2, name: "Châtelet", latitude: 48.858, longitude: 2.347, parentStationId: nil),
            Stop(id: 3, name: "Montparnasse Quai M12", latitude: 48.842, longitude: 2.322, parentStationId: 1),
            Stop(id: 4, name: "Montparnasse Quai M4", latitude: 48.842, longitude: 2.322, parentStationId: 1)
        ]
        let lines: ContiguousArray<CSALine> = [
            CSALine(id: 0, code: "M12", name: "M12", mode: .metro, colorHex: "#00814F"),
            CSALine(id: 1, code: "M4", name: "M4", mode: .metro, colorHex: "#CF009E")
        ]
        let transfers: ContiguousArray<CSAFootpath> = [
            CSAFootpath(fromStop: 3, toStop: 4, durationSeconds: 120),
            CSAFootpath(fromStop: 4, toStop: 3, durationSeconds: 120)
        ]
        let connections: ContiguousArray<Connection> = [
            // M12 arrive Quai 3 à 08:05:00 (29_100)
            Connection(departureStop: 0, arrivalStop: 3, departureTime: 28_800, arrivalTime: 29_100, tripId: 1, lineId: 0),
            // M4 #1 part Quai 4 à 08:06:30 (29_190) -> trop juste car marche = 120s (prêt à 29_220)
            Connection(departureStop: 4, arrivalStop: 2, departureTime: 29_190, arrivalTime: 29_490, tripId: 2, lineId: 1),
            // M4 #2 part Quai 4 à 08:07:00 (29_220) -> pile après les 120s de correspondance !
            Connection(departureStop: 4, arrivalStop: 2, departureTime: 29_220, arrivalTime: 29_520, tripId: 3, lineId: 1)
        ]

        let router = TransitRouter(
            network: CSANetworkData(stops: stops, lines: lines, transfers: transfers, connections: connections)
        )

        let journey = try #require(
            router.computeJourney(from: 0, to: 2, departureTime: 28_800)
        )
        #expect(journey.transferCount == 1)
        #expect(journey.totalWalkingSeconds == 120)
        #expect(journey.rideLegs[1].tripId == 3)
        #expect(journey.arrivalTime == 29_520)
    }

    // MARK: - Test d'intégration sur le dataset ferré Île-de-France généré

    @Test("Chargement du binaire ferré IDF (transit_schedule.bin) et calcul d'itinéraire réel")
    func bundledIleDeFranceDatasetRouting() throws {
        let router = try TransitRouter.makeBundled()

        #expect(router.network.lines.count >= 20)
        #expect(router.network.stops.count >= 900)
        #expect(router.network.connections.count >= 100_000)

        let issyId = try #require(router.network.findStationId(named: "Mairie d'Issy"))
        let chateletId = try #require(router.network.findStationId(named: "Châtelet"))

        // Recherche à 08:30:00 (30_600s)
        let journey = try #require(
            router.computeJourney(from: issyId, to: chateletId, departureTime: 30_600)
        )

        #expect(journey.departureTime >= 30_600)
        #expect(journey.arrivalTime > journey.departureTime)
        // Trajet réaliste Mairie d'Issy -> Châtelet (< 50 minutes)
        #expect(journey.elapsedSinceQuerySeconds < 3_000)
        #expect(!journey.rideLegs.isEmpty)
    }
}

struct TrafficParsingTests {
    @Test("Décodage ServerResponse et matching des lignes (active, future, 7B/T3A)")
    func serverResponseDecodingAndLineMatching() throws {
        let json = """
        {
          "disruptions": [
            {
              "id": "d-metro-7b",
              "status": "future",
              "cause": "travaux",
              "category": "Travaux",
              "severity": { "effect": "NO_SERVICE", "name": "interrompu", "priority": 10 },
              "messages": [{ "text": "Travaux sur la ligne 7bis." }],
              "application_periods": [{ "begin": "20990101T000000", "end": "20990102T000000" }],
              "impacted_objects": [{
                "pt_object": {
                  "id": "line:IDFM:C01387",
                  "name": "7B",
                  "line": {
                    "id": "line:IDFM:C01387",
                    "code": "7B",
                    "name": "7B",
                    "commercial_mode": { "id": "commercial_mode:Metro", "name": "Métro" }
                  }
                }
              }]
            },
            {
              "id": "d-rer-a",
              "status": "active",
              "cause": "perturbation",
              "category": "Incidents",
              "severity": { "effect": "SIGNIFICANT_DELAYS", "name": "perturbée", "priority": 30 },
              "messages": [{ "text": "Trafic perturbé sur le RER A." }],
              "application_periods": [{ "begin": "20200101T000000", "end": "20990101T000000" }],
              "impacted_objects": [{
                "pt_object": {
                  "id": "line:IDFM:C01742",
                  "name": "A",
                  "line": {
                    "id": "line:IDFM:C01742",
                    "code": "A",
                    "name": "A",
                    "commercial_mode": { "id": "commercial_mode:RapidTransit", "name": "RER" }
                  }
                }
              }]
            },
            {
              "id": "d-tram-t3a",
              "status": "future",
              "cause": "travaux",
              "category": "Travaux",
              "severity": { "effect": "REDUCED_SERVICE", "name": "perturbée", "priority": 20 },
              "messages": [{ "text": "Travaux T3a." }],
              "application_periods": [{ "begin": "20990101T000000", "end": "20990102T000000" }],
              "impacted_objects": [{
                "pt_object": {
                  "id": "line:IDFM:T3a",
                  "name": "T3a",
                  "line": {
                    "id": "line:IDFM:T3a",
                    "code": "T3A",
                    "name": "T3a",
                    "commercial_mode": { "id": "commercial_mode:Tramway", "name": "Tramway" }
                  }
                }
              }]
            }
          ]
        }
        """
        let data = try #require(json.data(using: .utf8))
        let decoded = try JSONDecoder().decode(ServerResponse.self, from: data)
        let disruptions = try #require(decoded.disruptions)
        #expect(disruptions.count == 3)

        let service = TrafficService()
        service.updateLines(with: disruptions)

        let metro7bis = try #require(service.lines.first { $0.type == .metro && $0.lineId == "7bis" })
        #expect(metro7bis.trafficInfos.count == 1)
        #expect(metro7bis.trafficInfos.first?.period == .future)

        let rerA = try #require(service.lines.first { $0.type == .rer && $0.lineId == "A" })
        #expect(rerA.status == .disrupted)
        #expect(rerA.trafficInfos.count == 1)
        #expect(rerA.trafficInfos.first?.period == .active)

        let tramT3a = try #require(service.lines.first { $0.type == .tram && $0.lineId == "T3a" })
        #expect(tramT3a.trafficInfos.count == 1)
        #expect(tramT3a.trafficInfos.first?.period == .future)
    }
}

struct FlowPerformanceAuditTests {
    @Test("Construction des overlays cartographiques (< 50 ms)")
    func buildOverlaysPerformance() {
        var lines: [LineTrace] = []
        lines.reserveCapacity(40)

        for i in 0..<40 {
            var coords: [CLLocationCoordinate2D] = []
            coords.reserveCapacity(25)
            for p in 0..<25 {
                coords.append(
                    CLLocationCoordinate2D(
                        latitude: 48.80 + Double(i) * 0.002 + Double(p) * 0.0005,
                        longitude: 2.25 + Double(p) * 0.002
                    )
                )
            }
            let poly1 = MKPolyline(coordinates: &coords, count: coords.count)
            let poly2 = MKPolyline(coordinates: &coords, count: coords.count)
            let type: TransportType = (i % 4 == 0) ? .rer : .metro
            lines.append(
                LineTrace(
                    id: "line_\(i)",
                    name: "M\(i)",
                    color: .blue,
                    polylines: [poly1, poly2],
                    type: type,
                    isDashed: false
                )
            )
        }

        let clock = ContinuousClock()
        var overlays: [ColoredPolyline] = []
        let elapsed = clock.measure {
            overlays = MapDataService.buildOverlays(from: lines)
        }

        // 40 lignes * 2 polylignes * (casing + fill) = 160 overlays
        #expect(overlays.count == 160)
        #expect(elapsed < .milliseconds(50))
    }

    @Test("Classement de recherche StationSuggestionEngine avec cache (< 50 ms)")
    func stationRankingPerformance() {
        var stations: [MapStation] = []
        stations.reserveCapacity(500)

        for i in 0..<500 {
            let stationName = i == 250 ? "Châtelet - Les Halles" : "Station Étoile Nord-\(i)"
            stations.append(
                MapStation(
                    id: "st_\(i)",
                    name: stationName,
                    coordinate: CLLocationCoordinate2D(
                        latitude: 48.82 + Double(i % 50) * 0.002,
                        longitude: 2.28 + Double(i / 50) * 0.005
                    ),
                    platforms: [],
                    isHub: i % 10 == 0,
                    mainType: i % 3 == 0 ? .rer : .metro,
                    lines: [StationLine(name: "1", type: .metro), StationLine(name: "A", type: .rer)],
                    city: "Paris"
                )
            )
        }

        let userCoord = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        // Pré-chauffe le cache de normalisation (simule les frappes précédentes au clavier)
        _ = StationSuggestionEngine.rank(
            stations: stations,
            query: "Chate",
            userLocation: userCoord,
            favoriteIds: ["st_250"],
            recentIds: ["st_10"]
        )

        let clock = ContinuousClock()
        var ranked: [MapStation] = []
        let elapsed = clock.measure {
            ranked = StationSuggestionEngine.rank(
                stations: stations,
                query: "Chatelet",
                userLocation: userCoord,
                favoriteIds: ["st_250"],
                recentIds: ["st_10"]
            )
        }

        #expect(ranked.first?.id == "st_250")
        #expect(elapsed < .milliseconds(50))
    }

    @Test("Estimation d'affluence en rafale CrowdAffluenceService (< 50 ms)")
    func crowdAffluenceEstimationPerformance() {
        let now = Date()
        let service = CrowdAffluenceService.shared
        // Pré-chauffe le singleton
        _ = service.estimateAffluence(
            lineCode: "1",
            transportType: .metro,
            direction: "La Défense",
            stationName: "Châtelet",
            date: now
        )

        let clock = ContinuousClock()
        var count = 0
        let elapsed = clock.measure {
            for i in 0..<200 {
                let result = service.estimateAffluence(
                    lineCode: i % 2 == 0 ? "1" : "A",
                    transportType: i % 2 == 0 ? .metro : .rer,
                    direction: "La Défense",
                    stationName: "Châtelet",
                    date: now
                )
                if result.score >= 0 {
                    count += 1
                }
            }
        }

        #expect(count == 200)
        #expect(elapsed < .milliseconds(50))
    }
}
