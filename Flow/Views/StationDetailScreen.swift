import Combine
import CoreLocation
import CoreData
import MapKit
import SwiftUI

struct StationDetailScreen: View {
    let station: MapStation
    @State private var mergedStation: MapStation? = nil
    
    private var currentStation: MapStation {
        mergedStation ?? station
    }
    
    @State private var departures: [Departure] = []
    @ObservedObject var favoritesService = FavoritesService.shared
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var cancellable: AnyCancellable?
    @State private var selectedMode: String = "Tout"
    @State private var showItinerary = false
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
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
        var resumeTime: String? = nil  // nil = service actif, sinon "HH:mm" du premier train
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
            ZStack {
                ShaderAnimationView(isLoading: isLoading, station: currentStation)
                (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
        }
        .navigationTitle(currentStation.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    // Bouton Favoris
                    Button(action: {
                        favoritesService.toggleFavorite(stationId: currentStation.id)
                    }) {
                        Image(
                            systemName: favoritesService.isFavorite(stationId: currentStation.id)
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
            let merged = loadNearbyBusesAndMerge()
            loadDepartures(for: merged)
        }
        .onDisappear {
            if FlowServerService.shared.isEnabled {
                FlowServerService.shared.sendUnsubscribeStation()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .flowServerStationUpdate)) { notification in
            if let newDepartures = notification.userInfo?["departures"] as? [Departure] {
                self.departures = newDepartures
                self.isLoading = false
            }
        }
            .navigationDestination(isPresented: $showItinerary) {
                ItineraryResultView(
                    destination: currentStation,
                    currentLocation: locationManager.userLocation
                )
            }
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
                VStack(alignment: .leading, spacing: 20) {
                    // Title with WWDC Pulse animation following S-curve
                    HStack {
                        WWDCTextAnimator(
                            text: currentStation.name,
                            fontSize: 28,
                            animationType: .pulse,
                            speed: 1.0
                        )
                        .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    let groups = groupDepartures(departures)
                    let filteredGroups = groups.filter { group in
                        if selectedMode == "Tout" { return true }
                        return group.mode?.lowercased().contains(selectedMode.lowercased()) ?? false
                            || (group.mode == nil && selectedMode == "Autre")
                    }

                    ForEach(filteredGroups) { group in
                        StationLineRow(
                            group: group,
                            station: currentStation,
                            onLocate: {
                                dismiss()
                            },
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
                .padding(.bottom, 160)
            }
        }
    }

    struct StationLineRow: View {
        let group: LineGroup
        let station: MapStation
        let onLocate: () -> Void
        let onLiveActivityStart: (String, String, [String], String, String) -> Void
        @Environment(\.colorScheme) var colorScheme

        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                // En-tête de ligne (Icone + Réseau)
                HStack {
                    let assetName = TransportType.getAssetName(mode: group.mode, label: group.label)
                    if UIImage(named: assetName) != nil {
                        Image(assetName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    } else {
                        ZStack {
                            let isBus = group.mode?.lowercased().contains("bus") == true
                            let badgeColor = isBus ? (group.color.isEmpty || group.color == "000000" ? Color(hex: "008B5E") : Color(hex: group.color)) : Color(hex: group.color)
                            if group.mode == "RER" || group.mode == "Train" || isBus {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(badgeColor)
                                    .frame(width: isBus ? 50 : 40, height: 40)
                            } else {
                                Circle()
                                    .fill(badgeColor)
                                    .frame(width: 36, height: 36)
                            }
                            Text(group.label)
                                .font(.system(size: 14, weight: .black))
                                .foregroundColor(Color(hex: group.text_color ?? "FFFFFF"))
                        }
                    }

                    if let network = group.network {
                        Text(network)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                    
                    if group.mode?.lowercased().contains("bus") == true {
                        Button(action: {
                            locateBusStops()
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.system(size: 13, weight: .bold))
                                Text("Localiser")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.blue)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.06))
                            .clipShape(Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)

                // Contenu : hors service ou directions actives
                if let resume = group.resumeTime {
                    // Ligne hors service la nuit
                    HStack(spacing: 10) {
                        Image(systemName: "moon.zzz.fill")
                            .font(.body)
                            .foregroundColor(.secondary)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Hors service")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Reprise du service à \(resume)")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.primary)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    // Carte des directions actives
                    VStack(spacing: 0) {
                        ForEach(Array(group.directions.enumerated()), id: \.element.id) {
                            index, direction in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(direction.direction)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .lineLimit(2)

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

                                        Image(systemName: "wifi")
                                            .font(.caption)
                                            .foregroundColor(.green)
                                            .padding(.leading, 4)
                                    }
                                }

                                Spacer()

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
                                .buttonStyle(.plain)
                            }
                            .padding()

                            if index < group.directions.count - 1 {
                                Divider()
                                    .padding(.leading)
                            }
                        }
                    }
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }

        private func locateBusStops() {
            let busPlatforms = station.platforms.filter { $0.lineName == group.label && $0.type == .bus }
            guard !busPlatforms.isEmpty else {
                print("⚠️ No physical bus stops found for line \(group.label)")
                return
            }
            
            let mapView = SharedMapView.main.mapView
            let oldAnnotations = mapView.annotations.filter { $0 is BusStopTempAnnotation }
            mapView.removeAnnotations(oldAnnotations)
            
            var annotationsToAdd: [BusStopTempAnnotation] = []
            for platform in busPlatforms {
                let anno = BusStopTempAnnotation(
                    coordinate: platform.coordinate,
                    title: "\(station.name) - Bus \(group.label)",
                    subtitle: "Arrêt physique"
                )
                annotationsToAdd.append(anno)
            }
            
            mapView.addAnnotations(annotationsToAdd)
            
            if let first = busPlatforms.first {
                let region = MKCoordinateRegion(
                    center: first.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
                )
                mapView.setRegion(region, animated: true)
            }
            
            onLocate()
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
        // Garde la date du prochain départ par ligne (même très lointain) pour le message "Reprise"
        var firstFutureDates: [String: Date] = [:]

        for dep in departures {
            let info = dep.displayInformations
            guard let lineKey = info.label, !lineKey.isEmpty else { continue }
            guard let date = DateFormat.navitia.date(from: dep.stopDateTime.departureDateTime) else { continue }

            let minutesAway = Int(date.timeIntervalSinceNow / 60)

            // Créer le groupe s'il n'existe pas encore
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

            // Mémoriser le prochain départ futur de cette ligne (même très loin)
            if date > Date() {
                if let existing = firstFutureDates[lineKey] {
                    if date < existing { firstFutureDates[lineKey] = date }
                } else {
                    firstFutureDates[lineKey] = date
                }
            }

            // N'ajouter au calendrier visible que les départs proches (< 120 min)
            guard minutesAway >= 0 && minutesAway < 120 else { continue }
            let timeStr = "\(minutesAway) min"

            let dirName = info.direction ?? "Inconnue"
            if var group = groups[lineKey],
               let dirIndex = group.directions.firstIndex(where: { $0.direction == dirName })
            {
                if group.directions[dirIndex].times.count < 2 {
                    group.directions[dirIndex].times.append(timeStr)
                    groups[lineKey] = group
                }
            } else {
                groups[lineKey]?.directions.append(
                    DirectionGroup(id: UUID().uuidString, direction: dirName, times: [timeStr]))
            }
        }

        // Marquer les lignes hors service (aucun départ < 120 min) avec l'heure de reprise
        for (lineKey, firstDate) in firstFutureDates {
            if var group = groups[lineKey], group.directions.isEmpty {
                group.resumeTime = DateFormat.shortTime.string(from: firstDate)
                groups[lineKey] = group
            }
        }

        // Tri: Métro → RER → Transilien → Tram → Bus, puis numérique/alpha
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

    private func loadDepartures(for targetStation: MapStation? = nil, force: Bool = false) {
        let activeStation = targetStation ?? currentStation
        
        isLoading = true
        errorMessage = nil

        var queryIds = Set<String>()
        for platform in activeStation.platforms {
            let cleanId = platform.id
                .replacingOccurrences(of: "stop_point:", with: "")
                .replacingOccurrences(of: "stop_area:", with: "")
            
            if platform.type == .bus {
                queryIds.insert("stop_point:\(cleanId)")
            } else {
                // Pour le métro/RER/train, si le stopAreaId contient la lettre "C" (ex: IDFM:C01374),
                // Navitia ne supporte pas cet ID logique de regroupement et renvoie 404.
                // On utilise alors directement le stopPointId (physique) de la plateforme.
                if !platform.stopAreaId.isEmpty && !platform.stopAreaId.contains("IDFM:C") && !platform.stopAreaId.contains(":C") {
                    let cleanAreaId = platform.stopAreaId
                        .replacingOccurrences(of: "stop_point:", with: "")
                        .replacingOccurrences(of: "stop_area:", with: "")
                    queryIds.insert("stop_area:\(cleanAreaId)")
                } else {
                    queryIds.insert("stop_point:\(cleanId)")
                }
            }
        }
        
        print("🏪 Station: \(activeStation.name)")
        print("📡 Constructed Query IDs: \(queryIds)")
        
        if queryIds.isEmpty {
            print("⚠️ No query IDs found for departures")
            self.isLoading = false
            return
        }

        // Limiter à 15 requêtes max pour économiser le quota
        let limitedIds = Array(queryIds.prefix(15))
        
        if FlowServerService.shared.isEnabled && FlowServerService.shared.isConnected {
            print("📡 WebSocket connectée : Souscription aux horaires temps réel pour \(limitedIds.count) IDs")
            FlowServerService.shared.sendSubscribeStation(stopIds: limitedIds)
            return
        }
        
        print("📡 Mode REST Direct IDFM : Récupération pour \(limitedIds.count) IDs: \(limitedIds)")
        
        let publishers = limitedIds.map { id in
            IDFMService.shared.fetchDepartures(for: id, force: force)
                .catch { error -> Just<[Departure]> in
                    print("⚠️ Error for departures query \(id): \(error)")
                    return Just([])
                }
        }
        
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
                        print("❌ Error fetching departures: \(error)")
                    }
                },
                receiveValue: { allDepartures in
                    self.departures = allDepartures
                    print("✅ Received \(allDepartures.count) departures")
                })
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
            return
        }

        let departuresToUse = Array(nextDepartures.prefix(2))

        // Optimisation :
        // 1. Filtrer les quais qui correspondent à la ligne sélectionnée
        // 2. Utiliser les stop_area_id si disponibles (1 requête au lieu de N)
        // 3. Dédupliquer
        let relevantPlatforms = currentStation.platforms.filter { $0.lineName == lineName }
        
        let optimizedIds: Set<String> = Set(relevantPlatforms.compactMap { platform in
            // Fallback sur stop_point si le stopAreaId contient la lettre "C" (non supportée par l'API pour les départs)
            if !platform.stopAreaId.isEmpty && !platform.stopAreaId.contains("IDFM:C") && !platform.stopAreaId.contains(":C") {
                return "stop_area:\(platform.stopAreaId)"
            } else {
                let id = platform.id
                if !id.contains("stop_point") {
                    return "stop_point:\(id)"
                }
                return id
            }
        })

        LiveActivityManager.shared.startLiveActivity(
            stationName: currentStation.name,
            lineName: lineName,
            direction: direction,
            nextDepartures: departuresToUse,
            stopIds: Array(optimizedIds),
            lineColor: lineColor,
            textColor: textColor
        )
    }

    @discardableResult
    private func loadNearbyBusesAndMerge() -> MapStation {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" || station.mainType == .bus {
            self.mergedStation = station
            return station
        }
        
        let context = PersistenceController.shared.container.viewContext
        let request: NSFetchRequest<StopPointEntity> = StopPointEntity.fetchRequest()
        
        let latDelta = 0.0032
        let lonDelta = 0.0048
        let minLat = station.latitude - latDelta
        let maxLat = station.latitude + latDelta
        let minLon = station.longitude - lonDelta
        let maxLon = station.longitude + lonDelta
        
        request.predicate = NSPredicate(
            format: "type == %@ AND latitude >= %f AND latitude <= %f AND longitude >= %f AND longitude <= %f",
            "Bus", minLat, maxLat, minLon, maxLon
        )
        
        do {
            let entities = try context.fetch(request)
            if entities.isEmpty {
                self.mergedStation = station
                return station
            }
            
            let centerLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
            let filteredEntities = entities.filter { entity in
                let entityLoc = CLLocation(latitude: entity.latitude, longitude: entity.longitude)
                return centerLoc.distance(from: entityLoc) <= 350.0
            }
            
            if filteredEntities.isEmpty {
                self.mergedStation = station
                return station
            }
            
            var newPlatforms = station.platforms
            var existingLines = station.lines
            
            for entity in filteredEntities {
                guard let id = entity.id,
                      let name = entity.name,
                      let lineName = entity.lineName else { continue }
                
                if !newPlatforms.contains(where: { $0.id == id }) {
                    newPlatforms.append(
                        StopPoint(
                            id: id,
                            stopAreaId: entity.stopAreaId ?? "",
                            name: name,
                            coordinate: CLLocationCoordinate2D(latitude: entity.latitude, longitude: entity.longitude),
                            type: .bus,
                            lineName: lineName
                        )
                    )
                }
                
                if !existingLines.contains(where: { $0.name == lineName && $0.type == .bus }) {
                    existingLines.append(StationLine(name: lineName, type: .bus))
                }
            }
            
            existingLines.sort { a, b in
                let priorityA = a.type.priority
                let priorityB = b.type.priority
                if priorityA != priorityB {
                    return priorityA > priorityB
                }
                return a.name.localizedStandardCompare(b.name) == .orderedAscending
            }
            
            let merged = MapStation(
                id: station.id,
                name: station.name,
                coordinate: station.coordinate,
                platforms: newPlatforms,
                isHub: true,
                mainType: station.mainType,
                lines: existingLines,
                city: station.city
            )
            self.mergedStation = merged
            return merged
        } catch {
            print("❌ Error fetching nearby buses: \(error)")
            self.mergedStation = station
            return station
        }
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
        return Array(modes).sorted()
    }
}

#Preview {
    NavigationStack {
        StationDetailScreen(station: PreviewMockData.mockStation)
    }
}

