import SwiftUI

// MARK: - Liquid Glass Theme & Design Tokens

public enum LiquidGlassTheme {
    /// Rayon d'angle standard pour les surfaces et cartes Liquid Glass
    public static let standardCornerRadius: CGFloat = 18.0
    public static let largeCornerRadius: CGFloat = 24.0
    public static let sheetCornerRadius: CGFloat = 28.0
    
    /// Couleur verte dynamique pour les horaires de départs en direct
    public static func liveGreen(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(hex: "30D158") : Color(hex: "008543")
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
    
    public func body(content: Content) -> some View {
        content
            .presentationBackground(.ultraThinMaterial)
            .presentationCornerRadius(cornerRadius)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
    }
}

public struct LiquidGlassBackgroundModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    
    public func body(content: Content) -> some View {
        content
            .background {
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
    func liquidGlassSheet(cornerRadius: CGFloat = LiquidGlassTheme.sheetCornerRadius) -> some View {
        modifier(LiquidGlassSheetModifier(cornerRadius: cornerRadius))
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
