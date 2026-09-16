import Combine
import SwiftUI
import MapKit
import SwiftData

private struct DuoTabItem: Identifiable {
    let id: String
    let icon: String
    let label: String
}

private let duoTabs: [DuoTabItem] = [
    DuoTabItem(id: "Explore", icon: "map", label: "Explore"),
    DuoTabItem(id: "Nearby", icon: "location.circle.fill", label: "Proximité"),
    DuoTabItem(id: "Favorites", icon: "star.fill", label: "Favoris"),
    DuoTabItem(id: "Trafic", icon: "tram.fill", label: "Trafic"),
    DuoTabItem(id: "Search", icon: "magnifyingglass", label: "Recherche")
]

struct ContentView: View {
    @StateObject private var coordinator = NavigationCoordinator.shared
    @ObservedObject private var navigationManager = NavigationManager.shared
    @ObservedObject private var mapData = MapDataService.shared
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

            ZStack {
                if posture == .unfoldedDualScreen {
                    duoDualScreenLayout
                } else {
                    classicSingleScreenLayout
                }

                if showLoading {
                    LoadingScreenView(isPresented: $showLoading)
                        .transition(.opacity)
                        .zIndex(999)
                }
            }
        }
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

    // MARK: - iPhone Duo Dual-Screen Layout
    private var duoDualScreenLayout: some View {
        DuoSplitView {
            VStack(spacing: 0) {
                duoTopBar

                if let selectedStation = coordinator.selectedStation {
                    StationDetailSheet(
                        station: selectedStation,
                        onDismiss: {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                coordinator.selectedStation = nil
                            }
                        }
                    )
                    .transition(.move(edge: .leading).combined(with: .opacity))
                } else {
                    duoTabContent
                        .transition(.opacity)
                }
            }
            .background(.ultraThinMaterial)
        } trailing: {
            AppMapView(showControls: true)
                .ignoresSafeArea()
        }
    }

    @ViewBuilder
    private var duoTabContent: some View {
        switch coordinator.selectedTab {
        case "Nearby":
            NearbyStationsView()
        case "Favorites":
            FavoritesView()
        case "Trafic":
            NavigationStack {
                TrafficViewContent()
                    .navigationTitle("Trafic")
            }
        case "Search":
            SearchTabContent(searchText: $searchText)
        default:
            NearbyStationsView()
        }
    }

    private var duoTopBar: some View {
        HStack(spacing: 6) {
            ForEach(duoTabs) { tab in
                let isSelected = coordinator.selectedTab == tab.id && coordinator.selectedStation == nil
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        coordinator.selectedStation = nil
                        coordinator.selectedTab = tab.id
                    }
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 14, weight: .semibold))
                        if isSelected {
                            Text(tab.label)
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundColor(isSelected ? .blue : .secondary)
                    .padding(.horizontal, isSelected ? 12 : 8)
                    .padding(.vertical, 8)
                    .background {
                        if isSelected {
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.primary.opacity(0.10), lineWidth: 1)
                                )
                        }
                    }
                }
                .buttonStyle(.liquidGlassInteractive)
            }
        }
        .padding(6)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(Color.primary.opacity(0.08), lineWidth: 1)
        )
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 6)
    }

    // MARK: - Single-Screen Standard Layout
    private var classicSingleScreenLayout: some View {
        TabView(selection: $coordinator.selectedTab) {
            Tab("Explore", systemImage: "map", value: "Explore") {
                AppMapView(showControls: true)
                    .ignoresSafeArea(edges: .top)
            }

            Tab("À Proximité", systemImage: "location.circle.fill", value: "Nearby") {
                NearbyStationsView()
            }

            Tab("Favoris", systemImage: "star.fill", value: "Favorites") {
                FavoritesView()
            }

            Tab("Trafic", systemImage: "tram.fill", value: "Trafic") {
                NavigationStack {
                    TrafficViewContent()
                        .navigationTitle("Trafic")
                }
            }

            Tab("Recherche", systemImage: "magnifyingglass", value: "Search", role: .search) {
                SearchTabContent(searchText: $searchText)
            }
        }
        .searchable(text: $searchText, prompt: "Rechercher une station...")
        .tabViewSearchActivation(.searchTabSelection)
        .accentColor(.blue)
#if os(iOS)
        .tabBarMinimizeBehavior(.onScrollDown)
#endif
        .onChange(of: navigationManager.shouldSwitchToMap) { _, shouldSwitch in
            if shouldSwitch {
                coordinator.selectedTab = "Explore"
                navigationManager.shouldSwitchToMap = false
            }
        }
    }
}

// MARK: - TrafficViewContent
struct TrafficViewContent: View {
    @StateObject var service = TrafficService()
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
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
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                // Header avec heure de dernière mise à jour
                HStack {
                    if let lastUpdate = service.lastUpdateTime {
                        let formatter = DateFormatter()
                        let _ = (formatter.dateFormat = "HH:mm")
                        Text("Dernière mise à jour: \(formatter.string(from: lastUpdate))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } else {
                        Text("Chargement...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Barre de recherche de ligne
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                        .font(.system(size: 16, weight: .semibold))

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
                                .font(.system(size: 16))
                        }
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                )
                .padding(.horizontal)

                // Filtres par statut
                HStack {
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
                        HStack(spacing: 8) {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .foregroundColor(.blue)
                                .frame(width: 20, height: 20)
                            Text(selectedFilter.rawValue)
                                .font(.system(.subheadline, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.liquidGlassInteractive)

                    Spacer()
                }
                .padding(.horizontal)

                // Contenu : soit les résultats de recherche, soit la vue structurée par mode
                if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    searchResultsView
                } else {
                    defaultSectionsView
                }
            }
            .padding(.vertical)
        }
        .refreshable {
            await withCheckedContinuation { continuation in
                service.refresh()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    continuation.resume()
                }
            }
        }
        .background {
            ZStack {
                ShaderAnimationView(isLoading: true)
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(colorScheme == .dark ? 0.70 : 0.85)
            }
            .ignoresSafeArea()
        }
    }

    // MARK: - Vue par défaut (Modes structurants & bus perturbés)
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

                    GlassEffectContainer(spacing: isIPad ? 20 : 16) {
                        LazyVGrid(
                            columns: [
                                GridItem(.adaptive(minimum: isIPad ? 100 : 80, maximum: isIPad ? 130 : 100), spacing: isIPad ? 20 : 16)
                            ], spacing: isIPad ? 20 : 16
                        ) {
                            ForEach(filteredLines) { line in
                                TrafficLineCell(line: line, isIPad: isIPad)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }

        // Section Bus (Perturbations en cours uniquement s'il y en a)
        let activeBusLines = service.lines.filter { line in
            line.type == .bus && line.status != .normal
        }

        if !activeBusLines.isEmpty && (selectedFilter == .all || selectedFilter.matchingStatus != nil) {
            let filteredBus = activeBusLines.filter { line in
                selectedFilter == .all ? true : line.status == selectedFilter.matchingStatus
            }

            if !filteredBus.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 6) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                            .font(.caption)
                        Text("BUS PERTURBÉS EN COURS")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    .padding(.leading, 20)

                    GlassEffectContainer(spacing: isIPad ? 20 : 16) {
                        LazyVGrid(
                            columns: [
                                GridItem(.adaptive(minimum: isIPad ? 100 : 80, maximum: isIPad ? 130 : 100), spacing: isIPad ? 20 : 16)
                            ], spacing: isIPad ? 20 : 16
                        ) {
                            ForEach(filteredBus) { line in
                                TrafficLineCell(line: line, isIPad: isIPad)
                            }
                        }
                    }
                    .padding(.horizontal)
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
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.liquidGlassInteractive)
                }
                .padding(.horizontal)
            } else {
                GlassEffectContainer(spacing: isIPad ? 20 : 16) {
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: isIPad ? 100 : 80, maximum: isIPad ? 130 : 100), spacing: isIPad ? 20 : 16)
                        ], spacing: isIPad ? 20 : 16
                    ) {
                        ForEach(results) { line in
                            TrafficLineCell(line: line, isIPad: isIPad)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private func searchLines(query: String) -> [TransportLine] {
        let cleanQuery = query.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .replacingOccurrences(of: " ", with: "")
        
        return service.lines.filter { line in
            // Filtre de statut
            if selectedFilter != .all, line.status != selectedFilter.matchingStatus {
                return false
            }

            let id = line.lineId.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                .replacingOccurrences(of: " ", with: "")
            let typeName = line.type.rawValue.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                .replacingOccurrences(of: " ", with: "")

            // Match direct par ID (ex: "80", "1", "A", "T3a", "FUN")
            if id == cleanQuery {
                return true
            }
            if id.contains(cleanQuery) {
                return true
            }
            // Match avec type (ex: "bus80", "metro1", "rerA")
            let fullCombined = "\(typeName)\(id)"
            if fullCombined.contains(cleanQuery) {
                return true
            }

            return false
        }
    }

    private func lines(for type: TransportType) -> [TransportLine] {
        let filtered = service.lines.filter { line in
            if selectedFilter == .all {
                return line.type == type
            } else {
                return line.type == type && line.status == selectedFilter.matchingStatus
            }
        }
        
        return filtered.sorted { lhs, rhs in
            let lhsId = lhs.lineId
            let rhsId = rhs.lineId
            
            let lhsStartsWithNumber = lhsId.first?.isNumber ?? false
            let rhsStartsWithNumber = rhsId.first?.isNumber ?? false
            
            if lhsStartsWithNumber && rhsStartsWithNumber {
                let lhsNumPrefix = lhsId.prefix { $0.isNumber }
                let rhsNumPrefix = rhsId.prefix { $0.isNumber }
                if let lInt = Int(lhsNumPrefix), let rInt = Int(rhsNumPrefix) {
                    if lInt != rInt {
                        return lInt < rInt
                    }
                }
                return lhsId.localizedStandardCompare(rhsId) == .orderedAscending
            } else if lhsStartsWithNumber {
                return true
            } else if rhsStartsWithNumber {
                return false
            } else {
                return lhsId.localizedStandardCompare(rhsId) == .orderedAscending
            }
        }
    }
}

private struct TrafficLineCell: View {
    let line: TransportLine
    let isIPad: Bool

    var body: some View {
        NavigationLink(destination: TrafficDetailView(line: line)) {
            LineIcon(line: line, size: isIPad ? 70 : 55)
                .frame(width: isIPad ? 100 : 80, height: isIPad ? 100 : 80)
                .overlay(alignment: .bottomTrailing) {
                    statusBadge
                }
        }
        .buttonStyle(.liquidGlassInteractive)
        .glassEffect(.regular.interactive(), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    @ViewBuilder
    private var statusBadge: some View {
        if line.status != .normal {
            Image(systemName: line.status.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(5)
                .foregroundColor(.white)
                .background(line.status.color)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.regularMaterial, lineWidth: 2)
                )
                .offset(x: 8, y: 8)
        }
    }
}

#Preview {
    ContentView(showLoading: false)
}

#Preview("Traffic Line Picker") {
    NavigationStack {
        TrafficViewContent()
            .navigationTitle("Trafic")
    }
}
