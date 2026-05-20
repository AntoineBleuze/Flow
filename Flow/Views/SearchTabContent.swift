import CoreData
import CoreLocation
import SwiftUI
import Combine

struct SearchTabContent: View {
    @Binding var searchText: String
    @State private var searchResults: [MapStation] = []
    @State private var selectedStation: MapStation?

    @EnvironmentObject var coordinator: NavigationCoordinator
    @ObservedObject var historyManager = SearchHistoryManager.shared
    @ObservedObject var favoritesService = FavoritesService.shared
    @ObservedObject var mapData = MapDataService.shared

    let context = PersistenceController.shared.container.viewContext
    @State private var cancellables = Set<AnyCancellable>()
    
    // Itinerary State
    @State private var searchMode: SearchMode = .station
    @State private var startStation: MapStation?
    @State private var endStation: MapStation?
    @State private var departureDate = Date()
    @State private var isArrivalTime = false
    @State private var itineraryResults: [Journey] = []
    @State private var selectedJourney: Journey?
    @State private var itineraryPanelState: ItineraryPanelState = .expanded
    
    enum SearchMode: String, CaseIterable {
        case station = "Stations"
        case itinerary = "Itinéraire"
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Picker("Mode", selection: $searchMode) {
                    ForEach(SearchMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                .background(.ultraThinMaterial.opacity(0.5))
                .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                .padding(.top, 8)
                
                if searchMode == .station {
                    stationSearchView
                } else {
                    itinerarySearchView
                }
            }
            .background {
                AdaptiveMapBackground()
            }
            .navigationTitle("Recherche")
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
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
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
    
    // MARK: - Itinerary Search View
    var itinerarySearchView: some View {
        VStack {
            ItinerarySearchPanel(
                startStation: $startStation,
                endStation: $endStation,
                departureDate: $departureDate,
                isArrivalTime: $isArrivalTime,
                journeys: $itineraryResults,
                selectedJourney: $selectedJourney,
                panelState: $itineraryPanelState,
                onSearch: performItinerarySearch,
                onSwap: {
                    let temp = startStation
                    startStation = endStation
                    endStation = temp
                },
                onCurrentLocation: {
                   if let coord = LocationManager.shared.userLocation {
                       startStation = MapStation(id: "user-location", name: "Ma position", coordinate: coord, platforms: [], isHub: false, mainType: .bus, lines: [])
                   }
                },
                onStartNavigation: {
                    print("🔘 Start Navigation Button Tapped")
                    if let journey = selectedJourney {
                        print("🚀 Launching Journey: \(journey.id)")
                        // 1. Direct Start
                        NavigationManager.shared.startNavigation(journey: journey)
                        // 2. Direct Switch
                        coordinator.switchToExplore()
                    } else {
                        print("⚠️ No selected journey to start")
                    }
                }
            )
            Spacer()
        }
    }
    
    func performItinerarySearch() {
        guard let start = startStation, let end = endStation else { return }
        
        IDFMItineraryService.shared.searchItinerary(
            from: start.coordinate,
            to: end,
            date: departureDate,
            isArrival: isArrivalTime
        )
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { _ in }, receiveValue: { results in
            self.itineraryResults = results
            withAnimation {
                self.itineraryPanelState = .results
            }
        })
        .store(in: &cancellables) // Need to add cancellables set
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

        let request: NSFetchRequest<StopPointEntity> = StopPointEntity.fetchRequest()

        // Normalize query: replace apostrophes with spaces to handle "d'Issy" -> "d Issy"
        let normalizedQuery = query.replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")

        // Tokenize query by spaces
        let tokens = normalizedQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }

        if tokens.isEmpty {
            searchResults = []
            return
        }

        // Create AND predicate for all tokens
        let predicates = tokens.map { token in
            NSPredicate(format: "name CONTAINS[cd] %@", token)
        }
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)

        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.fetchLimit = 50

        do {
            let results = try context.fetch(request)
            let grouped = Dictionary(grouping: results) { "\($0.name ?? "")_\($0.city ?? "")" }

            let stations: [MapStation] = grouped.compactMap { (_, stops) -> MapStation? in
                guard let first = stops.first,
                    let name = first.name
                else { return nil }

                let totalLat = stops.reduce(0.0) { $0 + $1.latitude }
                let totalLon = stops.reduce(0.0) { $0 + $1.longitude }
                let count = Double(stops.count)
                let center = CLLocationCoordinate2D(
                    latitude: totalLat / count, longitude: totalLon / count)

                let types = stops.compactMap { $0.type }
                let mainTypeStr =
                    types.first(where: { $0 == "RER" }) ?? types.first(where: { $0 == "Transilien" }
                    ) ?? types.first(where: { $0 == "Metro" }) ?? types.first ?? "Bus"

                let type = mapType(mainTypeStr)

                let platforms = stops.compactMap { entity -> StopPoint? in
                    guard let id = entity.id,
                        let name = entity.name,
                        let typeStr = entity.type,
                        let lineName = entity.lineName
                    else { return nil }

                    let coordinate = CLLocationCoordinate2D(
                        latitude: entity.latitude, longitude: entity.longitude)
                    let type = mapType(typeStr)

                    return StopPoint(
                        id: id,
                        stopAreaId: entity.stopAreaId ?? "",
                        name: name,
                        coordinate: coordinate,
                        type: type,
                        lineName: lineName
                    )
                }

                // MapStation.id is String, not UUID
                let stationId: String = first.id ?? UUID().uuidString

                let uniqueLines = Set(stops.compactMap { entity -> StationLine? in
                    guard let lineName = entity.lineName, let typeStr = entity.type else { return nil }
                    return StationLine(name: lineName, type: mapType(typeStr))
                })
                let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }

                return MapStation(
                    id: stationId,
                    name: name,
                    coordinate: center,
                    platforms: platforms,
                    isHub: false,
                    mainType: type,
                    lines: sortedLines
                )
            }

            searchResults = stations.sorted { $0.name < $1.name }

        } catch {
            print("❌ Search error: \(error)")
        }
    }

    private func mapType(_ typeStr: String) -> TransportType {
        let lower = typeStr.lowercased()
        if lower.contains("rer") { return .rer }
        if lower.contains("metro") { return .metro }
        if lower.contains("tram") { return .tram }
        if lower.contains("train") || lower.contains("transilien") { return .transilien }
        return .bus
    }
}

struct StationRow: View {
    let station: MapStation

    private var transportModes: [TransportType] {
        let modes = Set(station.lines.map { $0.type })
        return Array(modes).sorted { $0.priority > $1.priority }
    }

    private var modesString: String {
        transportModes.map { $0.rawValue.capitalized }.joined(separator: ", ")
    }

    private var isMultiModal: Bool {
        transportModes.count > 1
    }

    var body: some View {
        HStack(spacing: 16) {
            // Icon with soft glass circle
            ZStack {
                Circle()
                    .fill((isMultiModal ? .blue : color(for: station.mainType)).opacity(0.15))
                    .frame(width: 40, height: 40)
                    .glassEffect(.standard, in: Circle())
                
                Image(systemName: isMultiModal ? "train.side.front.car" : iconName(for: station.mainType))
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(isMultiModal ? .blue : color(for: station.mainType))
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(station.name)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.primary)
                
                Text(modesString)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
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

