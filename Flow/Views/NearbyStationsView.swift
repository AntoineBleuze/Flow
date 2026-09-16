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
                .liquidGlassBackground()
                .navigationTitle("À Proximité")
                .navigationBarTitleDisplayMode(.large)
        }
    }

    @ViewBuilder
    private var nearbyStationsContent: some View {
        if viewModel.permissionDenied {
            VStack(spacing: 20) {
                Image(systemName: "location.slash.fill")
                    .font(.system(size: 54))
                    .foregroundColor(.orange)
                Text("Localisation désactivée")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(
                    "Veuillez activer la localisation dans les réglages pour voir les stations à proximité."
                )
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .foregroundColor(.secondary)
            }
            .padding(24)
            .liquidGlassCard(cornerRadius: 24, padding: 24)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if viewModel.userLocation == nil {
            VStack(spacing: 20) {
                Image(systemName: "location.circle.fill")
                    .font(.system(size: 54))
                    .foregroundColor(.blue)
                Text("Localisation nécessaire")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(
                    "Autorisez l'accès à votre position pour trouver les stations autour de vous."
                )
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .foregroundColor(.secondary)

                Button(action: {
                    viewModel.requestLocation()
                }) {
                    Text("Autoriser la localisation")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .shadow(color: Color.blue.opacity(0.35), radius: 8, y: 3)
                }
                .buttonStyle(.liquidGlassInteractive)
                .padding(.horizontal, 20)
                .padding(.top, 8)
            }
            .padding(24)
            .liquidGlassCard(cornerRadius: 24, padding: 24)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if viewModel.nearbyStations.isEmpty {
            VStack(spacing: 20) {
                RadiusSelector(viewModel: viewModel)
                    .padding(.top, 8)

                if viewModel.isLoading {
                    ProgressView("Recherche des stations...")
                        .tint(.primary)
                        .foregroundColor(.secondary)
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "tram.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.secondary)
                        Text("Aucune station trouvée")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text(
                            "Aucune station dans un rayon de \(Int(viewModel.selectedRadius))m."
                        )
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .foregroundColor(.secondary)
                    }
                    .padding(24)
                    .liquidGlassCard(cornerRadius: 24, padding: 24)
                    .padding(.horizontal, 20)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                VStack(spacing: 14) {
                    HStack {
                        RadiusSelector(viewModel: viewModel)
                        Spacer()
                        Text("\(viewModel.nearbyStations.count) stations")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)

                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.nearbyStations) { station in
                            Button(action: {
                                coordinator.selectedStation = station
                                coordinator.switchToExplore()
                            }) {
                                NearbyStationRow(station: station)
                            }
                            .buttonStyle(.liquidGlassInteractive)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: horizontalSizeClass == .regular ? 700 : .infinity)
                .frame(maxWidth: .infinity)
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
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Image(systemName: "chevron.down")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial, in: Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.primary.opacity(0.08), lineWidth: 1)
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
    @Environment(\.colorScheme) var colorScheme

    @State private var groupedDepartures: [String: [String: [Departure]]] = [:]
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
        LiquidGlassCard(cornerRadius: 18, padding: 14) {
            VStack(alignment: .leading, spacing: 10) {
                // Station Header: Name, Transport Badges, Distance Pill
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(station.name)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(1)

                        HStack(spacing: 4) {
                            let lines = displayedStationLines
                            ForEach(lines.prefix(5), id: \.id) { line in
                                LineIcon(type: line.type, lineId: line.name, size: 18)
                            }

                            if station.mainType != .bus && station.lines.contains(where: { $0.type == .bus }) {
                                Image("Bus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 18)
                            }
                        }
                    }

                    Spacer()

                    if let distance = distanceFromUser(station: station) {
                        HStack(spacing: 4) {
                            Image(systemName: "figure.walk")
                                .font(.caption2)
                            Text(distance)
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.primary)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.ultraThinMaterial, in: Capsule())
                        .overlay(Capsule().stroke(Color.primary.opacity(0.08), lineWidth: 1))
                    }
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                        .padding(.leading, 4)
                }

                // Departures Preview
                if isLoading {
                    HStack(spacing: 6) {
                        ProgressView()
                            .scaleEffect(0.75)
                        Text("Recherche des horaires...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 2)
                } else if groupedDepartures.isEmpty {
                    Text("Aucun départ immédiat")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 2)
                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        Divider().opacity(0.5)
                        
                        ForEach(groupedDepartures.keys.sorted { a, b in
                            if let numA = Int(a), let numB = Int(b) { return numA < numB }
                            if Int(a) != nil { return true }
                            if Int(b) != nil { return false }
                            return a.localizedStandardCompare(b) == .orderedAscending
                        }.prefix(3), id: \.self) { lineKey in
                            if let directions = groupedDepartures[lineKey] {
                                let firstDep = directions.values.first?.first
                                let type = determineType(from: firstDep?.displayInformations)
                                
                                HStack(alignment: .center, spacing: 8) {
                                    LineIcon(type: type, lineId: lineKey, size: 20)

                                    VStack(alignment: .leading, spacing: 2) {
                                        ForEach(directions.keys.sorted().prefix(1), id: \.self) { directionKey in
                                            if let deps = directions[directionKey] {
                                                HStack {
                                                    Text(directionKey)
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                        .lineLimit(1)

                                                    Spacer()

                                                    HStack(spacing: 4) {
                                                        Circle()
                                                            .fill(LiquidGlassTheme.liveGreen(for: colorScheme))
                                                            .frame(width: 5, height: 5)
                                                        
                                                        Text(
                                                            deps.prefix(2).map(formatDepartureTime)
                                                                .joined(separator: ", ")
                                                        )
                                                        .font(.system(.caption, design: .rounded))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(LiquidGlassTheme.liveGreen(for: colorScheme))
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 2)
                }
            }
        }
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
        let stopAreaIds = Set(station.platforms.compactMap { platform -> String? in
            let id = platform.stopAreaId
            if id.isEmpty || id.contains("IDFM:C") || id.contains(":C") { return nil }
            return id
        })

        if !stopAreaIds.isEmpty {
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

// Extension pour récupérer la couleur du type de transport
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
