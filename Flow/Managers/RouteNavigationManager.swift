import SwiftUI
import Combine
import CoreLocation

/// Gestionnaire d'état découplé pour la navigation active dans Flow.
///
/// Ce manager sépare le cycle de vie de la session d'itinéraire de la présentation UI :
/// - L'itinéraire reste actif en arrière-plan avec ses coordonnées, calculs temps réel et Live Activity
/// - Les tracés `MapPolyline` restent affichés sur la carte
/// - L'utilisateur conserve une liberté totale pour naviguer dans la barre d'onglets,
///   inspecter d'autres stations, ou consulter le trafic
/// - Une mini-pilule flottante Liquid Glass permet de reprendre ou d'arrêter la session à tout instant
final class RouteNavigationManager: ObservableObject {
    static let shared = RouteNavigationManager()

    // MARK: - Published State

    /// Indique si une session d'itinéraire est active en arrière-plan
    @Published private(set) var isRouteActive: Bool = false

    /// L'itinéraire en cours de navigation
    @Published private(set) var activeJourney: Journey? = nil

    /// Indique si la feuille d'itinéraire détaillée (ImmersiveNavigationView / DuoNavigationPanel) est dépliée
    @Published var isShowingRouteSheet: Bool = false

    /// Données d'affichage dynamiques pour la mini-pilule et les bannières
    @Published private(set) var currentInstruction: String = ""
    @Published private(set) var nextStopName: String = ""
    @Published private(set) var destinationName: String = ""
    @Published private(set) var remainingMinutes: Int = 0
    @Published private(set) var arrivalTimeFormatted: String = "--:--"
    @Published private(set) var currentLineDisplay: DisplayInformation? = nil
    @Published private(set) var currentTransportType: TransportType = .metro
    @Published private(set) var isWalking: Bool = false
    @Published private(set) var progress: Double = 0.0

    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    private var isInternallyUpdating: Bool = false

    // MARK: - Init & Subscriptions

    private init() {
        setupSubscriptions()
    }

    private func setupSubscriptions() {
        let nav = NavigationManager.shared

        // Synchronisation avec NavigationManager.isNavigating
        nav.$isNavigating
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isNavigating in
                guard let self = self, !self.isInternallyUpdating else { return }
                if isNavigating {
                    self.isRouteActive = true
                    if self.activeJourney == nil {
                        self.activeJourney = nav.currentJourney
                    }
                    self.updateRouteState()
                } else {
                    self.isRouteActive = false
                    self.activeJourney = nil
                    self.isShowingRouteSheet = false
                    self.updateRouteState()
                }
            }
            .store(in: &cancellables)

        // Synchronisation avec NavigationManager.currentJourney
        nav.$currentJourney
            .receive(on: DispatchQueue.main)
            .sink { [weak self] journey in
                guard let self = self, !self.isInternallyUpdating else { return }
                if let journey = journey {
                    self.activeJourney = journey
                    self.updateRouteState()
                }
            }
            .store(in: &cancellables)

        // Synchronisation avec l'avancement temps réel
        Publishers.CombineLatest4(
            nav.$currentSectionIndex,
            nav.$currentLegIndex,
            nav.$progress,
            nav.$adjustedTimetableDelay
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] _ in
            self?.updateRouteState()
        }
        .store(in: &cancellables)

        // Synchronisation avec les changements d'état (à quai, à bord, marche)
        nav.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.updateRouteState()
            }
            .store(in: &cancellables)
    }

    // MARK: - Actions

    /// Démarre un itinéraire de façon non-bloquante et présente la feuille de route
    func startRoute(journey: Journey) {
        isInternallyUpdating = true
        self.activeJourney = journey
        self.isRouteActive = true
        self.isShowingRouteSheet = true
        isInternallyUpdating = false

        // Basculer sur l'onglet Explore et réinitialiser la station sélectionnée
        NavigationCoordinator.shared.selectedTab = "Explore"
        NavigationCoordinator.shared.selectedStation = nil
        NavigationCoordinator.shared.previewJourney = nil
        NavigationCoordinator.shared.isAIPreviewActive = false

        // Démarrer la session de fond (Live Activity, GPS, Audio)
        NavigationManager.shared.startNavigation(journey: journey)

        updateRouteState()
    }

    /// Termine explicitement la session d'itinéraire en cours
    func stopRoute() {
        isInternallyUpdating = true
        self.isRouteActive = false
        self.activeJourney = nil
        self.isShowingRouteSheet = false
        isInternallyUpdating = false

        NavigationManager.shared.stopNavigation()
        updateRouteState()
    }

    /// Ramène la feuille d'itinéraire détaillée au premier plan (depuis n'importe quel onglet)
    func showRouteDetails() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
            NavigationCoordinator.shared.selectedTab = "Explore"
            NavigationCoordinator.shared.selectedStation = nil
            self.isShowingRouteSheet = true
        }
    }

    /// Réduit la feuille détaillée pour permettre l'exploration libre tout en maintenant l'itinéraire actif
    func minimizeRouteDetails() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
            self.isShowingRouteSheet = false
        }
    }

    /// Notifie le démarrage initié depuis un composant externe (ex: Siri Shortcut, DuoPanel)
    func handleNavigationStarted(journey: Journey) {
        guard !isInternallyUpdating else { return }
        self.activeJourney = journey
        self.isRouteActive = true
        self.isShowingRouteSheet = true
        updateRouteState()
    }

    /// Notifie l'arrêt initié depuis un composant externe (ex: arrivée automatique, Live Activity)
    func handleNavigationStopped() {
        guard !isInternallyUpdating else { return }
        self.isRouteActive = false
        self.activeJourney = nil
        self.isShowingRouteSheet = false
        updateRouteState()
    }

    // MARK: - Route Computation

    /// Met à jour les libellés, icônes et métriques de la pilule flottante
    public func updateRouteState() {
        guard isRouteActive, let journey = activeJourney else {
            self.nextStopName = ""
            self.destinationName = ""
            self.remainingMinutes = 0
            self.arrivalTimeFormatted = "--:--"
            self.currentLineDisplay = nil
            self.isWalking = false
            self.currentInstruction = ""
            self.progress = 0.0
            return
        }

        let nav = NavigationManager.shared
        self.progress = nav.progress
        self.currentInstruction = nav.currentInstruction

        // 1. Nom de destination
        let dest = journey.sections?.last?.to?.name
            ?? journey.sections?.last?.to?.stop_point?.name
            ?? "Destination"
        self.destinationName = dest

        // 2. Section courante et informations de ligne
        guard let sections = journey.sections, !sections.isEmpty else { return }
        let currentIdx = min(max(0, nav.currentSectionIndex), sections.count - 1)
        let currentSection = sections[currentIdx]

        if currentSection.type == "public_transport", let display = currentSection.display_informations {
            self.currentLineDisplay = display
            self.currentTransportType = display.transportType
            self.isWalking = false
        } else if currentSection.mode == "walking" || currentSection.type == "street_network" {
            self.isWalking = true
            // Recherche de la prochaine ligne de transport en commun pour anticiper le badge
            if let upcomingPT = sections.dropFirst(currentIdx + 1).first(where: { $0.type == "public_transport" }),
               let display = upcomingPT.display_informations {
                self.currentLineDisplay = display
                self.currentTransportType = display.transportType
            } else {
                self.currentLineDisplay = nil
            }
        } else {
            self.isWalking = false
        }

        // 3. Prochain arrêt selon l'état du manager
        switch nav.state {
        case .walkingToStation(let targetStation, _):
            self.nextStopName = targetStation.name ?? targetStation.stop_point?.name ?? "Station"
        case .waitingAtStation(let station, _):
            self.nextStopName = station.name ?? station.stop_point?.name ?? "À quai"
        case .onBoard(let section):
            if let stopTimes = section.stop_date_times, nav.currentLegIndex + 1 < stopTimes.count {
                self.nextStopName = stopTimes[nav.currentLegIndex + 1].stop_point.name ?? "Prochaine station"
            } else if let toPlace = section.to {
                self.nextStopName = toPlace.name ?? toPlace.stop_point?.name ?? "Terminus"
            } else {
                self.nextStopName = "En trajet"
            }
        case .walkingToDestination(let destination):
            self.nextStopName = destination.name ?? destination.stop_point?.name ?? dest
        case .idle:
            if let toPlace = currentSection.to {
                self.nextStopName = toPlace.name ?? toPlace.stop_point?.name ?? dest
            }
        }

        // 4. Calcul du temps restant et heure d'arrivée
        if let arrivalStr = journey.arrival_date_time,
           let arrivalDate = DateFormat.navitia.date(from: arrivalStr) {
            let adjusted = arrivalDate.addingTimeInterval(nav.adjustedTimetableDelay)
            let diff = Int(ceil(adjusted.timeIntervalSinceNow / 60.0))
            if diff > 0 && diff < 360 {
                self.remainingMinutes = diff
            } else {
                self.remainingMinutes = max(1, (journey.duration ?? 60) / 60)
            }
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            self.arrivalTimeFormatted = formatter.string(from: adjusted)
        } else {
            self.remainingMinutes = max(1, (journey.duration ?? 60) / 60)
            self.arrivalTimeFormatted = "--:--"
        }
    }

    // MARK: - Pill Text Formatters

    /// Titre principal pour la mini-pilule
    var pillHeadline: String {
        if isWalking {
            if !nextStopName.isEmpty {
                return "Vers \(nextStopName)"
            }
            return "Marche à pied"
        }
        if !nextStopName.isEmpty {
            return "Prochain arrêt : \(nextStopName)"
        }
        if let line = currentLineDisplay {
            return "Ligne \(line.code ?? line.label ?? "")"
        }
        return "Itinéraire en cours"
    }

    /// Sous-titre pour la mini-pilule (temps restant + arrivée)
    var pillSubheadline: String {
        if remainingMinutes > 0 {
            if arrivalTimeFormatted != "--:--" {
                return "\(remainingMinutes) min restantes · Arrivée \(arrivalTimeFormatted)"
            }
            return "\(remainingMinutes) min restantes"
        }
        return "Arrivée imminente"
    }
}
