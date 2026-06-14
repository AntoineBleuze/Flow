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

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Rechercher une station...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .onChange(of: searchText) { _, newValue in
                            performSearch(query: newValue)
                        }
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()

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
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Sélectionner une station", displayMode: .inline)
            .navigationBarItems(
                trailing: Button("Annuler") {
                    dismiss()
                })
        }
    }

    func performSearch(query: String) {
        currentSearch?.cancel()
        
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        let descriptor = FetchDescriptor<StopPointModel>(
            predicate: #Predicate<StopPointModel> { stop in
                stop.name.contains(query)
            },
            sortBy: [SortDescriptor(\.name, order: .forward)]
        )

        var stations: [MapStation] = []
        do {
            let results = try context.fetch(descriptor)
            let grouped = Dictionary(grouping: results) { "\($0.name)_\($0.city)" }

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

            stations.sort { $0.name < $1.name }
            searchResults = stations

        } catch {
            print("❌ Search error: \(error)")
        }

        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        let parisCenter = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        searchRequest.region = MKCoordinateRegion(
            center: parisCenter,
            latitudinalMeters: 50000,
            longitudinalMeters: 50000
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
                
                return MapStation(
                    id: "address:\(coordinate.latitude),\(coordinate.longitude)",
                    name: name,
                    coordinate: coordinate,
                    platforms: [],
                    isHub: false,
                    mainType: .bus,
                    lines: []
                )
            }
            
            DispatchQueue.main.async {
                var merged = stations
                for addr in addressStations {
                    if !merged.contains(where: { $0.id == addr.id }) {
                        merged.append(addr)
                    }
                }
                self.searchResults = merged
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

