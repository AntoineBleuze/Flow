import Combine
import SwiftUI
import MapKit
import SwiftData

struct ContentView: View {
    @StateObject private var coordinator = NavigationCoordinator.shared
    @ObservedObject private var navigationManager = NavigationManager.shared
    @ObservedObject private var routeManager = RouteNavigationManager.shared
    @ObservedObject private var mapData = MapDataService.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchText = ""
    @State private var showLoading: Bool
    @State private var isDuoPanelCollapsed: Bool = false
    @GestureState private var duoOuterDragOffset: CGFloat = 0

    init(showLoading: Bool = true) {
        _showLoading = State(initialValue: showLoading)
    }

    var body: some View {
        GeometryReader { geometry in
            let posture = DuoLayoutHelper.posture(
                horizontalSizeClass: horizontalSizeClass,
                screenSize: geometry.size
            )

            ZStack {
                switch posture {
                case .unfoldedDualScreen:
                    duoDualScreenLayout
                        .environment(\.duoPosture, .unfoldedDualScreen)
                case .foldedDuoOuterScreen:
                    duoOuterScreenLayout(in: geometry.size)
                        .environment(\.duoPosture, .foldedDuoOuterScreen)
                case .foldedSingleScreen:
                    classicSingleScreenLayout
                        .environment(\.duoPosture, .foldedSingleScreen)
                }

                if showLoading {
                    LoadingScreenView(isPresented: $showLoading)
                        .transition(.opacity)
                        .zIndex(999)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .environmentObject(coordinator)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                if showLoading {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        showLoading = false
                    }
                }
            }
        }
    }

    // MARK: - iPhone Duo Outer Screen Layout (Écran Extérieur 466×678, Tab Bar latérale sous la caméra)
    @ViewBuilder
    private func duoOuterScreenLayout(in size: CGSize) -> some View {
        let isCollapsed = coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent
        let baseCardHeight: CGFloat = {
            switch coordinator.exploreSheetDetent {
            case NavigationCoordinator.collapsedSheetDetent:
                return 76
            case .large:
                return max(372, size.height - 28)
            default:
                return min(max(364, size.height * 0.55), 376)
            }
        }()
        let maxCardHeight = max(372, size.height - 28)
        let currentCardHeight = min(maxCardHeight, max(76, baseCardHeight - duoOuterDragOffset))

        ZStack {
            // Couche 1 : Carte plein écran
            AppMapView(showControls: true)
                .ignoresSafeArea()

            // Couche 2 : Conteneur unifié Liquid Glass (Panneau à gauche + Rail vertical Tab Bar sous la caméra)
            GlassEffectContainer(spacing: 12) {
                ZStack {
                    // Panneau / Feuille spatiale Liquid Glass à gauche du rail latéral
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer(minLength: 0)

                        let isShowingExploreInlineRoute = coordinator.selectedTab == "Explore"
                            && coordinator.selectedStation == nil
                            && coordinator.previewJourney == nil
                            && searchText.isEmpty
                        if isCollapsed && routeManager.isRouteActive
                            && (!routeManager.isShowingRouteSheet || coordinator.selectedTab != "Explore")
                            && !isShowingExploreInlineRoute {
                            ActiveRouteResumePill(routeManager: routeManager)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }

                        duoOuterSheetCard(
                            isCollapsed: isCollapsed,
                            cardHeight: currentCardHeight
                        )
                    }
                    .padding(.leading, 12)
                    .padding(.trailing, 86)
                    .padding(.bottom, 12)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)

                    // Rail latéral droit positionné sous la caméra et l'indicateur réseau (x ≈ 382..458pt)
                    duoOuterSideRail
                }
            }
            .animation(.spring(response: 0.36, dampingFraction: 0.82), value: coordinator.exploreSheetDetent)
            .animation(.spring(response: 0.34, dampingFraction: 0.80), value: coordinator.selectedTab)
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .sheet(isPresented: $coordinator.showAIAssistant) {
            FlowAssistantView()
                .environmentObject(coordinator)
                .presentationDetents([.medium, .large], selection: $coordinator.aiSheetDetent)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .presentationContentInteraction(.scrolls)
                .presentationDragIndicator(.visible)
        }
        .onChange(of: navigationManager.shouldSwitchToMap) { _, shouldSwitch in
            if shouldSwitch {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    coordinator.exploreSheetDetent = .medium
                }
                navigationManager.shouldSwitchToMap = false
            }
        }
        .onChange(of: coordinator.selectedStation?.id) { _, newId in
            if newId != nil {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    coordinator.exploreSheetDetent = .medium
                }
            }
        }
        .onChange(of: routeManager.isShowingRouteSheet) { _, isShowing in
            if isShowing {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    coordinator.exploreSheetDetent = .medium
                }
            }
        }
    }

    private var duoOuterSideRail: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)

            DuoVerticalLiquidGlassTabBar(
                selectedTab: $coordinator.selectedTab,
                showAIAssistant: coordinator.showAIAssistant,
                onSelectTab: { tab in
                    if tab == "AI" {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        #endif
                        coordinator.aiSheetDetent = .large
                        coordinator.showAIAssistant = true
                        return
                    }
                    if tab == "Explore" && coordinator.exploreSheetDetent != NavigationCoordinator.collapsedSheetDetent {
                        coordinator.selectedStation = nil
                    }
                    if coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent {
                        withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                            coordinator.exploreSheetDetent = .medium
                        }
                    }
                }
            )

            Spacer(minLength: 0)
        }
        .padding(.top, 178)
        .padding(.trailing, 14)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
    }

    @ViewBuilder
    private func duoOuterSheetCard(isCollapsed: Bool, cardHeight: CGFloat) -> some View {
        let shape = RoundedRectangle(cornerRadius: 28, style: .continuous)

        VStack(spacing: 0) {
            // Poignée de glissement / redimensionnement vertical
            ZStack {
                Color.clear
                    .frame(height: 22)
                    .contentShape(Rectangle())
                LiquidGlassSheetGrabber()
            }
            .gesture(duoOuterDragGesture)
            .onTapGesture {
                withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                    if coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent {
                        coordinator.exploreSheetDetent = .medium
                    } else if coordinator.exploreSheetDetent == .medium {
                        coordinator.exploreSheetDetent = .large
                    } else {
                        coordinator.exploreSheetDetent = .medium
                    }
                }
            }

            if isCollapsed {
                duoOuterCollapsedContent
            } else {
                duoSheetActiveTabContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .clipped()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: cardHeight, alignment: .top)
        .clipShape(shape)
        .glassEffect(.regular, in: shape)
    }

    @ViewBuilder
    private var duoOuterCollapsedContent: some View {
        Button {
            withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                coordinator.exploreSheetDetent = .medium
            }
        } label: {
            HStack(spacing: 10) {
                if routeManager.isRouteActive && routeManager.isShowingRouteSheet {
                    Image(systemName: "location.north.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.blue)
                    Text(routeManager.pillHeadline)
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                } else if let station = coordinator.selectedStation {
                    Image(systemName: "tram.fill")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.blue)
                    Text(station.name)
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                } else {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.blue)
                    Text("Rechercher station, ligne...")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer(minLength: 4)

                Image(systemName: "chevron.up")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    private var duoOuterDragGesture: some Gesture {
        DragGesture(minimumDistance: 6)
            .updating($duoOuterDragOffset) { value, state, _ in
                state = value.translation.height
            }
            .onEnded { value in
                let deltaY = value.translation.height
                let velocity = value.predictedEndTranslation.height - deltaY
                let isExpanding = (deltaY + velocity * 0.25) < -36
                let isCollapsing = (deltaY + velocity * 0.25) > 36

                withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                    if isExpanding {
                        if coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent {
                            coordinator.exploreSheetDetent = .medium
                        } else if coordinator.exploreSheetDetent == .medium {
                            coordinator.exploreSheetDetent = .large
                        }
                    } else if isCollapsing {
                        if coordinator.exploreSheetDetent == .large {
                            coordinator.exploreSheetDetent = .medium
                        } else {
                            coordinator.exploreSheetDetent = NavigationCoordinator.collapsedSheetDetent
                        }
                    }
                }
            }
    }

    // MARK: - iPhone Duo Dual-Screen Layout (Écran Intérieur Déplié 951×669, Liquid Glass Natif Apple)
    private var duoDualScreenLayout: some View {
        DuoSplitView {
            GlassEffectContainer(spacing: 12) {
                VStack(spacing: 0) {
                    if isDuoPanelCollapsed {
                        duoCollapsedHeaderPill
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 12)
                            .transition(.move(edge: .top).combined(with: .opacity))

                        Spacer(minLength: 0)
                    } else {
                        duoFloatingMainPanel
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 12)
                            .transition(.scale(scale: 0.96, anchor: .bottom).combined(with: .opacity))
                    }

                    duoBottomDock
                }
            }
        } trailing: {
            AppMapView(showControls: true)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $coordinator.showAIAssistant) {
            FlowAssistantView()
                .environmentObject(coordinator)
                .presentationDetents([.medium, .large], selection: $coordinator.aiSheetDetent)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .presentationContentInteraction(.scrolls)
                .presentationDragIndicator(.visible)
        }
        .onAppear {
            if coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent {
                coordinator.exploreSheetDetent = .medium
            }
        }
        .onChange(of: navigationManager.shouldSwitchToMap) { _, shouldSwitch in
            if shouldSwitch {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    isDuoPanelCollapsed = false
                }
                navigationManager.shouldSwitchToMap = false
            }
        }
        .onChange(of: coordinator.selectedStation?.id) { _, newId in
            if newId != nil {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    isDuoPanelCollapsed = false
                }
            }
        }
        .onChange(of: routeManager.isShowingRouteSheet) { _, isShowing in
            if isShowing {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    isDuoPanelCollapsed = false
                }
            }
        }
        .onChange(of: coordinator.previewJourney?.id) { _, newId in
            if newId != nil && isDuoPanelCollapsed {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    isDuoPanelCollapsed = false
                }
            }
        }
    }

    private var duoCollapsedHeaderPill: some View {
        Button {
            withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                isDuoPanelCollapsed = false
            }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: duoActiveTabIcon)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.blue)

                Text(duoCollapsedPillTitle)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Spacer()

                Image(systemName: "chevron.down")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .glassEffect(.regular.interactive(), in: Capsule())
        }
        .buttonStyle(.plain)
    }

    private var duoActiveTabIcon: String {
        switch coordinator.selectedTab {
        case "Nearby": return "location.circle.fill"
        case "Favorites": return "star.fill"
        case "Trafic": return "tram.fill"
        default: return "map.fill"
        }
    }

    private var duoCollapsedPillTitle: String {
        if routeManager.isRouteActive && routeManager.isShowingRouteSheet && coordinator.selectedTab == "Explore" {
            return routeManager.pillHeadline
        }
        if let station = coordinator.selectedStation, coordinator.selectedTab == "Explore" {
            return station.name
        }
        switch coordinator.selectedTab {
        case "Nearby": return "Stations à proximité"
        case "Favorites": return "Lignes favorites"
        case "Trafic": return "État du trafic"
        default: return "Afficher le panneau Flow"
        }
    }

    private var duoFloatingMainPanel: some View {
        let shape = RoundedRectangle(cornerRadius: 36, style: .continuous)

        return VStack(spacing: 0) {
            // Barre supérieure discrète avec poignée et bouton de réduction rapide pour voir la carte plein écran
            HStack(spacing: 8) {
                Capsule()
                    .fill(Color.primary.opacity(0.22))
                    .frame(width: 36, height: 4)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading, 32)

                Button {
                    withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                        isDuoPanelCollapsed = true
                    }
                } label: {
                    Image(systemName: "arrow.down.right.and.arrow.up.left")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.secondary)
                        .frame(width: 28, height: 28)
                        .background(Color.primary.opacity(0.08), in: Circle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Réduire le panneau")
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .padding(.bottom, 2)

            duoSheetActiveTabContent
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .clipShape(shape)
        .glassEffect(.regular, in: shape)
    }

    @ViewBuilder
    private var duoSheetActiveTabContent: some View {
        switch coordinator.selectedTab {
        case "Explore":
            exploreSheetTabContent
        case "Nearby":
            NearbyStationsView(embeddedInSheet: true)
        case "Favorites":
            FavoritesView()
        case "Trafic":
            NavigationStack {
                TrafficViewContent()
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .liquidGlassBackground()
        default:
            exploreSheetTabContent
        }
    }

    // MARK: - Duo Bottom Floating Dock (Tab Bar Concentric with Inner 55pt Chassis)
    private var duoBottomDock: some View {
        VStack(spacing: 8) {
            let isShowingExploreInlineRoute = coordinator.selectedTab == "Explore"
                && coordinator.selectedStation == nil
                && coordinator.previewJourney == nil
                && searchText.isEmpty
            if routeManager.isRouteActive
                && (!routeManager.isShowingRouteSheet || coordinator.selectedTab != "Explore")
                && !isShowingExploreInlineRoute {
                ActiveRouteResumePill(routeManager: routeManager)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }

            LiquidGlassFloatingTabBar(
                selectedTab: $coordinator.selectedTab,
                isMergedIntoSheet: false,
                expandProgress: 1.0,
                onSelectTab: { tab in
                    if tab == "AI" {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        #endif
                        coordinator.aiSheetDetent = .large
                        coordinator.showAIAssistant = true
                        return
                    }
                    if tab == "Explore" {
                        coordinator.selectedStation = nil
                    }
                    if isDuoPanelCollapsed {
                        withAnimation(.spring(response: 0.36, dampingFraction: 0.82)) {
                            isDuoPanelCollapsed = false
                        }
                    }
                }
            )
            .padding(.horizontal, -10)
        }
        .padding(.leading, 20)
        .padding(.trailing, 12)
        .padding(.bottom, 16)
        .padding(.top, 8)
    }

    // MARK: - Architecture Spatiale Localiser (Find My) iOS 26+
    // Couche 1 : Carte interactive plein écran (AppMapView)
    // Couche 2 : Feuille modale persistante native iOS 26 (sans .presentationBackground)
    // Couche 3 : Barre d'onglets Liquid Glass intégrée dans la sheet via .safeAreaInset(edge: .bottom),
    //            se morphant continûment (taille, marges, rayon de courbure et .glassEffect) entre .height(84) et .medium/.large
    private var classicSingleScreenLayout: some View {
        ZStack(alignment: .topTrailing) {
            AppMapView(showControls: true)
                .ignoresSafeArea()
        }
        // Feuille modale persistante native iOS 26
        // IMPORTANT : Aucun .presentationBackground() n'est appliqué afin de conserver
        // le matériau Liquid Glass concentrique automatique d'iOS 26 aux paliers .height(84) et .medium.
        .sheet(
            isPresented: Binding(
                get: { !showLoading },
                set: { _ in }
            )
        ) {
            flowSheetContainerView
                .presentationDetents(
                    [NavigationCoordinator.collapsedSheetDetent, .medium, .large],
                    selection: $coordinator.exploreSheetDetent
                )
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .medium)
                )
                .presentationContentInteraction(.scrolls)
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
                .environmentObject(coordinator)
        }
        .onChange(of: navigationManager.shouldSwitchToMap) { _, shouldSwitch in
            if shouldSwitch {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    coordinator.exploreSheetDetent = .medium
                }
                navigationManager.shouldSwitchToMap = false
            }
        }
        .onChange(of: coordinator.selectedStation?.id) { _, newId in
            if newId != nil {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    coordinator.exploreSheetDetent = .medium
                }
            }
        }
        .onChange(of: routeManager.isShowingRouteSheet) { _, isShowing in
            if isShowing {
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    coordinator.selectedTab = "Explore"
                    coordinator.exploreSheetDetent = .medium
                }
            }
        }
    }

    // MARK: - Conteneur de la Feuille Modale & Tab Bar Intégrée (Style Localiser iOS 26+)
    // Lorsque la feuille est rabattue au palier minimal (.height(84)), le contenu interne
    // s'estompe et se réduit doucement pendant que la Tab Bar se fond dans le verre de la sheet (.identity).
    // Lorsqu'elle s'étend vers .medium / .large, la Tab Bar se détache en capsule Liquid Glass flottante.
    @ViewBuilder
    private var flowSheetContainerView: some View {
        GeometryReader { sheetGeo in
            let isCollapsedDetent = (coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent)
            let rawProgress = (sheetGeo.size.height - 116.0) / 64.0
            let expandProgress = min(1.0, max(0.0, rawProgress))
            let shouldMergePlatter = isCollapsedDetent || (sheetGeo.size.height > 0 && sheetGeo.size.height < 124)
            let contentOpacity = shouldMergePlatter ? 0.0 : expandProgress

            ZStack(alignment: .bottom) {
                // Couche 1 : Contenu de l'onglet actif, borné et clippé à sheetGeo.size.height
                // pour que son en-tête ne pousse jamais la Tab Bar vers le bas lorsque la sheet est réduite.
                ZStack(alignment: .top) {
                    switch coordinator.selectedTab {
                    case "Explore":
                        exploreSheetTabContent
                    case "Nearby":
                        NearbyStationsView(embeddedInSheet: true)
                    case "Favorites":
                        FavoritesView()
                    case "Trafic":
                        NavigationStack {
                            TrafficViewContent()
                        }
                        .liquidGlassBackground()
                    default:
                        exploreSheetTabContent
                    }
                }
                .frame(width: sheetGeo.size.width, height: max(0, sheetGeo.size.height), alignment: .top)
                .clipped()
                .opacity(contentOpacity)
                .scaleEffect(0.96 + (0.04 * expandProgress), anchor: .bottom)
                .allowsHitTesting(contentOpacity > 0.05)

                // Couche 2 : Tab Bar UITabBar Liquid Glass native ancrée au bas de la sheet
                VStack(spacing: 8) {
                    let isShowingExploreInlineRoute = coordinator.selectedTab == "Explore"
                        && coordinator.selectedStation == nil
                        && coordinator.previewJourney == nil
                        && searchText.isEmpty
                    if routeManager.isRouteActive
                        && (!routeManager.isShowingRouteSheet || coordinator.selectedTab != "Explore")
                        && !isShowingExploreInlineRoute
                        && expandProgress > 0.2 {
                        ActiveRouteResumePill(routeManager: routeManager)
                            .padding(.horizontal, 16)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    LiquidGlassFloatingTabBar(
                        selectedTab: $coordinator.selectedTab,
                        isMergedIntoSheet: shouldMergePlatter,
                        expandProgress: expandProgress,
                        onSelectTab: { tab in
                            if tab == "AI" {
                                #if canImport(UIKit)
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                #endif
                                coordinator.aiSheetDetent = .large
                                coordinator.showAIAssistant = true
                                return
                            }
                            if tab == "Explore" && coordinator.exploreSheetDetent != NavigationCoordinator.collapsedSheetDetent {
                                coordinator.selectedStation = nil
                            }
                            if coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent {
                                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                                    coordinator.exploreSheetDetent = .medium
                                }
                            }
                        },
                        onVerticalSwipe: { isUpward in
                            withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                                if isUpward {
                                    if coordinator.exploreSheetDetent == NavigationCoordinator.collapsedSheetDetent {
                                        coordinator.exploreSheetDetent = .medium
                                    } else if coordinator.exploreSheetDetent == .medium {
                                        coordinator.exploreSheetDetent = .large
                                    }
                                } else {
                                    if coordinator.exploreSheetDetent == .large {
                                        coordinator.exploreSheetDetent = .medium
                                    } else if coordinator.exploreSheetDetent == .medium {
                                        coordinator.exploreSheetDetent = NavigationCoordinator.collapsedSheetDetent
                                    }
                                }
                            }
                        }
                    )
                    .padding(.horizontal, -8 + (2 * expandProgress))
                    .padding(.bottom, 8 + (4 * expandProgress))
                }
                .animation(.spring(response: 0.32, dampingFraction: 0.84), value: shouldMergePlatter)
            }
            .frame(width: sheetGeo.size.width, height: sheetGeo.size.height, alignment: .bottom)
            .onChange(of: shouldMergePlatter) { _, newValue in
                if coordinator.isSheetMergedWithTabBar != newValue {
                    coordinator.isSheetMergedWithTabBar = newValue
                }
            }
            .onChange(of: expandProgress) { _, newProgress in
                if abs(coordinator.sheetExpandProgress - newProgress) > 0.01 {
                    coordinator.sheetExpandProgress = newProgress
                }
            }
            .onAppear {
                if coordinator.isSheetMergedWithTabBar != shouldMergePlatter {
                    coordinator.isSheetMergedWithTabBar = shouldMergePlatter
                }
                coordinator.sheetExpandProgress = expandProgress
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scrollContentBackground(.hidden)
        .onChange(of: coordinator.exploreSheetDetent) { _, newDetent in
            let collapsed = (newDetent == NavigationCoordinator.collapsedSheetDetent)
            if coordinator.isSheetMergedWithTabBar != collapsed {
                coordinator.isSheetMergedWithTabBar = collapsed
            }
            if collapsed {
                #if canImport(UIKit)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                #endif
            }
        }
        .sheet(isPresented: $coordinator.showAIAssistant) {
            FlowAssistantView()
                .environmentObject(coordinator)
                .presentationDetents([.medium, .large], selection: $coordinator.aiSheetDetent)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .presentationContentInteraction(.scrolls)
                .presentationDragIndicator(.visible)
        }
    }

    @ViewBuilder
    private var exploreSheetTabContent: some View {
        if routeManager.isRouteActive && routeManager.isShowingRouteSheet,
           let journey = routeManager.activeJourney ?? navigationManager.currentJourney {
            ImmersiveNavigationView(
                journey: journey,
                selectedDetent: $coordinator.exploreSheetDetent,
                isFloating: false
            )
        } else if let station = coordinator.selectedStation {
            StationDetailSheet(
                station: station,
                onDismiss: {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        coordinator.selectedStation = nil
                    }
                },
                selectedDetent: $coordinator.exploreSheetDetent
            )
        } else if let previewJourney = coordinator.previewJourney {
            DuoJourneyPreviewPanel(journey: previewJourney)
        } else {
            EmbeddedSearchSheetContent(
                searchText: $searchText,
                selectedDetent: $coordinator.exploreSheetDetent,
                showsSearchBar: true,
                onSelectStation: { station in
                    withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                        coordinator.selectedStation = station
                        coordinator.exploreSheetDetent = .medium
                    }
                }
            )
        }
    }
}

// MARK: - TrafficViewContent
struct TrafficViewContent: View {
    @ObservedObject var service = TrafficService.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.duoPosture) private var duoPosture
    @State private var searchText: String = ""

    enum StatusFilter: String, CaseIterable, Identifiable {
        case all = "Tout"
        case interrupted = "Interruptions"
        case disrupted = "Perturbations"
        case works = "Travaux"
        case information = "Informations"

        var id: String { rawValue }

        var matchingStatus: LineStatus? {
            switch self {
            case .all: return nil
            case .interrupted: return .interrupted
            case .disrupted: return .disrupted
            case .works: return .works
            case .information: return .information
            }
        }
    }

    @State private var selectedFilter: StatusFilter = .all

    /// Types de transports structurants affichés par défaut (sans les bus)
    private let defaultTransportTypes: [TransportType] = [
        .metro, .rer, .tram, .transilien, .train, .cable
    ]

    var body: some View {
        VStack(spacing: 0) {
            LiquidGlassSheetHeader(
                title: "Trafic",
                subtitle: service.lastUpdateTime.map { "Mis à jour à \($0.formatted(date: .omitted, time: .shortened))" } ?? "Chargement de l'état du réseau..."
            ) {
                Button(action: {
                    service.refresh()
                }) {
                    Group {
                        if service.isRefreshing {
                            ProgressView()
                                .controlSize(.small)
                        } else {
                            Image(systemName: "arrow.clockwise")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.primary)
                        }
                    }
                    .frame(width: 36, height: 36)
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive(), in: Circle())
                .disabled(service.isRefreshing)
                .accessibilityLabel("Actualiser le trafic")
            } trailingContent: {
                Menu {
                    ForEach(StatusFilter.allCases) { filter in
                        Button(action: {
                            selectedFilter = filter
                        }) {
                            HStack {
                                Text(filter.rawValue)
                                if selectedFilter == filter {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 14, weight: .semibold))
                        Text(selectedFilter.rawValue)
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.down")
                            .font(.caption2.weight(.bold))
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 7)
                    .glassEffect(.regular.interactive(), in: .capsule)
                }
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    // Barre de recherche de ligne en Liquid Glass natif
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                            .font(.system(size: 15, weight: .semibold))

                        TextField("Rechercher une ligne (ex: 80, 1, A, T3a)...", text: $searchText)
                            .font(.system(.subheadline, design: .rounded))
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)

                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 15))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .glassEffect(.regular.interactive(), in: .capsule)
                    .padding(.horizontal, 16)

                    // Contenu : soit les résultats de recherche, soit la vue structurée par mode
                    if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        searchResultsView
                    } else {
                        defaultSectionsView
                    }
                }
                .padding(.top, 6)
                .padding(.bottom, 96)
            }
            .scrollContentBackground(.hidden)
        }
        .toolbar(.hidden, for: .navigationBar)
        .liquidGlassBackground()
    }

    // MARK: - Vue par défaut (Modes structurants)
    @ViewBuilder
    private var defaultSectionsView: some View {
        let isIPad = horizontalSizeClass == .regular

        // Réseaux structurants (Métro, RER, Tram, Transilien, Train, Câble)
        ForEach(defaultTransportTypes, id: \.self) { type in
            let filteredLines = lines(for: type)

            if !filteredLines.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text(type.rawValue.uppercased())
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.leading, 20)

                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: isIPad ? 96 : 74, maximum: isIPad ? 120 : 92), spacing: isIPad ? 16 : 12)
                        ], spacing: isIPad ? 16 : 12
                    ) {
                        ForEach(filteredLines) { line in
                            TrafficLineCell(line: line, isIPad: isIPad)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }

    // MARK: - Résultats de Recherche
    @ViewBuilder
    private var searchResultsView: some View {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let results = searchLines(query: trimmed)
        let isIPad = horizontalSizeClass == .regular

        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("RÉSULTATS POUR « \(trimmed) »")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(results.count) ligne\(results.count > 1 ? "s" : "")")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 20)

            if results.isEmpty {
                // Si aucune ligne existante ne correspond, proposer la ligne de bus recherchée
                let fallbackBusLine = TransportLine(
                    type: .bus,
                    lineId: trimmed.uppercased(),
                    status: .normal
                )

                VStack(spacing: 12) {
                    Text("Aucune perturbation signalée sur le réseau pour cette recherche.")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)

                    NavigationLink(destination: TrafficDetailView(line: fallbackBusLine)) {
                        HStack(spacing: 12) {
                            LineIcon(line: fallbackBusLine, size: 40)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Ligne de bus \(trimmed)")
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                Text("Trafic normal / Aucune alerte active")
                                    .font(.caption)
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(14)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 16)
                }
            } else {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: isIPad ? 96 : 74, maximum: isIPad ? 120 : 92), spacing: isIPad ? 16 : 12)
                    ], spacing: isIPad ? 16 : 12
                ) {
                    ForEach(results) { line in
                        TrafficLineCell(line: line, isIPad: isIPad)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }

    private func searchLines(query: String) -> [TransportLine] {
        let q = query.lowercased()
        let matching = service.lines.filter { line in
            let idMatch = line.lineId.lowercased().contains(q)
            let typeMatch = line.type.rawValue.lowercased().contains(q)
            let fullMatch = "\(line.type.rawValue.lowercased()) \(line.lineId.lowercased())".contains(q)
            return idMatch || typeMatch || fullMatch
        }

        if let targetStatus = selectedFilter.matchingStatus {
            return matching.filter { $0.status == targetStatus }
        }
        return matching
    }

    private func lines(for type: TransportType) -> [TransportLine] {
        let allLinesForType = service.lines.filter { $0.type == type }
        if let targetStatus = selectedFilter.matchingStatus {
            return allLinesForType.filter { $0.status == targetStatus }
        } else {
            return allLinesForType
        }
    }
}

struct TrafficLineCell: View {
    let line: TransportLine
    var isIPad: Bool = false

    @ObservedObject var favoritesService = FavoritesService.shared
    @Environment(\.colorScheme) private var colorScheme

    var isFav: Bool {
        favoritesService.isFavoriteLine(lineId: line.lineId, type: line.type)
    }

    var body: some View {
        NavigationLink(destination: TrafficDetailView(line: line)) {
            ZStack(alignment: .topLeading) {
                LineIcon(line: line, size: isIPad ? 68 : 56)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, isIPad ? 14 : 10)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
                    )

                if isFav {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: isIPad ? 15 : 13))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 1)
                        .padding(6)
                }
            }
        }
        .buttonStyle(.plain)
        .contextMenu {
            Button {
                favoritesService.toggleFavoriteLine(lineId: line.lineId, type: line.type)
            } label: {
                Label(
                    isFav ? "Retirer des favoris" : "Ajouter aux favoris",
                    systemImage: isFav ? "star.slash" : "star"
                )
            }
        }
    }
}

// MARK: - Barre d'onglets verticale Liquid Glass pour l'écran extérieur de l'iPhone Duo
private struct DuoVerticalLiquidGlassTabBar: View {
    @Binding var selectedTab: String
    var showAIAssistant: Bool
    var onSelectTab: (String) -> Void

    @Namespace private var tabSelectionNamespace

    var body: some View {
        VStack(spacing: 6) {
            ForEach(LiquidGlassTabItem.unifiedTabs) { tab in
                let isSelected = (tab.id != "AI" && selectedTab == tab.id)
                    || (tab.id == "AI" && showAIAssistant)

                Button {
                    #if canImport(UIKit)
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    #endif
                    withAnimation(.spring(response: 0.34, dampingFraction: 0.78)) {
                        if tab.id != "AI" {
                            selectedTab = tab.id
                        }
                        onSelectTab(tab.id)
                    }
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(
                                tab.id == "AI"
                                ? AnyShapeStyle(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                                : AnyShapeStyle(isSelected ? Color.blue : Color.primary.opacity(0.80))
                            )

                        Text(tab.label)
                            .font(.system(size: 8.5, weight: isSelected ? .bold : .medium, design: .rounded))
                            .foregroundStyle(isSelected ? Color.blue : Color.secondary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }
                    .frame(width: 50, height: 50)
                    .background {
                        if isSelected {
                            Circle()
                                .fill(tab.id == "AI" ? Color.purple.opacity(0.18) : Color.blue.opacity(0.16))
                                .glassEffect(.regular.interactive(), in: Circle())
                                .glassEffectID("duoOuterActiveTabPill", in: tabSelectionNamespace)
                        }
                    }
                    .contentShape(Circle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(tab.label)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 6)
        .glassEffect(.regular.interactive(), in: Capsule())
    }
}

#Preview {
    ContentView(showLoading: false)
}
