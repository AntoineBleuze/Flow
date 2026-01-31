import SwiftUI
import Combine

class NavigationCoordinator: ObservableObject {
    @Published var selectedTab: String = "Explore"
    
    func switchToExplore() {
        selectedTab = "Explore"
    }
}
