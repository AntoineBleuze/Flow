import SwiftUI

// MARK: - iPhone Duo Posture & Architecture Framework

/// Posture et état d'affichage pour l'iPhone Duo (appareil pliable / double écran)
public enum DuoDevicePosture: Equatable {
    case foldedSingleScreen
    case unfoldedDualScreen
    
    public var isDualScreen: Bool {
        self == .unfoldedDualScreen
    }
    
    public var isFolded: Bool {
        self == .foldedSingleScreen
    }
}

// MARK: - Environment Key pour Duo Posture

private struct DuoPostureKey: EnvironmentKey {
    static let defaultValue: DuoDevicePosture = .foldedSingleScreen
}

public extension EnvironmentValues {
    var duoPosture: DuoDevicePosture {
        get { self[DuoPostureKey.self] }
        set { self[DuoPostureKey.self] = newValue }
    }
}

/// Helper pour détecter l'état et calculer la géométrie spécifique à l'iPhone Duo
public enum DuoLayoutHelper {
    /// Largeur de la gouttière / charnière centrale du double écran (en points)
    public static let hingeWidth: CGFloat = 16.0
    
    /// Largeur minimale conseillée pour le volet gauche (panneau de contrôle / liste)
    public static let primaryPaneMinWidth: CGFloat = 360.0
    public static let primaryPaneIdealWidth: CGFloat = 420.0
    
    /// Calcule la largeur optimale du volet gauche (écran 1)
    public static func primaryPaneWidth(for totalWidth: CGFloat) -> CGFloat {
        if totalWidth <= 1020 {
            // Sur iPhone Duo (largeur ~951 pt déplié), chaque écran occupe exactement
            // la moitié symétrique de l'espace moins la charnière centrale (467.5 pt).
            let halfScreen = (totalWidth - hingeWidth) / 2
            return max(primaryPaneMinWidth, halfScreen)
        } else {
            // Sur grands écrans (iPad Pro, Mac Catalyst)
            return min(primaryPaneIdealWidth, max(primaryPaneMinWidth, totalWidth * 0.38))
        }
    }
    
    /// Détermine la posture selon la taille de l'écran et la classe de taille horizontale.
    /// Gère fidèlement l'iPhone Duo (plié: 466x678, déplié: 951x669).
    public static func posture(
        horizontalSizeClass: UserInterfaceSizeClass?,
        screenSize: CGSize
    ) -> DuoDevicePosture {
        let minDimension = min(screenSize.width, screenSize.height)
        let maxDimension = max(screenSize.width, screenSize.height)
        
        // Un appareil double écran / pliable déplié possède un écran étendu :
        // la plus petite dimension dépasse 550 pt et la plus grande dépasse 750 pt.
        let isDualScreenGeometry = minDimension >= 550 && maxDimension >= 750
        
        if isDualScreenGeometry && screenSize.width >= 650 {
            return .unfoldedDualScreen
        } else if horizontalSizeClass == .regular && screenSize.width >= 650 && screenSize.height >= 550 {
            return .unfoldedDualScreen
        } else {
            return .foldedSingleScreen
        }
    }
}

// MARK: - DuoSplitView (Conteneur Double Écran Adaptatif)

/// Conteneur 2 volets intelligent conçu pour l'iPhone Duo, iPad et grands écrans.
/// - En mode Déplié / Duo : Affiche le panneau de contrôle à gauche et la carte / vue immersive à droite,
///   séparés par une transition en dégradé Liquid Glass fluide et progressive vers la carte.
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
                    .environment(\.duoPosture, .unfoldedDualScreen)
            } else {
                leadingContent
                    .environment(\.duoPosture, .foldedSingleScreen)
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func unfoldedDualLayout(in size: CGSize) -> some View {
        let paneWidth = DuoLayoutHelper.primaryPaneWidth(for: size.width)
        
        ZStack(alignment: .leading) {
            // 1. CARTE EN ARRIÈRE-PLAN PLEINE LARGEUR
            // S'étend sur l'ensemble des deux écrans pour faire transparaître ses couleurs sous l'ultraThinMaterial
            trailingContent
                .frame(width: size.width, height: size.height)
                .clipped()

            // 2. FOND EN DÉGRADÉ LIQUID GLASS (TRANSITION PROGRESSIVE VERS LA CARTE)
            // Remplace la coupure linéaire abrupte par un dégradé doux et continu de flou et de lumière
            glassGradientBackground(paneWidth: paneWidth, size: size)

            // 3. CONTENU INTERACTIF DES DEUX ÉCRANS
            HStack(spacing: 0) {
                // Volet 1 (Écran Gauche de l'iPhone Duo)
                leadingContent
                    .frame(width: paneWidth, height: size.height)
                
                // Espace correspondant à la charnière centrale
                Color.clear
                    .frame(width: DuoLayoutHelper.hingeWidth, height: size.height)
                    .allowsHitTesting(false)
                
                // Volet 2 (Écran Droit) : transparent pour transmettre toutes les interactions tactiles à la carte
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .allowsHitTesting(false)
            }
        }
        .ignoresSafeArea()
    }

    /// Fond en verre dégradé offrant une transition progressive et fluide entre le volet gauche et la carte
    @ViewBuilder
    private func glassGradientBackground(paneWidth: CGFloat, size: CGSize) -> some View {
        let fadeStart = max(0, paneWidth - 30.0)
        let fadeEnd = min(size.width, paneWidth + DuoLayoutHelper.hingeWidth + 50.0)
        let backgroundWidth = fadeEnd
        let startLocation = backgroundWidth > 0 ? (fadeStart / backgroundWidth) : 0
        
        ZStack(alignment: .leading) {
            // Couche principale en matériau translucide ultra-fin
            Rectangle()
                .fill(.ultraThinMaterial)
            
            // Teinte adaptative Liquid Glass
            Rectangle()
                .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
            
            // Halo spéculaire subtil et progressif accompagnant la transition
            LinearGradient(
                stops: [
                    .init(color: .clear, location: 0.0),
                    .init(color: .clear, location: max(0, startLocation - 0.05)),
                    .init(
                        color: Color.white.opacity(colorScheme == .dark ? 0.06 : 0.22),
                        location: (startLocation + 1.0) / 2.0
                    ),
                    .init(color: .clear, location: 1.0)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        .opacity(LiquidGlassTheme.duoLeftPaneOpacity)
        .frame(width: backgroundWidth, height: size.height)
        .mask {
            LinearGradient(
                stops: [
                    .init(color: .black, location: 0.0),
                    .init(color: .black, location: startLocation),
                    .init(color: .clear, location: 1.0)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        .allowsHitTesting(false)
    }
}
