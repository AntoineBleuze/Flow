import SwiftUI
import Combine
import MapKit

class NavigationCoordinator: ObservableObject {
    static let shared = NavigationCoordinator()

    /// Palier minimal de la feuille modale couplée à la Tab Bar flottante (Style Localiser iOS 26)
    static let collapsedSheetDetent: PresentationDetent = .height(84)

    @Published var selectedTab: String = "Explore"
    @Published var exploreSheetDetent: PresentationDetent = .medium
    @Published var isSheetMergedWithTabBar: Bool = false
    @Published var sheetExpandProgress: CGFloat = 1.0
    @Published var userTrackingMode: MKUserTrackingMode = .none
    @Published var selectedStation: MapStation?
    @Published var recenterTrigger: Bool = false
    @Published var previewJourney: Journey? = nil
    @Published var isAIPreviewActive: Bool = false
    @Published var showAIAssistant: Bool = false
    @Published var aiSheetDetent: PresentationDetent = .large
    @Published var focusedSectionId: String? = nil
    
    func recenterMap() {
        switch userTrackingMode {
        case .none:
            userTrackingMode = .follow
        case .follow:
            userTrackingMode = .followWithHeading
        case .followWithHeading:
            userTrackingMode = .none
        @unknown default:
            userTrackingMode = .follow
        }
        recenterTrigger.toggle()
    }
    
    func switchToExplore() {
        selectedTab = "Explore"
    }
    
    /// Affiche un aperçu exclusif d'itinéraire sur la carte Explore (masque les autres lignes)
    func showItineraryPreview(journey: Journey) {
        selectedTab = "Explore"
        selectedStation = nil
        if exploreSheetDetent == Self.collapsedSheetDetent {
            exploreSheetDetent = .medium
        }
        previewJourney = journey
        isAIPreviewActive = true
    }
    
    /// Réinitialise l'aperçu et restaure l'affichage normal de toutes les lignes
    func clearItineraryPreview() {
        withAnimation(.easeInOut(duration: 0.3)) {
            previewJourney = nil
            isAIPreviewActive = false
        }
    }
    
    /// Démarre la navigation en temps réel depuis l'aperçu actuel
    func startNavigationFromPreview() {
        guard let journey = previewJourney else { return }
        clearItineraryPreview()
        startNavigation(journey: journey)
    }
    
    func startNavigation(journey: Journey) {
        // 1. Fermer l'assistant IA si ouvert et basculer sur l'onglet Explore
        showAIAssistant = false
        selectedTab = "Explore"
        exploreSheetDetent = .medium
        
        // 2. Réinitialiser les panneaux d'aperçu
        selectedStation = nil
        previewJourney = nil
        isAIPreviewActive = false
        
        // 3. Démarrer la navigation via RouteNavigationManager (synchronise NavigationManager + ImmersiveNavigationView)
        RouteNavigationManager.shared.startRoute(journey: journey)
    }
    
    var userTrackingModeImageName: String {
        switch userTrackingMode {
        case .none: return "location"
        case .follow: return "location.fill"
        case .followWithHeading: return "location.north.line.fill"
        @unknown default: return "location"
        }
    }

    func cycleUserTrackingMode() {
        switch userTrackingMode {
        case .none:
            userTrackingMode = .follow
        case .follow:
            userTrackingMode = .followWithHeading
        case .followWithHeading:
            userTrackingMode = .follow
        @unknown default:
            userTrackingMode = .follow
        }
    }
}
