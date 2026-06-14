import Combine
import SwiftUI
import MapKit
import SwiftData

struct ContentView: View {
    @StateObject private var coordinator = NavigationCoordinator()
    @ObservedObject private var navigationManager = NavigationManager.shared
    @ObservedObject private var mapData = MapDataService.shared
    @State private var searchText = ""
    @State private var showLoading = true

    var body: some View {
        ZStack {
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

                Tab(value: "Search", role: .search) {
                    SearchTabContent(searchText: $searchText)
                }
            }
            .accentColor(.blue)
            .environmentObject(coordinator)
#if os(iOS)
            .tabBarMinimizeBehavior(.onScrollDown)
#endif
            // Auto-switch to Explore when navigation starts
            .onChange(of: navigationManager.shouldSwitchToMap) { _, shouldSwitch in
                if shouldSwitch {
                    coordinator.selectedTab = "Explore"
                    navigationManager.shouldSwitchToMap = false
                }
            }

            if showLoading {
                LoadingScreenView(isPresented: $showLoading)
                    .transition(.opacity)
                    .zIndex(999)
            }
        }
        .onAppear {
            // Safety timeout: dismiss loading screen after 5 seconds under any circumstance
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                if showLoading {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        showLoading = false
                    }
                }
            }
        }
    }
}

// --- COMPOSANTS DE CONTENU (Adaptés pour être dans une NavigationView) ---

struct TrafficViewContent: View {
    @StateObject var service = TrafficService()
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme

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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
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

                // Status Filter Menu
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
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.down")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(.ultraThinMaterial.opacity(0.97))
                    .clipShape(Capsule())
                }
                .padding(.horizontal)

                // Filtered Lines by Status
                ForEach(TransportType.allCases) { type in
                    let filteredLines = lines(for: type)

                    if !filteredLines.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(type.rawValue.uppercased())
                                .font(.caption).bold()
                                .foregroundColor(.secondary)
                                .padding(.leading, 20)

                            // Grid Layout — adaptive for iPad
                            let isIPad = horizontalSizeClass == .regular
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
            }
            .padding(.vertical)
        }
        .refreshable {
            await withCheckedContinuation { continuation in
                service.refresh()
                // Wait for refresh to complete
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    continuation.resume()
                }
            }
        }
        .background {
            ZStack {
                ShaderAnimationView(isLoading: true)
                (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                    .background(.ultraThinMaterial.opacity(0.65))
            }
            .ignoresSafeArea()
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

// Sous-vue extraite pour éviter "unable to type-check this expression in reasonable time"
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
        .buttonStyle(.plain)
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
    let _ = {
        LocationManager.shared.isSimulating = true
        LocationManager.shared.simulateLocation(latitude: 48.8566, longitude: 2.3522)
    }()
    return ContentView()
}

#Preview("Traffic Line Picker") {
    NavigationStack {
        TrafficViewContent()
            .navigationTitle("Trafic")
    }
}
