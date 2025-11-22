import SwiftUI
import Combine

extension Notification.Name {
    static let triggerItinerary = Notification.Name("triggerItinerary")
}

struct StationDetailSheet: View {
    let station: Station
    @State private var departures: [Departure] = []
    @ObservedObject var favoritesService = FavoritesService.shared
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var cancellable: AnyCancellable?
    @State private var selectedMode: String = "Tout"
    
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
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)
                
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
            .navigationTitle(station.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        NotificationCenter.default.post(name: .triggerItinerary, object: station)
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                            Text("Y aller")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        // Bouton Live Activity
                        Button(action: {
                            startLiveActivity()
                        }) {
                            Image(systemName: "waveform.path.ecg")
                                .foregroundColor(.green)
                        }
                        
                        // Bouton Favoris
                        Button(action: {
                            FavoritesService.shared.toggleFavorite(stationId: station.id)
                            // Force UI refresh if needed (via @ObservedObject or Notification)
                        }) {
                            Image(systemName: FavoritesService.shared.isFavorite(stationId: station.id) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }
                        
                        Button("Fermer") {
                            dismiss()
                        }
                    }
                }
            }
            .onAppear {
                loadDepartures()
            }
        }
    }
        
        var contentView: some View {
        VStack {
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
                        return group.mode?.lowercased().contains(selectedMode.lowercased()) ?? false ||
                        (group.mode == nil && selectedMode == "Autre")
                    }
                    
                    ForEach(filteredGroups) { group in
                        VStack(alignment: .leading, spacing: 10) {
                            // En-tête de ligne (Icone + Nom optionnel)
                            HStack {
                                // Icone Ligne
                                let assetName = TransportType.getAssetName(mode: group.mode, label: group.label)
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
                                            .foregroundColor(Color(hex: group.text_color ?? "FFFFFF"))
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
                                ForEach(Array(group.directions.enumerated()), id: \.element.id) { index, direction in
                                    HStack {
                                        Text(direction.direction)
                                            .font(.body)
                                            .foregroundColor(.primary)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                        
                                        // Liste des temps (ex: "1, 4 min")
                                        HStack(spacing: 0) {
                                            ForEach(Array(direction.times.enumerated()), id: \.offset) { tIndex, time in
                                                Text(time + (tIndex < direction.times.count - 1 ? ", " : ""))
                                                    .font(.body)
                                                    .bold()
                                                    .foregroundColor(.green)
                                            }
                                            
                                            Image(systemName: "wifi") // Symbole temps réel
                                                .font(.caption)
                                                .foregroundColor(.green)
                                                .padding(.leading, 4)
                                        }
                                    }
                                    .padding()
                                    
                                    if index < group.directions.count - 1 {
                                        Divider()
                                            .padding(.leading)
                                    }
                                }
                            }
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
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
                   let dirIndex = group.directions.firstIndex(where: { $0.direction == dirName }) {
                    // Limite à 2 horaires pour ne pas surcharger
                    if group.directions[dirIndex].times.count < 2 {
                        group.directions[dirIndex].times.append(timeStr)
                        groups[lineKey] = group // Mise à jour de la struct (value type)
                    }
                } else {
                    groups[lineKey]?.directions.append(DirectionGroup(id: UUID().uuidString, direction: dirName, times: [timeStr]))
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
                        return Just([]) // Ignorer les erreurs individuelles
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
                .sink(receiveCompletion: { completion in
                    isLoading = false
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }, receiveValue: { allDepartures in
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
                if diff <= 0 { return "Maintenant" }
                return "\(diff) min"
            }
            return ""
        }
        

        
    private func startLiveActivity() {
        print("🚀 Attempting to start Live Activity for \(station.name)")
        // Trouver le premier groupe de départ pertinent (ou tout afficher)
        let groups = groupDepartures(departures)
        
        guard let firstGroup = groups.first, let firstDir = firstGroup.directions.first else {
            print("⚠️ No departures found to start Live Activity")
            errorMessage = "Aucun horaire disponible pour lancer l'activité."
            return
        }
        
        let nextDepartures = firstDir.times.prefix(2).map { String($0) }
        print("📦 Data for Live Activity: \(firstGroup.label) -> \(firstDir.direction) : \(nextDepartures)")
            
        LiveActivityManager.shared.startLiveActivity(
            stationName: station.name,
            lineName: firstGroup.label,
            direction: firstDir.direction,
            nextDepartures: Array(nextDepartures),
            stopIds: station.platforms.map { $0.id }
        )
    }

    private func getAvailableModes(from departures: [Departure]) -> [String] {
        let modes = Set(departures.compactMap { $0.displayInformations.commercial_mode })
        // On peut normaliser les noms si besoin (ex: "Metro" -> "Métro")
        return Array(modes).sorted()
    }
}
