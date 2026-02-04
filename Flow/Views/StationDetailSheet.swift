import Combine
import CoreLocation
import SwiftUI

struct StationDetailSheet: View {
    let station: MapStation
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
            // Custom Header
            HStack {
                Button(action: {
                    showItinerary = true
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                        Text("Y aller")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)

                Spacer()

                Text(station.name)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.horizontal, 4)

                Spacer()

                HStack(spacing: 12) {
                    Button(action: {
                        loadDepartures()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive())

                    Button(action: {
                        FavoritesService.shared.toggleFavorite(stationId: station.id)
                    }) {
                        Image(
                            systemName: FavoritesService.shared.isFavorite(stationId: station.id)
                                ? "heart.fill" : "heart"
                        )
                        .font(.title3)
                        .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)

                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            .padding(.top, 10)  // Extra padding for top safe area if needed, though sheet usually handles it.

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
                .padding(.top, 10)
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
                        VStack(alignment: .leading, spacing: 10) {
                            // En-tête de ligne (Icone + Nom optionnel)
                            HStack {
                                // Icone Ligne
                                let assetName = TransportType.getAssetName(
                                    mode: group.mode, label: group.label)
                                if UIImage(named: assetName) != nil {
                                    Image(assetName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                } else {
                                    ZStack {
                                        if group.mode == "RER" || group.mode == "Train" {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color(hex: group.color))
                                                .frame(width: 40, height: 40)
                                        } else {
                                            Circle()
                                                .fill(Color(hex: group.color))
                                                .frame(width: 30, height: 30)
                                        }

                                        Text(group.label)
                                            .font(.headline)
                                            .bold()
                                            .foregroundColor(
                                                Color(hex: group.text_color ?? "FFFFFF"))
                                    }
                                }

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
                                                .font(.title3)
                                                .foregroundColor(isActive ? .green : .red)
                                                .padding(8)
                                                .background(
                                                    (isActive ? Color.green : Color.red).opacity(
                                                        0.1)
                                                )
                                                .clipShape(Circle())
                                        }
                                        .buttonStyle(.plain)
                                    }
                                    .padding()

                                    if index < group.directions.count - 1 {
                                        Divider()
                                            .padding(.leading)
                                    }
                                }
                            }
                            .glassEffect()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
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

            // Filtrage TER : On exclut si c'est un Train/TER mais PAS un Transilien connu
            let mode = info.commercial_mode?.lowercased() ?? ""
            let lbl = info.label ?? ""
            let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]

            if mode.contains("ter") || (mode.contains("train") && !allowedTransiliens.contains(lbl))
            {
                continue
            }

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
        print("🔑 API Key used: \(IDFMService.shared.apiKey)")
        print("📡 Fetching for \(stopIds.count) stop points: \(stopIds)")

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

    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        }
        return dateString
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
        print("🚀 Starting Live Activity for \(lineName) → \(direction)")

        guard !nextDepartures.isEmpty else {
            print("⚠️ No departures available")
            errorMessage = "Aucun horaire disponible."
            return
        }

        let departuresToUse = Array(nextDepartures.prefix(2))

        LiveActivityManager.shared.startLiveActivity(
            stationName: station.name,
            lineName: lineName,
            direction: direction,
            nextDepartures: departuresToUse,
            stopIds: station.platforms.map { $0.id },
            lineColor: lineColor,
            textColor: textColor
        )
    }

    private func getAvailableModes(from departures: [Departure]) -> [String] {
        let modes = Set(departures.compactMap { $0.displayInformations.commercial_mode })
        // On peut normaliser les noms si besoin (ex: "Metro" -> "Métro")
        return Array(modes).sorted()
    }
}
