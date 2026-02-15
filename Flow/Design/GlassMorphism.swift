import SwiftUI

// Extension pour les couleurs et le style
extension Color {
    // Apple Design: Use semantic colors where possible, but for custom branding gradients, keep them soft.
    static let liquidBackground = LinearGradient(
        colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

// MARK: - Old Modifiers (Deprecated but kept for compatibility if needed)
// Ideally verify usage and migrate, but for now we focus on the new API used in NearbyStationsView.

struct LiquidGlassStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .background(.regularMaterial) // Adaptive material
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.1), radius: 10, x: 0, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            colors: [
                                .white.opacity(colorScheme == .dark ? 0.2 : 0.5),
                                .white.opacity(colorScheme == .dark ? 0.05 : 0.1)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 0.5
                    )
            )
    }
}

// MARK: - New Glass API

struct Glass {
    enum Style {
        case regular
    }
    
    let style: Style
    var isInteractive: Bool = false
    
    static var standard: Glass {
        Glass(style: .regular)
    }
    
    func interactive() -> Glass {
        var copy = self
        copy.isInteractive = true
        return copy
    }
}

struct DefaultGlassEffectShape: Shape {
    func path(in rect: CGRect) -> Path {
        RoundedRectangle(cornerRadius: 12).path(in: rect)
    }
}

extension View {
    func glassEffect(_ glass: Glass = .standard) -> some View {
        self.glassEffect(glass, in: DefaultGlassEffectShape())
    }
    
    func glassEffect<S: Shape>(_ glass: Glass = .standard, in shape: S) -> some View {
        self.modifier(GlassEffectModifier(config: glass, shape: shape))
    }
}

struct GlassEffectModifier<S: Shape>: ViewModifier {
    let config: Glass
    let shape: S
    @Environment(\.colorScheme) var colorScheme
    @State private var isPressed = false

    func body(content: Content) -> some View {
        content
            .background(
                Material.regular // Adaptive material (blur)
            )
            .clipShape(shape)
            .shadow(
                color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.1),
                radius: 10, x: 0, y: 5
            )
            .overlay(
                shape
                    .stroke(
                        LinearGradient(
                            colors: [
                                .white.opacity(colorScheme == .dark ? 0.2 : 0.6),
                                .white.opacity(colorScheme == .dark ? 0.05 : 0.1)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 0.5
                    )
            )
            // Interactive glow effect when pressed
            .overlay(
                Group {
                    if config.isInteractive && isPressed {
                        shape
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.4),
                                        Color.white.opacity(0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .allowsHitTesting(false)
                    }
                }
            )
            .scaleEffect(config.isInteractive && isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isPressed)
            .contentShape(shape) // Ensure hit testing follows the shape
            .simultaneousGesture(
                config.isInteractive ?
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        if !isPressed { isPressed = true }
                    }
                    .onEnded { _ in
                        isPressed = false
                    }
                : nil
            )
    }
}

