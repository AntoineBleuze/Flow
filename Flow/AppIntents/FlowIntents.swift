//
//  FlowIntents.swift
//  Flow
//
//  Created for Siri & Apple Intelligence (SiriAI) support.
//

import AppIntents
import SwiftUI
import CoreLocation

// MARK: - 1. Check Line Traffic Intent

public struct CheckLineTrafficIntent: AppIntent {
    public static var title: LocalizedStringResource = "Consulter le trafic d'une ligne"
    public static var description = IntentDescription("Vérifie l'état du trafic en temps réel pour une ligne de métro, RER, tramway ou train.")

    @Parameter(title: "Ligne", requestValueDialog: IntentDialog("Pour quelle ligne souhaitez-vous vérifier le trafic ?"))
    public var line: TransitLineEntity?

    @Parameter(title: "Nom ou numéro de ligne (texte)", description: "Ex: 1, 14, A, T3a")
    public var lineName: String?

    public init() {}

    public init(line: TransitLineEntity) {
        self.line = line
    }

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let code = line?.lineCode ?? lineName ?? "1"
        let transportLine = FlowAppIntentsHelper.findTransportLine(codeOrName: code)

        guard let targetLine = transportLine else {
            let errorMsg = "Impossible de trouver les informations de trafic pour la ligne \(code)."
            return .result(
                dialog: IntentDialog(stringLiteral: errorMsg),
                view: TrafficStatusIntentView(
                    line: TransportLine(
                        type: .metro,
                        lineId: code,
                        status: .information,
                        trafficInfos: [TrafficInfo(id: "unk", title: "Ligne inconnue", message: errorMsg, period: .active, severity: .information, startTime: nil, endTime: nil, impactedStops: nil, impactedSection: nil)]
                    )
                )
            )
        }

        let siriMessage: String
        switch targetLine.status {
        case .normal:
            siriMessage = "Le trafic est normal sur la \(targetLine.type.rawValue) \(targetLine.lineId)."
        case .disrupted:
            let detail = targetLine.message ?? "Perturbations signalées"
            siriMessage = "Trafic perturbé sur la \(targetLine.type.rawValue) \(targetLine.lineId) : \(detail)."
        case .interrupted:
            let detail = targetLine.message ?? "Trafic temporairement interrompu"
            siriMessage = "Attention, le trafic est interrompu sur la \(targetLine.type.rawValue) \(targetLine.lineId) : \(detail)."
        case .works:
            let detail = targetLine.message ?? "Travaux en cours"
            siriMessage = "Des travaux impactent la \(targetLine.type.rawValue) \(targetLine.lineId) : \(detail)."
        case .information:
            let detail = targetLine.message ?? "Information voyageur"
            siriMessage = "Info sur la \(targetLine.type.rawValue) \(targetLine.lineId) : \(detail)."
        }

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: TrafficStatusIntentView(line: targetLine)
        )
    }
}

// MARK: - 2. Check Network Traffic Intent

public struct CheckNetworkTrafficIntent: AppIntent {
    public static var title: LocalizedStringResource = "Consulter le trafic global"
    public static var description = IntentDescription("Donne une vue d'ensemble de l'état du réseau de transport en commun.")

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let allLines = TrafficService.shared.lines
        let perturbed = allLines.filter { $0.status != .normal }

        let siriMessage: String
        if perturbed.isEmpty {
            siriMessage = "Le trafic est fluide et normal sur l'ensemble du réseau."
        } else {
            let lineNames = perturbed.prefix(3).map { "\($0.type.rawValue) \($0.lineId)" }.joined(separator: ", ")
            siriMessage = "\(perturbed.count) ligne(s) rencontrent des perturbations actuellement : \(lineNames)."
        }

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: NetworkTrafficIntentView(perturbedLines: perturbed)
        )
    }
}

// MARK: - 3. Get Next Departures Intent

public struct GetNextDeparturesIntent: AppIntent {
    public static var title: LocalizedStringResource = "Voir les prochains départs"
    public static var description = IntentDescription("Affiche les prochains passages de métros, RER ou trams à une station.")

    @Parameter(title: "Station", requestValueDialog: IntentDialog("Pour quelle station souhaitez-vous voir les prochains départs ?"))
    public var station: StationEntity?

    @Parameter(title: "Nom de la station (texte)")
    public var stationName: String?

    @Parameter(title: "Ligne (optionnel)")
    public var line: TransitLineEntity?

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let queryName = station?.name ?? stationName ?? "Châtelet"
        let resolvedStation = FlowAppIntentsHelper.findStation(named: queryName)

        guard let targetStation = resolvedStation else {
            let msg = "Impossible de trouver la station '\(queryName)'."
            return .result(
                dialog: IntentDialog(stringLiteral: msg),
                view: DeparturesIntentView(stationName: queryName, departures: [])
            )
        }

        let lineFilter = line?.lineCode
        let departures = (try? await FlowAppIntentsHelper.fetchNextDepartures(for: targetStation, lineCode: lineFilter)) ?? []

        let siriMessage: String
        if departures.isEmpty {
            siriMessage = "Aucun départ prévu dans l'immédiat à \(targetStation.name)."
        } else {
            let topTwo = departures.prefix(2)
            let details = topTwo.map { dep in
                let time = dep.minutesRemaining == 0 ? "à l'approche" : "dans \(dep.minutesRemaining) min"
                return "ligne \(dep.lineCode) vers \(dep.destination) \(time)"
            }.joined(separator: ", et ")
            siriMessage = "Prochains départs à \(targetStation.name) : \(details)."
        }

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: DeparturesIntentView(stationName: targetStation.name, departures: departures)
        )
    }
}

// MARK: - 4. Search Itinerary Intent

public struct SearchItineraryIntent: AppIntent {
    public static var title: LocalizedStringResource = "Rechercher un itinéraire"
    public static var description = IntentDescription("Calcule le meilleur trajet en transports jusqu'à votre destination.")

    @Parameter(title: "Destination", requestValueDialog: IntentDialog("Où souhaitez-vous vous rendre ?"))
    public var destination: StationEntity?

    @Parameter(title: "Nom de destination (texte)")
    public var destinationName: String?

    @Parameter(title: "Départ (optionnel)", description: "Laisser vide pour partir de votre position actuelle")
    public var departure: StationEntity?

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let destQuery = destination?.name ?? destinationName ?? "Gare de Lyon"
        guard let destStation = FlowAppIntentsHelper.findStation(named: destQuery) else {
            let msg = "Désolé, impossible de trouver la destination '\(destQuery)'."
            return .result(
                dialog: IntentDialog(stringLiteral: msg),
                view: ItinerarySnippetIntentView(origin: "Départ", destination: destQuery, durationMinutes: 0, transfers: 0, summary: msg)
            )
        }

        let allStations = FlowAppIntentsHelper.getAllStations()
        let startStation: MapStation
        let originName: String

        if let depEntity = departure, let depStation = FlowAppIntentsHelper.findStation(named: depEntity.name) {
            startStation = depStation
            originName = depStation.name
        } else {
            let userLoc = LocationManager.shared.userLocation
            let nearest = StationSuggestionEngine.nearbySuggestions(from: allStations, userLocation: userLoc, maxResults: 1).first
            startStation = nearest ?? destStation
            originName = nearest != nil ? "Votre position (\(nearest!.name))" : "Position actuelle"
        }

        // Calcul du meilleur itinéraire avec TransitGraphRouter
        let route = TransitGraphRouter.shared.findOptimalRoute(from: startStation, to: destStation, allStations: allStations)

        let durationMin: Int
        let transfers: Int
        let summary: String

        if let route = route {
            durationMin = max(1, route.totalDurationSeconds / 60)
            transfers = route.numberOfTransfers
            let lines = route.legs.map { $0.lineName }.joined(separator: ", ")
            summary = lines.isEmpty ? "Direct" : "Via \(lines)"

            let journey = TransitGraphRouter.shared.buildJourney(from: route, startCoord: startStation.coordinate)
            NavigationCoordinator.shared.showItineraryPreview(journey: journey)
        } else {
            durationMin = 25
            transfers = 0
            summary = "Trajet estimé"
        }

        let siriMessage = "Itinéraire vers \(destStation.name) trouvé : environ \(durationMin) minutes avec \(transfers == 0 ? "aucun changement" : "\(transfers) correspondance(s)")."

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: ItinerarySnippetIntentView(
                origin: originName,
                destination: destStation.name,
                durationMinutes: durationMin,
                transfers: transfers,
                summary: summary
            )
        )
    }
}

// MARK: - 5. Start Navigation Intent

public struct StartNavigationIntent: AppIntent {
    public static var title: LocalizedStringResource = "Démarrer la navigation"
    public static var description = IntentDescription("Lance le guidage étape par étape vers votre destination.")
    public static var openAppWhenRun: Bool = true

    @Parameter(title: "Destination", requestValueDialog: IntentDialog("Vers quelle station souhaitez-vous naviguer ?"))
    public var destination: StationEntity?

    @Parameter(title: "Nom de destination (texte)")
    public var destinationName: String?

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog {
        let destQuery = destination?.name ?? destinationName ?? "Châtelet"
        guard let destStation = FlowAppIntentsHelper.findStation(named: destQuery) else {
            return .result(dialog: IntentDialog(stringLiteral: "Impossible de trouver la destination '\(destQuery)'."))
        }

        let allStations = FlowAppIntentsHelper.getAllStations()
        let userLoc = LocationManager.shared.userLocation
        let startStation = StationSuggestionEngine.nearbySuggestions(from: allStations, userLocation: userLoc, maxResults: 1).first ?? destStation

        if let route = TransitGraphRouter.shared.findOptimalRoute(from: startStation, to: destStation, allStations: allStations) {
            let journey = TransitGraphRouter.shared.buildJourney(from: route, startCoord: startStation.coordinate)
            NavigationCoordinator.shared.startNavigation(journey: journey)
            return .result(dialog: IntentDialog(stringLiteral: "C'est parti ! Guidage en cours vers \(destStation.name)."))
        } else {
            return .result(dialog: IntentDialog(stringLiteral: "Impossible de calculer un itinéraire vers \(destStation.name) pour le moment."))
        }
    }
}

// MARK: - 6. Stop Navigation Intent

public struct StopNavigationIntent: AppIntent {
    public static var title: LocalizedStringResource = "Arrêter la navigation"
    public static var description = IntentDescription("Arrête le trajet et le guidage en cours dans Flow.")

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog {
        NavigationManager.shared.stopNavigation()
        return .result(dialog: IntentDialog(stringLiteral: "La navigation a été arrêtée."))
    }
}

// MARK: - 7. Find Nearby Stations Intent

public struct FindNearbyStationsIntent: AppIntent {
    public static var title: LocalizedStringResource = "Trouver les stations proches"
    public static var description = IntentDescription("Localise les stations de transport les plus proches de votre position actuelle.")

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let allStations = FlowAppIntentsHelper.getAllStations()
        let userCoord = LocationManager.shared.userLocation

        guard let coord = userCoord else {
            let fallbackStations = allStations.prefix(3).map {
                (name: $0.name, distanceMeters: 250, linesText: $0.lines.map { $0.name }.joined(separator: ", "))
            }
            return .result(
                dialog: IntentDialog(stringLiteral: "Position GPS non disponible. Voici les principales stations du réseau."),
                view: NearbyStationsIntentView(stations: fallbackStations)
            )
        }

        let userLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        let nearby = StationSuggestionEngine.nearbySuggestions(from: allStations, userLocation: coord, maxResults: 4)

        let items: [(name: String, distanceMeters: Int, linesText: String)] = nearby.map { st in
            let stLoc = CLLocation(latitude: st.latitude, longitude: st.longitude)
            let dist = Int(userLoc.distance(from: stLoc))
            let lines = st.lines.map { $0.name }.joined(separator: ", ")
            return (name: st.name, distanceMeters: dist, linesText: lines)
        }

        let siriMessage: String
        if let closest = items.first {
            siriMessage = "La station la plus proche est \(closest.name) à \(closest.distanceMeters) mètres (\(closest.linesText))."
        } else {
            siriMessage = "Aucune station trouvée à proximité immédiate."
        }

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: NearbyStationsIntentView(stations: items)
        )
    }
}

// MARK: - 8. Show Station On Map Intent

public struct ShowStationOnMapIntent: AppIntent {
    public static var title: LocalizedStringResource = "Afficher une station sur la carte"
    public static var description = IntentDescription("Ouvre Flow et focalise la carte sur une station spécifique.")
    public static var openAppWhenRun: Bool = true

    @Parameter(title: "Station", requestValueDialog: IntentDialog("Quelle station souhaitez-vous afficher ?"))
    public var station: StationEntity?

    @Parameter(title: "Nom de station (texte)")
    public var stationName: String?

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog {
        let query = station?.name ?? stationName ?? "Châtelet"
        guard let mapStation = FlowAppIntentsHelper.findStation(named: query) else {
            return .result(dialog: IntentDialog(stringLiteral: "Station '\(query)' introuvable."))
        }

        NavigationCoordinator.shared.switchToExplore()
        NavigationCoordinator.shared.selectedStation = mapStation
        MapDataService.shared.selectStation(mapStation)

        return .result(dialog: IntentDialog(stringLiteral: "Affichage de \(mapStation.name) sur la carte."))
    }
}

// MARK: - 9. Check Station Elevators Intent

public struct CheckStationElevatorsIntent: AppIntent {
    public static var title: LocalizedStringResource = "Vérifier les ascenseurs d'une station"
    public static var description = IntentDescription("Vérifie l'accessibilité et la disponibilité des ascenseurs dans une station.")

    @Parameter(title: "Station", requestValueDialog: IntentDialog("Pour quelle station souhaitez-vous vérifier les ascenseurs ?"))
    public var station: StationEntity?

    @Parameter(title: "Nom de station (texte)")
    public var stationName: String?

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let name = station?.name ?? stationName ?? "Bastille"
        let summary = FlowAppIntentsHelper.checkElevators(stationName: name)

        let siriMessage: String
        if summary.total == 0 {
            siriMessage = "Aucun ascenseur répertorié ou station non équipée pour \(name)."
        } else if summary.broken == 0 {
            siriMessage = "Tous les \(summary.operational) ascenseurs sont opérationnels à la station \(name)."
        } else {
            siriMessage = "Attention : \(summary.broken) ascenseur(s) hors service sur \(summary.total) à la station \(name)."
        }

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: ElevatorStatusIntentView(stationName: name, summary: summary)
        )
    }
}

// MARK: - 10. Get Favorite Stations Intent

public struct GetFavoriteStationsIntent: AppIntent {
    public static var title: LocalizedStringResource = "Consulter les favoris"
    public static var description = IntentDescription("Affiche les stations et lignes enregistrées dans vos favoris.")

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let (stations, lines): ([String], [String]) = {
            let favStations = FavoritesService.shared.favoriteStations.map { $0.name }
            let favLines = Array(FavoritesService.shared.favoriteLinesList).sorted()
            return (favStations, favLines)
        }()

        let siriMessage: String
        if stations.isEmpty && lines.isEmpty {
            siriMessage = "Vous n'avez pas encore enregistré de favoris dans Flow."
        } else {
            let countText = "\(stations.count) station(s) et \(lines.count) ligne(s)"
            siriMessage = "Vous avez \(countText) dans vos favoris Flow."
        }

        return .result(
            dialog: IntentDialog(stringLiteral: siriMessage),
            view: FavoritesIntentView(stations: stations, lines: lines)
        )
    }
}

// MARK: - 11. Add Favorite Station Intent

public struct AddFavoriteStationIntent: AppIntent {
    public static var title: LocalizedStringResource = "Ajouter une station aux favoris"
    public static var description = IntentDescription("Enregistre une station dans votre liste de favoris.")

    @Parameter(title: "Station", requestValueDialog: IntentDialog("Quelle station souhaitez-vous ajouter à vos favoris ?"))
    public var station: StationEntity?

    @Parameter(title: "Nom de station (texte)")
    public var stationName: String?

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog {
        let query = station?.name ?? stationName ?? ""
        guard let targetStation = FlowAppIntentsHelper.findStation(named: query) else {
            return .result(dialog: IntentDialog(stringLiteral: "Impossible de trouver la station '\(query)'."))
        }

        if !FavoritesService.shared.isFavorite(stationId: targetStation.id) {
            FavoritesService.shared.toggleFavorite(stationId: targetStation.id)
        }

        return .result(dialog: IntentDialog(stringLiteral: "\(targetStation.name) a été ajoutée à vos favoris Flow."))
    }
}

// MARK: - 12. Confirm Boarding Intent

public struct ConfirmBoardingIntent: AppIntent {
    public static var title: LocalizedStringResource = "Confirmer la montée à bord"
    public static var description = IntentDescription("Confirme que vous êtes monté dans votre métro, RER ou bus pendant la navigation.")

    public init() {}

    @MainActor
    public func perform() async throws -> some IntentResult & ProvidesDialog {
        NavigationManager.shared.confirmBoarding()
        return .result(dialog: IntentDialog(stringLiteral: "Montée à bord confirmée. Bon voyage !"))
    }
}
