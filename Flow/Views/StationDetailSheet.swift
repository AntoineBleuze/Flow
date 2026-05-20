import Combine
import CoreLocation
import SwiftUI

struct StationDetailSheet: View {
    let station: MapStation
    var onDismiss: (() -> Void)? = nil  // For inline iPad panel
    @State private var departures: [Departure] = []
    @ObservedObject var favoritesService = FavoritesService.shared
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var cancellable: AnyCancellable?
    @State private var selectedMode: String = "Tout"
    @State private var showItinerary = false
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var liveActivityManager = LiveActivityManager.shared

    @Environment(\.dismiss) var dismiss

    // Structures pour le regroupement
    struct LineGroup: Identifiable {
        let id: String
        let label: String
        let color: String
        let text_color: String?
        let network: String?
        let mode: String?
        var directions: [DirectionGroup]
    }

    struct DirectionGroup: Identifiable {
        let id: String
        let direction: String
        var times: [String]
    }

    @ViewBuilder
    private var sheetContent: some View {
        if isLoading {
            ProgressView("Chargement des horaires...")
        } else if let error = errorMessage {
            VStack {
                Text("Erreur: \(error)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                if error.contains("401") || error.contains("Authentication") {
                    Text("Vérifiez votre clé API IDFM.")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        } else if departures.isEmpty {
            Text("Aucun départ trouvé.")
                .foregroundColor(.secondary)
        } else {
            contentView
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                sheetContent
            }
            .glassEffect().edgesIgnoringSafeArea(.all)
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                loadDepartures()
            }
            .background(
                NavigationLink(
                    destination: ItineraryResultView(
                        destination: station,
                        currentLocation: locationManager.userLocation
                    ),
                    isActive: $showItinerary
                ) {
                    EmptyView()
                }
            )
        }
        .presentationBackground(.clear)
    }

    var contentView: some View {
        VStack(spacing: 0) {
            // Header — Station name + close
            HStack(alignment: .center) {
                Text(station.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)

                Spacer()

                // Close button
                Button(action: {
                    if let onDismiss = onDismiss {
                        onDismiss()
                    } else {
                        dismiss()
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)

            // Row 2: Y aller button + action buttons
            HStack(spacing: 10) {
                // Y aller — prominent button
                Button(action: { showItinerary = true }) {
                    Label("Y aller", systemImage: "arrow.triangle.turn.up.right.circle.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.glassProminent)

                Spacer()

                // Action buttons — individual glass circles
                Button(action: { loadDepartures() }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.body)
                        .fontWeight(.medium)
                        .frame(width: 36, height: 36)
                }
                .buttonStyle(.glass)

                Button(action: {
                    FavoritesService.shared.toggleFavorite(stationId: station.id)
                }) {
                    Image(
                        systemName: FavoritesService.shared.isFavorite(stationId: station.id)
                            ? "heart.fill" : "heart"
                    )
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.red)
                    .frame(width: 36, height: 36)
                }
                .buttonStyle(.glass)
            }
            .padding(.horizontal)
            .padding(.top, 8)

            // Filtre des modes
            let availableModes = getAvailableModes(from: departures)
            if availableModes.count > 1 {
                Picker("Mode", selection: $selectedMode) {
                    Text("Tout").tag("Tout")
                    ForEach(availableModes, id: \.self) { mode in
                        Text(mode).tag(mode)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.top, 8)
            }

            ScrollView {
                VStack(spacing: 16) {
                    let groups = groupDepartures(departures)
                    let filteredGroups = groups.filter { group in
                        if selectedMode == "Tout" { return true }
                        return group.mode?.lowercased().contains(selectedMode.lowercased()) ?? false
                            || (group.mode == nil && selectedMode == "Autre")
                    }

                    ForEach(filteredGroups) { group in
                        VStack(alignment: .leading, spacing: 8) {
                            // En-tête de ligne (Icone + Réseau)
                            HStack(spacing: 10) {
                                // Icone Ligne
                                let assetName = TransportType.getAssetName(
                                    mode: group.mode, label: group.label)
                                if UIImage(named: assetName) != nil {
                                    Image(assetName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 36, height: 36)
                                } else {
                                    ZStack {
                                        if group.mode == "RER" || group.mode == "Train" {
                                            RoundedRectangle(cornerRadius: 6)
                                                .fill(Color(hex: group.color))
                                                .frame(width: 36, height: 36)
                                        } else {
                                            Circle()
                                                .fill(Color(hex: group.color))
                                                .frame(width: 30, height: 30)
                                        }

                                        Text(group.label)
                                            .font(.subheadline)
                                            .bold()
                                            .foregroundColor(
                                                Color(hex: group.text_color ?? "FFFFFF"))
                                    }
                                }

                                if let network = group.network {
                                    Text(network)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()
                            }
                            .padding(.horizontal)

                            // Carte des directions
                            VStack(spacing: 0) {
                                ForEach(Array(group.directions.enumerated()), id: \.element.id) {
                                    index, direction in
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(direction.direction)
                                                .font(.subheadline)
                                                .foregroundColor(.primary)
                                                .lineLimit(2)

                                            // Liste des temps
                                            HStack(spacing: 0) {
                                                ForEach(
                                                    Array(direction.times.enumerated()),
                                                    id: \.offset
                                                ) { tIndex, time in
                                                    Text(
                                                        time
                                                            + (tIndex < direction.times.count - 1
                                                                ? ", " : "")
                                                    )
                                                    .font(.subheadline)
                                                    .bold()
                                                    .foregroundColor(.green)
                                                }

                                                Image(systemName: "wifi")
                                                    .font(.caption2)
                                                    .foregroundColor(.green)
                                                    .padding(.leading, 4)
                                            }
                                        }

                                        Spacer()

                                        // Bouton Live Activity pour cette direction
                                        let isActive = liveActivityManager.isActivityActive(
                                            line: group.label, direction: direction.direction)

                                        Button(action: {
                                            if isActive {
                                                liveActivityManager.endLiveActivity()
                                            } else {
                                                startLiveActivity(
                                                    lineName: group.label,
                                                    direction: direction.direction,
                                                    nextDepartures: direction.times,
                                                    lineColor: group.color,
                                                    textColor: group.text_color ?? "FFFFFF"
                                                )
                                            }
                                        }) {
                                            Image(systemName: "bolt.fill")
                                                .font(.body)
                                                .foregroundColor(isActive ? .green : .pink)
                                                .frame(width: 34, height: 34)
                                        }
                                        .buttonStyle(.glass)
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 12)

                                    if index < group.directions.count - 1 {
                                        Divider()
                                            .padding(.leading, 14)
                                    }
                                }
                            }
                            .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 16))
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 30)
            }
            .scrollContentBackground(.hidden)
        }
    }

    private func groupDepartures(_ departures: [Departure]) -> [LineGroup] {
        var groups: [String: LineGroup] = [:]

        for dep in departures {
            let info = dep.displayInformations
            // Unwrap label safely
            guard let lineKey = info.label, !lineKey.isEmpty else { continue }

            // Calcul du temps
            let timeStr = timeRemaining(dep.stopDateTime.departureDateTime)
            if timeStr.isEmpty { continue }

            if groups[lineKey] == nil {
                groups[lineKey] = LineGroup(
                    id: lineKey,
                    label: lineKey,
                    color: info.color ?? "000000",
                    text_color: info.textColor,
                    network: info.network,
                    mode: info.commercial_mode,
                    directions: []
                )
            }

            // Gestion des directions
            let dirName = info.direction ?? "Inconnue"

            if var group = groups[lineKey],
                let dirIndex = group.directions.firstIndex(where: { $0.direction == dirName })
            {
                // Limite à 2 horaires pour ne pas surcharger
                if group.directions[dirIndex].times.count < 2 {
                    group.directions[dirIndex].times.append(timeStr)
                    groups[lineKey] = group  // Mise à jour de la struct (value type)
                }
            } else {
                groups[lineKey]?.directions.append(
                    DirectionGroup(id: UUID().uuidString, direction: dirName, times: [timeStr]))
            }
        }

        // Tri: Par mode (Métro → RER → Transilien → Tram → autre) puis numérique/alpha
        return groups.values.sorted { a, b in
            let priorityA = modePriority(a.mode)
            let priorityB = modePriority(b.mode)
            if priorityA != priorityB { return priorityA < priorityB }
            return compareLineLabels(a.label, b.label)
        }.map { group in
            var newGroup = group
            newGroup.directions.sort { $0.direction < $1.direction }
            return newGroup
        }
    }

    private func loadDepartures() {
        isLoading = true
        errorMessage = nil

        // Récupérer les stopAreaIds uniques des quais (le vrai ID de zone d'arrêt pour l'API)
        let stopAreaIds = Set(station.platforms.compactMap { platform -> String? in
            let id = platform.stopAreaId
            return id.isEmpty ? nil : id
        })
        
        print("🏪 Station: \(station.name)")
        print("📡 Unique stop_area IDs: \(stopAreaIds)")
        
        // Si pas de stopAreaId valide, fallback sur les stop_points individuels
        if stopAreaIds.isEmpty {
            print("⚠️ No valid stopAreaIds, falling back to stop_points")
            let stopPointIds = Set(station.platforms.map { $0.id })
            
            // Limiter à 15 requêtes max pour économiser le quota mais avoir tout le hub
            let limitedIds = Array(stopPointIds.prefix(15))
            print("📡 Using \(limitedIds.count) stop_points (limited): \(limitedIds)")
            
            let publishers = limitedIds.map { id in
                IDFMService.shared.fetchDepartures(for: id)
                    .catch { _ in Just<[Departure]>([]) }
            }
            
            cancellable = Publishers.MergeMany(publishers)
                .collect()
                .map { $0.flatMap { $0 } }
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { _ in self.isLoading = false },
                    receiveValue: { deps in
                        self.departures = deps.sorted { $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime }
                        print("✅ Received \(deps.count) departures")
                    })
            return
        }
        
        // Utiliser les stop_areas (1 requête par zone unique, généralement 1-2 max)
        let publishers = stopAreaIds.map { id in
            IDFMService.shared.fetchDepartures(for: "stop_area:\(id)")
                .catch { error -> Just<[Departure]> in
                    print("⚠️ Error for stop_area \(id): \(error)")
                    return Just([])
                }
        }
        
        print("📡 Fetching \(stopAreaIds.count) stop_area(s)")
        
        cancellable = Publishers.MergeMany(publishers)
            .collect()
            .map { results in
                results.flatMap { $0 }.sorted {
                    $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    self.isLoading = false
                    if case .failure(let error) = completion {
                        self.errorMessage = error.localizedDescription
                        print("❌ Error: \(error)")
                    }
                },
                receiveValue: { allDepartures in
                    self.departures = allDepartures
                    print("✅ Received \(allDepartures.count) departures")
                })
    }

    private func formatDate(_ dateString: String) -> String {
        return DateFormat.formatTime(from: dateString)
    }

    private func timeRemaining(_ dateString: String) -> String {
        return DateFormat.timeRemaining(from: dateString)
    }

    private func startLiveActivity(
        lineName: String, direction: String, nextDepartures: [String], lineColor: String,
        textColor: String
    ) {
        print("🚀 Starting Live Activity for \(lineName) → \(direction)")

        guard !nextDepartures.isEmpty else {
            print("⚠️ No departures available")
            errorMessage = "Aucun horaire disponible."
            return
        }

        let departuresToUse = Array(nextDepartures.prefix(2))

        // Optimisation :
        // 1. Filtrer les quais qui correspondent à la ligne sélectionnée
        // 2. Utiliser les stop_area_id si disponibles (1 requête au lieu de N)
        // 3. Dédupliquer
        let relevantPlatforms = station.platforms.filter { $0.lineName == lineName }
        
        let optimizedIds: Set<String> = Set(relevantPlatforms.compactMap { platform in
            if !platform.stopAreaId.isEmpty {
                return "stop_area:\(platform.stopAreaId)"
            } else {
                // Fallback sur stop_point.
                // Le serveur utilise .contains("stop_point") pour choisir l'endpoint.
                let id = platform.id
                if !id.contains("stop_point") {
                    return "stop_point:\(id)"
                }
                return id
            }
        })

        LiveActivityManager.shared.startLiveActivity(
            stationName: station.name,
            lineName: lineName,
            direction: direction,
            nextDepartures: departuresToUse,
            stopIds: Array(optimizedIds),
            lineColor: lineColor,
            textColor: textColor
        )
    }

    private func modePriority(_ mode: String?) -> Int {
        guard let m = mode?.lowercased() else { return 99 }
        if m.contains("metro") || m.contains("métro") { return 0 }
        if m.contains("rer") { return 1 }
        if m.contains("train") || m.contains("transilien") { return 2 }
        if m.contains("tram") { return 3 }
        if m.contains("bus") { return 4 }
        return 5
    }

    private func compareLineLabels(_ a: String, _ b: String) -> Bool {
        if let numA = Int(a), let numB = Int(b) {
            return numA < numB
        }
        if Int(a) != nil { return true }
        if Int(b) != nil { return false }
        return a.localizedStandardCompare(b) == .orderedAscending
    }

    private func getAvailableModes(from departures: [Departure]) -> [String] {
        let modes = Set(departures.compactMap { $0.displayInformations.commercial_mode })
        // On peut normaliser les noms si besoin (ex: "Metro" -> "Métro")
        return Array(modes).sorted()
    }
}
