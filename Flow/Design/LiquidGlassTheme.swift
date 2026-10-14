import SwiftUI

// MARK: - Liquid Glass Theme & Design Tokens

public enum LiquidGlassTheme {
    /// Rayon d'angle standard pour les surfaces et cartes Liquid Glass
    public static let standardCornerRadius: CGFloat = 18.0
    public static let largeCornerRadius: CGFloat = 24.0
    public static let sheetCornerRadius: CGFloat = 28.0
    
    // MARK: - Contrôle Rapide d'Opacité des Surfaces
    /// Opacité globale du fond .ultraThinMaterial pour toutes les sheets modales (0.0 = transparent, 1.0 = opaque standard)
    /// 👉 Modifiez cette valeur ici pour ajuster instantanément la transparence de toutes les sheets du projet.
    public static var sheetMaterialOpacity: Double = 0.15
    
    /// Opacité globale du fond en verre de l'écran de gauche en mode double écran / pliable (0.0 = totalement transparent, 1.0 = opaque standard)
    /// 👉 Modifiez cette valeur ici pour ajuster instantanément la transparence du volet gauche.
    public static var duoLeftPaneOpacity: Double = 0.85
    
    /// Couleur verte dynamique pour les horaires de départs en direct
    public static func liveGreen(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(hex: "30D158") : Color(hex: "008543")
    }
    
    /// Couleur adaptative pour le statut 'Travaux' respectant les critères WCAG 2.1 AA
    /// En mode clair, un ambre foncé (#B25E00) offre un ratio > 5:1 sur fond clair.
    /// En mode sombre, un jaune d'alerte vif (#FFD60A) offre un ratio > 12:1.
    public static func statusWorksColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(hex: "FFD60A") : Color(hex: "B25E00")
    }
    
    /// Couleur adaptative pour les métriques de marche et d'alerte
    public static func warningMetricColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(hex: "FFD60A") : Color(hex: "B25E00")
    }
    
    /// Calcule une couleur de texte accessible (noir ou blanc) en fonction de la luminance du fond hexadécimal
    public static func contrastHexColor(forHex hex: String) -> String {
        let clean = hex.replacingOccurrences(of: "#", with: "").uppercased()
        guard clean.count >= 6, let intVal = UInt64(clean.prefix(6), radix: 16) else {
            return "FFFFFF"
        }
        let r = Double((intVal >> 16) & 0xFF) / 255.0
        let g = Double((intVal >> 8) & 0xFF) / 255.0
        let b = Double(intVal & 0xFF) / 255.0
        let luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return luminance > 0.48 ? "000000" : "FFFFFF"
    }
    
    /// Calcule une couleur de texte SwiftUI accessible (noir ou blanc) pour une Color
    public static func contrastTextColor(forColor color: Color) -> Color {
        #if canImport(UIKit)
        let uiColor = UIColor(color)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) {
            let luminance = 0.2126 * Double(r) + 0.7152 * Double(g) + 0.0722 * Double(b)
            return luminance > 0.48 ? .black : .white
        }
        #endif
        return .white
    }
    
    /// Couleur de bordure spéculaire (reflet de lumière sur le verre)
    public static func specularBorder(for colorScheme: ColorScheme) -> LinearGradient {
        if colorScheme == .dark {
            return LinearGradient(
                colors: [
                    Color.white.opacity(0.24),
                    Color.white.opacity(0.08),
                    Color.white.opacity(0.02)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return LinearGradient(
                colors: [
                    Color.white.opacity(0.85),
                    Color.black.opacity(0.04),
                    Color.black.opacity(0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
    
    /// Fond adaptatif pour les conteneurs et les cartes
    public static func cardBackgroundTint(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color.white.opacity(0.04) : Color.white.opacity(0.45)
    }
}

// MARK: - Interactive Touch Reaction Button Styles (Réaction Tactile & Haptique)

/// Style de bouton réagissant instantanément au toucher avec ressort dynamique, variation d'échelle et retour haptique
public struct LiquidGlassInteractiveButtonStyle: ButtonStyle {
    public var scale: CGFloat
    public var pressedOpacity: CGFloat
    
    public init(scale: CGFloat = 0.94, pressedOpacity: CGFloat = 0.85) {
        self.scale = scale
        self.pressedOpacity = pressedOpacity
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1.0)
            .opacity(configuration.isPressed ? pressedOpacity : 1.0)
            .animation(.spring(response: 0.24, dampingFraction: 0.65), value: configuration.isPressed)
            .sensoryFeedback(.impact(weight: .light), trigger: configuration.isPressed)
    }
}

/// Style de bouton capsule / pastille Liquid Glass interactive
public struct LiquidGlassPillButtonStyle: ButtonStyle {
    public var backgroundColor: Color?
    @Environment(\.colorScheme) private var colorScheme
    
    public init(backgroundColor: Color? = nil) {
        self.backgroundColor = backgroundColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background {
                if let bg = backgroundColor {
                    Capsule().fill(bg)
                } else {
                    Capsule()
                        .fill(.ultraThinMaterial)
                        .overlay(
                            Capsule().strokeBorder(
                                LiquidGlassTheme.specularBorder(for: colorScheme),
                                lineWidth: 1.0
                            )
                        )
                }
            }
            .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .shadow(
                color: Color.black.opacity(configuration.isPressed ? 0.05 : (colorScheme == .dark ? 0.25 : 0.08)),
                radius: configuration.isPressed ? 2 : 6,
                y: configuration.isPressed ? 1 : 3
            )
            .animation(.spring(response: 0.22, dampingFraction: 0.65), value: configuration.isPressed)
            .sensoryFeedback(.impact(weight: .medium), trigger: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == LiquidGlassInteractiveButtonStyle {
    static var liquidGlassInteractive: LiquidGlassInteractiveButtonStyle {
        LiquidGlassInteractiveButtonStyle()
    }
    
    static func liquidGlassInteractive(scale: CGFloat) -> LiquidGlassInteractiveButtonStyle {
        LiquidGlassInteractiveButtonStyle(scale: scale)
    }
}

public extension ButtonStyle where Self == LiquidGlassPillButtonStyle {
    static var liquidGlassPill: LiquidGlassPillButtonStyle {
        LiquidGlassPillButtonStyle()
    }
    
    static func liquidGlassPill(backgroundColor: Color) -> LiquidGlassPillButtonStyle {
        LiquidGlassPillButtonStyle(backgroundColor: backgroundColor)
    }
}

// MARK: - Liquid Glass Card Container

public struct LiquidGlassCard<Content: View>: View {
    let cornerRadius: CGFloat
    let padding: CGFloat
    let interactive: Bool
    let content: Content
    
    @Environment(\.colorScheme) private var colorScheme
    
    public init(
        cornerRadius: CGFloat = LiquidGlassTheme.standardCornerRadius,
        padding: CGFloat = 14,
        interactive: Bool = false,
        @ViewBuilder content: () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.interactive = interactive
        self.content = content()
    }
    
    public var body: some View {
        content
            .padding(padding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                    )
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        LiquidGlassTheme.specularBorder(for: colorScheme),
                        lineWidth: 1.0
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(
                color: colorScheme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.06),
                radius: colorScheme == .dark ? 10 : 8,
                x: 0,
                y: colorScheme == .dark ? 4 : 3
            )
    }
}

// MARK: - Modifiers

public struct LiquidGlassCardModifier: ViewModifier {
    let cornerRadius: CGFloat
    let padding: CGFloat
    let interactive: Bool
    
    @Environment(\.colorScheme) private var colorScheme
    
    public func body(content: Content) -> some View {
        content
            .padding(padding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                    )
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        LiquidGlassTheme.specularBorder(for: colorScheme),
                        lineWidth: 1.0
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(
                color: colorScheme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.06),
                radius: colorScheme == .dark ? 10 : 8,
                x: 0,
                y: colorScheme == .dark ? 4 : 3
            )
    }
}

public struct LiquidGlassSheetModifier: ViewModifier {
    let cornerRadius: CGFloat
    let customOpacity: Double?
    
    public init(cornerRadius: CGFloat = LiquidGlassTheme.sheetCornerRadius, customOpacity: Double? = nil) {
        self.cornerRadius = cornerRadius
        self.customOpacity = customOpacity
    }
    
    public func body(content: Content) -> some View {
        content
            .presentationBackground {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(customOpacity ?? LiquidGlassTheme.sheetMaterialOpacity)
            }
            .presentationCornerRadius(cornerRadius)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
    }
}

// MARK: - Transparent Navigation & Container Helper

#if canImport(UIKit)
import UIKit

/// Contrôleur invisible pour effacer les fonds opaques des conteneurs UIKit (NavigationStack / UINavigationController / UIHostingController)
public struct TransparentHostingView: UIViewControllerRepresentable {
    public init() {}

    public func makeUIViewController(context: Context) -> TransparentController {
        TransparentController()
    }

    public func updateUIViewController(_ uiViewController: TransparentController, context: Context) {
        uiViewController.applyTransparency()
    }

    public class TransparentController: UIViewController {
        public override func viewDidLoad() {
            super.viewDidLoad()
            applyTransparency()
        }

        public override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            applyTransparency()
        }

        public override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            applyTransparency()
        }

        public override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            applyTransparency()
        }

        public func applyTransparency() {
            view.backgroundColor = .clear

            var currentView: UIView? = view
            while let sv = currentView?.superview {
                sv.backgroundColor = .clear
                currentView = sv
            }

            var currentVC: UIViewController? = self
            while let parent = currentVC?.parent {
                parent.view.backgroundColor = .clear
                if let nav = parent as? UINavigationController {
                    clearNavController(nav)
                }
                currentVC = parent
            }

            if let nav = navigationController {
                clearNavController(nav)
            }
        }

        private func clearNavController(_ nav: UINavigationController) {
            nav.view.backgroundColor = .clear
            for subview in nav.view.subviews {
                subview.backgroundColor = .clear
            }
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear
            appearance.shadowColor = .clear
            nav.navigationBar.standardAppearance = appearance
            nav.navigationBar.scrollEdgeAppearance = appearance
            nav.navigationBar.compactAppearance = appearance
        }
    }
}
#else
public struct TransparentHostingView: View {
    public init() {}
    public var body: some View {
        Color.clear
    }
}
#endif

public struct LiquidGlassBackgroundModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.duoPosture) private var duoPosture
    
    public func body(content: Content) -> some View {
        content
            .background {
                if duoPosture == .unfoldedDualScreen {
                    TransparentHostingView()
                        .ignoresSafeArea()
                } else {
                    ZStack {
                        if colorScheme == .dark {
                            Color.black.ignoresSafeArea()
                        } else {
                            Color(uiColor: .systemGroupedBackground).ignoresSafeArea()
                        }
                        
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .opacity(colorScheme == .dark ? 0.35 : 0.85)
                            .ignoresSafeArea()
                    }
                }
            }
            .toolbarBackground(duoPosture == .unfoldedDualScreen ? .hidden : .visible, for: .navigationBar)
    }
}

// MARK: - View Extensions

public extension View {
    /// Applique le style carte Liquid Glass avec fond ultraThinMaterial et reflet spéculaire
    func liquidGlassCard(
        cornerRadius: CGFloat = LiquidGlassTheme.standardCornerRadius,
        padding: CGFloat = 14,
        interactive: Bool = false
    ) -> some View {
        modifier(LiquidGlassCardModifier(cornerRadius: cornerRadius, padding: padding, interactive: interactive))
    }
    
    /// Configure une sheet modale avec les guidelines Apple Liquid Glass (ultraThinMaterial et interaction)
    func liquidGlassSheet(
        cornerRadius: CGFloat = LiquidGlassTheme.sheetCornerRadius,
        opacity: Double? = nil
    ) -> some View {
        modifier(LiquidGlassSheetModifier(cornerRadius: cornerRadius, customOpacity: opacity))
    }
    
    /// Fond ultraThinMaterial pour sheet modale avec opacité configurable
    func liquidGlassSheetBackground(opacity: Double = LiquidGlassTheme.sheetMaterialOpacity) -> some View {
        self.presentationBackground {
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(opacity)
        }
    }
    
    /// Fond adaptatif haute lisibilité pour les vues principales
    func liquidGlassBackground() -> some View {
        modifier(LiquidGlassBackgroundModifier())
    }
    
    /// Fait réagir instantanément tous les boutons de cette vue au toucher (rebond spring, échelle et haptique)
    func interactiveTouchReaction(scale: CGFloat = 0.94) -> some View {
        self.buttonStyle(LiquidGlassInteractiveButtonStyle(scale: scale))
    }
}
