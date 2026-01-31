import CoreData
import CoreLocation
import SwiftUI

struct SimpleStationPicker: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedStation: MapStation?
    @State private var searchText = ""
    @State private var searchResults: [MapStation] = []

    let currentLocation: CLLocationCoordinate2D?
    let context = PersistenceController.shared.container.viewContext

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
                                Image(systemName: iconName(for: station.mainType))
                                    .foregroundColor(color(for: station.mainType))
                                VStack(alignment: .leading) {
                                    Text(station.name)
                                        .font(.headline)
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
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        let request: NSFetchRequest<StopPointEntity> = StopPointEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", query)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.fetchLimit = 50

        do {
            let results = try context.fetch(request)
            let grouped = Dictionary(grouping: results) { "\($0.name ?? "")_\($0.city ?? "")" }

            let stations: [MapStation] = grouped.compactMap { (_, stops) in
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

                return MapStation(
                    id: first.id ?? UUID().uuidString,
                    name: name,
                    coordinate: center,
                    platforms: [],
                    isHub: false,
                    mainType: type,
                    lines: []
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
