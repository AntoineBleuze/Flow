import SwiftUI
import Combine
import MapKit

class NavigationCoordinator: ObservableObject {
    @Published var selectedTab: String = "Explore"
    @Published var userTrackingMode: MKUserTrackingMode = .none
    @Published var selectedStation: MapStation?
    @Published var recenterTrigger: Bool = false
    
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
    
    func startNavigation(journey: Journey) {
        // 1. Switch to Explore tab (where the map is)
        selectedTab = "Explore"
        
        // 2. Dismiss any active sheet/panel on the map
        selectedStation = nil
        
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
