import Combine
import CoreLocation
import SwiftData
import MapKit
import SwiftUI

struct StationDetailSheet: View {
    let station: MapStation
    var onDismiss: (() -> Void)? = nil  // For inline iPad panel
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
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var liveActivityManager = LiveActivityManager.shared

    // Buffer pour accumuler les pushes WebSocket avant affichage
    @State private var departureBuffer: [String: Departure] = [:]
    @State private var bufferTask: Task<Void, Never>?

    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme

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

    @ViewBuilder
    private var sheetContent: some View {
        let gpeLines = currentStation.lines.filter { ["15", "16", "17", "18"].contains($0.name) }
        let hasActiveLines = currentStation.lines.contains { !["15", "16", "17", "18"].contains($0.name) }

        if isLoading && hasActiveLines {
            ProgressView("Chargement des horaires...")
                .tint(.white)
                .foregroundColor(.white)
        } else if let error = errorMessage, hasActiveLines {
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
        } else if departures.isEmpty && !hasActiveLines && gpeLines.isEmpty {
            Text("Aucun départ trouvé.")
                .foregroundColor(.secondary)
        } else {
            contentView
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                if onDismiss == nil {
                    // iPhone sheet: needs its own glass effect background
                    (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .ignoresSafeArea()
                } else {
                    // iPad panel: background is handled by the MapView container
                    Color.clear
                        .ignoresSafeArea()
                }
                
                // Sheet content constrained within safe area boundaries
                sheetContent
            }
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                setupStation()
            }
            .onDisappear {
                if FlowServerService.shared.isEnabled {
                    FlowServerService.shared.sendUnsubscribeStation()
                }
            }
            .onChange(of: station.id) { _, _ in
                setupStation()
            }
            .onReceive(NotificationCenter.default.publisher(for: .flowServerStationUpdate)) { notification in
                if let newDepartures = notification.userInfo?["departures"] as? [Departure] {
                    guard !newDepartures.isEmpty else { return }
                    
                    // Accumuler dans le buffer (dédupliqué par ID)
                    for dep in newDepartures {
                        departureBuffer[dep.id] = dep
                    }
                    
                    // Annuler le debounce précédent et en planifier un nouveau.
                    // On attend 500ms sans nouveau push avant d'afficher,
                    // pour que tous les arrêts arrivent en un seul paquet.
                    bufferTask?.cancel()
                    bufferTask = Task {
                        try? await Task.sleep(for: .milliseconds(500))
                        guard !Task.isCancelled else { return }
                        
                        // Fusionner le buffer avec les départs existants
                        // (les entrées du buffer écrasent les anciennes)
                        var mergedDict: [String: Departure] = [:]
                        for dep in self.departures { mergedDict[dep.id] = dep }
                        for (id, dep) in departureBuffer { mergedDict[id] = dep }
                        
                        let batched = Array(mergedDict.values).sorted {
                            $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                        }
                        
                        withAnimation(.easeInOut(duration: 0.35)) {
                            self.departures = batched
                            self.isLoading = false
                        }
                        departureBuffer.removeAll()
                    }
                }
            }
            .navigationDestination(isPresented: $showItinerary) {
                ItineraryResultView(
                    destination: currentStation,
                    currentLocation: locationManager.userLocation
                )
            }
        }
        .presentationBackground(.clear)
    }

    var contentView: some View {
        VStack(spacing: 0) {
            // Header — Station name + close
            HStack(alignment: .center) {
                let words = currentStation.name.components(separatedBy: " ")
                HStack(spacing: 4) {
                    ForEach(Array(words.enumerated()), id: \.offset) { index, word in
                        AnimatedStationWordView(text: word, sequenceIndex: index, size: 22)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                // Close button
                Button(action: {
                    if let onDismiss = onDismiss {
                        onDismiss()
                    } else {
                        dismiss()
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                        .frame(width: 22, height: 33)
                }
                .buttonStyle(.glass)
                .glassEffect(.regular.interactive(), in: .circle)
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
                .glassEffect(.regular.interactive(), in: .capsule)
                

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)

            // Filtre des modes
            let groups = groupDepartures(departures)
            let availableModes = getAvailableModes(from: groups)
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
                    let filteredGroups = groups.filter { group in
                        if selectedMode == "Tout" { return true }
                        return group.mode?.lowercased().contains(selectedMode.lowercased()) ?? false
                            || (group.mode == nil && selectedMode == "Autre")
                    }
                    let gpeLines = currentStation.lines.filter { ["15", "16", "17", "18"].contains($0.name) }

                    if filteredGroups.isEmpty && gpeLines.isEmpty {
                        let activeLines = currentStation.lines.filter { !["15", "16", "17", "18"].contains($0.name) }
                        let hour = Calendar.current.component(.hour, from: Date())
                        let isNight = hour >= 1 && hour < 5
                        
                        if !activeLines.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Lignes desservies")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(.top, 12)
                                
                                ForEach(activeLines) { line in
                                    HStack(spacing: 12) {
                                        // Badge
                                        LineBadge(line: line)
                                            .scaleEffect(1.2)
                                            .frame(width: 32, height: 32)
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(line.name.count < 3 ? "\(line.type.rawValue) Ligne \(line.name)" : line.name)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                            Text(isNight ? "Service de jour terminé • Reprise à 05:30" : "Aucun départ imminent")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 12)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .padding(.horizontal)
                                }
                            }
                        } else {
                            VStack(spacing: 16) {
                                Spacer().frame(height: 20)
                                Image(systemName: "clock.badge.exclamationmark")
                                    .font(.system(size: 40))
                                    .foregroundColor(.secondary)
                                Text("Aucun départ trouvé")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text("Veuillez réactualiser ou réessayer plus tard.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding(.top, 20)
                        }
                    } else {
                        let categories = ["Métro", "RER", "Tramway", "Train", "Bus", "Autre"]
                        ForEach(categories, id: \.self) { category in
                            let categoryGroups = filteredGroups.filter { displayModeName(for: $0.mode) == category }
                            if !categoryGroups.isEmpty {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(category.uppercased())
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 20)
                                        .padding(.top, 10)
                                    
                                    ForEach(categoryGroups) { group in
                                        LineGroupRowSheet(
                                            group: group,
                                            station: currentStation,
                                            liveActivityManager: liveActivityManager,
                                            onLiveActivity: { lineName, direction, times, color, textColor in
                                                startLiveActivity(
                                                    lineName: lineName,
                                                    direction: direction,
                                                    nextDepartures: times,
                                                    lineColor: color,
                                                    textColor: textColor
                                                )
                                            }
                                        )
                                    }
                                }
                            }
                        }
                    }

                    // Grand Paris Express lines (Estimated delivery dates)
                    if !gpeLines.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Grand Paris Express (En construction)")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top, filteredGroups.isEmpty ? 0 : 8)

                            ForEach(gpeLines) { gpeLine in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack(spacing: 10) {
                                        // GPE Line Logo using SVG vector
                                        if UIImage(named: gpeLine.assetName) != nil {
                                            Image(gpeLine.assetName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 36, height: 36)
                                        } else {
                                            Circle()
                                                .fill(resolveLineColor(gpeLine.name, type: .metro))
                                                .frame(width: 30, height: 30)
                                                .overlay(
                                                    Text(gpeLine.name)
                                                        .font(.subheadline)
                                                        .bold()
                                                        .foregroundColor(.white)
                                                )
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text("Métro Ligne \(gpeLine.name)")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                            Text("Société des Grands Projets")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }

                                        Spacer()
                                    }
                                    .padding(.horizontal)

                                    // Delivery Date Box
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Date de livraison estimée")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                            
                                            Text(getGPEDeliveryDate(lineName: gpeLine.name, stationName: currentStation.name))
                                                .font(.subheadline)
                                                .bold()
                                                .foregroundColor(.blue)
                                        }
                                        Spacer()
                                        Image(systemName: "calendar")
                                            .font(.title3)
                                            .foregroundColor(.blue)
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 12)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 100)
            }
            .scrollContentBackground(.hidden)
        }
    }

    private func setupStation() {
        self.errorMessage = nil
        self.departures = []
        self.mergedStation = station
        
        // Vider le buffer WebSocket pour la nouvelle station
        bufferTask?.cancel()
        departureBuffer.removeAll()
        
        // Charger immédiatement les départs pour la station d'origine (Métro / RER)
        let hasActiveLines = station.lines.contains { !["15", "16", "17", "18"].contains($0.name) }
        if hasActiveLines {
            loadDepartures(for: station)
        }
        
        // Lancer la recherche des bus proches et la fusion en arrière-plan
        loadNearbyBusesAndMerge()
    }

    private func loadNearbyBusesAndMerge() {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" || station.mainType == .bus {
            self.mergedStation = station
            return
        }
        
        let stationId = station.id
        let stationLat = station.latitude
        let stationLon = station.longitude
        let stationPlatforms = station.platforms
        let stationLines = station.lines
        let stationName = station.name
        let stationCoordinate = station.coordinate
        let stationMainType = station.mainType
        let stationCity = station.city
        
        Task {
            let container = SwiftDataStack.shared.container
            let backgroundContext = ModelContext(container)
            
            let latDelta = 0.0032
            let lonDelta = 0.0048
            let minLat = stationLat - latDelta
            let maxLat = stationLat + latDelta
            let minLon = stationLon - lonDelta
            let maxLon = stationLon + lonDelta
            
            let descriptor = FetchDescriptor<StopPointModel>(
                predicate: #Predicate<StopPointModel> { stop in
                    stop.type == "Bus" &&
                    stop.latitude >= minLat && stop.latitude <= maxLat &&
                    stop.longitude >= minLon && stop.longitude <= maxLon
                }
            )
            
            do {
                let entities = try backgroundContext.fetch(descriptor)
                if entities.isEmpty {
                    await MainActor.run {
                        if self.station.id == stationId {
                            self.mergedStation = self.station
                        }
                    }
                    return
                }
                
                let centerLoc = CLLocation(latitude: stationLat, longitude: stationLon)
                let filteredEntities = entities.filter { entity in
                    let entityLoc = CLLocation(latitude: entity.latitude, longitude: entity.longitude)
                    return centerLoc.distance(from: entityLoc) <= 350.0
                }
                
                if filteredEntities.isEmpty {
                    await MainActor.run {
                        if self.station.id == stationId {
                            self.mergedStation = self.station
                        }
                    }
                    return
                }
                
                var newPlatforms = stationPlatforms
                var existingLines = stationLines
                
                for entity in filteredEntities {
                    let id = entity.id
                    let name = entity.name
                    let lineName = entity.lineName
                    
                    if !newPlatforms.contains(where: { $0.id == id }) {
                        newPlatforms.append(
                            StopPoint(
                                id: id,
                                stopAreaId: entity.stopAreaId,
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
                    id: stationId,
                    name: stationName,
                    coordinate: stationCoordinate,
                    platforms: newPlatforms,
                    isHub: true,
                    mainType: stationMainType,
                    lines: existingLines,
                    city: stationCity
                )
                
                await MainActor.run {
                    if self.station.id == stationId {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            self.mergedStation = merged
                        }
                        
                        // Re-fetch departures if new bus lines were added
                        let hasActiveLines = merged.lines.contains { !["15", "16", "17", "18"].contains($0.name) }
                        if hasActiveLines {
                            loadDepartures(for: merged)
                        }
                    }
                }
            } catch {
                print("❌ Error fetching nearby buses in background: \(error)")
                await MainActor.run {
                    if self.station.id == stationId {
                        self.mergedStation = self.station
                    }
                }
            }
        }
    }

    private func normalizeLineName(_ name: String) -> String {
        let upper = name.uppercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if upper.hasPrefix("T") && upper.count > 1, upper.contains(where: { $0.isNumber }) {
            return String(upper.dropFirst())
        }
        return upper
    }
    
    private func getTransportType(from mode: String?) -> TransportType {
        guard let mode = mode?.lowercased().folding(options: .diacriticInsensitive, locale: .current) else { return .bus }
        if mode.contains("metro") || mode.contains("subway") { return .metro }
        if mode.contains("rer") || mode.contains("rapidtransit") { return .rer }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") || mode.contains("localtrain") { return .transilien }
        if mode.contains("cable") { return .cable }
        return .bus
    }

    private func groupDepartures(_ departures: [Departure]) -> [LineGroup] {
        var groups: [String: LineGroup] = [:]
        var firstFutureDates: [String: Date] = [:]

        for dep in departures {
            let info = dep.displayInformations
            guard let label = info.label, !label.isEmpty else { continue }
            let type = getTransportType(from: info.commercial_mode)
            let lineKey = "\(label)-\(type.rawValue)"
            guard let date = DateFormat.navitia.date(from: dep.stopDateTime.departureDateTime) else { continue }

            let minutesAway = Int(date.timeIntervalSinceNow / 60)

            if groups[lineKey] == nil {
                groups[lineKey] = LineGroup(
                    id: lineKey,
                    label: label,
                    color: info.color ?? "000000",
                    text_color: info.textColor,
                    network: info.network,
                    mode: info.commercial_mode,
                    directions: []
                )
            }

            // Mémoriser le prochain départ futur (même très loin)
            if date > Date() {
                if let existing = firstFutureDates[lineKey] {
                    if date < existing { firstFutureDates[lineKey] = date }
                } else {
                    firstFutureDates[lineKey] = date
                }
            }

            // N'afficher que les départs dans les 120 prochains minutes
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
                    DirectionGroup(id: "\(lineKey)-\(dirName)", direction: dirName, times: [timeStr]))
            }
        }

        // Marquer les lignes hors service avec l'heure de reprise
        for (lineKey, firstDate) in firstFutureDates {
            if var group = groups[lineKey], group.directions.isEmpty {
                group.resumeTime = DateFormat.shortTime.string(from: firstDate)
                groups[lineKey] = group
            }
        }

        // Add local lines that have no departures at all (to show they serve the station but are out of service)
        let allLocalLines = currentStation.lines
        for localLine in allLocalLines {
            if localLine.type == .bus {
                let isReplacement = allLocalLines.contains { other in
                    other.name == localLine.name && other.type != .bus
                }
                if isReplacement {
                    continue
                }
            }
            
            let lineKey = "\(localLine.name)-\(localLine.type.rawValue)"
            
            let normalizedLocal = normalizeLineName(localLine.name)
            let alreadyExists = groups.values.contains { group in
                let groupType = getTransportType(from: group.mode)
                return normalizeLineName(group.label) == normalizedLocal && groupType == localLine.type
            }
            
            if !alreadyExists {
                let modeName: String
                switch localLine.type {
                case .metro: modeName = "Métro"
                case .rer: modeName = "RER"
                case .tram: modeName = "Tramway"
                case .transilien, .train: modeName = "Train"
                case .bus: modeName = "Bus"
                case .cable: modeName = "Câble"
                }
                
                let defaultResumeTime: String?
                switch localLine.type {
                case .metro:
                    defaultResumeTime = "05:30"
                case .rer:
                    defaultResumeTime = "05:15"
                case .tram:
                    defaultResumeTime = "05:00"
                case .transilien, .train:
                    defaultResumeTime = "05:00"
                case .bus:
                    defaultResumeTime = "05:30"
                default:
                    defaultResumeTime = nil
                }
                
                if ["15", "16", "17", "18"].contains(localLine.name) {
                    continue
                }
                
                let colorHex = MapDataService.shared.lineColorCache[localLine.name]?.toHex() 
                    ?? resolveLineColor(localLine.name, type: localLine.type).toHex() 
                    ?? "000000"
                
                let hour = Calendar.current.component(.hour, from: Date())
                let isNight = hour >= 1 && hour < 5

                groups[lineKey] = LineGroup(
                    id: lineKey,
                    label: localLine.name,
                    color: colorHex,
                    text_color: "FFFFFF",
                    network: modeName,
                    mode: modeName,
                    directions: [],
                    resumeTime: isNight ? defaultResumeTime : nil
                )
            }
        }

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
        
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            let nowStr = DateFormat.navitia.string(from: Date())
            let minutesLater = DateFormat.navitia.string(from: Date().addingTimeInterval(300))
            let tenMinutesLater = DateFormat.navitia.string(from: Date().addingTimeInterval(600))
            
            let mockDepartures: [Departure] = [
                Departure(
                    displayInformations: DisplayInformations(
                        direction: "La Défense",
                        label: "1",
                        code: "1",
                        color: "FFCD00",
                        commercial_mode: "Métro",
                        network: "Métro",
                        textColor: "000000",
                        name: "Ligne 1"
                    ),
                    stopDateTime: StopDateTime(departureDateTime: minutesLater)
                ),
                Departure(
                    displayInformations: DisplayInformations(
                        direction: "Château de Vincennes",
                        label: "1",
                        code: "1",
                        color: "FFCD00",
                        commercial_mode: "Métro",
                        network: "Métro",
                        textColor: "000000",
                        name: "Ligne 1"
                    ),
                    stopDateTime: StopDateTime(departureDateTime: tenMinutesLater)
                ),
                Departure(
                    displayInformations: DisplayInformations(
                        direction: "Saint-Germain-en-Laye",
                        label: "A",
                        code: "A",
                        color: "5291CE",
                        commercial_mode: "RER",
                        network: "RER",
                        textColor: "FFFFFF",
                        name: "RER A"
                    ),
                    stopDateTime: StopDateTime(departureDateTime: nowStr)
                )
            ]
            self.departures = mockDepartures
            self.isLoading = false
            return
        }

        isLoading = true
        errorMessage = nil

        var queryIds = Set<String>()
        var queryIdTypes = [String: TransportType]()
        
        for platform in activeStation.platforms {
            let id: String
            if platform.type == .bus {
                id = platform.id.contains("stop_point:") ? platform.id : "stop_point:\(platform.id)"
            } else {
                // Pour le métro/RER/train, si le stopAreaId contient la lettre "C" (ex: IDFM:C01374),
                // Navitia ne supporte pas cet ID logique de regroupement et renvoie 404.
                // On utilise alors directement le stopPointId (physique) de la plateforme.
                if !platform.stopAreaId.isEmpty && !platform.stopAreaId.contains("IDFM:C") && !platform.stopAreaId.contains(":C") {
                    id = platform.stopAreaId.contains("stop_area:") ? platform.stopAreaId : "stop_area:\(platform.stopAreaId)"
                } else if platform.id.contains("IDFM:") {
                    id = platform.id.contains("stop_point:") ? platform.id : "stop_point:\(platform.id)"
                } else {
                    print("⚠️ Impossible de requêter les départs pour une plateforme locale sans référence IDFM : \(platform.id)")
                    continue
                }
            }
            queryIds.insert(id)
            
            // Conserver le type de transport le plus prioritaire associé à cet ID
            if let existingType = queryIdTypes[id] {
                if platform.type.priority > existingType.priority {
                    queryIdTypes[id] = platform.type
                }
            } else {
                queryIdTypes[id] = platform.type
            }
        }
        
        print("🏪 Station: \(activeStation.name)")
        print("📡 Constructed Query IDs: \(queryIds)")
        
        if queryIds.isEmpty {
            print("⚠️ No query IDs found for departures")
            self.isLoading = false
            return
        }

        // Tri par type de transport (priorité décroissante : Métro > RER > Tram > Train > Câble > Bus)
        let sortedIds = Array(queryIds).sorted { id1, id2 in
            let priority1 = queryIdTypes[id1]?.priority ?? 0
            let priority2 = queryIdTypes[id2]?.priority ?? 0
            if priority1 != priority2 {
                return priority1 > priority2
            }
            return id1 < id2
        }

        // Limiter pour économiser le quota (plus généreux si WebSocket connecté)
        let limit = (FlowServerService.shared.isEnabled && FlowServerService.shared.isConnected) ? 50 : 25
        let limitedIds = Array(sortedIds.prefix(limit))
        print("📡 Fetching departures for \(limitedIds.count) IDs (limit \(limit)): \(limitedIds)")
        
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

    private func modePriority(_ mode: String?) -> Int {
        guard let m = mode?.lowercased() else { return 99 }
        if m.contains("metro") || m.contains("métro") { return 0 }
        if m.contains("rer") { return 1 }
        if m.contains("train") || m.contains("transilien") { return 2 }
        if m.contains("tram") { return 3 }
        if m.contains("bus") { return 4 }
        return 5
    }

    private func displayModeName(for mode: String?) -> String {
        guard let m = mode?.lowercased() else { return "Autre" }
        if m.contains("metro") || m.contains("métro") { return "Métro" }
        if m.contains("rer") { return "RER" }
        if m.contains("tram") { return "Tramway" }
        if m.contains("train") || m.contains("transilien") { return "Train" }
        if m.contains("bus") { return "Bus" }
        return "Autre"
    }

    private func compareLineLabels(_ a: String, _ b: String) -> Bool {
        if let numA = Int(a), let numB = Int(b) {
            return numA < numB
        }
        if Int(a) != nil { return true }
        if Int(b) != nil { return false }
        return a.localizedStandardCompare(b) == .orderedAscending
    }

    private func getAvailableModes(from groups: [LineGroup]) -> [String] {
        let modes = Set(groups.compactMap { group -> String? in
            guard let mode = group.mode else { return nil }
            let lower = mode.lowercased()
            if lower == "metro" || lower.contains("metro") {
                return "Métro"
            } else if lower == "rer" {
                return "RER"
            } else if lower == "tram" || lower.contains("tram") {
                return "Tramway"
            } else if lower == "bus" {
                return "Bus"
            } else if lower == "train" || lower.contains("transilien") {
                return "Train"
            }
            return mode.capitalized
        })
        let orderPriority: [String: Int] = [
            "métro": 0,
            "rer": 1,
            "tramway": 2,
            "train": 3,
            "bus": 4
        ]
        return Array(modes).sorted { a, b in
            let pA = orderPriority[a.lowercased()] ?? 99
            let pB = orderPriority[b.lowercased()] ?? 99
            if pA != pB {
                return pA < pB
            }
            return a < b
        }
    }

    private static let sudStations: [String] = [
        "Pont de Sèvres", "Issy", "Clamart", "Châtillon", "Bagneux", "Arcueil", 
        "Villejuif", "Vitry", "Ardoines", "Vert de Maisons", "Créteil", 
        "Saint-Maur", "Champigny", "Bry", "Noisy"
    ]
    private static let lateStations: [String] = ["Chelles", "Noisy"]

    private func getGPEDeliveryDate(lineName: String, stationName: String) -> String {
        switch lineName {
        case "15":
            if Self.sudStations.contains(where: { stationName.contains($0) }) {
                return "Avril 2027 (Ligne 15 Sud)"
            } else {
                return "Horizon 2031 (Ligne 15 Est/Ouest)"
            }
        case "16":
            if Self.lateStations.contains(where: { stationName.contains($0) }) {
                return "Horizon 2028"
            } else {
                return "Horizon 2027"
            }
        case "17":
            if stationName.contains("Mesnil") {
                return "Horizon 2030"
            } else if stationName.contains("Expositions") || stationName.contains("Roissy") || stationName.contains("Charles de Gaulle") {
                return "Horizon 2028"
            } else {
                return "Horizon 2027"
            }
        case "18":
            if stationName.contains("Versailles") || stationName.contains("Saint-Quentin") || stationName.contains("Guyancourt") || stationName.contains("Satory") {
                return "Horizon 2030"
            } else if stationName.contains("Orly") || stationName.contains("Antonypole") {
                return "Horizon 2027"
            } else {
                return "Octobre 2026"
            }
        default:
            return "Mise en service prochaine"
        }
    }
}
// MARK: - Sub-view extraite pour éviter les timeouts du compilateur Swift
private struct LineGroupRowSheet: View {
    // Types locaux miroirs de StationDetailSheet
    typealias LineGroup = StationDetailSheet.LineGroup

    let group: LineGroup
    let station: MapStation
    let liveActivityManager: LiveActivityManager
    let onLiveActivity: (String, String, [String], String, String) -> Void
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var favoritesService = FavoritesService.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // En-tête : badge ligne + réseau
            lineHeader

            // Contenu
            if let resume = group.resumeTime {
                nightServiceView(resume: resume)
            } else {
                directionsView
            }
        }
        .padding(.horizontal)
    }

    private var lineHeader: some View {
        HStack(spacing: 10) {
            let assetName = TransportType.getAssetName(mode: group.mode, label: group.label)
            if !assetName.isEmpty, UIImage(named: assetName) != nil {
                Image(assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
            } else {
                let isBus = group.mode?.lowercased().contains("bus") == true
                let badgeColor = isBus ? (group.color.isEmpty || group.color == "000000" ? Color(hex: "008B5E") : Color(hex: group.color)) : Color(hex: group.color)
                
                if group.mode == "RER" || group.mode == "Train" || isBus || group.label.count > 3 {
                    Text(group.label)
                        .font(.subheadline).bold()
                        .foregroundColor(Color(hex: group.text_color ?? "FFFFFF"))
                        .padding(.horizontal, (isBus || group.label.count > 3) ? 8 : 4)
                        .frame(minWidth: isBus ? 45 : 36)
                        .frame(height: 36)
                        .background(RoundedRectangle(cornerRadius: 6).fill(badgeColor))
                } else {
                    Text(group.label)
                        .font(.subheadline).bold()
                        .foregroundColor(Color(hex: group.text_color ?? "FFFFFF"))
                        .frame(width: 30, height: 30)
                        .background(Circle().fill(badgeColor))
                }
            }
            if let network = group.network {
                Text(network).font(.caption).foregroundColor(.secondary)
            }
            
            Spacer()
            
            HStack(spacing: 8) {
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
                
                let lineType = mapModeToType(group.mode)
                let isFav = favoritesService.isFavoriteLine(lineId: group.label, type: lineType, stationId: station.id)
                Button(action: {
                    favoritesService.toggleFavoriteLine(
                        lineId: group.label,
                        type: lineType,
                        stationId: station.id,
                        stationName: station.name,
                        color: group.color,
                        textColor: group.text_color
                    )
                }) {
                    Image(systemName: isFav ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 32, height: 32)
                        .background(colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.06), in: Circle())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }

    private func mapModeToType(_ mode: String?) -> TransportType {
        guard let mode = mode?.lowercased().folding(options: .diacriticInsensitive, locale: .current) else { return .bus }
        if mode.contains("metro") || mode.contains("subway") { return .metro }
        if mode.contains("rer") || mode.contains("rapidtransit") { return .rer }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") || mode.contains("localtrain") { return .transilien }
        if mode.contains("cable") { return .cable }
        return .bus
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
    }

    @ViewBuilder
    private func nightServiceView(resume: String) -> some View {
        let hour = Calendar.current.component(.hour, from: Date())
        let isNight = hour >= 1 && hour < 5

        HStack(spacing: 10) {
            Image(systemName: isNight ? "moon.zzz.fill" : "clock.badge.exclamationmark")
                .font(.body)
                .foregroundColor(.secondary)
            VStack(alignment: .leading, spacing: 2) {
                Text(isNight ? "Hors service" : "Aucun départ imminent")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(isNight ? "Reprise du service à \(resume)" : "Prochain passage à \(resume)")
                    .font(.subheadline).bold()
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(colorScheme == .dark ? Color.white.opacity(0.05) : Color.black.opacity(0.03))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var directionsView: some View {
        VStack(spacing: 0) {
            if group.directions.isEmpty {
                HStack {
                    Text("Aucune information en temps réel")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(colorScheme == .dark ? Color.white.opacity(0.05) : Color.black.opacity(0.03))
            } else {
                ForEach(Array(group.directions.enumerated()), id: \.element.id) { index, direction in
                    directionRow(direction: direction, index: index)
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func directionRow(direction: StationDetailSheet.DirectionGroup, index: Int) -> some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(direction.direction)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack(spacing: 4) {
                        ForEach(Array(direction.times.enumerated()), id: \.offset) { tIndex, time in
                            let parts = time.split(separator: " ", maxSplits: 1)
                            let minuteValue = Int(String(parts.first ?? "0")) ?? 0
                            let suffix = parts.count > 1 ? " \(parts.last!)" : ""
                            
                            HStack(spacing: 0) {
                                Text("\(minuteValue)")
                                    .contentTransition(.numericText())
                                    .animation(.spring(duration: 0.2), value: minuteValue)
                                Text(suffix)
                                if tIndex < direction.times.count - 1 {
                                    Text(", ")
                                }
                            }
                            .font(.subheadline).bold()
                            .foregroundColor(.green)
                        }
                        Image(systemName: "wifi")
                            .font(.caption2)
                            .foregroundColor(.green)
                            .padding(.leading, 4)
                    }
                }
                Spacer()
                let isActive = liveActivityManager.isActivityActive(
                    line: group.label, direction: direction.direction)
                Button(action: {
                    if isActive {
                        liveActivityManager.endLiveActivity()
                    } else {
                        onLiveActivity(
                            group.label, direction.direction, direction.times,
                            group.color, group.text_color ?? "FFFFFF"
                        )
                    }
                }) {
                    Image(systemName: "bolt.fill")
                        .font(.body)
                        .foregroundColor(isActive ? .green : .pink)
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive(), in: .circle)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            if index < group.directions.count - 1 {
                Divider().padding(.leading, 14)
            }
        }
    }
}

struct StationDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailSheet(
            station: MapStation(
                id: "IDFM:C01377",
                name: "Nation",
                coordinate: CLLocationCoordinate2D(latitude: 48.8482, longitude: 2.3982),
                platforms: [
                    StopPoint(
                        id: "stop_point:1",
                        stopAreaId: "C01377",
                        name: "Nation - RER A",
                        coordinate: CLLocationCoordinate2D(latitude: 48.8482, longitude: 2.3982),
                        type: .rer,
                        lineName: "A"
                    )
                ],
                isHub: true,
                mainType: .rer,
                lines: [
                    StationLine(name: "A", type: .rer),
                    StationLine(name: "1", type: .metro),
                    StationLine(name: "6", type: .metro),
                    StationLine(name: "15", type: .metro)
                ],
                city: "Paris"
            )
        )
    }
}

// MARK: - COMPONENTS POUR L'ANIMATION DE VAGUE TYPOGRAPHIQUE

private struct SFProVariableWeightModifier: ViewModifier {
    let weight: CGFloat
    let size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(createVariableFont()))
    }

    private func createVariableFont() -> UIFont {
        let baseFont = UIFont.systemFont(ofSize: size)
        let attributes: [UIFontDescriptor.AttributeName: Any] = [
            .traits: [
                kCTFontWeightTrait: weight
            ]
        ]
        let descriptor = baseFont.fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: descriptor, size: size)
    }
}

extension View {
    nonisolated fileprivate func sfProVariableWeight(weight: CGFloat, size: CGFloat) -> some View {
        self.modifier(SFProVariableWeightModifier(weight: weight, size: size))
    }
}

private struct VariableWaveProperties {
    var weight: CGFloat = 0.40 // Base en Bold
}

private struct AnimatedStationWordView: View {
    let text: String
    let sequenceIndex: Int
    let size: CGFloat
    
    @State private var startAnimation = false
    
    var body: some View {
        let staggerDelay = 0.12 
        let delay = Double(sequenceIndex) * staggerDelay
        let animationDuration = 1.0
        let totalLoopDuration = 1.6 
        let restDuration = totalLoopDuration - animationDuration - delay
        
        Text(text)
            .fixedSize(horizontal: true, vertical: true)
            .foregroundColor(.primary) // S'adapte au mode sombre/clair automatiquement
            .keyframeAnimator(
                initialValue: VariableWaveProperties(),
                trigger: startAnimation
            ) { content, value in
                content
                    .sfProVariableWeight(weight: value.weight, size: size)
            } keyframes: { _ in
                KeyframeTrack(\.weight) {
                    CubicKeyframe(0.40, duration: delay)
                    
                    CubicKeyframe(0.62, duration: 0.20)
                    CubicKeyframe(0.40, duration: 0.20)
                    CubicKeyframe(-0.60, duration: 0.30)
                    CubicKeyframe(0.40, duration: 0.30)
                    
                    CubicKeyframe(0.40, duration: max(0, restDuration))
                }
            }
            .onAppear {
                startAnimation = true
            }
    }
}


