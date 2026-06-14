import SwiftData
import CoreLocation
import SwiftUI
import Combine
import MapKit

struct SearchTabContent: View {
    @Binding var searchText: String
    @State private var searchResults: [MapStation] = []
    @State private var selectedStation: MapStation?

    @EnvironmentObject var coordinator: NavigationCoordinator
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var historyManager = SearchHistoryManager.shared
    @ObservedObject var favoritesService = FavoritesService.shared
    @ObservedObject var mapData = MapDataService.shared

    @Environment(\.modelContext) private var context
    @State private var cancellables = Set<AnyCancellable>()
    
    // Live Map and Focus Interaction State
    @State private var userTrackingMode: MKUserTrackingMode = .none
    @State private var focusedSectionId: String? = nil

    var body: some View {
        NavigationStack {
            GlassEffectContainer(spacing: 0) {
                VStack(spacing: 0) {
                    stationSearchView
                }
            }
            .background {
                ZStack {
                    ShaderAnimationView(isLoading: true)
                    (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                        .background(.ultraThinMaterial.opacity(0.97))
                }
                .ignoresSafeArea()
            }
            .navigationTitle("Recherche")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Station Search View
    var stationSearchView: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                if searchText.isEmpty {
                    // MARK: Favorites Section
                    if !favoritesService.favoriteStationIds.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("Favoris")
                                    .font(.caption).bold()
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                            
                            ForEach(Array(favoritesService.favoriteStationIds), id: \.self) { stationId in
                                if let station = mapData.allStations.first(where: { $0.id == stationId })
                                    ?? mapData.getAllStationsSync().first(where: { $0.id == stationId })
                                {
                                    Button(action: {
                                        selectStation(station)
                                    }) {
                                        StationRow(station: station)
                                    }
                                    .buttonStyle(.plain)
                                    .padding(.horizontal)
                                }
                            }
                        }
                        
                        Divider()
                            .padding(.vertical, 4)
                    }
                    
                    // MARK: Recent Searches Section
                    if !historyManager.recentStations.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                    .foregroundColor(.secondary)
                                Text("Recherches récentes")
                                    .font(.caption).bold()
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                            
                            ForEach(historyManager.recentStations) { station in
                                Button(action: {
                                    selectStation(station)
                                }) {
                                    StationRow(station: station)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal)
                                
                                if station.id != historyManager.recentStations.last?.id {
                                    Divider().padding(.leading, 56)
                                }
                            }
                        }
                    }
                } else {
                    if searchResults.isEmpty {
                        VStack {
                            Spacer()
                            Text("Aucun résultat")
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        .frame(minHeight: 200)
                    } else {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(searchResults) { station in
                                Button(action: {
                                    selectStation(station)
                                }) {
                                    StationRow(station: station)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal)
                                
                                if station.id != searchResults.last?.id {
                                    Divider().padding(.leading, 56)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 100)
        }
        .safeAreaInset(edge: .bottom) {
            bottomSearchBar
        }
        .onChange(of: searchText) { _, newValue in
            performSearch(query: newValue)
        }
        .onAppear {
            historyManager.refreshHistory()
            if !searchText.isEmpty {
                performSearch(query: searchText)
            }
        }
    }
    
    var bottomSearchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Rechercher une station...", text: $searchText)
                .textFieldStyle(.plain)
                .font(.system(size: 16, weight: .medium))
            
            if !searchText.isEmpty {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.secondary)
                    .font(.system(size: 18))
                    .padding(8)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        searchText = ""
                    }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .glassEffect(.regular.interactive(), in: Capsule())
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
    



    func selectStation(_ station: MapStation) {
        // 1. Sauvegarder dans l'historique
        historyManager.addSearch(station)

        // 2. Notifier MapDataService
        MapDataService.shared.selectStation(station)

        // 3. Changer d'onglet vers Explore
        coordinator.switchToExplore()
    }

    func performSearch(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        // Normalize query: replace apostrophes with spaces to handle "d'Issy" -> "d Issy"
        let normalizedQuery = query.replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")

        // Tokenize query by spaces
        let tokens = normalizedQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }

        if tokens.isEmpty {
            searchResults = []
            return
        }

        // 1. Filtrer les stations ferroviaires (métro, RER, tram, transilien) chargées en mémoire
        let matchingRailStations = MapDataService.shared.allStations.filter { station in
            tokens.allSatisfy { token in
                station.name.localizedCaseInsensitiveContains(token)
            }
        }

        // 2. Chercher dans SwiftData uniquement pour les bus (optimisé par premier token)
        let token1 = tokens[0]
        var descriptor = FetchDescriptor<StopPointModel>(
            predicate: #Predicate<StopPointModel> { stop in
                stop.type == "Bus" && stop.name.contains(token1)
            },
            sortBy: [SortDescriptor(\.name, order: .forward)]
        )
        descriptor.fetchLimit = 150

        do {
            let busResults = try context.fetch(descriptor)
            
            // Filtrer en mémoire pour s'assurer que tous les tokens correspondent
            let filteredBus = busResults.filter { stop in
                tokens.allSatisfy { token in
                    stop.name.localizedCaseInsensitiveContains(token)
                }
            }
            
            let groupedBus = Dictionary(grouping: filteredBus) { "\($0.name)_\($0.city)" }

            let busStations: [MapStation] = groupedBus.compactMap { (_, stops) -> MapStation? in
                guard let first = stops.first else { return nil }
                let name = first.name

                let totalLat = stops.reduce(0.0) { $0 + $1.latitude }
                let totalLon = stops.reduce(0.0) { $0 + $1.longitude }
                let count = Double(stops.count)
                let center = CLLocationCoordinate2D(
                    latitude: totalLat / count, longitude: totalLon / count)

                let platforms = stops.map { entity -> StopPoint in
                    let coordinate = CLLocationCoordinate2D(
                        latitude: entity.latitude, longitude: entity.longitude)
                    let type = mapType(entity.type)

                    return StopPoint(
                        id: entity.id,
                        stopAreaId: entity.stopAreaId,
                        name: name,
                        coordinate: coordinate,
                        type: type,
                        lineName: entity.lineName
                    )
                }

                let stationId: String = first.stopAreaId.isEmpty ? first.id : first.stopAreaId

                let uniqueLines = Set(stops.map { entity in
                    StationLine(name: entity.lineName, type: mapType(entity.type))
                })
                let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }

                return MapStation(
                    id: stationId,
                    name: name,
                    coordinate: center,
                    platforms: platforms,
                    isHub: false,
                    mainType: .bus,
                    lines: sortedLines,
                    city: first.city.isEmpty ? "Paris" : first.city
                )
            }

            // 3. Combiner et trier
            var allResults = matchingRailStations + busStations
            allResults.sort { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
            searchResults = allResults

        } catch {
            print("❌ Search error: \(error)")
            // Fallback sur les stations ferrées trouvées en cas d'erreur CoreData
            searchResults = matchingRailStations
        }
    }

    private func mapType(_ typeStr: String) -> TransportType {
        let lower = typeStr.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        if lower.contains("rer") { return .rer }
        if lower.contains("metro") { return .metro }
        if lower.contains("tram") { return .tram }
        if lower.contains("train") || lower.contains("transilien") || lower.contains("rail") { return .transilien }
        return .bus
    }
}

struct StationRow: View {
    let station: MapStation

    private var transportModes: [TransportType] {
        let modes = Set(station.lines.map { $0.type })
        let nonBusModes = modes.filter { $0 != .bus }
        if !nonBusModes.isEmpty {
            return Array(nonBusModes).sorted { customPriority($0) > customPriority($1) }
        } else {
            return Array(modes).sorted { customPriority($0) > customPriority($1) }
        }
    }

    private var modesString: String {
        transportModes.map { $0.rawValue.capitalized }.joined(separator: ", ")
    }

    private var isMultiModal: Bool {
        transportModes.count > 1
    }

    private var displayedStationLines: [StationLine] {
        let allLines = station.lines
        let nonBusLines = allLines.filter { $0.type != .bus }
        
        if !nonBusLines.isEmpty {
            return nonBusLines.sorted { lhs, rhs in
                let lhsPriority = customPriority(lhs.type)
                let rhsPriority = customPriority(rhs.type)
                if lhsPriority != rhsPriority {
                    return lhsPriority > rhsPriority
                }
                
                // Same type: compare names
                let lhsName = lhs.name
                let rhsName = rhs.name
                let lhsIsNum = lhsName.allSatisfy { $0.isNumber }
                let rhsIsNum = rhsName.allSatisfy { $0.isNumber }
                if lhsIsNum && rhsIsNum {
                    if let lVal = Int(lhsName), let rVal = Int(rhsName) {
                        return lVal < rVal
                    }
                }
                return lhsName.localizedStandardCompare(rhsName) == .orderedAscending
            }
        } else {
            return []
        }
    }

    private func customPriority(_ type: TransportType) -> Int {
        type.priority
    }

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 8) {
                    Text(station.name)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 4) {
                        let lines = displayedStationLines
                        ForEach(lines.prefix(8), id: \.id) { line in
                            LineIcon(type: line.type, lineId: line.name, size: 16)
                        }
                        
                        if station.lines.contains(where: { $0.type == .bus }) {
                            Image("Bus")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                        }
                    }
                }
                
                if let city = station.city, !city.isEmpty {
                    Text(city)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                } else {
                    Text(modesString)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.secondary.opacity(0.5))
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }

    func iconName(for type: TransportType) -> String {
        switch type {
        case .metro: return "tram.fill"
        case .rer: return "tram.circle.fill"
        case .transilien: return "train.side.front.car"
        case .tram: return "tram"
        case .bus: return "bus"
        case .train: return "train.side.front.car"
        case .cable: return "tram.fill.tunnel"
        }
    }

    func color(for type: TransportType) -> Color {
        switch type {
        case .metro: return .blue
        case .rer: return .red
        case .transilien: return .green
        case .tram: return .purple
        case .bus: return .orange
        case .train: return .green
        case .cable: return .gray
        }
    }
}

#Preview {
    SearchTabContent(searchText: .constant(""))
        .environmentObject(NavigationCoordinator())
}


