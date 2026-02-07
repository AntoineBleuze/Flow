import SwiftUI
import Combine

class NavigationCoordinator: ObservableObject {
    @Published var selectedTab: String = "Explore"
    
    func switchToExplore() {
        selectedTab = "Explore"
    }
    
    func startNavigation(journey: Journey) {
        // 1. Switch to Explore tab (where the map is)
        selectedTab = "Explore"
        
        // 2. Trigger navigation start in NavigationManager
        NavigationManager.shared.startNavigation(journey: journey)
    }
}
