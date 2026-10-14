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

    let currentLocation: CLLocationCoordinate2D?
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Rechercher une station...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .onChange(of: searchText) { _, newValue in
                            performSearch(query: newValue)
                        }
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(12)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
                )
                .padding(.horizontal)
                .padding(.vertical, 8)

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
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitle("Sélectionner une station", displayMode: .inline)
            .navigationBarItems(
                trailing: Button("Annuler") {
                    dismiss()
                })
        }
        .liquidGlassSheetBackground()
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
        
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        let normQuery = query.replacingOccurrences(of: "'", with: " ")
            .replacingOccurrences(of: "’", with: " ")
        let tokens = normQuery.components(separatedBy: .whitespaces).filter { !$0.isEmpty }

        let tokenVariants = tokens.first != nil ? StationSuggestionEngine.accentVariants(for: tokens[0]) : [query]
        var busResults: [StopPointModel] = []
        for variant in tokenVariants.prefix(6) {
            var descriptor = FetchDescriptor<StopPointModel>(
                predicate: #Predicate<StopPointModel> { stop in
                    stop.name.contains(variant)
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

        var stations: [MapStation] = []
        let filteredResults = busResults.filter { stop in
            StationSuggestionEngine.matchesQuery(text: stop.name, tokens: tokens)
                || StationSuggestionEngine.matchesQuery(text: stop.city, tokens: tokens)
        }
        let grouped = Dictionary(grouping: filteredResults) { "\($0.name)_\($0.city)" }

        stations = grouped.compactMap { (_, stops) in
            guard let first = stops.first else { return nil }
            let name = first.name

            let totalLat = stops.reduce(0.0) { $0 + $1.latitude }
            let totalLon = stops.reduce(0.0) { $0 + $1.longitude }
            let count = Double(stops.count)
            let center = CLLocationCoordinate2D(
                latitude: totalLat / count, longitude: totalLon / count)

            let types = stops.map { $0.type }
            let mainTypeStr =
                types.first(where: { $0 == "RER" }) ?? types.first(where: { $0 == "Transilien" }
                ) ?? types.first(where: { $0 == "Metro" }) ?? types.first ?? "Bus"

            let type = mapType(mainTypeStr)

            return MapStation(
                id: first.stopAreaId.isEmpty ? first.id : first.stopAreaId,
                name: name,
                coordinate: center,
                platforms: [],
                isHub: false,
                mainType: type,
                lines: []
            )
        }

        let userLoc = currentLocation ?? LocationManager.shared.userLocation
        searchResults = StationSuggestionEngine.rank(
            stations: stations,
            query: query,
            userLocation: userLoc,
            favoriteIds: FavoritesService.shared.favoriteStationIds,
            recentIds: Set(SearchHistoryManager.shared.recentStations.map { $0.id })
        )

        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        let parisCenter = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let searchCenter = currentLocation ?? LocationManager.shared.userLocation ?? parisCenter
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
                var merged = stations
                for addr in addressStations {
                    if !merged.contains(where: { $0.id == addr.id }) {
                        merged.append(addr)
                    }
                }
                let userLoc = self.currentLocation ?? LocationManager.shared.userLocation
                self.searchResults = StationSuggestionEngine.rank(
                    stations: merged,
                    query: query,
                    userLocation: userLoc,
                    favoriteIds: FavoritesService.shared.favoriteStationIds,
                    recentIds: Set(SearchHistoryManager.shared.recentStations.map { $0.id })
                )
            }
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

