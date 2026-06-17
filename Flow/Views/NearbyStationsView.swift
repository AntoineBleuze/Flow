import Combine
import CoreLocation
import SwiftUI

struct NearbyStationsView: View {
    @StateObject private var viewModel = NearbyStationsViewModel()
    @ObservedObject private var mapData = MapDataService.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        NavigationStack {
            nearbyStationsContent
                .background(Color.black.ignoresSafeArea())
                .navigationTitle("À Proximité")
                .navigationBarTitleDisplayMode(.large)
        }
    }

    @ViewBuilder
    private var nearbyStationsContent: some View {
        if viewModel.permissionDenied {
            VStack(spacing: 20) {
                Image(systemName: "location.slash.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.orange)
                Text("Localisation désactivée")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(
                    "Veuillez activer la localisation dans les réglages pour voir les stations à proximité."
                )
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if viewModel.userLocation == nil {
            VStack(spacing: 20) {
                Image(systemName: "location.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                Text("Localisation nécessaire")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(
                    "Autorisez l'accès à votre position pour trouver les stations autour de vous."
                )
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.gray)

                Button(action: {
                    viewModel.requestLocation()
                }) {
                    Text("Autoriser la localisation")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                }
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .padding(.horizontal, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if viewModel.nearbyStations.isEmpty {
            VStack(spacing: 20) {
                RadiusSelector(viewModel: viewModel)

                if viewModel.isLoading {
                    ProgressView("Recherche des stations...")
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "tram.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Aucune station trouvée")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(
                            "Aucune station dans un rayon de \(Int(viewModel.selectedRadius))m."
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top)
        } else {
            VStack(spacing: 0) {
                RadiusSelector(viewModel: viewModel)
                    .padding(.vertical, 8)

                List {
                    ForEach(viewModel.nearbyStations) { station in
                        Button(action: {
                            coordinator.selectedStation = station
                            coordinator.switchToExplore()
                        }) {
                            NearbyStationRow(station: station)
                        }
                        .buttonStyle(.plain)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .frame(maxWidth: horizontalSizeClass == .regular ? 700 : .infinity)
                .frame(maxWidth: .infinity) // center within parent
            }
        }
    }


}

struct RadiusSelector: View {
    @ObservedObject var viewModel: NearbyStationsViewModel

    var body: some View {

        Menu {
            ForEach(viewModel.availableRadii, id: \.self) { radius in
                Button(action: {
                    withAnimation {
                        viewModel.selectedRadius = radius
                    }
                }) {
                    HStack {
                        Text(formatRadius(radius))
                        if viewModel.selectedRadius == radius {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "arrow.up.and.down.circle.fill")
                    .foregroundColor(.blue)
                Text(formatRadius(viewModel.selectedRadius))
                    .font(SwiftUI.Font.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.12), in: Capsule())
        }
    }

    private func formatRadius(_ radius: Double) -> String {
        if radius >= 1000 {
            return "\(Int(radius / 1000)) km"
        } else {
            return "\(Int(radius)) m"
        }
    }
}

struct NearbyStationRow: View {
    let station: MapStation

    @State private var groupedDepartures: [String: [String: [Departure]]] = [:]  // Structure: [Line: [Direction: [Departures]]]
    @State private var isLoading = true
    @State private var cancellables = Set<AnyCancellable>()

    private var displayedStationLines: [StationLine] {
        let allLines = station.lines
        if station.mainType == .bus {
            return allLines.filter { $0.type == .bus }.sorted {
                $0.name.localizedStandardCompare($1.name) == .orderedAscending
            }
        } else {
            let nonBusLines = allLines.filter { $0.type != .bus }
            return nonBusLines.sorted { lhs, rhs in
                let lhsPriority = customPriority(lhs.type)
                let rhsPriority = customPriority(rhs.type)
                if lhsPriority != rhsPriority {
                    return lhsPriority > rhsPriority
                }
                return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
            }
        }
    }

    private func customPriority(_ type: TransportType) -> Int {
        type.priority
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .center, spacing: 8) {
                        Text(station.name)
                            .font(.headline)
                            .foregroundColor(.white)

                        HStack(spacing: 4) {
                            let lines = displayedStationLines
                            ForEach(lines.prefix(5), id: \.id) { line in
                                LineIcon(type: line.type, lineId: line.name, size: 16)
                            }

                            if station.mainType != .bus && station.lines.contains(where: { $0.type == .bus }) {
                                Image("Bus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                            }
                        }
                    }

                    if isLoading {
                        Text("Chargement...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    } else if groupedDepartures.isEmpty {
                        Text("Aucun départ proche")
                            .font(.caption)
                            .foregroundColor(.gray)
                    } else {
                        // Affichage groupé par ligne
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(groupedDepartures.keys.sorted { a, b in
                                if let numA = Int(a), let numB = Int(b) { return numA < numB }
                                if Int(a) != nil { return true }
                                if Int(b) != nil { return false }
                                return a.localizedStandardCompare(b) == .orderedAscending
                            }, id: \.self) { lineKey in
                                if let directions = groupedDepartures[lineKey] {
                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack(alignment: .center, spacing: 6) {
                                            // Nom de la ligne
                                            let firstDep = directions.values.first?.first
                                            let type = determineType(
                                                from: firstDep?.displayInformations)
                                            LineIcon(type: type, lineId: lineKey, size: 18)
                                        }

                                        // Liste des directions pour cette ligne
                                        VStack(alignment: .leading, spacing: 2) {
                                            ForEach(directions.keys.sorted(), id: \.self) {
                                                directionKey in
                                                if let deps = directions[directionKey] {
                                                    HStack(spacing: 4) {
                                                        Text(directionKey)
                                                            .font(.caption)
                                                            .foregroundColor(.gray)
                                                            .lineLimit(1)

                                                        Spacer()

                                                        Text(
                                                            deps.prefix(2).map(formatDepartureTime)
                                                                .joined(separator: ", ")
                                                        )
                                                        .font(.caption2)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.green)
                                                    }
                                                }
                                            }
                                        }
                                        .padding(.leading, 24)
                                    }
                                }
                            }
                        }
                    }
                }

                Spacer()

                if let distance = distanceFromUser(station: station) {
                    Text(distance)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.12))
                        .clipShape(Capsule())
                }
            }
            
            Divider()
                .background(Color.white.opacity(0.15))
                .padding(.top, 4)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .onAppear {
            loadPreview()
        }
    }

    private func distanceFromUser(station: MapStation) -> String? {
        guard let userLoc = LocationManager.shared.userLocation else { return nil }
        let userLocation = CLLocation(latitude: userLoc.latitude, longitude: userLoc.longitude)
        let stationLocation = CLLocation(
            latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
        let distance = userLocation.distance(from: stationLocation)

        if distance < 1000 {
            return "\(Int(distance)) m"
        } else {
            return String(format: "%.1f km", distance / 1000)
        }
    }

    private func loadPreview() {
        // Utiliser les stop_area quand disponibles (1-2 requêtes au lieu de 5-15)
        let stopAreaIds = Set(station.platforms.compactMap { platform -> String? in
            let id = platform.stopAreaId
            if id.isEmpty || id.contains("IDFM:C") || id.contains(":C") { return nil }
            return id
        })

        if !stopAreaIds.isEmpty {
            // Requête par stop_area (beaucoup plus efficace)
            let publishers = stopAreaIds.prefix(2).map { id in
                IDFMService.shared.fetchDepartures(for: "stop_area:\(id)")
                    .catch { _ in Just<[Departure]>([]) }
            }

            Publishers.MergeMany(publishers)
                .collect()
                .map { results in
                    results.flatMap { $0 }.sorted {
                        $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                    }
                }
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { _ in isLoading = false },
                    receiveValue: { deps in
                        self.groupDeparturesWithDirections(deps)
                        self.isLoading = false
                    }
                )
                .store(in: &cancellables)
        } else {
            // Fallback: limiter à 3 stop_points pour l'aperçu
            let stopIds = Array(Set(station.platforms.map { $0.id }.filter { $0.contains("IDFM:") }).prefix(3))

            let publishers = stopIds.map { id in
                IDFMService.shared.fetchDepartures(for: id)
                    .catch { _ in Just<[Departure]>([]) }
            }

            Publishers.MergeMany(publishers)
                .collect()
                .map { results in
                    results.flatMap { $0 }.sorted {
                        $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                    }
                }
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { _ in isLoading = false },
                    receiveValue: { deps in
                        self.groupDeparturesWithDirections(deps)
                        self.isLoading = false
                    }
                )
                .store(in: &cancellables)
        }
    }

    private func groupDeparturesWithDirections(_ deps: [Departure]) {
        var groups: [String: [String: [Departure]]] = [:]

        for dep in deps {
            let lineLabel = dep.displayInformations.label ?? dep.displayInformations.code ?? "?"
            let direction = dep.displayInformations.direction ?? "Inconnue"

            if groups[lineLabel] == nil {
                groups[lineLabel] = [:]
            }

            if groups[lineLabel]?[direction] == nil {
                groups[lineLabel]?[direction] = []
            }

            // Limit to 2 departures per direction for preview
            if groups[lineLabel]![direction]!.count < 2 {
                groups[lineLabel]![direction]!.append(dep)
            }
        }

        self.groupedDepartures = groups
    }

    private func formatDepartureTime(_ dep: Departure) -> String {
        let remaining = DateFormat.timeRemaining(from: dep.stopDateTime.departureDateTime)
        return remaining.isEmpty ? "?" : (remaining == "0 min" ? "Maintenant" : remaining)
    }

    private func determineType(from info: DisplayInformations?) -> TransportType {
        guard let info = info else { return .bus }
        let mode = (info.commercial_mode ?? "").lowercased()

        if mode.contains("rer") { return .rer }
        if mode.contains("metro") || mode.contains("métro") { return .metro }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") || mode.contains("rail") { return .transilien }
        if mode.contains("cable") || mode.contains("funiculaire") { return .cable }
        return .bus
    }
}

// Extension pour récupérer la couleur du type de transport (si pas déjà dispo)
extension TransportType {
    static func color(for type: TransportType) -> Color {
        switch type {
        case .metro: return .blue
        case .rer: return .red
        case .train, .transilien: return .orange
        case .tram: return .purple
        case .bus: return .cyan
        case .cable: return .gray
        }
    }
}

#Preview {
    NearbyStationsView()
}

