import SwiftUI

// MARK: - Liquid Glass Theme Alias

/// Alias vers FlowTheme pour garantir la cohérence des jetons de design
public typealias LiquidGlassTheme = FlowTheme

// MARK: - Interactive Touch Reaction Button Styles

/// Style de bouton réagissant instantanément au toucher avec ressort dynamique et retour haptique
public struct LiquidGlassInteractiveButtonStyle: ButtonStyle {
    public var scale: CGFloat
    public var pressedOpacity: CGFloat
    
    public init(scale: CGFloat = 0.96, pressedOpacity: CGFloat = 0.85) {
        self.scale = scale
        self.pressedOpacity = pressedOpacity
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1.0)
            .opacity(configuration.isPressed ? pressedOpacity : 1.0)
            .animation(.spring(response: 0.22, dampingFraction: 0.7), value: configuration.isPressed)
            .sensoryFeedback(.impact(weight: .light), trigger: configuration.isPressed)
    }
}

/// Style de bouton capsule / pastille Liquid Glass native
public struct LiquidGlassPillButtonStyle: ButtonStyle {
    public var backgroundColor: Color?
    
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
                }
            }
            .glassEffect(.regular.interactive(), in: Capsule())
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.spring(response: 0.22, dampingFraction: 0.7), value: configuration.isPressed)
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

// MARK: - Native Liquid Glass Card Container

public struct LiquidGlassCard<Content: View>: View {
    let cornerRadius: CGFloat
    let padding: CGFloat
    let interactive: Bool
    let content: Content
    
    public init(
        cornerRadius: CGFloat = FlowTheme.standardCornerRadius,
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
            .glassEffect(
                interactive ? .regular.interactive() : .regular,
                in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            )
    }
}

// MARK: - Card ViewModifier

public struct LiquidGlassCardModifier: ViewModifier {
    let cornerRadius: CGFloat
    let padding: CGFloat
    let interactive: Bool
    
    public func body(content: Content) -> some View {
        content
            .padding(padding)
            .glassEffect(
                interactive ? .regular.interactive() : .regular,
                in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            )
    }
}

// MARK: - Native Localiser / Find My Style Standard Components

/// Bouton circulaire Liquid Glass natif Apple (bouton fermer, centrer, info, etc.)
public struct LiquidGlassCircleButton: View {
    public var icon: String
    public var size: CGFloat
    public var iconSize: CGFloat
    public var iconWeight: Font.Weight
    public var foregroundColor: Color?
    public var action: () -> Void
    
    public init(
        icon: String,
        size: CGFloat = 40,
        iconSize: CGFloat = 16,
        iconWeight: Font.Weight = .semibold,
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
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive(), in: Circle())
    }
}

/// Conteneur pour listes groupées Liquid Glass natif
public struct LiquidGlassGroupedContainer<Content: View>: View {
    public var cornerRadius: CGFloat
    public let content: Content
    
    public init(
        cornerRadius: CGFloat = FlowTheme.standardCornerRadius,
        @ViewBuilder content: () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            content
        }
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

/// Barre de recherche Liquid Glass native
public struct LiquidGlassSearchBar: View {
    @Binding public var text: String
    public var placeholder: String
    public var onCommit: (() -> Void)?
    
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
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: FlowTheme.standardCornerRadius, style: .continuous))
    }
}

/// Poignée de redimensionnement de sheet Liquid Glass (Find My style grabber)
public struct LiquidGlassSheetGrabber: View {
    public init() {}
    
    public var body: some View {
        Capsule()
            .fill(Color.primary.opacity(0.25))
            .frame(width: 36, height: 5)
            .padding(.top, 8)
            .padding(.bottom, 4)
            .accessibilityHidden(true)
    }
}

// MARK: - Native Liquid Glass Floating Pill TabBar

public struct LiquidGlassTabItem: Identifiable, Sendable, Equatable {
    public let id: String
    public let icon: String
    public let label: String

    public init(id: String, icon: String, label: String) {
        self.id = id
        self.icon = icon
        self.label = label
    }

    public static let unifiedTabs: [LiquidGlassTabItem] = [
        LiquidGlassTabItem(id: "Explore", icon: "map", label: "Explore"),
        LiquidGlassTabItem(id: "Nearby", icon: "location.circle.fill", label: "Proximité"),
        LiquidGlassTabItem(id: "Favorites", icon: "star.fill", label: "Favoris"),
        LiquidGlassTabItem(id: "Trafic", icon: "tram.fill", label: "Trafic")
    ]
}

/// Barre d'onglets unifiée en pilule flottante Liquid Glass avec effet natif coopératif
public struct LiquidGlassFloatingTabBar: View {
    @Binding public var selectedTab: String
    public var tabs: [LiquidGlassTabItem]
    public var onSelectTab: ((String) -> Void)?

    public init(
        selectedTab: Binding<String>,
        tabs: [LiquidGlassTabItem] = LiquidGlassTabItem.unifiedTabs,
        onSelectTab: ((String) -> Void)? = nil
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.onSelectTab = onSelectTab
    }

    public var body: some View {
        GlassEffectContainer {
            HStack(spacing: 4) {
                ForEach(tabs) { tab in
                    let isSelected = selectedTab == tab.id
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                            selectedTab = tab.id
                            onSelectTab?(tab.id)
                        }
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: tab.icon)
                                .font(.system(size: 15, weight: isSelected ? .bold : .semibold))

                            if isSelected {
                                Text(tab.label)
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .transition(.scale.combined(with: .opacity))
                            }
                        }
                        .foregroundColor(isSelected ? .blue : .secondary)
                        .padding(.horizontal, isSelected ? 14 : 10)
                        .frame(height: 48)
                        .background {
                            if isSelected {
                                Capsule()
                                    .fill(Color.blue.opacity(0.18))
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: Capsule())
                }
            }
            .padding(.horizontal, 8)
            .frame(height: 64)
            .glassEffect(.regular, in: Capsule())
            .padding(.horizontal, 16)
        }
    }
}

/// État vide standardisé Liquid Glass
public struct LiquidGlassEmptyState: View {
    public let icon: String
    public let title: String
    public let subtitle: String
    public var actionTitle: String? = nil
    public var action: (() -> Void)? = nil
    
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
                Image(systemName: icon)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.secondary)
            }
            .frame(width: 76, height: 76)
            .glassEffect(.regular, in: Circle())
            
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
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive(), in: Capsule())
                .padding(.top, 8)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

/// Pastille / badge d'information Liquid Glass natif
public struct LiquidGlassBadge<Content: View>: View {
    public let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        content
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .glassEffect(.regular, in: Capsule())
    }
}

// MARK: - View Extensions

public extension View {
    /// Applique le style carte Liquid Glass natif
    func liquidGlassCard(
        cornerRadius: CGFloat = FlowTheme.standardCornerRadius,
        padding: CGFloat = 14,
        interactive: Bool = false
    ) -> some View {
        modifier(LiquidGlassCardModifier(cornerRadius: cornerRadius, padding: padding, interactive: interactive))
    }
    
    /// Configure une sheet modale avec les guidelines Apple Liquid Glass natives
    func liquidGlassSheet(
        cornerRadius: CGFloat = FlowTheme.sheetCornerRadius,
        dynamicOpacity: Bool = true,
        opacity: Double? = nil
    ) -> some View {
        self
            .presentationBackground(.ultraThinMaterial)
            .presentationCornerRadius(cornerRadius)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
    }
    
    /// Fond ultraThinMaterial natif pour sheet modale
    func liquidGlassSheetBackground(
        dynamicOpacity: Bool = true,
        opacity: Double? = nil
    ) -> some View {
        self
            .presentationBackground(.ultraThinMaterial)
    }
    
    /// Applique un effet Liquid Glass natif sur une forme Capsule
    func liquidGlassCapsule(interactive: Bool = false) -> some View {
        glassEffect(interactive ? .regular.interactive() : .regular, in: Capsule())
    }
    
    /// Applique un effet Liquid Glass natif sur une forme Circle
    func liquidGlassCircle(interactive: Bool = false) -> some View {
        glassEffect(interactive ? .regular.interactive() : .regular, in: Circle())
    }
}
