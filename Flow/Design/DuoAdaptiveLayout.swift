import SwiftUI

// MARK: - iPhone Duo Posture & Architecture Framework

/// Posture et état d'affichage pour l'iPhone Duo (appareil pliable / double écran)
public enum DuoDevicePosture: Equatable {
    case foldedSingleScreen
    case unfoldedDualScreen
    
    public var isDualScreen: Bool {
        self == .unfoldedDualScreen
    }
}

/// Helper pour détecter l'état et calculer la géométrie spécifique à l'iPhone Duo
public enum DuoLayoutHelper {
    /// Largeur de la gouttière / charnière centrale du double écran (en points)
    public static let hingeWidth: CGFloat = 16.0
    
    /// Largeur minimale conseillée pour le volet gauche (panneau de contrôle / liste)
    public static let primaryPaneMinWidth: CGFloat = 360.0
    public static let primaryPaneIdealWidth: CGFloat = 420.0
    
    /// Détermine la posture selon la taille de l'écran et la classe de taille horizontale
    public static func posture(
        horizontalSizeClass: UserInterfaceSizeClass?,
        screenSize: CGSize
    ) -> DuoDevicePosture {
        // En mode iPad ou iPhone Duo déplié (horizontalSizeClass .regular ou ratio d'écran large > 1.05)
        let isWideCanvas = screenSize.width / max(1, screenSize.height) > 1.05
        if horizontalSizeClass == .regular || (screenSize.width > 600 && isWideCanvas) {
            return .unfoldedDualScreen
        } else {
            return .foldedSingleScreen
        }
    }
}

// MARK: - DuoSplitView (Conteneur Double Écran Adaptatif)

/// Conteneur 2 volets intelligent conçu pour l'iPhone Duo, iPad et grands écrans.
/// - En mode Déplié / Duo : Affiche le panneau de contrôle à gauche et la carte / vue immersive à droite,
///   séparés par un élégant séparateur Liquid Glass aligné sur la charnière centrale.
/// - En mode Plié / Compact : Affiche le contenu principal avec support fluide des sheets.
public struct DuoSplitView<LeadingContent: View, TrailingContent: View>: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let leadingContent: LeadingContent
    private let trailingContent: TrailingContent
    
    public init(
        @ViewBuilder leading: () -> LeadingContent,
        @ViewBuilder trailing: () -> TrailingContent
    ) {
        self.leadingContent = leading()
        self.trailingContent = trailing()
    }
    
    public var body: some View {
        GeometryReader { proxy in
            let posture = DuoLayoutHelper.posture(
                horizontalSizeClass: horizontalSizeClass,
                screenSize: proxy.size
            )
            
            if posture == .unfoldedDualScreen {
                unfoldedDualLayout(in: proxy.size)
            } else {
                leadingContent
            }
        }
    }
    
    @ViewBuilder
    private func unfoldedDualLayout(in size: CGSize) -> some View {
        HStack(spacing: 0) {
            // Volet 1 (Écran Gauche de l'iPhone Duo)
            let paneWidth = max(
                DuoLayoutHelper.primaryPaneMinWidth,
                min(size.width * 0.40, DuoLayoutHelper.primaryPaneIdealWidth)
            )
            
            ZStack {
                leadingContent
            }
            .frame(width: paneWidth)
            .background(.ultraThinMaterial)
            
            // Séparateur Liquid Glass pour la charnière centrale (Hinge Gutter)
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(width: DuoLayoutHelper.hingeWidth)
                
                // Fine ligne spéculaire centrale simulant le pli de verre
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(colorScheme == .dark ? 0.25 : 0.6),
                                Color.white.opacity(0.05),
                                Color.black.opacity(colorScheme == .dark ? 0.3 : 0.08)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 1.5)
            }
            .allowsHitTesting(false)
            
            // Volet 2 (Écran Droit de l'iPhone Duo - Carte / Détail)
            ZStack {
                trailingContent
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - View Extension pour Duo Hinge Padding

public extension View {
    /// Ajoute une marge de sécurité pour préserver le contenu du pli central sur iPhone Duo
    func duoHingePadding(edges: Edge.Set = .horizontal) -> some View {
        self.padding(edges, DuoLayoutHelper.hingeWidth / 2)
    }
}
