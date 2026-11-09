import Combine
import CoreLocation
import SwiftUI

struct NearbyStationsView: View {
    @StateObject private var viewModel = NearbyStationsViewModel()
    @ObservedObject private var mapData = MapDataService.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var coordinator: NavigationCoordinator
    var embeddedInSheet: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            LiquidGlassSheetHeader(
                title: "À Proximité",
                subtitle: viewModel.nearbyStations.isEmpty ? nil : "\(viewModel.nearbyStations.count) stations autour de vous"
            ) {
                if !viewModel.permissionDenied && viewModel.userLocation != nil {
                    RadiusSelector(viewModel: viewModel)
                }
            }

            nearbyStationsContent
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .liquidGlassBackground()
    }

    @ViewBuilder
    private var nearbyStationsContent: some View {
        if viewModel.permissionDenied {
            ScrollView {
                LiquidGlassEmptyState(
                    icon: "location.slash.fill",
                    title: "Localisation désactivée",
                    subtitle: "Veuillez activer la localisation dans les réglages pour voir les stations à proximité."
                )
                .padding(.top, 28)
                .padding(.bottom, 100)
            }
            .scrollContentBackground(.hidden)
        } else if viewModel.userLocation == nil {
            ScrollView {
                LiquidGlassEmptyState(
                    icon: "location.circle.fill",
                    title: "Localisation nécessaire",
                    subtitle: "Autorisez l'accès à votre position pour trouver les stations autour de vous.",
                    actionTitle: "Autoriser la localisation",
                    action: {
                        viewModel.requestLocation()
                    }
                )
                .padding(.top, 28)
                .padding(.bottom, 100)
            }
            .scrollContentBackground(.hidden)
        } else if viewModel.nearbyStations.isEmpty {
            ScrollView {
                if viewModel.isLoading {
                    VStack(spacing: 14) {
                        ProgressView()
                            .tint(.primary)
                        Text("Recherche des stations...")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 56)
                } else {
                    LiquidGlassEmptyState(
                        icon: "tram.fill",
                        title: "Aucune station trouvée",
                        subtitle: "Aucune station dans un rayon de \(Int(viewModel.selectedRadius))m."
                    )
                    .padding(.top, 28)
                    .padding(.bottom, 100)
                }
            }
            .scrollContentBackground(.hidden)
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.nearbyStations) { station in
                        Button(action: {
                            coordinator.selectedStation = station
                            coordinator.switchToExplore()
                        }) {
                            NearbyStationRow(station: station)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 96)
                .frame(maxWidth: horizontalSizeClass == .regular ? 700 : .infinity)
                .frame(maxWidth: .infinity)
            }
            .scrollContentBackground(.hidden)
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
            HStack(spacing: 6) {
                Image(systemName: "scope")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.blue)
                Text(formatRadius(viewModel.selectedRadius))
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Image(systemName: "chevron.down")
                    .font(.caption2.weight(.bold))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .glassEffect(.regular.interactive(), in: .capsule)
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
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.primary.opacity(0.06), in: Capsule())
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
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
        )
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
        var result: [String: [String: [Departure]]] = [:]

        for dep in deps {
            guard let label = dep.displayInformations.label else { continue }
            let rawDirection = dep.displayInformations.direction ?? "Direction inconnue"
            let cleanDirection = rawDirection.components(separatedBy: " (").first ?? rawDirection

            if result[label] == nil {
                result[label] = [:]
            }
            if result[label]?[cleanDirection] == nil {
                result[label]?[cleanDirection] = []
            }

            if (result[label]?[cleanDirection]?.count ?? 0) < 2 {
                result[label]?[cleanDirection]?.append(dep)
            }
        }

        self.groupedDepartures = result
    }

    private func formatDepartureTime(_ departure: Departure) -> String {
        let isoDate = departure.stopDateTime.departureDateTime
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: isoDate) {
            let diff = Int(date.timeIntervalSinceNow / 60)
            if diff <= 0 { return "0 min" }
            return "\(diff) min"
        }
        return "--"
    }

    private func determineType(from info: DisplayInformations?) -> TransportType {
        guard let mode = info?.commercial_mode ?? info?.network else { return .metro }
        let lower = mode.lowercased()
        if lower.contains("rer") { return .rer }
        if lower.contains("tram") { return .tram }
        if lower.contains("bus") { return .bus }
        if lower.contains("train") || lower.contains("transilien") || lower.contains("ter") {
            return .transilien
        }
        return .metro
    }
}
