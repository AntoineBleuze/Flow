import SwiftUI

/// Vue de fond adaptative avec carte et overlay semi-transparent
/// S'adapte automatiquement au mode jour/nuit
struct AdaptiveMapBackground: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            // La carte se met automatiquement à jour selon le mode jour/nuit
            MapSnapshotView()

            // Couche de base pour plus d'opacité
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(0.95)
        }
        .ignoresSafeArea()
    }
}

#Preview("Light Mode") {
    AdaptiveMapBackground()
        .environment(\.colorScheme, .light)
}

#Preview("Dark Mode") {
    AdaptiveMapBackground()
        .environment(\.colorScheme, .dark)
}
