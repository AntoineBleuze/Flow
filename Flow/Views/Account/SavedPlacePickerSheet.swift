import CoreLocation
import MapKit
import SwiftData
import SwiftUI

/// Feuille de recherche permettant de définir une station ou adresse pour Domicile ou Travail.
struct SavedPlacePickerSheet: View {
    let title: String
    let onSelectPlace: (SavedPlace) -> Void

    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var mapData = MapDataService.shared
    @ObservedObject private var locationManager = LocationManager.shared
    @ObservedObject private var historyManager = SearchHistoryManager.shared
    @ObservedObject private var favoritesService = FavoritesService.shared

    @State private var searchText = ""
    @State private var searchResults: [MapStation] = []
    @State private var currentSearch: MKLocalSearch?
    @State private var searchTask: Task<Void, Never>?

    private var suggestedStations: [MapStation] {
        if !historyManager.recentStations.isEmpty {
            return Array(historyManager.recentStations.prefix(6))
        }
        return StationSuggestionEngine.nearbySuggestions(
            from: mapData.allStations,
            userLocation: locationManager.userLocation,
            maxResults: 6
        )
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                AccountSheetHeader(
                    title: title,
                    fontSize: 22,
                    buttonIcon: "xmark",
                    accessibilityLabel: "Fermer"
                ) {
                    dismiss()
                }

                LiquidGlassSearchBar(
                    text: $searchText,
                    placeholder: "Station, gare ou adresse..."
                )
                .padding(.horizontal, 16)
                .onChange(of: searchText) { _, newValue in
                    performSearch(query: newValue)
                }

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 14) {
                        if searchText.isEmpty {
                            if !suggestedStations.isEmpty {
                                AccountSectionHeader(
                                    title: historyManager.recentStations.isEmpty ? "À proximité" : "Recherches récentes",
                                    systemImage: historyManager.recentStations.isEmpty ? "location.fill" : "clock.arrow.circlepath"
                                )
                                stationListCard(stations: suggestedStations)
                            } else {
                                LiquidGlassEmptyState(
                                    icon: "magnifyingglass",
                                    title: "Choisir un lieu",
                                    subtitle: "Recherchez une station de métro, RER, tramway ou une adresse."
                                )
                                .padding(.top, 36)
                            }
                        } else if searchResults.isEmpty {
                            LiquidGlassEmptyState(
                                icon: "magnifyingglass",
                                title: "Aucun résultat",
                                subtitle: "Aucun lieu ne correspond à « \(searchText) »."
                            )
                            .padding(.top, 36)
                        } else {
                            stationListCard(stations: searchResults)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 28)
                }
                .scrollContentBackground(.hidden)
            }
            .liquidGlassBackground()
            .toolbar(.hidden, for: .navigationBar)
        }
        .liquidGlassSheet()
        .onDisappear {
            currentSearch?.cancel()
            searchTask?.cancel()
        }
    }

    @ViewBuilder
    private func stationListCard(stations: [MapStation]) -> some View {
        AccountSectionGroup {
            ForEach(stations) { station in
                Button {
                    UserPreferencesManager.shared.triggerHapticImpact()
                    onSelectPlace(SavedPlace(from: station))
                    dismiss()
                } label: {
                    StationRow(station: station)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 16)

                if station.id != stations.last?.id {
                    Divider()
                        .padding(.leading, 16)
                }
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

        let normalizedQuery = query
            .replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")
        let tokens = normalizedQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
        guard !tokens.isEmpty else {
            searchResults = []
            return
        }

        let userLoc = locationManager.userLocation
        let favoriteIds = favoritesService.favoriteStationIds
        let recentIds = Set(historyManager.recentStations.map { $0.id })

        let matchingMainStations = mapData.allStations.filter { station in
            StationSuggestionEngine.matchesQuery(text: station.name, tokens: tokens)
                || (station.city != nil && StationSuggestionEngine.matchesQuery(text: station.city!, tokens: tokens))
        }

        let immediateRanked = StationSuggestionEngine.rank(
            stations: matchingMainStations,
            query: query,
            userLocation: userLoc,
            favoriteIds: favoriteIds,
            recentIds: recentIds
        )
        searchResults = immediateRanked

        let tokenVariants = StationSuggestionEngine.accentVariants(for: tokens[0])
        let parisCenter = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let searchCenter = userLoc ?? parisCenter
        let container = SwiftDataStack.shared.container

        searchTask = Task {
            try? await Task.sleep(for: .milliseconds(120))
            guard !Task.isCancelled else { return }

            let importer = TransportDataImporter(modelContainer: container)
            let swiftDataStops = (try? await importer.searchBusStops(variants: tokenVariants, busOnly: false, fetchLimit: 80)) ?? []
            guard !Task.isCancelled else { return }

            let swiftDataStations = StationSuggestionEngine.buildStations(
                from: swiftDataStops,
                tokens: tokens,
                includePlatformsAndLines: false
            )
            let existingKeys = Set(matchingMainStations.map { "\($0.id)_\(StationSuggestionEngine.normalize($0.name))" })
            let existingNames = Set(matchingMainStations.map { StationSuggestionEngine.normalize($0.name) })
            let deduplicatedSwiftData = swiftDataStations.filter { station in
                !existingKeys.contains("\(station.id)_\(StationSuggestionEngine.normalize(station.name))")
                    && !existingNames.contains(StationSuggestionEngine.normalize(station.name))
            }

            let localRanked = StationSuggestionEngine.rank(
                stations: matchingMainStations + deduplicatedSwiftData,
                query: query,
                userLocation: userLoc,
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
            for addr in addressStations where !merged.contains(where: { $0.id == addr.id }) {
                merged.append(addr)
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
