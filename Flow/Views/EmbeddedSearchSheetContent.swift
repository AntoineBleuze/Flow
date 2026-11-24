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
    @ObservedObject var routeManager = RouteNavigationManager.shared
    @ObservedObject var navigationManager = NavigationManager.shared
    @ObservedObject var preferences = UserPreferencesManager.shared
    @StateObject private var voiceManager = VoiceDictationManager.shared

    @Environment(\.modelContext) private var context
    @State private var cancellables = Set<AnyCancellable>()
    @State private var currentSearch: MKLocalSearch? = nil
    @State private var searchTask: Task<Void, Never>? = nil

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
        VStack(spacing: 10) {
            if showsSearchBar {
                HStack(spacing: 10) {
                    standaloneSearchBar

                    if !isFieldFocused && searchText.isEmpty {
                        AccountAvatarButton(size: 38)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                .animation(.spring(response: 0.28, dampingFraction: 0.8), value: isFieldFocused || !searchText.isEmpty)
                .padding(.horizontal, 16)
                .padding(.top, 14)
            }

            ScrollView {
                LazyVStack(spacing: 18) {
                    if searchText.isEmpty {
                        let activeJourney = routeManager.isRouteActive ? (routeManager.activeJourney ?? navigationManager.currentJourney) : nil
                        let hasSavedPlaces = preferences.homePlace != nil || preferences.workPlace != nil
                        if historyManager.recentStations.isEmpty && favoritesService.favoriteStationIds.isEmpty && activeJourney == nil && !hasSavedPlaces {
                            emptyHistoryView
                        } else {
                            if hasSavedPlaces {
                                savedPlacesSection
                            }

                            if !historyManager.recentStations.isEmpty {
                                recentSearchesSection
                            }

                            if let journey = activeJourney {
                                activeRouteSection(journey: journey)
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
                .padding(.top, 6)
                .padding(.bottom, 96)
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
        .glassEffect(.regular.interactive(), in: Capsule())
    }

    // MARK: - Conteneur de section interne (conforme HIG : pas de verre-sur-verre dans le content layer)
    @ViewBuilder
    private func sheetSectionGroup<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        VStack(spacing: 0) {
            content()
        }
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
        )
    }

    // MARK: - Sections
    private var savedPlacesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                if let home = preferences.homePlace {
                    savedPlaceChip(icon: "house.fill", color: .blue, label: "Domicile", place: home)
                }
                if let work = preferences.workPlace {
                    savedPlaceChip(icon: "briefcase.fill", color: .indigo, label: "Travail", place: work)
                }
            }
            .padding(.horizontal, 2)
        }
    }

    @ViewBuilder
    private func savedPlaceChip(icon: String, color: Color, label: String, place: SavedPlace) -> some View {
        Button {
            preferences.triggerHapticImpact()
            let station = place.toMapStation()
            MapDataService.shared.selectStation(station)
            if let onSelectStation {
                onSelectStation(station)
            } else {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                    coordinator.selectedStation = station
                    selectedDetent = .medium
                }
            }
        } label: {
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.18))
                        .frame(width: 28, height: 28)
                    Image(systemName: icon)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(color)
                }

                VStack(alignment: .leading, spacing: 1) {
                    Text(label)
                        .font(.system(.caption, design: .rounded).weight(.bold))
                        .foregroundStyle(.primary)
                    Text(place.name)
                        .font(.system(size: 11, design: .rounded))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
            )
        }
        .buttonStyle(.plain)
    }

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
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 4)

            sheetSectionGroup {
                ForEach(historyManager.recentStations) { station in
                    HStack(spacing: 0) {
                        Button(action: {
                            selectStation(station)
                        }) {
                            StationRow(station: station)
                        }
                        .buttonStyle(.plain)

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
                        .buttonStyle(.plain)
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

    @ViewBuilder
    private func activeRouteSection(journey: Journey) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Itinéraire en cours", systemImage: "point.topleft.down.to.point.bottomright.curvepath.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()

                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                        routeManager.stopRoute()
                    }
                }) {
                    Text("Arrêter")
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.red)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 4)

            sheetSectionGroup {
                Button(action: {
                    routeManager.showRouteDetails()
                }) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 12) {
                            activeRouteTransportIcon

                            VStack(alignment: .leading, spacing: 3) {
                                Text(routeManager.pillHeadline)
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                    .lineLimit(1)

                                HStack(spacing: 5) {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 6, height: 6)

                                    Text(routeManager.pillSubheadline)
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                            }

                            Spacer(minLength: 4)

                            HStack(spacing: 4) {
                                Text("Détails")
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.bold)
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 10, weight: .bold))
                            }
                            .foregroundColor(.blue)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.12), in: Capsule())
                        }

                        if !routeManager.currentInstruction.isEmpty {
                            Text(routeManager.currentInstruction)
                                .font(.system(.caption, design: .rounded))
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }

                        ProgressView(value: min(max(routeManager.progress, 0), 1))
                            .tint(.blue)

                        if let sections = journey.sections, !sections.isEmpty {
                            Divider()

                            HStack(spacing: 8) {
                                activeRouteTimeline(sections: sections)

                                Spacer(minLength: 4)

                                if !routeManager.destinationName.isEmpty {
                                    Text(routeManager.destinationName)
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.medium)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .padding(16)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
    }

    @ViewBuilder
    private var activeRouteTransportIcon: some View {
        if routeManager.isWalking {
            ZStack {
                Circle()
                    .fill(Color.secondary.opacity(0.16))
                    .frame(width: 36, height: 36)

                Image(systemName: "figure.walk")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
            }
        } else if let line = routeManager.currentLineDisplay {
            LineIcon(
                type: line.transportType,
                lineId: line.code ?? line.label ?? "",
                size: 34,
                customColor: Color(hex: line.color ?? "0078D7")
            )
        } else {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.16))
                    .frame(width: 36, height: 36)

                Image(systemName: "tram.fill")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.blue)
            }
        }
    }

    @ViewBuilder
    private func activeRouteTimeline(sections: [ItinerarySection]) -> some View {
        let visibleSections = sections.filter { $0.type != "waiting" }
        HStack(spacing: 4) {
            ForEach(Array(visibleSections.enumerated()), id: \.offset) { index, section in
                if section.type == "public_transport", let display = section.display_informations {
                    LineIcon(
                        type: display.transportType,
                        lineId: display.code ?? display.label ?? "?",
                        size: 20,
                        customColor: Color(hex: display.color ?? "0078D7")
                    )
                } else if (section.mode == "walking" || section.type == "street_network"),
                          (section.duration ?? 0) > 120 {
                    Image(systemName: "figure.walk")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.secondary)
                } else if section.type == "transfer" {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(.secondary.opacity(0.7))
                }

                if index < visibleSections.count - 1,
                   section.type == "public_transport",
                   visibleSections[index + 1].type == "public_transport" {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(.secondary.opacity(0.7))
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

            sheetSectionGroup {
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
                    .buttonStyle(.plain)
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
        sheetSectionGroup {
            ForEach(searchResults) { station in
                Button(action: {
                    selectStation(station)
                }) {
                    StationRow(station: station)
                }
                .buttonStyle(.plain)
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
        searchTask?.cancel()

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

        let userLocation = locationManager.userLocation
        let favoriteIds = favoritesService.favoriteStationIds
        let recentIds = Set(historyManager.recentStations.map { $0.id })

        // 1. Filtrage immédiat en mémoire (latence 0 ms) sur les stations ferrées
        let matchingRailStations = MapDataService.shared.allStations.filter { station in
            StationSuggestionEngine.matchesQuery(text: station.name, tokens: tokens)
                || (station.city != nil && StationSuggestionEngine.matchesQuery(text: station.city!, tokens: tokens))
        }
        let immediateRanked = StationSuggestionEngine.rank(
            stations: matchingRailStations,
            query: query,
            userLocation: userLocation,
            favoriteIds: favoriteIds,
            recentIds: recentIds
        )
        searchResults = immediateRanked

        let tokenVariants = StationSuggestionEngine.accentVariants(for: tokens[0])
        let parisCenter = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let searchCenter = userLocation ?? parisCenter
        let container = SwiftDataStack.shared.container

        // 2. Recherche asynchrone débouclée hors @MainActor (SwiftData bus + MapKit)
        searchTask = Task {
            try? await Task.sleep(for: .milliseconds(120))
            guard !Task.isCancelled else { return }

            let importer = TransportDataImporter(modelContainer: container)
            let busStops = (try? await importer.searchBusStops(variants: tokenVariants, busOnly: true, fetchLimit: 80)) ?? []
            guard !Task.isCancelled else { return }

            let busStations = StationSuggestionEngine.buildStations(
                from: busStops,
                tokens: tokens,
                includePlatformsAndLines: true
            )
            let localRanked = StationSuggestionEngine.rank(
                stations: matchingRailStations + busStations,
                query: query,
                userLocation: userLocation,
                favoriteIds: favoriteIds,
                recentIds: recentIds
            )
            self.searchResults = localRanked

            try? await Task.sleep(for: .milliseconds(130))
            guard !Task.isCancelled else { return }

            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = query
            searchRequest.region = MKCoordinateRegion(
                center: searchCenter,
                latitudinalMeters: 30000,
                longitudinalMeters: 30000
            )

            let search = MKLocalSearch(request: searchRequest)
            self.currentSearch = search
            guard let response = try? await search.start(), !Task.isCancelled else { return }

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

            var merged = localRanked
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

    private func mapType(_ typeStr: String) -> TransportType {
        let lower = typeStr.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        if lower.contains("rer") { return .rer }
        if lower.contains("metro") { return .metro }
        if lower.contains("tram") { return .tram }
        if lower.contains("train") || lower.contains("transilien") || lower.contains("rail") { return .transilien }
        return .bus
    }
}
