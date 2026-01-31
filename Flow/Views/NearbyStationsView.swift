import Combine
import CoreLocation
import SwiftUI

struct NearbyStationsView: View {
    @StateObject private var viewModel = NearbyStationsViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.permissionDenied {
                    VStack(spacing: 20) {
                        Image(systemName: "location.slash.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.orange)
                        Text("Localisation désactivée")
                            .font(.headline)
                        Text(
                            "Veuillez activer la localisation dans les réglages pour voir les stations à proximité."
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if viewModel.userLocation == nil {
                    VStack(spacing: 20) {
                        Image(systemName: "location.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.blue)
                        Text("Localisation nécessaire")
                            .font(.headline)
                        Text(
                            "Autorisez l'accès à votre position pour trouver les stations autour de vous."
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)

                        Button(action: {
                            viewModel.requestLocation()
                        }) {
                            Text("Autoriser la localisation")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 40)
                        }
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
                                Text(
                                    "Aucune station dans un rayon de \(Int(viewModel.selectedRadius))m."
                                )
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .foregroundColor(.secondary)
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
                                ZStack {
                                    NavigationLink(
                                        destination: StationDetailScreen(station: station)
                                    ) {
                                        EmptyView()
                                    }
                                    .opacity(0)

                                    NearbyStationRow(station: station)
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .background {
                AdaptiveMapBackground()
            }
            .navigationTitle("À Proximité")
            .navigationBarTitleDisplayMode(.large)
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
                    .foregroundColor(.primary)
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .glassEffect(Glass.regular, in: .capsule)
            .overlay(
                Capsule()
                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
            )
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

    var body: some View {
        HStack {
            // Icone Type
            TransportTypeIcon(type: station.mainType)
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text(station.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                if isLoading {
                    Text("Chargement...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else if groupedDepartures.isEmpty {
                    Text("Aucun départ proche")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    // Affichage groupé par ligne
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(groupedDepartures.keys.sorted(), id: \.self) { lineKey in
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
                                                        .foregroundColor(.secondary)
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
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Material.thinMaterial)
                    .clipShape(Capsule())
            }
        }
        .padding()
        // Application de l'effet Liquid Glass "intelligemment"
        // On utilise .rect pour conserver l'aspect carte, et on le rend interactif
        .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 12))
        .padding(.vertical, 4)
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
        // Pour une vue à proximité complète, on veut tous les départs de tous les quais de la zone
        let stopIds = Set(station.platforms.map { $0.id })

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
        let dateStr = dep.stopDateTime.departureDateTime
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: dateStr) {
            let diff = Int(date.timeIntervalSinceNow / 60)
            if diff <= 0 { return "Maintenant" }
            return "\(diff) min"
        }
        return "?"
    }

    private func determineType(from info: DisplayInformations?) -> TransportType {
        guard let info = info else { return .bus }
        let mode = (info.commercial_mode ?? "").lowercased()

        if mode.contains("rer") { return .rer }
        if mode.contains("metro") || mode.contains("métro") { return .metro }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") { return .transilien }
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
