import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - Liquid Glass Theme Alias

/// Alias vers FlowTheme pour garantir la cohérence des jetons de design
public typealias LiquidGlassTheme = FlowTheme

// MARK: - Apple Native Liquid Glass Design System (iOS 26+)

/// Style de bouton Apple Liquid Glass natif utilisant exclusivement `.glassEffect()`
public struct LiquidGlassInteractiveButtonStyle: ButtonStyle {
    public var cornerRadius: CGFloat
    public var isProminent: Bool
    public var tintColor: Color?
    
    public init(cornerRadius: CGFloat = 999, isProminent: Bool = false, tintColor: Color? = nil) {
        self.cornerRadius = cornerRadius
        self.isProminent = isProminent
        self.tintColor = tintColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        
        configuration.label
            .contentShape(shape)
            .background {
                if let tint = tintColor {
                    shape.fill(tint.opacity(isProminent ? 0.32 : 0.14))
                } else if isProminent {
                    shape.fill(Color.accentColor.opacity(0.22))
                }
            }
            .glassEffect(.regular.interactive(), in: shape)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.72), value: configuration.isPressed)
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
    /// Bouton capsule interactif en Liquid Glass natif
    static var liquidGlassInteractive: LiquidGlassInteractiveButtonStyle {
        LiquidGlassInteractiveButtonStyle(cornerRadius: 999)
    }
    
    /// Bouton proéminent teinté en Liquid Glass natif
    static func liquidGlassProminent(cornerRadius: CGFloat = 999, tint: Color = .blue) -> LiquidGlassInteractiveButtonStyle {
        LiquidGlassInteractiveButtonStyle(cornerRadius: cornerRadius, isProminent: true, tintColor: tint)
    }
    
    /// Bouton rectangulaire arrondi en Liquid Glass natif
    static func liquidGlassRounded(cornerRadius: CGFloat = FlowTheme.standardCornerRadius, tint: Color? = nil) -> LiquidGlassInteractiveButtonStyle {
        LiquidGlassInteractiveButtonStyle(cornerRadius: cornerRadius, isProminent: false, tintColor: tint)
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
    public let cornerRadius: CGFloat
    public let padding: CGFloat
    public let interactive: Bool
    public let content: Content
    
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

// MARK: - Conteneur pour listes groupées Liquid Glass natif

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

// MARK: - Barre de recherche Liquid Glass native

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

// MARK: - Bouton circulaire Liquid Glass natif Apple

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

// MARK: - En-tête de feuille modale style Apple Localiser (Find My) iOS 26

public struct LiquidGlassSheetHeader<TrailingContent: View>: View {
    public let title: String
    public let subtitle: String?
    public let trailingContent: TrailingContent
    
    public init(
        title: String,
        subtitle: String? = nil,
        @ViewBuilder trailingContent: () -> TrailingContent
    ) {
        self.title = title
        self.subtitle = subtitle
        self.trailingContent = trailingContent()
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                if let subtitle = subtitle, !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer(minLength: 8)
            
            trailingContent
        }
        .padding(.horizontal, 20)
        .padding(.top, 18)
        .padding(.bottom, 8)
    }
}

public extension LiquidGlassSheetHeader where TrailingContent == EmptyView {
    init(title: String, subtitle: String? = nil) {
        self.init(title: title, subtitle: subtitle) {
            EmptyView()
        }
    }
}

// MARK: - État vide standardisé Liquid Glass

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

// MARK: - Pastille / badge d'information Liquid Glass natif

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

// MARK: - Liquid Glass Card Surface Modifier

public struct LiquidGlassCardModifier: ViewModifier {
    public var cornerRadius: CGFloat
    public var padding: CGFloat
    public var tintColor: Color?
    public var isInteractive: Bool
    
    public init(
        cornerRadius: CGFloat = FlowTheme.standardCornerRadius,
        padding: CGFloat = 0,
        tintColor: Color? = nil,
        isInteractive: Bool = false
    ) {
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.tintColor = tintColor
        self.isInteractive = isInteractive
    }
    
    public func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        
        content
            .padding(padding)
            .background {
                if let tint = tintColor {
                    shape.fill(tint)
                }
            }
            .glassEffect(isInteractive ? .regular.interactive() : .regular, in: shape)
    }
}

// MARK: - Liquid Glass Pill / Capsule Surface Modifier

public struct LiquidGlassCapsuleModifier: ViewModifier {
    public var tintColor: Color?
    public var isInteractive: Bool
    
    public init(tintColor: Color? = nil, isInteractive: Bool = true) {
        self.tintColor = tintColor
        self.isInteractive = isInteractive
    }
    
    public func body(content: Content) -> some View {
        content
            .background {
                if let tint = tintColor {
                    Capsule().fill(tint)
                }
            }
            .glassEffect(isInteractive ? .regular.interactive() : .regular, in: Capsule())
    }
}

// MARK: - Liquid Glass Floating Control Circle Modifier

public struct LiquidGlassCircleControlModifier: ViewModifier {
    public var size: CGFloat
    public var tintColor: Color?
    
    public init(size: CGFloat = 44, tintColor: Color? = nil) {
        self.size = size
        self.tintColor = tintColor
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .background {
                if let tint = tintColor {
                    Circle().fill(tint)
                }
            }
            .glassEffect(.regular.interactive(), in: Circle())
    }
}

// MARK: - View Extensions for Liquid Glass

public extension View {
    /// Applique une surface de carte Apple Liquid Glass native (`.glassEffect`)
    func liquidGlassCard(
        cornerRadius: CGFloat = FlowTheme.standardCornerRadius,
        padding: CGFloat = 0,
        tint: Color? = nil,
        interactive: Bool = false
    ) -> some View {
        modifier(LiquidGlassCardModifier(cornerRadius: cornerRadius, padding: padding, tintColor: tint, isInteractive: interactive))
    }
    
    /// Applique une pilule / capsule Apple Liquid Glass native (`.glassEffect`)
    func liquidGlassCapsule(
        tint: Color? = nil,
        interactive: Bool = true
    ) -> some View {
        modifier(LiquidGlassCapsuleModifier(tintColor: tint, isInteractive: interactive))
    }
    
    /// Applique un effet Liquid Glass natif sur une forme Capsule (rétrocompatibilité)
    func liquidGlassCapsule(interactive: Bool = false) -> some View {
        glassEffect(interactive ? .regular.interactive() : .regular, in: Capsule())
    }
    
    /// Applique un effet Liquid Glass natif sur une forme Circle (rétrocompatibilité)
    func liquidGlassCircle(interactive: Bool = false) -> some View {
        glassEffect(interactive ? .regular.interactive() : .regular, in: Circle())
    }
    
    /// Applique un bouton circulaire flottant en Liquid Glass natif
    func liquidGlassCircleControl(
        size: CGFloat = 44,
        tint: Color? = nil
    ) -> some View {
        modifier(LiquidGlassCircleControlModifier(size: size, tintColor: tint))
    }
    
    /// Configure une sheet modale avec les guidelines Apple Liquid Glass natives iOS 26
    /// IMPORTANT : Aucun `.presentationBackground` n'est appliqué afin qu'iOS 26 utilise son matériau Liquid Glass concentrique natif.
    func liquidGlassSheet(
        cornerRadius: CGFloat = FlowTheme.sheetCornerRadius,
        dynamicOpacity: Bool = true,
        opacity: Double? = nil
    ) -> some View {
        self
            .scrollContentBackground(.hidden)
    }
    
    /// Fond natif pour sheet modale iOS 26 (sans `.presentationBackground` pour préserver le verre natif)
    func liquidGlassSheetBackground(
        dynamicOpacity: Bool = true,
        opacity: Double? = nil
    ) -> some View {
        self
            .scrollContentBackground(.hidden)
    }
    
    /// Conteneur de barre flottante en verre liquide (pilule de navigation ou dock d'actions)
    func liquidGlassFloatingBar(cornerRadius: CGFloat = 999) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        return self
            .glassEffect(.regular, in: shape)
    }
}

// MARK: - Reusable Liquid Glass Header Grabber

public struct LiquidGlassSheetGrabber: View {
    public init() {}
    
    public var body: some View {
        Capsule()
            .fill(Color.primary.opacity(0.24))
            .frame(width: 38, height: 5)
            .padding(.top, 8)
            .padding(.bottom, 4)
            .accessibilityHidden(true)
    }
}

// MARK: - Unified Floating Liquid Glass Tab Bar (Style Localiser iOS 26)

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
        LiquidGlassTabItem(id: "Explore", icon: "map.fill", label: "Explorer"),
        LiquidGlassTabItem(id: "Nearby", icon: "location.circle.fill", label: "Proximité"),
        LiquidGlassTabItem(id: "Favorites", icon: "star.fill", label: "Favoris"),
        LiquidGlassTabItem(id: "Trafic", icon: "tram.fill", label: "Trafic")
    ]
}

#if canImport(UIKit)
// MARK: - Sous-classe UITabBar fusionnable dans la Sheet réduite (Style Localiser iOS 26)

/// Sous-classe de `UITabBar` capable d'estomper son contour externe (`outline` / platter global)
/// lorsque la `.sheet` est réduite au minimum afin de se fondre dans le verre de la sheet,
/// tout en conservant la pilule de sélection interne de l'onglet actif et la loupe réfractive au glissement.
public final class MorphingPlatterUITabBar: UITabBar {
    public var isMergedIntoSheet: Bool = false {
        didSet {
            guard oldValue != isMergedIntoSheet else { return }
            UIView.animate(
                withDuration: 0.24,
                delay: 0,
                options: [.curveEaseInOut, .allowUserInteraction, .beginFromCurrentState]
            ) {
                self.applyPlatterMergeState()
            }
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        applyPlatterMergeState()
    }

    public func applyPlatterMergeState() {
        let barWidth = self.bounds.width
        guard barWidth > 0 else { return }
        // Seuil distinguant le platter/outline global de la TabBar (> 60 % de la largeur)
        // des éléments propres à un onglet individuel ou à la loupe réfractive (~20-45 % de la largeur).
        let fullBarWidthThreshold = barWidth * 0.60
        let targetAlpha: CGFloat = isMergedIntoSheet ? 0.0 : 1.0

        updateSubtreeForPlatterMerge(
            in: self,
            barWidth: barWidth,
            threshold: fullBarWidthThreshold,
            targetAlpha: targetAlpha
        )
    }

    private func updateSubtreeForPlatterMerge(
        in view: UIView,
        barWidth: CGFloat,
        threshold: CGFloat,
        targetAlpha: CGFloat
    ) {
        if view !== self {
            let isFullWidth = view.bounds.width >= threshold
            let hasTabOrPill = Self.subtreeContainsTabOrPillElement(view, barWidth: barWidth, threshold: threshold)

            if isFullWidth && !hasTabOrPill {
                // Vue d'arrière-plan, verre externe ou contour (outline) global de la TabBar :
                // disparaît quand la sheet est réduite pour se fondre dans la sheet.
                view.alpha = targetAlpha
                return
            }

            if isFullWidth && hasTabOrPill {
                if isMergedIntoSheet {
                    view.backgroundColor = .clear
                    view.layer.borderWidth = 0
                    view.layer.shadowOpacity = 0
                }
            }
        }

        // Masquer également les sous-calques CALayer directs (rim/stroke/shadow/backdrop) de pleine largeur
        if let sublayers = view.layer.sublayers {
            for layer in sublayers {
                if layer.delegate is UIView {
                    continue
                }
                if layer.bounds.width >= threshold {
                    layer.opacity = Float(targetAlpha)
                }
            }
        }

        for subview in view.subviews {
            updateSubtreeForPlatterMerge(
                in: subview,
                barWidth: barWidth,
                threshold: threshold,
                targetAlpha: targetAlpha
            )
        }
    }

    private static func subtreeContainsTabOrPillElement(
        _ view: UIView,
        barWidth: CGFloat,
        threshold: CGFloat
    ) -> Bool {
        if view is UIControl {
            return true
        }
        // Préserver la pilule de sélection de l'onglet actif ainsi que la bulle loupe réfractive
        // (dont la largeur est celle d'un onglet : entre 14 % et 58 % de la largeur totale de la barre).
        let w = view.bounds.width
        let h = view.bounds.height
        if w >= barWidth * 0.14 && w < threshold && h >= 30 {
            return true
        }
        for subview in view.subviews {
            if subtreeContainsTabOrPillElement(subview, barWidth: barWidth, threshold: threshold) {
                return true
            }
        }
        return false
    }
}

// MARK: - Native UIKit UITabBar Bridge (Bulle Loupe Réfractive Native iOS 26 & Concentricité Écran)

public struct NativeLiquidGlassUITabBarRepresentable: UIViewRepresentable {
    @Binding public var selectedTab: String
    public var tabs: [LiquidGlassTabItem]
    public var isMergedIntoSheet: Bool
    public var onSelectTab: ((String) -> Void)?
    public var onVerticalSwipe: ((Bool) -> Void)?

    public init(
        selectedTab: Binding<String>,
        tabs: [LiquidGlassTabItem] = LiquidGlassTabItem.unifiedTabs,
        isMergedIntoSheet: Bool = false,
        onSelectTab: ((String) -> Void)? = nil,
        onVerticalSwipe: ((Bool) -> Void)? = nil
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.isMergedIntoSheet = isMergedIntoSheet
        self.onSelectTab = onSelectTab
        self.onVerticalSwipe = onVerticalSwipe
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> MorphingPlatterUITabBar {
        let tabBar = MorphingPlatterUITabBar()
        tabBar.delegate = context.coordinator
        tabBar.tintColor = .systemBlue
        tabBar.isTranslucent = true
        // Important : ne pas clipper la bulle loupe Liquid Glass d'iOS 26 qui déborde verticalement au glissement
        tabBar.clipsToBounds = false
        tabBar.isMergedIntoSheet = isMergedIntoSheet

        let items: [UITabBarItem] = tabs.enumerated().map { index, tab in
            let item = UITabBarItem(
                title: tab.label,
                image: UIImage(systemName: tab.icon),
                tag: index
            )
            return item
        }
        tabBar.items = items

        if let selectedIndex = tabs.firstIndex(where: { $0.id == selectedTab }),
           selectedIndex < items.count {
            tabBar.selectedItem = items[selectedIndex]
        }

        // Geste vertical simultané permettant aussi d'ouvrir/réduire la sheet en glissant verticalement sur la Tab Bar
        let verticalPan = UIPanGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handleVerticalPan(_:))
        )
        verticalPan.cancelsTouchesInView = false
        verticalPan.delaysTouchesBegan = false
        verticalPan.delegate = context.coordinator
        tabBar.addGestureRecognizer(verticalPan)

        return tabBar
    }

    public func updateUIView(_ tabBar: MorphingPlatterUITabBar, context: Context) {
        context.coordinator.parent = self
        tabBar.clipsToBounds = false
        tabBar.isMergedIntoSheet = isMergedIntoSheet
        guard let items = tabBar.items else { return }

        if let selectedIndex = tabs.firstIndex(where: { $0.id == selectedTab }),
           selectedIndex < items.count {
            if tabBar.selectedItem !== items[selectedIndex] {
                tabBar.selectedItem = items[selectedIndex]
            }
        }
    }

    public final class Coordinator: NSObject, UITabBarDelegate, UIGestureRecognizerDelegate {
        var parent: NativeLiquidGlassUITabBarRepresentable
        private var didTriggerVerticalSwipe = false

        init(_ parent: NativeLiquidGlassUITabBarRepresentable) {
            self.parent = parent
        }

        public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            let index = item.tag
            guard index >= 0 && index < parent.tabs.count else { return }
            let chosenTabId = parent.tabs[index].id
            if parent.selectedTab != chosenTabId {
                parent.selectedTab = chosenTabId
            }
            parent.onSelectTab?(chosenTabId)
        }

        public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            guard let pan = gestureRecognizer as? UIPanGestureRecognizer else { return true }
            let velocity = pan.velocity(in: pan.view)
            // Ne déclencher que sur un mouvement majoritairement vertical afin de laisser 100 %
            // de liberté à la loupe réfractive horizontale native de la UITabBar
            return abs(velocity.y) > abs(velocity.x) * 1.35
        }

        public func gestureRecognizer(
            _ gestureRecognizer: UIGestureRecognizer,
            shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
        ) -> Bool {
            return true
        }

        @objc func handleVerticalPan(_ recognizer: UIPanGestureRecognizer) {
            switch recognizer.state {
            case .began:
                didTriggerVerticalSwipe = false
            case .changed:
                guard !didTriggerVerticalSwipe else { return }
                let translation = recognizer.translation(in: recognizer.view)
                if translation.y < -18 {
                    didTriggerVerticalSwipe = true
                    parent.onVerticalSwipe?(true)
                } else if translation.y > 22 {
                    didTriggerVerticalSwipe = true
                    parent.onVerticalSwipe?(false)
                }
            default:
                didTriggerVerticalSwipe = false
            }
        }
    }
}

// MARK: - Architecture Multi-Fenêtre PassThroughOverlayWindow (Indépendance Totale Sheet / TabBar)

/// Fenêtre secondaire transparente positionnée au-dessus de la `.sheet` système (`windowLevel = .normal + 1`).
/// Intercepte exclusivement les touchers sur les contrôles interactifs (comme la `UITabBar` Liquid Glass
/// ou la pilule d'itinéraire actif) et laisse passer 100 % des autres événements vers la `.sheet` et la carte.
public final class PassThroughOverlayWindow: UIWindow {
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let rootView = self.rootViewController?.view else { return nil }
        guard let hitView = super.hitTest(point, with: event) else { return nil }

        // Laisser traverser les touchers qui tombent sur le fond transparent du UIHostingController
        if hitView === rootView {
            return nil
        }

        // Vérifier si la vue touchée appartient à un contrôle UIKit natif (ex: UITabBar) ou possède une région interactive
        if isInteractiveTarget(hitView, at: point, in: rootView, with: event) {
            return hitView
        }

        return nil
    }

    private func isInteractiveTarget(_ hitView: UIView, at windowPoint: CGPoint, in rootView: UIView, with event: UIEvent?) -> Bool {
        // 1. Si le toucher tombe dans une UITabBar ou l'une de ses sous-vues :
        // laisser passer la bande supérieure au niveau du Grabber central pour que la poignée de la sheet reste 100 % saisissable.
        var current: UIView? = hitView
        while let view = current {
            if let tabBar = view as? UITabBar {
                let localPoint = tabBar.convert(windowPoint, from: self)
                let isInCenterGrabberColumn = abs(windowPoint.x - self.bounds.midX) < 56
                if isInCenterGrabberColumn && localPoint.y < 14 {
                    return false
                }
                return true
            }
            if view is UIControl {
                // Vérifier également si ce UIControl est dans une UITabBar sous la zone de la poignée centrale
                if let parentTabBar = findParentTabBar(of: view) {
                    let localPoint = parentTabBar.convert(windowPoint, from: self)
                    let isInCenterGrabberColumn = abs(windowPoint.x - self.bounds.midX) < 56
                    if isInCenterGrabberColumn && localPoint.y < 14 {
                        return false
                    }
                }
                return true
            }
            current = view.superview
        }

        // 2. Recherche récursive des UITabBar ou zones interactives dont la frame contient le point
        return containsInteractiveControl(in: rootView, windowPoint: windowPoint, event: event, hitView: hitView)
    }

    private func findParentTabBar(of view: UIView) -> UITabBar? {
        var current = view.superview
        while let v = current {
            if let tabBar = v as? UITabBar {
                return tabBar
            }
            current = v.superview
        }
        return nil
    }

    private func containsInteractiveControl(in view: UIView, windowPoint: CGPoint, event: UIEvent?, hitView: UIView) -> Bool {
        for subview in view.subviews {
            guard !subview.isHidden && subview.alpha > 0.01 else { continue }
            let localPoint = subview.convert(windowPoint, from: self)
            if subview.point(inside: localPoint, with: event) {
                if let tabBar = subview as? UITabBar {
                    let isInCenterGrabberColumn = abs(windowPoint.x - self.bounds.midX) < 56
                    if isInCenterGrabberColumn && localPoint.y < 14 {
                        return false
                    }
                    return true
                }
                if subview is UIControl {
                    return true
                }
                // Pour la pilule SwiftUI ActiveRouteResumePill (située juste au-dessus de la TabBar, hauteur <= 90pt)
                if subview.frame.height > 20 && subview.frame.height <= 90 && windowPoint.y >= (self.bounds.height - 190) {
                    if hitView !== view && !(SubtreeContainsOnlyHostingBackground(hitView)) {
                        return true
                    }
                }
                if containsInteractiveControl(in: subview, windowPoint: windowPoint, event: event, hitView: hitView) {
                    return true
                }
            }
        }
        return false
    }

    private func SubtreeContainsOnlyHostingBackground(_ view: UIView) -> Bool {
        let typeName = String(describing: type(of: view))
        return typeName.contains("UIHostingView")
    }
}

/// Gestionnaire singleton de la fenêtre PassThrough contenant la TabBar flottante Liquid Glass
@MainActor
public final class FloatingTabBarWindowManager {
    public static let shared = FloatingTabBarWindowManager()
    private var overlayWindow: PassThroughOverlayWindow?

    private init() {}

    public func showOverlay<Content: View>(@ViewBuilder content: () -> Content) {
        if let existingWindow = overlayWindow,
           let hosting = existingWindow.rootViewController as? UIHostingController<Content> {
            hosting.rootView = content()
            existingWindow.isHidden = false
            return
        }

        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive })
            ?? UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).first
        else { return }

        let window = PassThroughOverlayWindow(windowScene: windowScene)
        window.windowLevel = UIWindow.Level.normal + 1
        window.backgroundColor = .clear

        let hostingController = UIHostingController(rootView: content())
        hostingController.view.backgroundColor = .clear
        hostingController.sizingOptions = []

        window.rootViewController = hostingController
        window.isHidden = false
        self.overlayWindow = window
    }

    public func setHidden(_ hidden: Bool) {
        overlayWindow?.isHidden = hidden
    }
}
#endif

/// Barre d'onglets flottante native iOS 26 inspirée de l'application Localiser (Find My).
/// Utilise `NativeLiquidGlassUITabBarRepresentable` pour bénéficier de la vraie capsule Liquid Glass
/// d'Apple, de la concentricité exacte avec les coins de l'écran et de la loupe réfractive au glissement du doigt.
public struct LiquidGlassFloatingTabBar: View {
    @Binding public var selectedTab: String
    public var tabs: [LiquidGlassTabItem]
    public var isMergedIntoSheet: Bool
    public var onSelectTab: ((String) -> Void)?
    public var onVerticalSwipe: ((Bool) -> Void)?

    public init(
        selectedTab: Binding<String>,
        tabs: [LiquidGlassTabItem] = LiquidGlassTabItem.unifiedTabs,
        isMergedIntoSheet: Bool = false,
        onSelectTab: ((String) -> Void)? = nil,
        onVerticalSwipe: ((Bool) -> Void)? = nil
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.isMergedIntoSheet = isMergedIntoSheet
        self.onSelectTab = onSelectTab
        self.onVerticalSwipe = onVerticalSwipe
    }

    public var body: some View {
        #if canImport(UIKit)
        NativeLiquidGlassUITabBarRepresentable(
            selectedTab: $selectedTab,
            tabs: tabs,
            isMergedIntoSheet: isMergedIntoSheet,
            onSelectTab: onSelectTab,
            onVerticalSwipe: onVerticalSwipe
        )
        .frame(height: 58)
        #else
        EmptyView()
        #endif
    }
}
