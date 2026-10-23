import SwiftData
import CoreLocation
import SwiftUI
import Combine
import MapKit

// MARK: - Embedded Search Sheet Content (Style Apple Localiser / Find My)
/// Composant de recherche embarqué dans la Sheet unifiée avec élévation automatique en detent .large
struct EmbeddedSearchSheetContent: View {
    @Binding var searchText: String
    @Binding var selectedDetent: PresentationDetent
    var showsSearchBar: Bool = false
    var onSelectStation: ((MapStation) -> Void)? = nil

    @State private var searchResults: [MapStation] = []
    @FocusState private var isFieldFocused: Bool

    @EnvironmentObject var coordinator: NavigationCoordinator
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var historyManager = SearchHistoryManager.shared
    @ObservedObject var favoritesService = FavoritesService.shared
    @ObservedObject var mapData = MapDataService.shared
    @ObservedObject var locationManager = LocationManager.shared
    @StateObject private var voiceManager = VoiceDictationManager.shared

    @Environment(\.modelContext) private var context
    @State private var cancellables = Set<AnyCancellable>()
    @State private var currentSearch: MKLocalSearch? = nil

    private var nearbyStations: [MapStation] {
        let nearby = StationSuggestionEngine.nearbySuggestions(
            from: mapData.allStations,
            userLocation: locationManager.userLocation,
            maxResults: 5
        )
        let recentIds = Set(historyManager.recentStations.map { $0.id })
        return nearby.filter { !recentIds.contains($0.id) }
    }

    init(
        searchText: Binding<String>,
        selectedDetent: Binding<PresentationDetent>,
        showsSearchBar: Bool = false,
        onSelectStation: ((MapStation) -> Void)? = nil
    ) {
        self._searchText = searchText
        self._selectedDetent = selectedDetent
        self.showsSearchBar = showsSearchBar
        self.onSelectStation = onSelectStation
    }

    var body: some View {
        VStack(spacing: 12) {
            if showsSearchBar {
                standaloneSearchBar
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
            }

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
                .padding(.top, 4)
                .padding(.bottom, 24)
            }
            .scrollContentBackground(.hidden)
        }
        .liquidGlassBackground()
        .onChange(of: searchText) { _, newValue in
            performSearch(query: newValue)
            if !newValue.isEmpty && selectedDetent != .large {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                    selectedDetent = .large
                }
            }
        }
        .onChange(of: isFieldFocused) { _, isFocused in
            if isFocused && selectedDetent != .large {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                    selectedDetent = .large
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            if selectedDetent != .large {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                    selectedDetent = .large
                }
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

    // MARK: - Standalone Search Bar
    private var standaloneSearchBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.blue)
                .font(.system(size: 15, weight: .semibold))

            TextField("Rechercher station, ligne, adresse...", text: $searchText)
                .font(.system(.subheadline, design: .rounded))
                .focused($isFieldFocused)
                .submitLabel(.search)
                .autocorrectionDisabled()

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
                    }
                )
            }) {
                Image(systemName: voiceManager.isRecording ? "waveform.circle.fill" : "mic.fill")
                    .foregroundColor(voiceManager.isRecording ? .red : .secondary)
                    .font(.system(size: 15, weight: .semibold))
            }
            .buttonStyle(.plain)

            Button(action: {
                coordinator.showAIAssistant = true
            }) {
                Image(systemName: "sparkles")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            .buttonStyle(.plain)

            if isFieldFocused || !searchText.isEmpty {
                Button(action: {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                        searchText = ""
                        isFieldFocused = false
                        selectedDetent = .medium
                    }
                }) {
                    Text("Annuler")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background {
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
                )
        }
        .clipShape(Capsule())
        .shadow(color: colorScheme == .dark ? Color.black.opacity(0.3) : Color.black.opacity(0.08), radius: 8, x: 0, y: 3)
    }

    // MARK: - Sections
    private var recentSearchesSection: some View {
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

            LiquidGlassGroupedContainer {
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
        }
    }

    private var nearbyStationsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("À proximité", systemImage: "location.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()
            }
            .padding(.horizontal, 4)

            LiquidGlassGroupedContainer {
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
        }
    }

    private var favoritesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Favoris", systemImage: "star.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
            }
            .padding(.horizontal, 4)

            LiquidGlassGroupedContainer {
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
        }
    }

    private var emptyHistoryView: some View {
        LiquidGlassEmptyState(
            icon: "clock.arrow.circlepath",
            title: "Historique vide",
            subtitle: "Vos stations et adresses récemment consultées apparaîtront ici."
        )
        .padding(.top, 40)
    }

    private var noResultsView: some View {
        LiquidGlassEmptyState(
            icon: "magnifyingglass",
            title: "Aucun résultat",
            subtitle: "Aucune station ou adresse ne correspond à « \(searchText) »."
        )
        .padding(.top, 40)
    }

    private var searchResultsSection: some View {
        LiquidGlassGroupedContainer {
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
    }

    private func selectStation(_ station: MapStation) {
        historyManager.addSearch(station)
        MapDataService.shared.selectStation(station)
        if let onSelect = onSelectStation {
            onSelect(station)
        } else {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                coordinator.selectedStation = station
                selectedDetent = .medium
            }
        }
    }

    private func performSearch(query: String) {
        currentSearch?.cancel()

        guard !query.isEmpty else {
            searchResults = []
            return
        }

        let normalizedQuery = query.replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")

        let tokens = normalizedQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }

        if tokens.isEmpty {
            searchResults = []
            return
        }

        let matchingRailStations = MapDataService.shared.allStations.filter { station in
            StationSuggestionEngine.matchesQuery(text: station.name, tokens: tokens)
                || (station.city != nil && StationSuggestionEngine.matchesQuery(text: station.city!, tokens: tokens))
        }

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

        let allResults = matchingRailStations + busStations
        let ranked = StationSuggestionEngine.rank(
            stations: allResults,
            query: query,
            userLocation: locationManager.userLocation,
            favoriteIds: favoritesService.favoriteStationIds,
            recentIds: Set(historyManager.recentStations.map { $0.id })
        )
        searchResults = ranked

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
                var merged = ranked
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
