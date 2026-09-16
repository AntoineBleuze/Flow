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
    @ObservedObject var locationManager = LocationManager.shared

    @Environment(\.modelContext) private var context
    @State private var cancellables = Set<AnyCancellable>()
    @State private var currentSearch: MKLocalSearch? = nil
    
    // Live Map and Focus Interaction State
    @State private var userTrackingMode: MKUserTrackingMode = .none
    @State private var focusedSectionId: String? = nil

    private var nearbyStations: [MapStation] {
        let nearby = StationSuggestionEngine.nearbySuggestions(
            from: mapData.allStations,
            userLocation: locationManager.userLocation,
            maxResults: 5
        )
        let recentIds = Set(historyManager.recentStations.map { $0.id })
        return nearby.filter { !recentIds.contains($0.id) }
    }

    private var cardBackground: Material {
        .ultraThinMaterial
    }

    private var borderColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.08)
    }

    var body: some View {
        NavigationStack {
            stationSearchView
                .liquidGlassBackground()
                .navigationTitle("Recherche")
                .navigationBarTitleDisplayMode(.large)
                .searchPresentationToolbarBehavior(.avoidHidingContent)
        }
    }
    
    // MARK: - Station Search View
    var stationSearchView: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                if searchText.isEmpty {
                    if historyManager.recentStations.isEmpty && favoritesService.favoriteStationIds.isEmpty && nearbyStations.isEmpty {
                        emptyHistoryView
                    } else {
                        if !historyManager.recentStations.isEmpty {
                            recentSearchesSection
                        }

                        if !nearbyStations.isEmpty {
                            nearbyStationsSection
                        }

                        if !favoritesService.favoriteStationIds.isEmpty {
                            favoritesSection
                        }
                    }
                } else {
                    if searchResults.isEmpty {
                        noResultsView
                    } else {
                        searchResultsSection
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .padding(.bottom, 24)
        }
        .onChange(of: searchText) { _, newValue in
            performSearch(query: newValue)
        }
        .onChange(of: locationManager.userLocation?.latitude) { _, _ in
            if !searchText.isEmpty {
                performSearch(query: searchText)
            }
        }
        .onAppear {
            locationManager.requestLocation()
            historyManager.refreshHistory()
            if !searchText.isEmpty {
                performSearch(query: searchText)
            }
        }
    }

    // MARK: - Recent Searches Section
    var recentSearchesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Historique de recherche", systemImage: "clock.arrow.circlepath")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        historyManager.clearHistory()
                    }
                }) {
                    Text("Effacer")
                        .font(.footnote.weight(.medium))
                        .foregroundColor(.blue)
                }
                .buttonStyle(.liquidGlassInteractive)
            }
            .padding(.horizontal, 4)

            VStack(spacing: 0) {
                ForEach(historyManager.recentStations) { station in
                    HStack(spacing: 0) {
                        Button(action: {
                            selectStation(station)
                        }) {
                            StationRow(station: station)
                        }
                        .buttonStyle(.liquidGlassInteractive)

                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                historyManager.removeSearch(stationId: station.id)
                            }
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.secondary.opacity(0.7))
                                .padding(8)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.liquidGlassInteractive)
                    }
                    .padding(.horizontal, 16)

                    if station.id != historyManager.recentStations.last?.id {
                        Divider()
                            .padding(.leading, 16)
                    }
                }
            }
            .background(cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
            )
        }
    }

    // MARK: - Nearby Stations Section
    var nearbyStationsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("À proximité", systemImage: "location.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()
            }
            .padding(.horizontal, 4)

            VStack(spacing: 0) {
                ForEach(nearbyStations) { station in
                    Button(action: {
                        selectStation(station)
                    }) {
                        StationRow(station: station)
                    }
                    .buttonStyle(.liquidGlassInteractive)
                    .padding(.horizontal, 16)

                    if station.id != nearbyStations.last?.id {
                        Divider()
                            .padding(.leading, 16)
                    }
                }
            }
            .background(cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
            )
        }
    }

    // MARK: - Favorites Section
    var favoritesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Favoris", systemImage: "star.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
            }
            .padding(.horizontal, 4)

            VStack(spacing: 0) {
                let favStations = Array(favoritesService.favoriteStationIds).compactMap { id in
                    mapData.allStations.first(where: { $0.id == id })
                        ?? mapData.getAllStationsSync().first(where: { $0.id == id })
                }
                ForEach(favStations) { station in
                    Button(action: {
                        selectStation(station)
                    }) {
                        StationRow(station: station)
                    }
                    .buttonStyle(.liquidGlassInteractive)
                    .padding(.horizontal, 16)

                    if station.id != favStations.last?.id {
                        Divider()
                            .padding(.leading, 16)
                    }
                }
            }
            .background(cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
            )
        }
    }

    // MARK: - Empty History View
    var emptyHistoryView: some View {
        VStack(spacing: 14) {
            Spacer(minLength: 60)

            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.12))
                    .frame(width: 72, height: 72)

                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.blue)
            }

            Text("Historique vide")
                .font(.headline)
                .foregroundColor(.primary)

            Text("Vos stations et adresses récemment consultées apparaîtront ici.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer(minLength: 80)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - No Results View
    var noResultsView: some View {
        VStack(spacing: 14) {
            Spacer(minLength: 60)

            ZStack {
                Circle()
                    .fill(Color.secondary.opacity(0.12))
                    .frame(width: 72, height: 72)

                Image(systemName: "magnifyingglass")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.secondary)
            }

            Text("Aucun résultat")
                .font(.headline)
                .foregroundColor(.primary)

            Text("Aucune station ou adresse ne correspond à « \(searchText) ».")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer(minLength: 80)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Search Results Section
    var searchResultsSection: some View {
        VStack(spacing: 0) {
            ForEach(searchResults) { station in
                Button(action: {
                    selectStation(station)
                }) {
                    StationRow(station: station)
                }
                .buttonStyle(.liquidGlassInteractive)
                .padding(.horizontal, 16)

                if station.id != searchResults.last?.id {
                    Divider()
                        .padding(.leading, 16)
                }
            }
        }
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(borderColor, lineWidth: 1)
        )
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
        currentSearch?.cancel()
        
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

        // 1. Filtrer les stations ferroviaires (métro, RER, tram, transilien) chargées en mémoire sans tenir compte des accents
        let matchingRailStations = MapDataService.shared.allStations.filter { station in
            StationSuggestionEngine.matchesQuery(text: station.name, tokens: tokens)
                || (station.city != nil && StationSuggestionEngine.matchesQuery(text: station.city!, tokens: tokens))
        }

        // 2. Chercher dans SwiftData pour les bus avec les variantes accentuées du premier token
        let tokenVariants = StationSuggestionEngine.accentVariants(for: tokens[0])
        var busResults: [StopPointModel] = []
        for variant in tokenVariants.prefix(6) {
            var descriptor = FetchDescriptor<StopPointModel>(
                predicate: #Predicate<StopPointModel> { stop in
                    stop.type == "Bus" && stop.name.contains(variant)
                },
                sortBy: [SortDescriptor(\.name, order: .forward)]
            )
            descriptor.fetchLimit = 80
            if let results = try? context.fetch(descriptor) {
                for r in results {
                    if !busResults.contains(where: { $0.id == r.id }) {
                        busResults.append(r)
                    }
                }
            }
        }

        var localResults: [MapStation] = []

        // Filtrer en mémoire pour s'assurer que tous les tokens correspondent sans tenir compte des accents
        let filteredBus = busResults.filter { stop in
            StationSuggestionEngine.matchesQuery(text: stop.name, tokens: tokens)
                || StationSuggestionEngine.matchesQuery(text: stop.city, tokens: tokens)
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

        // 3. Combiner et classer intelligemment par pertinence et proximité
        let allResults = matchingRailStations + busStations
        let ranked = StationSuggestionEngine.rank(
            stations: allResults,
            query: query,
            userLocation: locationManager.userLocation,
            favoriteIds: favoritesService.favoriteStationIds,
            recentIds: Set(historyManager.recentStations.map { $0.id })
        )
        localResults = ranked
        searchResults = ranked

        // 4. Rechercher les adresses physiques à proximité via MapKit
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        let parisCenter = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let searchCenter = locationManager.userLocation ?? parisCenter
        searchRequest.region = MKCoordinateRegion(
            center: searchCenter,
            latitudinalMeters: 30000,
            longitudinalMeters: 30000
        )
        
        let search = MKLocalSearch(request: searchRequest)
        currentSearch = search
        
        search.start { response, error in
            guard let response = response, error == nil else {
                return
            }
            
            let addressStations: [MapStation] = response.mapItems.map { item in
                let coordinate = item.location.coordinate
                let name = item.name ?? ""
                let city = item.addressRepresentations?.cityName ?? item.name ?? "Adresse"
                
                return MapStation(
                    id: "address:\(coordinate.latitude),\(coordinate.longitude)",
                    name: name,
                    coordinate: coordinate,
                    platforms: [],
                    isHub: false,
                    mainType: .bus,
                    lines: [],
                    city: city
                )
            }
            
            DispatchQueue.main.async {
                var merged = localResults
                for addr in addressStations {
                    if !merged.contains(where: { $0.id == addr.id }) {
                        merged.append(addr)
                    }
                }
                self.searchResults = StationSuggestionEngine.rank(
                    stations: merged,
                    query: query,
                    userLocation: self.locationManager.userLocation,
                    favoriteIds: self.favoritesService.favoriteStationIds,
                    recentIds: Set(self.historyManager.recentStations.map { $0.id })
                )
            }
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
    var customUserLocation: CLLocationCoordinate2D? = nil
    @ObservedObject private var locationManager = LocationManager.shared

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

    private var distanceText: String? {
        guard let userCoord = customUserLocation ?? locationManager.userLocation else { return nil }
        let userLoc = CLLocation(latitude: userCoord.latitude, longitude: userCoord.longitude)
        let stationLoc = CLLocation(latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
        let meters = userLoc.distance(from: stationLoc)
        guard meters < 100_000 else { return nil }
        if meters < 1000 {
            return "\(Int(meters)) m"
        } else {
            return String(format: "%.1f km", meters / 1000.0)
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 8) {
                    Text(station.name)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    if station.id.hasPrefix("address:") {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else {
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

            if let distance = distanceText {
                Text(distance)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
            }
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
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

extension StationRow: Equatable {
    public static func == (lhs: StationRow, rhs: StationRow) -> Bool {
        return lhs.station.id == rhs.station.id &&
               lhs.station.name == rhs.station.name &&
               lhs.station.city == rhs.station.city &&
               lhs.station.lines.count == rhs.station.lines.count
    }
}

#Preview("Search View") {
    NavigationStack {
        SearchTabContent(searchText: .constant(""))
    }
    .environmentObject(NavigationCoordinator())
}

#Preview("Station Row with Distance") {
    VStack(spacing: 0) {
        StationRow(
            station: MapStation(
                id: "1",
                name: "Châtelet",
                coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3470),
                platforms: [],
                isHub: true,
                mainType: .metro,
                lines: [
                    StationLine(name: "1", type: .metro),
                    StationLine(name: "4", type: .metro),
                    StationLine(name: "7", type: .metro),
                    StationLine(name: "11", type: .metro),
                    StationLine(name: "14", type: .metro)
                ],
                city: "Paris"
            ),
            customUserLocation: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        )
        .padding(.horizontal, 16)

        Divider()
            .padding(.leading, 16)

        StationRow(
            station: MapStation(
                id: "2",
                name: "Gare de Lyon",
                coordinate: CLLocationCoordinate2D(latitude: 48.8443, longitude: 2.3744),
                platforms: [],
                isHub: true,
                mainType: .rer,
                lines: [
                    StationLine(name: "A", type: .rer),
                    StationLine(name: "D", type: .rer),
                    StationLine(name: "1", type: .metro),
                    StationLine(name: "14", type: .metro)
                ],
                city: "Paris"
            ),
            customUserLocation: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        )
        .padding(.horizontal, 16)
    }
    .background(Color(uiColor: .secondarySystemGroupedBackground))
    .clipShape(RoundedRectangle(cornerRadius: 16))
    .padding()
    .onAppear {
        LocationManager.shared.simulateLocation(latitude: 48.8566, longitude: 2.3522)
    }
}


