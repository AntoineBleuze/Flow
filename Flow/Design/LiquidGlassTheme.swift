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

public struct LiquidGlassSheetHeader<LeadingContent: View, TrailingContent: View>: View {
    public let title: String
    public let subtitle: String?
    public let leadingContent: LeadingContent
    public let trailingContent: TrailingContent
    
    public init(
        title: String,
        subtitle: String? = nil,
        @ViewBuilder leadingContent: () -> LeadingContent,
        @ViewBuilder trailingContent: () -> TrailingContent
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingContent = leadingContent()
        self.trailingContent = trailingContent()
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 12) {
            leadingContent
            
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

public extension LiquidGlassSheetHeader where LeadingContent == EmptyView {
    init(
        title: String,
        subtitle: String? = nil,
        @ViewBuilder trailingContent: () -> TrailingContent
    ) {
        self.init(title: title, subtitle: subtitle, leadingContent: { EmptyView() }, trailingContent: trailingContent)
    }
}

public extension LiquidGlassSheetHeader where LeadingContent == EmptyView, TrailingContent == EmptyView {
    init(title: String, subtitle: String? = nil) {
        self.init(title: title, subtitle: subtitle, leadingContent: { EmptyView() }, trailingContent: { EmptyView() })
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
        LiquidGlassTabItem(id: "Trafic", icon: "tram.fill", label: "Trafic"),
        LiquidGlassTabItem(id: "AI", icon: "sparkles", label: "Flow IA")
    ]
}

#if canImport(UIKit)
// MARK: - Sous-classe UITabBar fusionnable dans la Sheet réduite (Style Localiser iOS 26+)

/// Sous-classe de `UITabBar` capable d'estomper son contour externe (`outline` / platter global)
/// lorsque la `.sheet` est réduite au minimum afin de se fondre dans le verre de la sheet,
/// tout en conservant la pilule de sélection interne de l'onglet actif et la dalle en verre réfractive qui se soulève au glissement.
public final class MorphingPlatterUITabBar: UITabBar {
    private var savedPlatterGlassEffect: AnyObject?

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

    public var expandProgress: CGFloat = 1.0 {
        didSet {
            guard abs(oldValue - expandProgress) > 0.005 else { return }
            applyPlatterMergeState()
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        applyPlatterMergeState()
    }

    public func applyPlatterMergeState() {
        let barWidth = self.bounds.width
        guard barWidth > 0 else { return }
        let clampedExpand = min(1.0, max(0.0, expandProgress))
        let effectiveFill: Double = isMergedIntoSheet ? 0.0 : Double(clampedExpand)
        let fullBarWidthThreshold = barWidth * 0.60
        let targetAlpha: CGFloat = isMergedIntoSheet ? 0.0 : 1.0

        // 1. Piloter directement la progression du matériau de barre sur _UITabBarVisualProvider_Floating
        if let vp = self.value(forKey: "_visualProvider") as? NSObject {
            let fillSelector = NSSelectorFromString("setBarMaterialFillProgress:")
            if vp.responds(to: fillSelector) {
                typealias SetDoubleMethod = @convention(c) (AnyObject, Selector, Double) -> Void
                let methodIMP = vp.method(for: fillSelector)
                let fn = unsafeBitCast(methodIMP, to: SetDoubleMethod.self)
                fn(vp, fillSelector, effectiveFill)
            }

            let bgTransitionSelector = NSSelectorFromString("setBackgroundTransitionProgress:")
            if vp.responds(to: bgTransitionSelector) {
                typealias SetDoubleMethod = @convention(c) (AnyObject, Selector, Double) -> Void
                let methodIMP = vp.method(for: bgTransitionSelector)
                let fn = unsafeBitCast(methodIMP, to: SetDoubleMethod.self)
                fn(vp, bgTransitionSelector, isMergedIntoSheet ? 0.0 : Double(clampedExpand))
            }
        }

        // 2. Supprimer ou restaurer le verre / outline externe de _UITabBarItemPlatterView
        // tout en préservant les boutons (_UITabButton) et la pilule active (_UILiquidLensView).
        for subview in self.subviews {
            let className = String(describing: type(of: subview))
            if className.contains("PlatterView") {
                updatePlatterViewGlassAndOutline(subview, effectiveFill: effectiveFill, threshold: fullBarWidthThreshold)
            }
        }

        updateSubtreeForPlatterMerge(
            in: self,
            barWidth: barWidth,
            threshold: fullBarWidthThreshold,
            targetAlpha: targetAlpha
        )
    }

    private func updatePlatterViewGlassAndOutline(
        _ platter: UIView,
        effectiveFill: Double,
        threshold: CGFloat
    ) {
        let getGlassSel = NSSelectorFromString("_glassEffect")
        let setGlassSel = NSSelectorFromString("_setGlassEffect:")

        if savedPlatterGlassEffect == nil,
           platter.responds(to: getGlassSel),
           let currentEffect = platter.perform(getGlassSel)?.takeUnretainedValue() {
            savedPlatterGlassEffect = currentEffect
        }

        if isMergedIntoSheet {
            if platter.responds(to: setGlassSel) {
                _ = platter.perform(setGlassSel, with: nil)
            }
            platter.backgroundColor = .clear
            platter.layer.borderWidth = 0
            platter.layer.shadowOpacity = 0
        } else {
            if let savedEffect = savedPlatterGlassEffect,
               platter.responds(to: getGlassSel),
               platter.responds(to: setGlassSel),
               platter.perform(getGlassSel)?.takeUnretainedValue() == nil {
                _ = platter.perform(setGlassSel, with: savedEffect)
            }
            platter.setNeedsLayout()
        }

        if let sublayers = platter.layer.sublayers {
            for layer in sublayers where !(layer.delegate is UIView) {
                if layer.bounds.width >= threshold {
                    layer.opacity = Float(isMergedIntoSheet ? 0.0 : effectiveFill)
                }
            }
        }
    }

    private func updateSubtreeForPlatterMerge(
        in view: UIView,
        barWidth: CGFloat,
        threshold: CGFloat,
        targetAlpha: CGFloat
    ) {
        let className = String(describing: type(of: view))
        if className.contains("LiquidLens") || className.contains("TabSelection") || className.contains("BadgeContainer") {
            return
        }

        if view !== self {
            let isFullWidth = view.bounds.width >= threshold
            let hasTabOrPill = Self.subtreeContainsTabOrPillElement(view, barWidth: barWidth, threshold: threshold)

            if isFullWidth && !hasTabOrPill {
                view.alpha = targetAlpha
                return
            }

            if isFullWidth && hasTabOrPill && isMergedIntoSheet {
                view.backgroundColor = .clear
                view.layer.borderWidth = 0
                view.layer.shadowOpacity = 0
            }
        }

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

// MARK: - Native UIKit UITabBar Bridge (Dalle en Verre Réfractive Native iOS 26+)

public struct NativeLiquidGlassUITabBarRepresentable: UIViewRepresentable {
    @Binding public var selectedTab: String
    public var tabs: [LiquidGlassTabItem]
    public var isMergedIntoSheet: Bool
    public var expandProgress: CGFloat
    public var onSelectTab: ((String) -> Void)?
    public var onVerticalSwipe: ((Bool) -> Void)?

    public init(
        selectedTab: Binding<String>,
        tabs: [LiquidGlassTabItem] = LiquidGlassTabItem.unifiedTabs,
        isMergedIntoSheet: Bool = false,
        expandProgress: CGFloat = 1.0,
        onSelectTab: ((String) -> Void)? = nil,
        onVerticalSwipe: ((Bool) -> Void)? = nil
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.isMergedIntoSheet = isMergedIntoSheet
        self.expandProgress = expandProgress
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
        // Important : ne pas clipper la dalle en verre Liquid Glass d'iOS 26+ qui se soulève au glissement
        tabBar.clipsToBounds = false
        tabBar.expandProgress = expandProgress
        tabBar.isMergedIntoSheet = isMergedIntoSheet

        let items: [UITabBarItem] = tabs.enumerated().map { index, tab in
            UITabBarItem(
                title: tab.label,
                image: UIImage(systemName: tab.icon),
                tag: index
            )
        }
        tabBar.items = items

        if let selectedIndex = tabs.firstIndex(where: { $0.id == selectedTab }),
           selectedIndex < items.count {
            tabBar.selectedItem = items[selectedIndex]
        }

        // Geste vertical simultané permettant d'ouvrir/réduire la sheet en glissant verticalement sur la Tab Bar
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
        tabBar.expandProgress = expandProgress
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

            if chosenTabId == "AI" {
                // Conserver l'onglet actif sous-jacent et laisser la pilule dessus pendant l'ouverture de la sheet IA
                if let items = tabBar.items,
                   let currentIdx = parent.tabs.firstIndex(where: { $0.id == parent.selectedTab }),
                   currentIdx < items.count {
                    DispatchQueue.main.async {
                        tabBar.selectedItem = items[currentIdx]
                    }
                }
                parent.onSelectTab?("AI")
                return
            }

            if parent.selectedTab != chosenTabId {
                parent.selectedTab = chosenTabId
            }
            parent.onSelectTab?(chosenTabId)
        }

        public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            guard let pan = gestureRecognizer as? UIPanGestureRecognizer else { return true }
            let velocity = pan.velocity(in: pan.view)
            // Ne déclencher que sur un mouvement majoritairement vertical afin de laisser 100 %
            // de liberté à la dalle en verre horizontale native de la UITabBar
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
#endif

/// Barre d'onglets flottante native iOS 26+ inspirée de l'application Localiser (Find My).
/// Utilise `NativeLiquidGlassUITabBarRepresentable` directement dans la `.sheet` pour bénéficier
/// de l'animation native Apple Liquid Glass (dalle en verre qui se soulève et suit le doigt au glissement)
/// tout en se fondant dans la feuille modale au palier réduit.
public struct LiquidGlassFloatingTabBar: View {
    @Binding public var selectedTab: String
    public var tabs: [LiquidGlassTabItem]
    public var isMergedIntoSheet: Bool
    public var expandProgress: CGFloat
    public var onSelectTab: ((String) -> Void)?
    public var onVerticalSwipe: ((Bool) -> Void)?

    public init(
        selectedTab: Binding<String>,
        tabs: [LiquidGlassTabItem] = LiquidGlassTabItem.unifiedTabs,
        isMergedIntoSheet: Bool = false,
        expandProgress: CGFloat = 1.0,
        onSelectTab: ((String) -> Void)? = nil,
        onVerticalSwipe: ((Bool) -> Void)? = nil
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.isMergedIntoSheet = isMergedIntoSheet
        self.expandProgress = expandProgress
        self.onSelectTab = onSelectTab
        self.onVerticalSwipe = onVerticalSwipe
    }

    public var body: some View {
        #if canImport(UIKit)
        NativeLiquidGlassUITabBarRepresentable(
            selectedTab: $selectedTab,
            tabs: tabs,
            isMergedIntoSheet: isMergedIntoSheet,
            expandProgress: expandProgress,
            onSelectTab: onSelectTab,
            onVerticalSwipe: onVerticalSwipe
        )
        .frame(height: 62)
        #else
        EmptyView()
        #endif
    }
}
