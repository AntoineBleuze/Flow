import SwiftUI

// MARK: - Flow Theme & Design Tokens

public enum FlowTheme {
    /// Rayon d'angle standard pour les surfaces et cartes
    public static let standardCornerRadius: CGFloat = 18.0
    public static let largeCornerRadius: CGFloat = 24.0
    public static let sheetCornerRadius: CGFloat = 28.0
    
    /// Opacité globale du fond en verre de l'écran de gauche en mode double écran / pliable
    public static var duoLeftPaneOpacity: Double = 0.85
    public static var sheetMaterialOpacity: Double = 0.15

    /// Dégradé de secours pour bordure lumineuse si nécessaire
    public static var specularRimLight: LinearGradient {
        LinearGradient(
            colors: [
                Color.white.opacity(0.65),
                Color.white.opacity(0.10)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    public static func specularBorder(for colorScheme: ColorScheme) -> LinearGradient {
        if colorScheme == .dark {
            return LinearGradient(
                colors: [Color.white.opacity(0.24), Color.white.opacity(0.08), Color.white.opacity(0.02)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return LinearGradient(
                colors: [Color.white.opacity(0.85), Color.black.opacity(0.04), Color.black.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
    
    // MARK: - Couleurs Sémantiques & Accessibilité WCAG 2.1 AA
    
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
    
    /// Fond adaptatif pour les conteneurs et les cartes
    public static func cardBackgroundTint(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color.white.opacity(0.04) : Color.white.opacity(0.45)
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

// MARK: - Flow Adaptive Background Modifier

public struct FlowAdaptiveBackgroundModifier: ViewModifier {
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
    /// Fond adaptatif pour les vues principales avec prise en charge du mode double écran
    func flowAdaptiveBackground() -> some View {
        modifier(FlowAdaptiveBackgroundModifier())
    }
    
    /// Rétrocompatibilité : utilise flowAdaptiveBackground()
    func liquidGlassBackground() -> some View {
        flowAdaptiveBackground()
    }
}
