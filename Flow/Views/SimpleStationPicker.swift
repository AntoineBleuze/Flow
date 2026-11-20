import SwiftData
import CoreLocation
import SwiftUI
import MapKit

struct SimpleStationPicker: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedStation: MapStation?
    @State private var searchText = ""
    @State private var searchResults: [MapStation] = []
    @State private var currentSearch: MKLocalSearch? = nil
    @State private var searchTask: Task<Void, Never>? = nil

    let currentLocation: CLLocationCoordinate2D?
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                // Search Bar
                LiquidGlassSearchBar(text: $searchText, placeholder: "Rechercher une station...")
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .onChange(of: searchText) { _, newValue in
                        performSearch(query: newValue)
                    }

                // Results
                List {
                    // Ma position option
                    if let location = currentLocation {
                        Button(action: {
                            selectedStation = MapStation(
                                id: "MY_POSITION",
                                name: "Ma position",
                                coordinate: location,
                                platforms: [],
                                isHub: false,
                                mainType: .bus,
                                lines: []
                            )
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                                Text("Ma position")
                                    .font(.headline)
                                Spacer()
                            }
                        }
                        .listRowBackground(Color.clear)
                    }

                    ForEach(searchResults) { station in
                        Button(action: {
                            selectedStation = station
                            dismiss()
                        }) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack(alignment: .center, spacing: 8) {
                                        Text(station.name)
                                            .font(.headline)

                                        if !station.id.hasPrefix("address:") {
                                            HStack(spacing: 4) {
                                                // Pour le picker simple, on n'a souvent pas les lignes détaillées dans l'objet MapStation,
                                                // on affiche alors juste le mainType si disponible
                                                if !station.lines.isEmpty {
                                                    ForEach(station.lines.filter { $0.type != .bus }.prefix(8), id: \.id) { line in
                                                        LineIcon(type: line.type, lineId: line.name, size: 16)
                                                    }
                                                } else if station.mainType != .bus {
                                                    // Fallback si pas de lignes
                                                    TransportTypeIcon(type: station.mainType)
                                                        .frame(width: 16, height: 16)
                                                }

                                                if station.mainType == .bus || station.lines.contains(where: { $0.type == .bus }) {
                                                    Image("Bus")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 16)
                                                }
                                            }
                                        } else {
                                            Image(systemName: "mappin.and.ellipse")
                                                .font(.caption)
                                                .foregroundColor(.red)
                                        }
                                    }
                                    
                                    if let city = station.city, !city.isEmpty {
                                        Text(city)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                Spacer()

                                if let distance = formattedDistance(for: station) {
                                    Text(distance)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .liquidGlassBackground()
            .navigationTitle("Sélectionner une station")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Annuler") {
                        dismiss()
                    }
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.medium)
                }
            }
        }
        .liquidGlassSheet()
    }

    private func formattedDistance(for station: MapStation) -> String? {
        guard let userCoord = currentLocation ?? LocationManager.shared.userLocation else { return nil }
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

    func performSearch(query: String) {
        currentSearch?.cancel()
        searchTask?.cancel()
        
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        let normQuery = query.replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")
        let tokens = normQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
        guard !tokens.isEmpty else {
            searchResults = []
            return
        }

        let userLoc = currentLocation ?? LocationManager.shared.userLocation
        let favoriteIds = FavoritesService.shared.favoriteStationIds
        let recentIds = Set(SearchHistoryManager.shared.recentStations.map { $0.id })

        // 1. Filtrage immédiat en mémoire sur les stations principales
        let matchingMainStations = MapDataService.shared.allStations.filter { station in
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
            for addr in addressStations {
                if !merged.contains(where: { $0.id == addr.id }) {
                    merged.append(addr)
                }
            }
            let updatedUserLoc = self.currentLocation ?? LocationManager.shared.userLocation
            self.searchResults = StationSuggestionEngine.rank(
                stations: merged,
                query: query,
                userLocation: updatedUserLoc,
                favoriteIds: FavoritesService.shared.favoriteStationIds,
                recentIds: Set(SearchHistoryManager.shared.recentStations.map { $0.id })
            )
        }
    }

    private func mapType(_ typeStr: String) -> TransportType {
        let folded = typeStr.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
        if folded.contains("rer") { return .rer }
        if folded.contains("metro") { return .metro }
        if folded.contains("tram") { return .tram }
        if folded.contains("train") || folded.contains("transilien") || folded.contains("rail") { return .transilien }
        return .bus
    }

    func iconName(for type: TransportType) -> String {
        switch type {
        case .metro: return "tram.fill"
        case .rer: return "tram.circle.fill"
        case .transilien: return "train.side.front.car"
        case .tram: return "tram"
        case .bus: return "bus"
        case .train: return "train.side.front.car"
        case .cable: return "tram.fill.tunnel"  // Icone temporaire ou "cablecar" si dispo en SF Symbols
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
    SimpleStationPicker(
        selectedStation: .constant(PreviewMockData.mockStation),
        currentLocation: CLLocationCoordinate2D(latitude: 48.8239, longitude: 2.2743)
    )
}

