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
        colorScheme == .dark ? Color.white.opacity(0.04) : Color.white.opacity(0.18)
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

// MARK: - Dynamic Auto-Opacifying Sheet Background

/// Fond de sheet adaptatif en .ultraThinMaterial qui s'opacifie automatiquement
/// à mesure que la sheet est étendue (du mode compact vers medium / large).
public struct LiquidGlassDynamicSheetBackground: View {
    public var minOpacity: Double
    public var maxOpacity: Double
    @Environment(\.colorScheme) private var colorScheme
    
    public init(minOpacity: Double = 0.28, maxOpacity: Double = 0.96) {
        self.minOpacity = minOpacity
        self.maxOpacity = maxOpacity
    }
    
    public var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            // Hauteur compacte standard (~160-200 pt) -> minOpacity
            // Hauteur étendue / plein écran (~700-850 pt) -> maxOpacity
            let minH: CGFloat = 160.0
            let maxH: CGFloat = 720.0
            let progress = min(1.0, max(0.0, (height - minH) / (maxH - minH)))
            let currentOpacity = minOpacity + progress * (maxOpacity - minOpacity)
            
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(currentOpacity)
                
                // Teinte subtile spéculaire de verre qui s'intensifie avec l'élévation
                if colorScheme == .dark {
                    Color.white.opacity(0.01 + progress * 0.04)
                } else {
                    Color.white.opacity(0.08 + progress * 0.16)
                }
            }
            .animation(.interactiveSpring(response: 0.25, dampingFraction: 0.85), value: currentOpacity)
            .ignoresSafeArea()
        }
    }
}

public struct LiquidGlassSheetModifier: ViewModifier {
    let cornerRadius: CGFloat
    let dynamicOpacity: Bool
    let customOpacity: Double?
    
    public init(
        cornerRadius: CGFloat = LiquidGlassTheme.sheetCornerRadius,
        dynamicOpacity: Bool = true,
        customOpacity: Double? = nil
    ) {
        self.cornerRadius = cornerRadius
        self.dynamicOpacity = dynamicOpacity
        self.customOpacity = customOpacity
    }
    
    public func body(content: Content) -> some View {
        content
            .presentationBackground {
                if let custom = customOpacity {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .opacity(custom)
                        .ignoresSafeArea()
                } else if dynamicOpacity {
                    LiquidGlassDynamicSheetBackground()
                } else {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .opacity(LiquidGlassTheme.sheetMaterialOpacity)
                        .ignoresSafeArea()
                }
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
                TransparentHostingView()
                    .ignoresSafeArea()
            }
            .toolbarBackground(.hidden, for: .navigationBar)
    }
}

// MARK: - Localiser / Find My Style Standard Components

/// Bouton circulaire Liquid Glass inspiré de l'application native Localiser d'Apple (bouton fermer, centrer, info, etc.)
public struct LiquidGlassCircleButton: View {
    public var icon: String
    public var size: CGFloat
    public var iconSize: CGFloat
    public var iconWeight: Font.Weight
    public var foregroundColor: Color?
    public var action: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    public init(
        icon: String,
        size: CGFloat = 36,
        iconSize: CGFloat = 15,
        iconWeight: Font.Weight = .bold,
        foregroundColor: Color? = nil,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.size = size
        self.iconSize = iconSize
        self.iconWeight = iconWeight
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: iconSize, weight: iconWeight))
                .foregroundColor(foregroundColor ?? .primary)
                .frame(width: size, height: size)
                .background(.ultraThinMaterial, in: Circle())
                .overlay(
                    Circle()
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
                )
                .shadow(
                    color: colorScheme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.08),
                    radius: 4,
                    y: 2
                )
        }
        .buttonStyle(.liquidGlassInteractive)
    }
}

/// Conteneur pour listes groupées Liquid Glass (équivalent des sections groupées de l'application Localiser)
public struct LiquidGlassGroupedContainer<Content: View>: View {
    public var cornerRadius: CGFloat
    public let content: Content
    
    @Environment(\.colorScheme) private var colorScheme
    
    public init(
        cornerRadius: CGFloat = LiquidGlassTheme.standardCornerRadius,
        @ViewBuilder content: () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            content
        }
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
                .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(
            color: colorScheme == .dark ? Color.black.opacity(0.30) : Color.black.opacity(0.06),
            radius: colorScheme == .dark ? 8 : 6,
            y: 2
        )
    }
}

/// Barre de recherche Liquid Glass inspirée de Localiser / Find My
public struct LiquidGlassSearchBar: View {
    @Binding public var text: String
    public var placeholder: String
    public var onCommit: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    @FocusState private var isFocused: Bool
    
    public init(
        text: Binding<String>,
        placeholder: String = "Rechercher...",
        onCommit: (() -> Void)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.onCommit = onCommit
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: $text)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(.plain)
                .focused($isFocused)
                .onSubmit {
                    onCommit?()
                }
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background {
            RoundedRectangle(cornerRadius: LiquidGlassTheme.standardCornerRadius, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: LiquidGlassTheme.standardCornerRadius, style: .continuous)
                        .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                )
        }
        .overlay {
            RoundedRectangle(cornerRadius: LiquidGlassTheme.standardCornerRadius, style: .continuous)
                .strokeBorder(
                    LiquidGlassTheme.specularBorder(for: colorScheme),
                    lineWidth: 1.0
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: LiquidGlassTheme.standardCornerRadius, style: .continuous))
        .shadow(
            color: colorScheme == .dark ? Color.black.opacity(0.20) : Color.black.opacity(0.04),
            radius: 6,
            y: 2
        )
    }
}

/// Poignée de redimensionnement de sheet Liquid Glass (Find My style grabber)
public struct LiquidGlassSheetGrabber: View {
    public init() {}
    
    public var body: some View {
        Capsule()
            .fill(Color.secondary.opacity(0.35))
            .frame(width: 36, height: 5)
            .padding(.top, 8)
            .padding(.bottom, 4)
            .accessibilityHidden(true)
    }
}

/// État vide standardisé Liquid Glass (Localiser style)
public struct LiquidGlassEmptyState: View {
    public let icon: String
    public let title: String
    public let subtitle: String
    public var actionTitle: String? = nil
    public var action: (() -> Void)? = nil
    
    @Environment(\.colorScheme) private var colorScheme
    
    public init(
        icon: String,
        title: String,
        subtitle: String,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.actionTitle = actionTitle
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 76, height: 76)
                    .overlay(
                        Circle().strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1)
                    )
                    .shadow(
                        color: colorScheme == .dark ? Color.black.opacity(0.3) : Color.black.opacity(0.06),
                        radius: 8,
                        y: 3
                    )
                
                Image(systemName: icon)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.secondary)
            }
            
            Text(title)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            if let actionTitle = actionTitle, let action = action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .shadow(color: Color.blue.opacity(0.3), radius: 8, y: 3)
                }
                .buttonStyle(.liquidGlassInteractive)
                .padding(.top, 8)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

/// Pastille / badge d'information Liquid Glass
public struct LiquidGlassBadge<Content: View>: View {
    public let content: Content
    @Environment(\.colorScheme) private var colorScheme
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        content
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.ultraThinMaterial, in: Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 0.8)
            )
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
    
    /// Configure une sheet modale avec les guidelines Apple Liquid Glass (ultraThinMaterial avec opacification automatique)
    func liquidGlassSheet(
        cornerRadius: CGFloat = LiquidGlassTheme.sheetCornerRadius,
        dynamicOpacity: Bool = true,
        opacity: Double? = nil
    ) -> some View {
        modifier(LiquidGlassSheetModifier(cornerRadius: cornerRadius, dynamicOpacity: dynamicOpacity, customOpacity: opacity))
    }
    
    /// Fond ultraThinMaterial pour sheet modale avec opacité dynamique automatique ou personnalisée
    func liquidGlassSheetBackground(
        dynamicOpacity: Bool = true,
        opacity: Double? = nil
    ) -> some View {
        self.presentationBackground {
            if let opacity = opacity {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(opacity)
                    .ignoresSafeArea()
            } else if dynamicOpacity {
                LiquidGlassDynamicSheetBackground()
            } else {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(LiquidGlassTheme.sheetMaterialOpacity)
                    .ignoresSafeArea()
            }
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
    
    /// Enrobe le contenu dans une capsule en verre Liquid Glass avec bordure spéculaire
    func liquidGlassCapsule() -> some View {
        self
            .background(.ultraThinMaterial, in: Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(
                        LinearGradient(
                            colors: [Color.white.opacity(0.35), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.0
                    )
            )
    }
    
    /// Enrobe le contenu dans un cercle en verre Liquid Glass avec bordure spéculaire
    func liquidGlassCircle() -> some View {
        self
            .background(.ultraThinMaterial, in: Circle())
            .overlay(
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [Color.white.opacity(0.35), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.0
                    )
            )
    }
}

