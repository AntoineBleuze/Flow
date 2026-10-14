import Combine
import SwiftUI

struct FavoritesView: View {
    @ObservedObject private var favoritesService = FavoritesService.shared
    @ObservedObject private var trafficService = TrafficService.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme

    private var favoriteEntries: [FavoriteLineEntry] {
        favoritesService.favoriteLinesList.compactMap { FavoriteLineEntry(key: $0) }
        .sorted { lhs, rhs in
            let lhsPriority = lhs.type.priority
            let rhsPriority = rhs.type.priority
            if lhsPriority != rhsPriority {
                return lhsPriority > rhsPriority
            }
            if lhs.lineId != rhs.lineId {
                return lhs.lineId.localizedStandardCompare(rhs.lineId) == .orderedAscending
            }
            let lhsStation = lhs.stationName ?? ""
            let rhsStation = rhs.stationName ?? ""
            return lhsStation.localizedStandardCompare(rhsStation) == .orderedAscending
        }
    }

    private func getTransportLine(for entry: FavoriteLineEntry) -> TransportLine {
        let allLines = trafficService.lines
        var line: TransportLine
        if let matched = allLines.first(where: { $0.lineId == entry.lineId && $0.type == entry.type }) {
            line = matched
        } else {
            line = TransportLine(
                type: entry.type,
                lineId: entry.lineId,
                status: .normal
            )
        }
        if let colorHex = entry.color {
            line.colorHex = colorHex
        }
        if let textColorHex = entry.textColor {
            line.textColorHex = textColorHex
        }
        return line
    }

    var body: some View {
        NavigationStack {
            Group {
                if favoriteEntries.isEmpty {
                    emptyStateView
                } else {
                    ScrollView {
                        LazyVStack(spacing: 14) {
                            ForEach(favoriteEntries) { entry in
                                NavigationLink(destination: TrafficDetailView(line: getTransportLine(for: entry))) {
                                    FavoriteLineRow(entry: entry)
                                }
                                .buttonStyle(.liquidGlassInteractive)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .frame(maxWidth: horizontalSizeClass == .regular ? 700 : .infinity)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .liquidGlassBackground()
            .navigationTitle("Favoris")
            .navigationBarTitleDisplayMode(.large)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.slash.fill")
                .font(.system(size: 54))
                .foregroundStyle(.secondary)
                .symbolEffect(.pulse.byLayer, options: .repeating)
            
            Text("Aucun favori")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Ajoutez des lignes à vos favoris en appuyant sur l'icône de cœur dans la fiche détaillée d'une station.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .liquidGlassCard(cornerRadius: 24, padding: 0)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct FavoriteLineRow: View {
    let entry: FavoriteLineEntry
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var favoritesService = FavoritesService.shared
    @ObservedObject var trafficService = TrafficService.shared

    @State private var departures: [Departure] = []
    @State private var isLoading = false
    @State private var timer: Timer? = nil
    @State private var cancellable: AnyCancellable? = nil

    private var line: TransportLine {
        let allLines = trafficService.lines
        var line: TransportLine
        if let matched = allLines.first(where: { $0.lineId == entry.lineId && $0.type == entry.type }) {
            line = matched
        } else {
            line = TransportLine(
                type: entry.type,
                lineId: entry.lineId,
                status: .normal
            )
        }
        if let colorHex = entry.color {
            line.colorHex = colorHex
        }
        if let textColorHex = entry.textColor {
            line.textColorHex = textColorHex
        }
        return line
    }

    var body: some View {
        LiquidGlassCard(cornerRadius: 18, padding: 14) {
            VStack(alignment: .leading, spacing: 12) {
                // Header: Line Badge, Name, Status / Station, Heart
                HStack(spacing: 14) {
                    LineIcon(line: line, size: 42)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(lineNameString)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        if let stationName = entry.stationName {
                            Text(stationName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        } else {
                            HStack(spacing: 6) {
                                Image(systemName: line.status.icon)
                                    .font(.caption)
                                    .foregroundColor(line.status.color)
                                
                                Text(line.status.description)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(line.status.color)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Toggle Favorite Button
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            favoritesService.toggleFavoriteLine(
                                lineId: entry.lineId,
                                type: entry.type,
                                stationId: entry.stationId,
                                stationName: entry.stationName,
                                color: entry.color,
                                textColor: entry.textColor
                            )
                        }
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .bold))
                            .frame(width: 36, height: 36)
                            .background(.ultraThinMaterial, in: Circle())
                            .overlay(Circle().stroke(Color.primary.opacity(0.08), lineWidth: 1))
                    }
                    .buttonStyle(.liquidGlassInteractive)
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                }
                
                // Real-time departures
                if entry.stationId != nil {
                    Divider()
                        .opacity(0.6)
                    
                    if isLoading && departures.isEmpty {
                        HStack(spacing: 8) {
                            ProgressView()
                                .scaleEffect(0.8)
                            Text("Chargement des prochains départs...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 2)
                    } else if departures.isEmpty {
                        HStack(spacing: 6) {
                            Image(systemName: "clock")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("Aucun départ immédiat ou info indisponible")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 2)
                    } else {
                        let grouped = groupedDepartures
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(grouped) { group in
                                HStack(alignment: .firstTextBaseline) {
                                    Text(group.direction)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 6) {
                                        // Live pulsing indicator
                                        Circle()
                                            .fill(LiquidGlassTheme.liveGreen(for: colorScheme))
                                            .frame(width: 6, height: 6)
                                        
                                        HStack(spacing: 4) {
                                            ForEach(Array(group.times.enumerated()), id: \.offset) { tIndex, minuteValue in
                                                HStack(spacing: 0) {
                                                    Text("\(minuteValue)")
                                                        .contentTransition(.numericText())
                                                        .animation(.spring(duration: 0.2), value: minuteValue)
                                                    Text(" min")
                                                    if tIndex < group.times.count - 1 {
                                                        Text(", ")
                                                    }
                                                }
                                                .font(.system(.subheadline, design: .rounded))
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
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onAppear {
            startFetching()
        }
        .onDisappear {
            stopFetching()
        }
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .background {
                stopFetching()
            } else if newPhase == .active {
                startFetching()
            }
        }
    }

    private var lineNameString: String {
        switch line.type {
        case .metro:
            return "Métro Ligne \(line.lineId)"
        case .rer:
            return "RER \(line.lineId)"
        case .tram:
            return "Tramway \(line.lineId)"
        case .transilien:
            return "Transilien \(line.lineId)"
        case .train:
            return "Train \(line.lineId)"
        case .bus:
            return "Bus \(line.lineId)"
        case .cable:
            return "Câble \(line.lineId)"
        }
    }

    private var groupedDepartures: [FavoriteDepartureGroup] {
        var directionTimes: [String: [Int]] = [:]
        
        for dep in departures {
            let info = dep.displayInformations
            guard let label = info.label, label.lowercased() == entry.lineId.lowercased() else { continue }
            guard let date = DateFormat.navitia.date(from: dep.stopDateTime.departureDateTime) else { continue }
            
            let minutesAway = Int(date.timeIntervalSinceNow / 60)
            guard minutesAway >= 0 && minutesAway < 120 else { continue }
            
            let dirName = info.direction ?? "Inconnue"
            directionTimes[dirName, default: []].append(minutesAway)
        }
        
        return directionTimes.map { dir, times in
            let sortedTimes = Array(times.sorted().prefix(2))
            return FavoriteDepartureGroup(direction: dir, times: sortedTimes)
        }.sorted { $0.direction < $1.direction }
    }

    private func startFetching() {
        fetchDepartures()
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
            fetchDepartures()
        }
    }

    private func stopFetching() {
        timer?.invalidate()
        timer = nil
        cancellable?.cancel()
        cancellable = nil
    }

    private func fetchDepartures() {
        guard let stationId = entry.stationId else { return }
        
        isLoading = true
        cancellable = IDFMService.shared.fetchDepartures(for: stationId)
            .sink(receiveCompletion: { completion in
                isLoading = false
                if case .failure(let error) = completion {
                    print("❌ Error fetching departures for favorite: \(error)")
                }
            }, receiveValue: { fetchedDepartures in
                withAnimation(.easeInOut) {
                    self.departures = fetchedDepartures
                }
            })
    }
}

struct FavoriteDepartureGroup: Identifiable {
    var id: String { direction }
    let direction: String
    var times: [Int]
}

#Preview("Favorites View") {
    FavoritesView()
}

#Preview("Favorite Card Item") {
    if let entry = FavoriteLineEntry(key: "1|metro|IDFM:C01377|Nation|FFCD00|000000") {
        FavoriteLineRow(entry: entry)
            .padding()
    }
}
