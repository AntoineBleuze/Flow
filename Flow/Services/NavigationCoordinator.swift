import SwiftUI
import Combine
import MapKit

class NavigationCoordinator: ObservableObject {
    static let shared = NavigationCoordinator()
    
    @Published var selectedTab: String = "Explore"
    @Published var userTrackingMode: MKUserTrackingMode = .none
    @Published var selectedStation: MapStation?
    @Published var recenterTrigger: Bool = false
    @Published var previewJourney: Journey? = nil
    @Published var isAIPreviewActive: Bool = false
    @Published var showAIAssistant: Bool = false
    
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
        // 1. Switch to Explore tab (where the map is)
        selectedTab = "Explore"
        
        // 2. Dismiss any active sheet/panel on the map
        selectedStation = nil
        previewJourney = nil
        isAIPreviewActive = false
        
        // 3. Trigger navigation start in NavigationManager
        NavigationManager.shared.startNavigation(journey: journey)
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
