import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = NavigationCoordinator()
    @ObservedObject private var navigationManager = NavigationManager.shared
    @State private var searchText = ""

    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            Tab("Explore", systemImage: "map", value: "Explore") {
                AppMapView(showControls: true)
                    .ignoresSafeArea(edges: .top)
            }

            Tab("À Proximité", systemImage: "location.circle.fill", value: "Nearby") {
                NavigationStack {
                    NearbyStationsView()
                }
            }

            Tab("Trafic", systemImage: "tram.fill", value: "Trafic") {
                NavigationStack {
                    TrafficViewContent()
                        .navigationTitle("Trafic")
                }
            }

            Tab("Favoris", systemImage: "star.fill", value: "Favoris") {
                NavigationStack {
                    FavoritesViewContent()
                        .navigationTitle("Favoris")
                }
            }

            Tab(value: "Search", role: .search) {
                SearchTabContent(searchText: $searchText)
            }
        }
        .accentColor(.blue)
        .environmentObject(coordinator)
        // Auto-switch to Explore when navigation starts
        .onChange(of: navigationManager.shouldSwitchToMap) { _, shouldSwitch in
            if shouldSwitch {
                coordinator.selectedTab = "Explore"
                navigationManager.shouldSwitchToMap = false
            }
        }
    }
}

// --- COMPOSANTS DE CONTENU (Adaptés pour être dans une NavigationView) ---

struct TrafficViewContent: View {
    @StateObject var service = TrafficService()

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
        NavigationStack {
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
                        .glassEffect(.standard.interactive(), in: Capsule())
                        .overlay(
                            Capsule()
                                .stroke(
                                    Color.blue.opacity(0.3),
                                    lineWidth: 1)
                        )
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

                                // Grid Layout
                                LazyVGrid(
                                    columns: [
                                        GridItem(.adaptive(minimum: 80, maximum: 100), spacing: 16)
                                    ], spacing: 16
                                ) {
                                    ForEach(filteredLines) { line in
                                        NavigationLink(destination: TrafficDetailView(line: line)) {
                                            ZStack {
                                                // Main Icon
                                                LineIcon(line: line, size: 55)
                                                    .frame(width: 80, height: 80)
                                                    .glassEffect(
                                                        .standard.interactive(),
                                                        in: .rect(cornerRadius: 16))

                                                // Status Badge Overlay - positionné en bas à droite
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
                                                                .stroke(
                                                                    .regularMaterial, lineWidth: 2)
                                                        )
                                                        .offset(x: 28, y: 28)
                                                }
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
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
                AdaptiveMapBackground()
            }
            .navigationTitle("Trafic")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private func lines(for type: TransportType) -> [TransportLine] {
        service.lines.filter { line in
            if selectedFilter == .all {
                return line.type == type
            } else {
                return line.type == type && line.status == selectedFilter.matchingStatus
            }
        }
    }
}

struct FavoritesViewContent: View {
    @ObservedObject var favoritesService = FavoritesService.shared
    @StateObject var mapData = MapDataService.shared

    var body: some View {
        NavigationStack {
            ScrollView {
                if favoritesService.favoriteStationIds.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "star.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Aucun favori pour le moment")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Ajoutez des stations depuis la carte pour les voir ici.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 100)
                } else {
                    VStack(spacing: 15) {
                        ForEach(Array(favoritesService.favoriteStationIds), id: \.self) {
                            stationId in
                            if let station = mapData.visibleStations.first(where: {
                                $0.id == stationId
                            })
                                ?? mapData.getAllStationsSync().first(where: {
                                    $0.id == stationId
                                })
                            {
                                NavigationLink(
                                    destination: StationDetailScreen(station: station)
                                ) {
                                    FavoriteStationRow(station: station)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)
                }
            }
            .background {
                AdaptiveMapBackground()
            }
            .navigationTitle("Favoris")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct FavoriteStationRow: View {
    let station: MapStation
    @State private var nextDepartures: [String] = []
    @State private var isLoading = true

    var body: some View {
        HStack {
            // Icone Type
            TransportTypeIcon(type: station.mainType)
                .frame(width: 40, height: 40)

            VStack(alignment: .leading) {
                Text(station.name)
                    .font(.headline)

                if isLoading {
                    Text("Chargement...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else if nextDepartures.isEmpty {
                    Text("Aucun départ proche")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    Text("Prochains: " + nextDepartures.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .lineLimit(1)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding()
        .glassEffect(.standard.interactive(), in: RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
        .onAppear {
            loadPreview()
        }
    }

    private func loadPreview() {
        // Chargement léger pour l'aperçu (juste les 2 prochains départs tout confondu)
        let stopIds = station.platforms.map { $0.id }
        guard let firstId = stopIds.first else { return }

        // On prend juste le premier arrêt pour l'aperçu rapide pour éviter de spammer l'API
        // Idéalement il faudrait une requête agrégée ou stocker le dernier état
        IDFMService.shared.fetchDepartures(for: firstId)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in isLoading = false },
                receiveValue: { deps in
                    let sorted = deps.sorted {
                        $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                    }
                    self.nextDepartures = sorted.prefix(2).compactMap { dep in
                        let dateStr = dep.stopDateTime.departureDateTime
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
                        if let date = formatter.date(from: dateStr) {
                            let diff = Int(date.timeIntervalSinceNow / 60)
                            if diff <= 0 { return "Maintenant" }
                            return "\(diff) min"
                        }
                        return nil
                    }
                }
            )
            .store(in: &cancellables)
    }

    @State private var cancellables = Set<AnyCancellable>()
}

#Preview {
    ContentView()
}
