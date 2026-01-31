import SwiftUI

// Extension pour les couleurs et le style
extension Color {
    static let liquidBackground = LinearGradient(
        colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct LiquidGlassStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .environment(\.colorScheme, .dark) // Force dark mode for better glass effect
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            colors: [.white.opacity(0.4), .white.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 0.5
                    )
            )
    }
}

struct FloatingDockStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 5)
            .overlay(
                Capsule()
                    .stroke(
                        LinearGradient(
                            colors: [.white.opacity(0.5), .white.opacity(0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 0.5
                    )
            )
    }
}


// MARK: - New Glass API

enum Glass {
    case regular
}

struct DefaultGlassEffectShape: Shape {
    func path(in rect: CGRect) -> Path {
        RoundedRectangle(cornerRadius: 20).path(in: rect)
    }
}

extension View {
    func glassEffect(_ glass: Glass = .regular) -> some View {
        self.glassEffect(glass, in: DefaultGlassEffectShape())
    }
    
    func glassEffect<S: Shape>(_ glass: Glass = .regular, in shape: S) -> some View {
        self
            .background(.clear)
            .clipShape(shape)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            .overlay(
                shape
                    .stroke(
                        LinearGradient(
                            colors: [.white.opacity(0.4), .white.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 0.5
                    )
            )
    }
}
