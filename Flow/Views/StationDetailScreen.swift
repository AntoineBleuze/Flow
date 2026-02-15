import Combine
import CoreLocation
import SwiftUI

struct StationDetailScreen: View {
    let station: MapStation
    @State private var departures: [Departure] = []
    @ObservedObject var favoritesService = FavoritesService.shared
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var cancellable: AnyCancellable?
    @State private var selectedMode: String = "Tout"
    @State private var showItinerary = false
    @ObservedObject var locationManager = LocationManager.shared

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

    var body: some View {
        ZStack {
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
        .background {
            AdaptiveMapBackground()
        }
        .navigationTitle(station.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    // Bouton Favoris
                    Button(action: {
                        FavoritesService.shared.toggleFavorite(stationId: station.id)
                    }) {
                        Image(
                            systemName: FavoritesService.shared.isFavorite(stationId: station.id)
                                ? "heart.fill" : "heart"
                        )
                        .foregroundColor(.red)
                    }

                    // Bouton Y Aller
                    Button {
                        showItinerary = true
                    } label: {
                        Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
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

    var contentView: some View {
        VStack(spacing: 0) {
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
                .padding(.top, 16)
            }

            ScrollView {
                VStack(spacing: 20) {
                    let groups = groupDepartures(departures)
                    let filteredGroups = groups.filter { group in
                        if selectedMode == "Tout" { return true }
                        return group.mode?.lowercased().contains(selectedMode.lowercased()) ?? false
                            || (group.mode == nil && selectedMode == "Autre")
                    }

                    ForEach(filteredGroups) { group in
                        StationLineRow(
                            group: group,
                            onLiveActivityStart: { lineName, direction, nextDepartures, lineColor, textColor in
                                startLiveActivity(
                                    lineName: lineName,
                                    direction: direction,
                                    nextDepartures: nextDepartures,
                                    lineColor: lineColor,
                                    textColor: textColor
                                )
                            }
                        )
                    }
                }
                .padding(.top)
                .padding(.bottom, 50)
            }
        }
    }

    struct StationLineRow: View {
        let group: LineGroup
        let onLiveActivityStart: (String, String, [String], String, String) -> Void

        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                // En-tête de ligne (Icone + Nom optionnel)
                HStack {
                    // Icone Ligne
                    LineIcon(
                        type: StationDetailScreen.determineType(mode: group.mode),
                        lineId: group.label,
                        size: 40
                    )

                    if let network = group.network {
                        Text(network)
                            .font(.subheadline)
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
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)

                                // Liste des temps (ex: "1, 4 min")
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
                                        .font(.body)
                                        .bold()
                                        .foregroundColor(.green)
                                    }

                                    Image(systemName: "wifi")  // Symbole temps réel
                                        .font(.caption)
                                        .foregroundColor(.green)
                                        .padding(.leading, 4)
                                }
                            }

                            Spacer()

                            // Bouton Live Activity pour cette direction
                            Button(action: {
                                onLiveActivityStart(
                                    group.label,
                                    direction.direction,
                                    direction.times,
                                    group.color,
                                    group.text_color ?? "FFFFFF"
                                )
                            }) {
                                Image(systemName: "waveform.path.ecg")
                                    .font(.title3)
                                    .foregroundColor(.green)
                                    .padding(8)
                            }
                            .buttonStyle(.glass)
                        }
                        .padding()

                        if index < group.directions.count - 1 {
                            Divider()
                                .padding(.leading)
                        }
                    }
                }
                // Utilisation de l'effet Glass pour la cohérence
                .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 12))
            }
            .padding(.horizontal)
        }
    }

    // MARK: - Logic Helpers (Copied/Adapted from StationDetailSheet)

    static func determineType(mode: String?) -> TransportType {
        guard let mode = mode?.lowercased() else { return .bus }
        if mode.contains("rer") { return .rer }
        if mode.contains("metro") || mode.contains("métro") { return .metro }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") { return .transilien }
        if mode.contains("cable") || mode.contains("funiculaire") { return .cable }
        return .bus
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

        // Tri: Lignes (Numérique/Alpha) puis Directions
        return groups.values.sorted { $0.label < $1.label }.map { group in
            var newGroup = group
            newGroup.directions.sort { $0.direction < $1.direction }
            return newGroup
        }
    }

    private func loadDepartures() {
        isLoading = true
        errorMessage = nil

        // Récupérer tous les IDs uniques des quais de la station pour avoir toutes les lignes
        let stopIds = Set(station.platforms.map { $0.id })

        // Créer un tableau de publishers pour chaque arrêt
        let publishers = stopIds.map { id in
            IDFMService.shared.fetchDepartures(for: id)
                .catch { error -> Just<[Departure]> in
                    print("⚠️ Error fetching for \(id): \(error)")
                    return Just([])  // Ignorer les erreurs individuelles
                }
        }

        // Combiner tous les résultats
        cancellable = Publishers.MergeMany(publishers)
            .collect()
            .map { results in
                // Aplatir et trier par heure de départ
                results.flatMap { $0 }.sorted {
                    $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    isLoading = false
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { allDepartures in
                    self.departures = allDepartures
                })
    }

    private func timeRemaining(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: dateString) {
            let diff = Int(date.timeIntervalSinceNow / 60)
            if diff <= 0 { return "0 min" }
            return "\(diff) min"
        }
        return ""
    }

    private func startLiveActivity(
        lineName: String, direction: String, nextDepartures: [String], lineColor: String,
        textColor: String
    ) {
        guard !nextDepartures.isEmpty else { return }

        LiveActivityManager.shared.startLiveActivity(
            stationName: station.name,
            lineName: lineName,
            direction: direction,
            nextDepartures: Array(nextDepartures.prefix(2)),
            stopIds: station.platforms.map { $0.id },
            lineColor: lineColor,
            textColor: textColor
        )
    }

    private func getAvailableModes(from departures: [Departure]) -> [String] {
        let modes = Set(departures.compactMap { $0.displayInformations.commercial_mode })
        return Array(modes).sorted()
    }
}
