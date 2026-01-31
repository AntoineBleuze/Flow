import CoreData
import CoreLocation
import SwiftUI

struct SearchTabContent: View {
    @Binding var searchText: String
    @State private var searchResults: [MapStation] = []
    @State private var selectedStation: MapStation?

    @EnvironmentObject var coordinator: NavigationCoordinator
    @ObservedObject var historyManager = SearchHistoryManager.shared

    let context = PersistenceController.shared.container.viewContext

    var body: some View {
        NavigationStack {
            List {
                if searchText.isEmpty {
                    if !historyManager.recentStations.isEmpty {
                        SwiftUI.Section("Recherches récentes") {
                            ForEach(historyManager.recentStations) { station in
                                Button(action: {
                                    selectStation(station)
                                }) {
                                    StationRow(station: station)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                } else {
                    if searchResults.isEmpty {
                        Text("Aucun résultat")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(searchResults) { station in
                            Button(action: {
                                selectStation(station)
                            }) {
                                StationRow(station: station)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Recherche")
            .searchable(
                text: $searchText, placement: .navigationBarDrawer(displayMode: .always)
            )
            .scrollContentBackground(.hidden)
            .onChange(of: searchText) { _, newValue in
                performSearch(query: newValue)
            }
            .onAppear {
                historyManager.refreshHistory()
                if !searchText.isEmpty {
                    performSearch(query: searchText)
                }
            }
            .background {
                AdaptiveMapBackground()
            }
        }
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

                return MapStation(
                    id: first.id ?? UUID().uuidString,
                    name: name,
                    coordinate: center,
                    platforms: platforms,
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
}

struct StationRow: View {
    let station: MapStation

    var body: some View {
        HStack {
            Image(systemName: iconName(for: station.mainType))
                .foregroundColor(color(for: station.mainType))
            VStack(alignment: .leading) {
                Text(station.name)
                    .font(.headline)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
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
