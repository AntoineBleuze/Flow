import Combine
import SwiftUI
import MapKit
import SwiftData

struct ContentView: View {
    @StateObject private var coordinator = NavigationCoordinator.shared
    @ObservedObject private var navigationManager = NavigationManager.shared
    @ObservedObject private var routeManager = RouteNavigationManager.shared
    @ObservedObject private var mapData = MapDataService.shared
    @StateObject private var voiceManager = VoiceDictationManager.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchText = ""
    @State private var showLoading: Bool

    init(showLoading: Bool = true) {
        _showLoading = State(initialValue: showLoading)
    }

    var body: some View {
        GeometryReader { geometry in
            let posture = DuoLayoutHelper.posture(
                horizontalSizeClass: horizontalSizeClass,
                screenSize: geometry.size
            )
            let minDim = min(geometry.size.width, geometry.size.height)
            let maxDim = max(geometry.size.width, geometry.size.height)
            let isDuoOuterScreen = (posture == .foldedSingleScreen)
                && (minDim >= 450 && maxDim <= 720 && geometry.size.width < 650)

            ZStack {
                switch posture {
                case .unfoldedDualScreen:
                    duoDualScreenLayout
                        .environment(\.duoPosture, .unfoldedDualScreen)
                case .foldedSingleScreen:
                    classicSingleScreenLayout(isDuoOuterScreen: isDuoOuterScreen)
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                if showLoading {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showLoading = false
                    }
                }
            }
        }
    }

    private var supportsCompactRouteDetent: Bool {
        routeManager.isRouteActive || coordinator.previewJourney != nil
    }

    private var activeSheetDetents: Set<PresentationDetent> {
        if supportsCompactRouteDetent {
            return [
                NavigationCoordinator.collapsedSheetDetent,
                NavigationCoordinator.compactRouteSheetDetent,
                .medium,
                .large
            ]
        } else {
            return [
                NavigationCoordinator.collapsedSheetDetent,
                .medium,
                .large
            ]
        }
    }

    // MARK: - iPhone Duo Dual-Screen Layout (Design de main)
    private var duoDualScreenLayout: some View {
        DuoSplitView {
            VStack(spacing: 0) {
                if let journey = navigationManager.currentJourney, navigationManager.isNavigating {
                    DuoNavigationPanel(journey: journey)
                        .flowAdaptiveBackground()
                        .transition(.move(edge: .leading).combined(with: .opacity))
                } else if let selectedStation = coordinator.selectedStation {
                    StationDetailSheet(
                        station: selectedStation,
                        onDismiss: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                coordinator.selectedStation = nil
                                coordinator.previewJourney = nil
                            }
                        }
                    )
                    .transition(.move(edge: .leading).combined(with: .opacity))
                } else if let previewJourney = coordinator.previewJourney {
                    DuoJourneyPreviewPanel(journey: previewJourney)
                        .flowAdaptiveBackground()
                        .transition(.move(edge: .leading).combined(with: .opacity))
                } else {
                    duoTabContent
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            TransparentHostingView()
                                .ignoresSafeArea()
                        }
                        .transition(.opacity)

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
    }

    @ViewBuilder
    private var duoTabContent: some View {
        switch coordinator.selectedTab {
        case "Explore":
            DuoExplorePanelView(searchText: $searchText)
        case "Nearby":
            NearbyStationsView()
        case "Favorites":
            FavoritesView()
        case "Trafic":
            NavigationStack {
                TrafficViewContent()
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        default:
            DuoExplorePanelView(searchText: $searchText)
        }
    }

    // MARK: - Duo Bottom Floating Dock (Search Bar + Native Tab Bar Concentric with Chassis)
    private var duoBottomDock: some View {
        VStack(spacing: 8) {
            if routeManager.isRouteActive && (!routeManager.isShowingRouteSheet || coordinator.selectedTab != "Explore") {
                ActiveRouteResumePill(routeManager: routeManager)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }

            duoSearchBar

            LiquidGlassFloatingTabBar(
                selectedTab: $coordinator.selectedTab,
                isMergedIntoSheet: false,
                expandProgress: 1.0,
                onSelectTab: { tab in
                    if tab == "AI" {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        #endif
                        coordinator.aiSheetDetent = .medium
                        coordinator.showAIAssistant = true
                        return
                    }
                    coordinator.selectedStation = nil
                }
            )
            .padding(.horizontal, -10)
        }
        .padding(.leading, 24)
        .padding(.trailing, 16)
        .padding(.bottom, 24)
        .padding(.top, 4)
    }

    private var duoSearchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
                .font(.system(size: 15, weight: .medium))

            TextField("Rechercher station, ligne...", text: $searchText)
                .font(.system(.subheadline, design: .rounded))
                .submitLabel(.search)
                .onSubmit {
                    if !searchText.isEmpty {
                        coordinator.selectedTab = "Explore"
                    }
                }
                .onChange(of: searchText) { _, newValue in
                    if !newValue.isEmpty && coordinator.selectedTab != "Explore" {
                        coordinator.selectedTab = "Explore"
                    }
                }

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

            Button(action: {
                voiceManager.toggleRecording(
                    onUpdate: { transcript in
                        searchText = transcript
                    },
                    onFinished: { finalTranscript in
                        searchText = finalTranscript
                        if !finalTranscript.isEmpty {
                            coordinator.selectedTab = "Explore"
                        }
                    }
                )
            }) {
                Image(systemName: voiceManager.isRecording ? "waveform.circle.fill" : "mic.fill")
                    .foregroundColor(voiceManager.isRecording ? .red : .secondary)
                    .font(.system(size: 15, weight: .semibold))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .glassEffect(.regular.interactive(), in: Capsule())
    }

    // MARK: - Architecture Spatiale Localiser (Find My) iOS 26+
    // Couche 1 : Carte interactive plein écran (AppMapView)
    // Couche 2 : Feuille modale persistante native iOS 26 (sans .presentationBackground)
    // Couche 3 : Barre d'onglets Liquid Glass intégrée dans la sheet via .safeAreaInset(edge: .bottom),
    //            se morphant continûment (taille, marges, rayon de courbure et .glassEffect) entre .height(84) et .medium/.large
    private func classicSingleScreenLayout(isDuoOuterScreen: Bool) -> some View {
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
            flowSheetContainerView(isDuoOuterScreen: isDuoOuterScreen)
                .background {
                    if isDuoOuterScreen {
                        DuoOuterSheetSizingHelper(targetWidth: 406)
                    }
                }
                .presentationDetents(
                    activeSheetDetents,
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
        .onChange(of: supportsCompactRouteDetent) { _, supported in
            if !supported && coordinator.exploreSheetDetent == NavigationCoordinator.compactRouteSheetDetent {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                    coordinator.exploreSheetDetent = .medium
                }
            }
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
    private func flowSheetContainerView(isDuoOuterScreen: Bool) -> some View {
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
                                coordinator.aiSheetDetent = .medium
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
                                        coordinator.exploreSheetDetent = supportsCompactRouteDetent
                                            ? NavigationCoordinator.compactRouteSheetDetent
                                            : .medium
                                    } else if coordinator.exploreSheetDetent == NavigationCoordinator.compactRouteSheetDetent {
                                        coordinator.exploreSheetDetent = .medium
                                    } else if coordinator.exploreSheetDetent == .medium {
                                        coordinator.exploreSheetDetent = .large
                                    }
                                } else {
                                    if coordinator.exploreSheetDetent == .large {
                                        coordinator.exploreSheetDetent = .medium
                                    } else if coordinator.exploreSheetDetent == .medium {
                                        coordinator.exploreSheetDetent = supportsCompactRouteDetent
                                            ? NavigationCoordinator.compactRouteSheetDetent
                                            : NavigationCoordinator.collapsedSheetDetent
                                    } else if coordinator.exploreSheetDetent == NavigationCoordinator.compactRouteSheetDetent {
                                        coordinator.exploreSheetDetent = NavigationCoordinator.collapsedSheetDetent
                                    }
                                }
                            }
                        }
                    )
                    .padding(.horizontal, isDuoOuterScreen ? 6 : (-8 + (2 * expandProgress)))
                    .padding(.bottom, (isDuoOuterScreen ? 10 : 8) + (4 * expandProgress))
                }
                .animation(.spring(response: 0.32, dampingFraction: 0.84), value: shouldMergePlatter)
            }
            .frame(width: sheetGeo.size.width, height: sheetGeo.size.height, alignment: .bottom)
            .onChange(of: shouldMergePlatter) { _, newValue in
                if coordinator.isSheetMergedWithTabBar != newValue {
                    coordinator.isSheetMergedWithTabBar = newValue
                }
            }
            .onChange(of: sheetGeo.size.height) { _, newHeight in
                if abs(coordinator.sheetHeight - newHeight) > 16.0 {
                    coordinator.sheetHeight = newHeight
                }
            }
            .onAppear {
                if coordinator.isSheetMergedWithTabBar != shouldMergePlatter {
                    coordinator.isSheetMergedWithTabBar = shouldMergePlatter
                }
                coordinator.sheetHeight = sheetGeo.size.height
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
                if coordinator.selectedStation != nil {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        coordinator.selectedStation = nil
                    }
                }
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

#if canImport(UIKit)
private struct DuoOuterSheetSizingHelper: UIViewControllerRepresentable {
    let targetWidth: CGFloat

    func makeUIViewController(context: Context) -> HelperVC {
        let vc = HelperVC()
        vc.targetWidth = targetWidth
        return vc
    }

    func updateUIViewController(_ uiViewController: HelperVC, context: Context) {
        uiViewController.targetWidth = targetWidth
        uiViewController.applySizing()
    }

    final class HelperVC: UIViewController {
        var targetWidth: CGFloat = 406

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            applySizing()
        }

        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            applySizing()
        }

        func applySizing() {
            guard let presentingHost = parent ?? self.presentingViewController?.presentedViewController else { return }
            presentingHost.preferredContentSize = CGSize(width: targetWidth, height: 0)
            if let sheet = presentingHost.sheetPresentationController {
                sheet.prefersPageSizing = false
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            }
        }
    }
}
#else
private struct DuoOuterSheetSizingHelper: View {
    let targetWidth: CGFloat
    var body: some View { Color.clear }
}
#endif

#Preview {
    ContentView(showLoading: false)
}
