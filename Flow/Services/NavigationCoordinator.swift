import SwiftUI
import Combine
import MapKit

class NavigationCoordinator: ObservableObject {
    @Published var selectedTab: String = "Explore"
    @Published var userTrackingMode: MKUserTrackingMode = .none
    
    func switchToExplore() {
        selectedTab = "Explore"
    }
    
    func startNavigation(journey: Journey) {
        // 1. Switch to Explore tab (where the map is)
        selectedTab = "Explore"
        
        // 2. Trigger navigation start in NavigationManager
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
