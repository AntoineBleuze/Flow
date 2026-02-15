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
            HStack(spacing: 12) {
                // Y aller — prominent glass button
                Button(action: {
                    showItinerary = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                            .font(.title3)
                        Text("Y aller")
                            .font(.callout)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                }
                .buttonStyle(.glassProminent)

                // Station name
                Text(station.name)
                    .font(.headline)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)

                // Action buttons grouped in a single glass container
                HStack(spacing: 14) {
                    Button(action: {
                        loadDepartures()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }

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

                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .glassEffect(.regular, in: Capsule())
            }
            .padding(.horizontal)
            .padding(.top, 14)

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
