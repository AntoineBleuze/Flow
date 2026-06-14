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
                    VStack(spacing: 20) {
                        Image(systemName: "star.slash.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Aucun favori")
                            .font(.headline)
                        Text(
                            "Ajoutez des lignes à vos favoris en appuyant sur l'icône de cœur à côté de chaque ligne dans le détail d'une station."
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 20)
                } else {
                    List {
                        ForEach(favoriteEntries) { entry in
                            NavigationLink(destination: TrafficDetailView(line: getTransportLine(for: entry))) {
                                FavoriteLineRow(entry: entry)
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
            .background {
                ZStack {
                    ShaderAnimationView(isLoading: true)
                    (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                        .background(.ultraThinMaterial.opacity(0.97))
                }
                .ignoresSafeArea()
            }
            .navigationTitle("Favoris")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct FavoriteLineRow: View {
    let entry: FavoriteLineEntry
    @Environment(\.colorScheme) var colorScheme
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
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                // Line Badge
                LineIcon(line: line, size: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(lineNameString)
                        .font(.headline)
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
                                .foregroundColor(line.status.color)
                        }
                    }
                }
                
                Spacer()
                
                // Remove Favorite button
                Button(action: {
                    withAnimation {
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
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 36, height: 36)
                        .background(colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.05), in: Circle())
                }
                .buttonStyle(.plain)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.secondary)
            }
            
            // Real-time departures (if stationId exists)
            if entry.stationId != nil {
                Divider()
                
                if isLoading && departures.isEmpty {
                    HStack {
                        ProgressView()
                            .scaleEffect(0.8)
                        Text("Chargement des départs...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else if departures.isEmpty {
                    Text("Aucun départ prévu ou info indisponible")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    let grouped = groupedDepartures
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(grouped) { group in
                            HStack {
                                Text(group.direction)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                                
                                Spacer()
                                
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
                                        .font(.caption).bold()
                                        .foregroundColor(.green)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
        // Premium glassmorphic look
        .background(colorScheme == .dark ? Color.white.opacity(0.08) : Color.black.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(colorScheme == .dark ? Color.white.opacity(0.05) : Color.black.opacity(0.03), lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.vertical, 4)
        .onAppear {
            startFetching()
        }
        .onDisappear {
            stopFetching()
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

    // Process and filter departures for this favorite line
    private var groupedDepartures: [FavoriteDepartureGroup] {
        var directionTimes: [String: [Int]] = [:]
        
        for dep in departures {
            let info = dep.displayInformations
            // Match line label (case-insensitive)
            guard let label = info.label, label.lowercased() == entry.lineId.lowercased() else { continue }
            guard let date = DateFormat.navitia.date(from: dep.stopDateTime.departureDateTime) else { continue }
            
            let minutesAway = Int(date.timeIntervalSinceNow / 60)
            guard minutesAway >= 0 && minutesAway < 120 else { continue }
            
            let dirName = info.direction ?? "Inconnue"
            directionTimes[dirName, default: []].append(minutesAway)
        }
        
        return directionTimes.map { dir, times in
            // Sort times ascending and keep next 2
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

#Preview {
    FavoritesView()
}
