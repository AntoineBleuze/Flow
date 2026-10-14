import Combine
import CoreLocation
import MapKit
import SwiftUI

/// Filtres pour trier les itinéraires
enum ItineraryFilter {
    case fastest
    case lessWalking
    case fewerTransfers
}

struct ItineraryResultView: View {
    let destination: MapStation?
    let currentLocation: CLLocationCoordinate2D?

    @State private var startStation: MapStation?
    @State private var endStation: MapStation?

    @State private var showStartPicker = false
    @State private var showEndPicker = false

    // Date/Time selection
    @State private var departureDate = Date()
    @State private var isArrivalTime = false  // false = départ, true = arrivée
    @State private var showDatePicker = false
    @State private var showTimePicker = false

    // Avoidance and Accessibility settings
    @State private var avoidedStations: [MapStation] = []
    @State private var avoidedLines: Set<String> = []
    @State private var avoidedModes: Set<String> = []
    @State private var isAccessible = false
    @State private var showAvoidOptions = false
    @State private var showStationToAvoidPicker = false
    @State private var selectedStationToAvoid: MapStation? = nil

    @StateObject private var viewModel = ItineraryViewModel()
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var coordinator: NavigationCoordinator
    @Environment(\.dismiss) private var dismiss
    @Environment(\.duoPosture) private var duoPosture

    // Computed: max date = today + 7 days
    private var maxDate: Date {
        Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    }

    // Filter selection
    @State private var selectedFilter: ItineraryFilter = .fastest

    @State private var selectedJourneyForPreview: Journey? = nil



    private var customHeaderRow: some View {
        HStack(alignment: .center) {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(10)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .circle)
            
            Spacer()
            
            HStack(spacing: 6) {
                AnimatedStationWordView(text: "Itinéraire", sequenceIndex: 0, size: 22)
            }
            
            Spacer()
            
            // Hidden placeholder to balance the back button
            Color.clear
                .frame(width: 34, height: 34)
        }
        .padding(.horizontal)
        .padding(.top, 16)
        .padding(.bottom, 4)
    }

    private var mainContentView: some View {
        VStack(spacing: 0) {
            customHeaderRow
            headerSection
            resultsSection
        }
    }

    var body: some View {
        ZStack {
            mainContentView
        }
        .toolbar(.hidden, for: .navigationBar)
        .liquidGlassBackground()
        .onAppear {
            setupInitialStations()
        }
        .onDisappear {
            if duoPosture == .unfoldedDualScreen && !NavigationManager.shared.isNavigating {
                coordinator.previewJourney = nil
            }
        }
        .onChange(of: viewModel.journeys.first?.id) { _, _ in
            if duoPosture == .unfoldedDualScreen, let best = viewModel.journeys.first {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    coordinator.previewJourney = best
                }
            }
        }
        .modifier(ItineraryChangesModifier(
            startStationId: startStation?.id,
            endStationId: endStation?.id,
            departureDate: departureDate,
            isArrivalTime: isArrivalTime,
            avoidedStations: avoidedStations,
            avoidedLines: avoidedLines,
            avoidedModes: avoidedModes,
            isAccessible: isAccessible,
            onSearch: { searchItinerary() }
        ))
        .modifier(ItinerarySheetsModifier(
            showStartPicker: $showStartPicker,
            showEndPicker: $showEndPicker,
            showStationToAvoidPicker: $showStationToAvoidPicker,
            startStation: $startStation,
            endStation: $endStation,
            selectedStationToAvoid: $selectedStationToAvoid,
            avoidedStations: $avoidedStations,
            selectedJourneyForPreview: $selectedJourneyForPreview,
            currentLocation: currentLocation,
            destinationName: endStation?.name ?? destination?.name ?? "Destination",
            onStartNavigation: { journey in
                coordinator.startNavigation(journey: journey)
                selectedJourneyForPreview = nil
            }
        ))
    }

    // MARK: - Header Section

    @ViewBuilder
    private var headerSection: some View {
        VStack(spacing: 12) {
            stationSelectionRow

            filterPicker
            departureArrivalRow
            dateTimeButtonsRow

            if showDatePicker {
                datePickerView
            }
            
            if showTimePicker {
                timePickerView
            }

            // Advanced options toggle button
            Button(action: {
                withAnimation {
                    showAvoidOptions.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 14))
                    Text("Options d'itinéraire")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: showAvoidOptions ? "chevron.up" : "chevron.down")
                        .font(.caption)
                }
                .foregroundColor(.blue)
                .padding(.vertical, 6)
            }
            .buttonStyle(.plain)

            if showAvoidOptions {
                avoidOptionsView
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        
        Divider()
            .background(Color.white.opacity(0.15))
            .padding(.top, 16)
    }

    private var stationSelectionRow: some View {
        HStack(spacing: 12) {
            VStack(spacing: 0) {
                // Start
                HStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundColor(.blue)
                        .frame(width: 24)
                    
                    Button(action: { showStartPicker = true }) {
                        Text(startStation?.name ?? "Choisir un départ")
                            .foregroundColor(startStation == nil ? .blue : .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: { setCurrentLocationAsStart() }) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
                }
                .padding()
                
                Divider().padding(.leading, 36)
                
                // End
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 24)
                    
                    Button(action: { showEndPicker = true }) {
                        Text(endStation?.name ?? "Choisir une destination")
                            .foregroundColor(endStation == nil ? .gray : .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .background(colorScheme == .dark ? Color.white.opacity(0.06) : Color.black.opacity(0.03), in: RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.06), lineWidth: 1)
            )
            
            // Swap Button
            Button(action: swapStations) {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .circle)
        }
    }

    private var filterPicker: some View {
        HStack(spacing: 4) {
            ForEach([ItineraryFilter.fastest, ItineraryFilter.lessWalking, ItineraryFilter.fewerTransfers], id: \.self) { filter in
                Button(action: {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
                        selectedFilter = filter
                    }
                }) {
                    Text(filterTitle(filter))
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(selectedFilter == filter ? (colorScheme == .dark ? .white : .black) : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(
                            selectedFilter == filter
                                ? (colorScheme == .dark ? Color.white.opacity(0.15) : Color.white)
                                : Color.clear,
                            in: Capsule()
                        )
                        .shadow(color: (selectedFilter == filter && colorScheme == .light) ? Color.black.opacity(0.08) : Color.clear, radius: 4, x: 0, y: 1)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .glassEffect(.regular.interactive(), in: Capsule())
    }

    private func filterTitle(_ filter: ItineraryFilter) -> String {
        switch filter {
        case .fastest: return "Rapide"
        case .lessWalking: return "Moins marcher"
        case .fewerTransfers: return "Direct"
        }
    }

    private var departureArrivalRow: some View {
        HStack {
            HStack(spacing: 4) {
                Button(action: {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
                        isArrivalTime = false
                    }
                }) {
                    Text("Départ")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(!isArrivalTime ? (colorScheme == .dark ? .white : .black) : .secondary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            !isArrivalTime
                                ? (colorScheme == .dark ? Color.white.opacity(0.2) : Color.white)
                                : Color.clear,
                            in: Capsule()
                        )
                        .shadow(color: (!isArrivalTime && colorScheme == .light) ? Color.black.opacity(0.08) : Color.clear, radius: 4, x: 0, y: 1)
                }
                .buttonStyle(.plain)
                
                Button(action: {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
                        isArrivalTime = true
                    }
                }) {
                    Text("Arrivée")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(isArrivalTime ? (colorScheme == .dark ? .white : .black) : .secondary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            isArrivalTime
                                ? (colorScheme == .dark ? Color.white.opacity(0.2) : Color.white)
                                : Color.clear,
                            in: Capsule()
                        )
                        .shadow(color: (isArrivalTime && colorScheme == .light) ? Color.black.opacity(0.08) : Color.clear, radius: 4, x: 0, y: 1)
                }
                .buttonStyle(.plain)
            }
            .padding(3)
            .glassEffect(.regular.interactive(), in: Capsule())
            
            Spacer()
        }
    }

    private var dateTimeButtonsRow: some View {
        HStack {
            // Date Button
            Button(action: {
                withAnimation {
                    showDatePicker.toggle()
                    showTimePicker = false
                }
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "calendar")
                        .foregroundColor(LiquidGlassTheme.liveGreen(for: colorScheme))
                    Text(formatDateOnly(departureDate))
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Image(systemName: showDatePicker ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: Capsule())

            Spacer()

            // Time Button
            Button(action: {
                withAnimation {
                    showTimePicker.toggle()
                    showDatePicker = false
                }
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    Text(formatTimeOnly(departureDate))
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Image(systemName: showTimePicker ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: Capsule())
        }
    }

    private var datePickerView: some View {
        DatePicker(
            "",
            selection: $departureDate,
            in: Date()...maxDate,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
        .labelsHidden()
    }

    private var timePickerView: some View {
        DatePicker(
            "",
            selection: $departureDate,
            displayedComponents: [.hourAndMinute]
        )
        .datePickerStyle(.wheel)
        .labelsHidden()
        .frame(height: 150)
    }

    private func formatDateOnly(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }

    private func formatTimeOnly(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

    private func cleanLineName(from lineId: String) -> String {
        let idClean = lineId.replacingOccurrences(of: "line:IDFM:", with: "")
        switch idClean {
        case "C01371": return "Métro 1"
        case "C01372": return "Métro 2"
        case "C01373": return "Métro 3"
        case "C01384": return "Métro 3bis"
        case "C01374": return "Métro 4"
        case "C01375": return "Métro 5"
        case "C01376": return "Métro 6"
        case "C01377": return "Métro 7"
        case "C01385": return "Métro 7bis"
        case "C01378": return "Métro 8"
        case "C01379": return "Métro 9"
        case "C01380": return "Métro 10"
        case "C01381": return "Métro 11"
        case "C01382": return "Métro 12"
        case "C01383": return "Métro 13"
        case "C01386": return "Métro 14"
        case "C01742": return "RER A"
        case "C01743": return "RER B"
        case "C01727": return "RER C"
        case "C01728": return "RER D"
        case "C01729": return "RER E"
        default:
            return idClean
        }
    }

    private func modeAvoidToggle(title: String, modeId: String) -> some View {
        let isAvoided = avoidedModes.contains(modeId)
        return Button(action: {
            if isAvoided {
                avoidedModes.remove(modeId)
            } else {
                avoidedModes.insert(modeId)
            }
        }) {
            Text(title)
                .font(.caption)
                .fontWeight(isAvoided ? .bold : .regular)
                .foregroundColor(isAvoided ? .white : .primary)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(isAvoided ? Color.red : (colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.06)), in: Capsule())
        }
        .buttonStyle(.plain)
    }

    private var avoidOptionsView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Divider()
            
            Toggle(isOn: $isAccessible) {
                HStack(spacing: 8) {
                    Image(systemName: "figure.roll")
                        .foregroundColor(.blue)
                    Text("Itinéraire accessible (Fauteuil)")
                        .font(.subheadline)
                }
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            
            Divider()
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Modes de transport à éviter :")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
                HStack(spacing: 8) {
                    modeAvoidToggle(title: "Métro", modeId: "physical_mode:Metro")
                    modeAvoidToggle(title: "RER", modeId: "physical_mode:RapidTransit")
                    modeAvoidToggle(title: "Tram", modeId: "physical_mode:Tramway")
                    modeAvoidToggle(title: "Train", modeId: "physical_mode:LocalTrain")
                    modeAvoidToggle(title: "Bus", modeId: "physical_mode:Bus")
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Stations à éviter :")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: { showStationToAvoidPicker = true }) {
                        HStack(spacing: 2) {
                            Image(systemName: "plus.circle.fill")
                            Text("Ajouter")
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
                }
                
                if avoidedStations.isEmpty {
                    Text("Aucune station évitée")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 2)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(avoidedStations) { station in
                                HStack(spacing: 4) {
                                    Text(station.name)
                                        .font(.caption)
                                    Button(action: {
                                        avoidedStations.removeAll(where: { $0.id == station.id })
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .font(.caption)
                                            .foregroundColor(.red)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.06), in: Capsule())
                            }
                        }
                    }
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Lignes à éviter :")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
                if avoidedLines.isEmpty {
                    Text("Aucune ligne évitée")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 2)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            let linesArray = Array(avoidedLines).sorted()
                            ForEach(linesArray, id: \.self) { lineId in
                                HStack(spacing: 4) {
                                    Text(cleanLineName(from: lineId))
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                    Button(action: {
                                        avoidedLines.remove(lineId)
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .font(.caption)
                                            .foregroundColor(.red)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.06), in: Capsule())
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: - Results Section

    @ViewBuilder
    private var resultsSection: some View {
        if viewModel.isLoading {
            Spacer()
            ProgressView("Recherche d'itinéraires...")
            Spacer()
        } else if let error = viewModel.errorMessage {
            Spacer()
            Text("Erreur : \(error)")
                .foregroundColor(.red)
                .padding()
            Spacer()
        } else if viewModel.journeys.isEmpty {
            Spacer()
            Text("Aucun itinéraire trouvé.")
                .foregroundColor(.gray)
                .padding()
            Spacer()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    if let bestJourney = filteredJourneys.first {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .font(.caption)
                                    .foregroundColor(LiquidGlassTheme.warningMetricColor(for: colorScheme))
                                Text("MEILLEUR ITINÉRAIRE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(LiquidGlassTheme.warningMetricColor(for: colorScheme))
                            }
                            .padding(.leading, 24)
                            .padding(.top, 4)
                            
                            JourneyRow(
                                journey: bestJourney,
                                isBestResult: true,
                                onAvoidLine: { lineId in
                                    avoidedLines.insert(lineId)
                                },
                                onTap: {
                                    if duoPosture == .unfoldedDualScreen {
                                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                            coordinator.previewJourney = bestJourney
                                        }
                                    } else {
                                        selectedJourneyForPreview = bestJourney
                                    }
                                }
                            )
                        }
                    }
                    
                    ForEach(filteredJourneys.dropFirst()) { journey in
                        VStack(spacing: 12) {
                            Divider()
                                .background(Color.white.opacity(0.15))
                                .padding(.horizontal, 24)
                            
                            JourneyRow(
                                journey: journey,
                                isBestResult: false,
                                onAvoidLine: { lineId in
                                    avoidedLines.insert(lineId)
                                },
                                onTap: {
                                    if duoPosture == .unfoldedDualScreen {
                                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                            coordinator.previewJourney = journey
                                        }
                                    } else {
                                        selectedJourneyForPreview = journey
                                    }
                                }
                            )
                        }
                    }
                }
                .padding(.vertical)
            }
        }
    }

    private func formatDateTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    private func setupInitialStations() {
        if startStation == nil {
            if let current = currentLocation {
                startStation = MapStation(
                    id: "MY_POSITION",
                    name: "Ma position",
                    coordinate: current,
                    platforms: [],
                    isHub: false,
                    mainType: .bus,
                    lines: []
                )
            }
        }

        if endStation == nil {
            endStation = destination
        }

        // Initial search if both set
        if startStation != nil && endStation != nil && viewModel.journeys.isEmpty {
            searchItinerary()
        }
    }

    private func swapStations() {
        let temp = startStation
        startStation = endStation
        endStation = temp
    }

    private func setCurrentLocationAsStart() {
        if let current = currentLocation {
            startStation = MapStation(
                id: "MY_POSITION",
                name: "Ma position",
                coordinate: current,
                platforms: [],
                isHub: false,
                mainType: .bus,
                lines: []
            )
        }
    }

    /// Journeys filtrés et triés selon le critère sélectionné
    private var filteredJourneys: [Journey] {
        switch selectedFilter {
        case .fastest:
            return viewModel.journeys.sorted { ($0.duration ?? 0) < ($1.duration ?? 0) }
        case .lessWalking:
            return viewModel.journeys.sorted { walkingTime(for: $0) < walkingTime(for: $1) }
        case .fewerTransfers:
            return viewModel.journeys.sorted { ($0.nb_transfers ?? 0) < ($1.nb_transfers ?? 0) }
        }
    }

    /// Calcule le temps de marche total pour un journey
    private func walkingTime(for journey: Journey) -> Int {
        guard let sections = journey.sections else { return 0 }
        return
            sections
            .filter { $0.type == "street_network" || $0.mode == "walking" || $0.type == "transfer" }
            .reduce(0) { $0 + ($1.duration ?? 0) }
    }

    private func searchItinerary() {
        guard let start = startStation, let end = endStation else {
            return
        }

        print("🚀 Recherche itinéraire de \(start.name) à \(end.name)")
        print("📍 De: \(start.coordinate.latitude),\(start.coordinate.longitude)")
        print("📍 À: \(end.coordinate.latitude),\(end.coordinate.longitude)")
        print("🕐 Date: \(departureDate) - Type: \(isArrivalTime ? "Arrivée" : "Départ")")

        var forbiddenUris: [String] = []
        for station in avoidedStations {
            if station.id != "MY_POSITION" {
                if station.id.hasPrefix("stop_area:") {
                    forbiddenUris.append(station.id)
                } else {
                    forbiddenUris.append("stop_area:\(station.id)")
                }
            }
        }
        for lineId in avoidedLines {
            forbiddenUris.append(lineId)
        }
        for modeId in avoidedModes {
            forbiddenUris.append(modeId)
        }

        viewModel.searchItinerary(
            from: start.coordinate,
            to: end,
            date: departureDate,
            isArrival: isArrivalTime,
            forbiddenUris: forbiddenUris,
            isAccessible: isAccessible
        )
    }
}

// MARK: - ViewModel
class ItineraryViewModel: ObservableObject {
    @Published var journeys: [Journey] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()

    func searchItinerary(
        from start: CLLocationCoordinate2D,
        to end: MapStation,
        date: Date,
        isArrival: Bool,
        forbiddenUris: [String] = [],
        isAccessible: Bool = false
    ) {
        self.isLoading = true
        self.errorMessage = nil

        IDFMItineraryService.shared.searchItinerary(
            from: start,
            to: end,
            date: date,
            isArrival: isArrival,
            forbiddenUris: forbiddenUris,
            isAccessible: isAccessible
        )
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("❌ Erreur itinéraire: \(error)")
                    if let decodingError = error as? DecodingError {
                        switch decodingError {
                        case .keyNotFound(let key, let context):
                            self.errorMessage = "Clé manquante: \(key.stringValue)"
                            print("❌ Key '\(key.stringValue)' not found: \(context.debugDescription)")
                        case .dataCorrupted(let context):
                            self.errorMessage = "Données corrompues"
                            print("❌ Data corrupted: \(context.debugDescription)")
                        case .typeMismatch(let type, let context):
                            self.errorMessage = "Type invalide: \(type)"
                            print("❌ Type mismatch for type \(type): \(context.debugDescription)")
                        case .valueNotFound(let type, let context):
                            self.errorMessage = "Valeur manquante: \(type)"
                            print("❌ Value not found for type \(type): \(context.debugDescription)")
                        @unknown default:
                            self.errorMessage = error.localizedDescription
                        }
                    } else {
                        self.errorMessage = error.localizedDescription
                    }
                }
            },
            receiveValue: { [weak self] journeys in
                guard let self = self else { return }
                print("✅ Reçu \(journeys.count) itinéraires")
                self.journeys = journeys
            }
        )
        .store(in: &cancellables)
    }
}

struct JourneyRow: View {
    let journey: Journey
    let isBestResult: Bool
    let onAvoidLine: (String) -> Void
    let onTap: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var coordinator: NavigationCoordinator

    /// Temps de marche total (incluant les correspondances)
    private var walkingTime: Int {
        guard let sections = journey.sections else { return 0 }
        return
            sections
            .filter { $0.type == "street_network" || $0.mode == "walking" || $0.type == "transfer" }
            .reduce(0) { $0 + ($1.duration ?? 0) }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header with times and duration
            Button(action: onTap) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(formatTime(journey.departure_date_time ?? ""))
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                            Text("→")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            Text(formatTime(journey.arrival_date_time ?? ""))
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                        }

                        // Duration with walking time
                        HStack(spacing: 4) {
                            Text(formatDuration(journey.duration ?? 0))
                            if walkingTime > 0 {
                                Text("•")
                                Image(systemName: "figure.walk")
                                    .font(.system(size: 11))
                                Text("\(walkingTime / 60) min")
                            }
                            Text("•")
                            Text("\(journey.nb_transfers ?? 0) corresp.")
                        }
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.secondary)
                    }

                    Spacer()
                }
            }
            .buttonStyle(.plain)

            // Summary line icons with real assets
            HStack(spacing: 6) {
                if let sections = journey.sections {
                    ForEach(sections.filter { $0.type == "public_transport" }) { section in
                        if let display = section.display_informations {
                            let assetName = getLineAssetName(
                                mode: display.commercial_mode,
                                code: display.code ?? display.label ?? "")

                            // Try to use real asset, fallback to colored circle
                            if !assetName.isEmpty, UIImage(named: assetName) != nil {
                                Image(assetName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                            } else {
                                let label = display.code ?? display.label ?? "?"
                                let isBus = display.commercial_mode?.lowercased().contains("bus") == true || display.physical_mode?.lowercased().contains("bus") == true
                                if isBus || label.count > 3 {
                                    Text(label)
                                        .font(.system(size: 10, weight: .bold, design: .rounded))
                                        .foregroundColor(Color(hex: display.text_color ?? "FFFFFF"))
                                        .padding(.horizontal, 6)
                                        .frame(minWidth: 26)
                                        .frame(height: 26)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color(hex: display.color ?? "CCCCCC")))
                                } else {
                                    Circle()
                                        .fill(Color(hex: display.color ?? "CCCCCC"))
                                        .frame(width: 26, height: 26)
                                        .overlay(
                                            Text(label)
                                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                                .foregroundColor(Color(hex: display.text_color ?? "FFFFFF"))
                                        )
                                }
                            }
                        }
                    }
                }

                Spacer()

                // Preview Button
                Button(action: onTap) {
                    HStack(spacing: 4) {
                        Image(systemName: "eye.fill")
                            .font(.system(size: 12, weight: .bold))
                        Text("Aperçu")
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.primary)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive(), in: Capsule())

                // Go Button
                Button(action: {
                    coordinator.startNavigation(journey: journey)
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "location.fill")
                            .font(.system(size: 12, weight: .bold))
                        Text("Go")
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color(hex: "0A84FF"))
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            isBestResult
                ? (colorScheme == .dark ? Color(hex: "0A84FF").opacity(0.12) : Color(hex: "0A84FF").opacity(0.08))
                : (colorScheme == .dark ? Color.white.opacity(0.04) : Color.white.opacity(0.5)),
            in: RoundedRectangle(cornerRadius: 16)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    isBestResult
                        ? Color(hex: "0A84FF").opacity(colorScheme == .dark ? 0.4 : 0.6)
                        : (colorScheme == .dark ? Color.white.opacity(0.08) : Color.black.opacity(0.06)),
                    lineWidth: isBestResult ? 1.5 : 1
                )
        )
        .padding(.horizontal)
    }

    func formatTime(_ isoDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = dateFormatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
        return isoDate
    }

    func formatDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let mins = minutes % 60
        if hours > 0 {
            return "\(hours)h\(String(format: "%02d", mins))"
        }
        return "\(mins) min"
    }

    /// Génère le nom d'asset pour une ligne de transport
    func getLineAssetName(mode: String?, code: String) -> String {
        guard let mode = mode?.lowercased() else { return "" }

        if mode.contains("metro") || mode.contains("métro") {
            var fixedCode = code
            if code == "3B" { fixedCode = "3bis" } else if code == "7B" { fixedCode = "7bis" }
            return "metro\(fixedCode)"
        } else if mode.contains("rer") {
            return "rer\(code.uppercased())"
        } else if mode.contains("tram") {
            if code.lowercased().starts(with: "t") {
                return code
            }
            return "T\(code)"
        } else if mode.contains("train") || mode.contains("transilien") {
            return "transilien\(code)"
        } else if mode.contains("bus") {
            return "bus\(code)"
        }
        return ""
    }
}

struct SectionDetailView: View {
    let section: ItinerarySection
    let isLast: Bool
    @State private var isStopsExpanded = false

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Timeline indicator
            VStack(spacing: 0) {
                Circle()
                    .fill(circleColor)
                    .frame(width: 12, height: 12)

                if !isLast {
                    Rectangle()
                        .fill(lineColor)
                        .frame(width: 2)
                        .padding(.vertical, 4)
                }
            }

            // Section content
            VStack(alignment: .leading, spacing: 6) {
                if section.type == "public_transport" {
                    // Public transport section
                    if let display = section.display_informations {
                        HStack(spacing: 8) {
                            // Line badge
                            let label = display.code ?? display.label ?? "?"
                            let isBus = display.commercial_mode?.lowercased().contains("bus") == true || display.physical_mode?.lowercased().contains("bus") == true
                            if isBus || label.count > 3 {
                                Text(label)
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .foregroundColor(Color(hex: display.text_color ?? "FFFFFF"))
                                    .padding(.horizontal, 8)
                                    .frame(minWidth: 32)
                                    .frame(height: 32)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(Color(hex: display.color ?? "CCCCCC")))
                            } else {
                                Circle()
                                    .fill(Color(hex: display.color ?? "CCCCCC"))
                                    .frame(width: 32, height: 32)
                                    .overlay(
                                        Text(label)
                                            .font(.system(size: 12, weight: .bold, design: .rounded))
                                            .foregroundColor(Color(hex: display.text_color ?? "FFFFFF"))
                                    )
                            }

                            VStack(alignment: .leading, spacing: 2) {
                                Text(
                                    "\(display.commercial_mode ?? "Transport") \(display.label ?? "")"
                                )
                                .font(.system(.subheadline, design: .rounded))
                                .fontWeight(.semibold)

                                if let direction = display.direction {
                                    Text("direction \(direction)")
                                        .font(.system(.caption, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: LineSchematicPlanView(line: TransportLine(
                                type: display.transportType,
                                lineId: display.code ?? display.label ?? "?",
                                status: .normal
                            ))) {
                                HStack(spacing: 4) {
                                    Image(systemName: "map")
                                    Text("Plan")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.semibold)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue.opacity(0.1), in: Capsule())
                            }
                            .buttonStyle(.plain)
                        }

                        // Departure and arrival
                        VStack(alignment: .leading, spacing: 6) {
                            if let from = section.from?.name {
                                HStack {
                                    Text(formatTime(section.departure_date_time ?? ""))
                                        .font(.system(.caption, design: .rounded))
                                        .foregroundColor(.secondary)
                                    Text(from)
                                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                                }
                            }

                            // Intermediate stops section
                            if let stops = section.stop_date_times, !stops.isEmpty {
                                Button(action: {
                                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                        isStopsExpanded.toggle()
                                    }
                                }) {
                                    HStack(spacing: 4) {
                                        Image(systemName: isStopsExpanded ? "chevron.down" : "chevron.right")
                                            .font(.caption2)
                                        Text("\(stops.count) arrêt\(stops.count > 1 ? "s" : "") (\((section.duration ?? 0) / 60) min)")
                                            .font(.system(.caption, design: .rounded))
                                            .fontWeight(.medium)
                                    }
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .background(Color.blue.opacity(0.08))
                                    .clipShape(Capsule())
                                }
                                .buttonStyle(.plain)
                                .padding(.leading, 8)

                                if isStopsExpanded {
                                    VerticalItineraryStopsView(section: section)
                                        .padding(.leading, 8)
                                        .transition(.opacity.combined(with: .move(edge: .top)))
                                }
                            }

                            if let to = section.to?.name {
                                HStack {
                                    Text(formatTime(section.arrival_date_time ?? ""))
                                        .font(.system(.caption, design: .rounded))
                                        .foregroundColor(.secondary)
                                    Text(to)
                                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                                }
                            }
                        }
                        .padding(.leading, 16)

                        if let duration = section.duration {
                            Text("\(duration / 60) min")
                                .font(.system(.caption2, design: .rounded))
                                .foregroundColor(.secondary)
                                .padding(.leading, 16)
                        }
                    }
                } else if section.type == "street_network" || section.mode == "walking" {
                    // Walking section
                    HStack(spacing: 8) {
                        Image(systemName: "figure.walk")
                            .foregroundColor(.blue)

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Marche à pied")
                                .font(.system(.subheadline, design: .rounded))

                            if let duration = section.duration {
                                Text("\(duration / 60) min")
                                    .font(.system(.caption, design: .rounded))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                } else if section.type == "transfer" {
                    // Transfer section
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.orange)

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Correspondance")
                                .font(.system(.subheadline, design: .rounded))

                            if let duration = section.duration {
                                Text("\(duration / 60) min")
                                    .font(.system(.caption, design: .rounded))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                } else if section.type == "waiting" {
                    // Waiting section
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)

                        Text("Attente \((section.duration ?? 0) / 60) min")
                            .font(.system(.caption, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }

    var circleColor: Color {
        if section.type == "public_transport" {
            return Color(hex: section.display_informations?.color ?? "CCCCCC")
        } else if section.mode == "walking" {
            return .blue
        } else if section.type == "transfer" {
            return .orange
        } else {
            return .gray
        }
    }

    var lineColor: Color {
        circleColor.opacity(0.3)
    }

    func formatTime(_ isoDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = dateFormatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
        return isoDate
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
    
    @Environment(\.colorScheme) var colorScheme
    @State private var startAnimation = false
    
    var body: some View {
        let staggerDelay = 0.12 
        let delay = Double(sequenceIndex) * staggerDelay
        let animationDuration = 1.0
        let totalLoopDuration = 1.6 
        let restDuration = totalLoopDuration - animationDuration - delay
        
        Text(text)
            .fixedSize(horizontal: true, vertical: true)
            .foregroundColor(colorScheme == .dark ? .white : .primary)
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

struct JourneyPreviewView: View {
    @Environment(\.dismiss) var dismiss
    let journey: Journey
    let destinationName: String
    let onStartNavigation: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    @State private var region: MKCoordinateRegion
    @State private var scrollOffset: CGFloat = 0

    init(journey: Journey, destinationName: String, onStartNavigation: @escaping () -> Void) {
        self.journey = journey
        self.destinationName = destinationName
        self.onStartNavigation = onStartNavigation
        
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }
    /// Temps de marche total (incluant les correspondances)
    private var walkingTime: Int {
        guard let sections = journey.sections else { return 0 }
        return sections
            .filter { $0.type == "street_network" || $0.mode == "walking" || $0.type == "transfer" }
            .reduce(0) { $0 + ($1.duration ?? 0) }
    }

    var body: some View {
        GeometryReader { geometry in
            let mapHeight = geometry.size.height * 0.5
            let scrolledDistance = max(0, -scrollOffset)
            let fadeProgress = min(1.0, scrolledDistance / 150.0)
            let blurRadius = min(12.0, (scrolledDistance / 150.0) * 12.0)
            
            ZStack(alignment: .top) {
                // Fond opaque global qui fait toute la page
                Color(uiColor: .systemBackground)
                    .ignoresSafeArea()
                
                // La carte d'itinéraire en arrière-plan
                ItineraryMapViewRepresentable(journey: journey, region: $region)
                    .frame(height: mapHeight)
                    .blur(radius: blurRadius)
                    .ignoresSafeArea(edges: .top)
                
                // Overlay opaque qui s'affiche progressivement pour rendre le fond opaque au scroll
                Color(uiColor: .systemBackground)
                    .frame(height: mapHeight)
                    .opacity(fadeProgress)
                    .ignoresSafeArea(edges: .top)
                
                // Le contenu défilant
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Track le scroll offset
                        Color.clear
                            .frame(height: 0)
                            .background(
                                GeometryReader { geo in
                                    Color.clear
                                        .preference(
                                            key: ScrollOffsetPreferenceKey.self,
                                            value: geo.frame(in: .named("scroll")).minY
                                        )
                                }
                            )
                        
                        // Espace vide pour laisser la carte visible (avec déduction de la zone de texte)
                        Color.clear
                            .frame(height: mapHeight - 160)
                        
                        // En-tête textuel (affiche le texte par-dessus la carte)
                        VStack(spacing: 16) {
                            // Nom de la destination
                            VStack(alignment: .leading, spacing: 6) {
                                Text("ITINÉRAIRE VERS")
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                
                                HStack(spacing: 6) {
                                    ForEach(Array(destinationName.components(separatedBy: " ").enumerated()), id: \.offset) { index, word in
                                        AnimatedStationWordView(text: word, sequenceIndex: index, size: 24)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            // Cartes résumé (Durée, marche, correspondances)
                            HStack(spacing: 12) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("DURÉE TOTALE")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                    Text(formatDuration(journey.duration ?? 0))
                                        .font(.system(size: 24, weight: .black, design: .rounded))
                                        .foregroundColor(.green)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("MARCHE")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                    Text("\(walkingTime / 60) MIN")
                                        .font(.system(size: 24, weight: .black, design: .rounded))
                                        .foregroundColor(.yellow)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("CORRESPONDANCES")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                    Text("\(journey.nb_transfers ?? 0)")
                                        .font(.system(size: 24, weight: .black, design: .rounded))
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                        // Gradient de lisibilité derrière le texte sur la carte
                        .background(
                            LinearGradient(
                                colors: [
                                    .clear,
                                    Color(uiColor: .systemBackground).opacity(0.40),
                                    Color(uiColor: .systemBackground).opacity(0.85),
                                    Color(uiColor: .systemBackground)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        
                        // Fiche de détails opaque
                        VStack(spacing: 20) {
                            Divider()
                                .background(Color.secondary.opacity(0.2))
                                .padding(.horizontal)
                            
                            // Étapes du trajet
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Étapes du trajet")
                                        .font(.system(.headline, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                VStack(spacing: 0) {
                                    if let ServerNameSections = journey.sections {
                                        ForEach(Array(ServerNameSections.enumerated()), id: \.element.id) { index, section in
                                            SectionDetailView(section: section, isLast: index == ServerNameSections.count - 1)
                                                .padding(.horizontal)
                                                .padding(.vertical, 8)
                                            
                                            if index < ServerNameSections.count - 1 {
                                                Divider()
                                                    .padding(.leading, 16)
                                            }
                                        }
                                    }
                                }
                            }
                            
                            // Bouton Démarrer la navigation avec effet de verre
                            Button(action: onStartNavigation) {
                                HStack {
                                    Image(systemName: "location.fill")
                                    Text("Démarrer la navigation")
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                            }
                            .buttonStyle(.plain)
                            .glassEffect(.regular.interactive(), in: Capsule())
                            .padding(.horizontal)
                            .padding(.top, 16)
                            .padding(.bottom, 24)
                        }
                        .frame(minHeight: max(0, geometry.size.height - mapHeight), alignment: .top)
                        .background(Color(uiColor: .systemBackground))
                    }
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollOffset = value
                }
                .ignoresSafeArea(edges: .bottom)
                
                // Bouton de fermeture flottant dans la zone de sécurité (ne dépasse plus)
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.primary)
                            .padding(10)
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: .circle)
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                }
                .zIndex(10)
            }
        }
        .presentationBackground(.clear)
    }

    func formatTime(_ isoDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = dateFormatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
        return isoDate
    }

    func formatDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let mins = minutes % 60
        if hours > 0 {
            return "\(hours)h\(String(format: "%02d", mins))"
        }
        return "\(mins) min"
    }
}

#Preview {
    NavigationStack {
        ItineraryResultView(
            destination: PreviewMockData.mockStation,
            currentLocation: CLLocationCoordinate2D(latitude: 48.8239, longitude: 2.2743)
        )
        .environmentObject(NavigationCoordinator())
    }
}

// Clé de préférence pour suivre la position du défilement
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}



// MARK: - Helper Modifiers for Fast Type Checking

private struct ItinerarySheetsModifier: ViewModifier {
    @Binding var showStartPicker: Bool
    @Binding var showEndPicker: Bool
    @Binding var showStationToAvoidPicker: Bool
    @Binding var startStation: MapStation?
    @Binding var endStation: MapStation?
    @Binding var selectedStationToAvoid: MapStation?
    @Binding var avoidedStations: [MapStation]
    @Binding var selectedJourneyForPreview: Journey?
    let currentLocation: CLLocationCoordinate2D?
    let destinationName: String
    let onStartNavigation: (Journey) -> Void

    func body(content: Content) -> some View {
        content
            .onChange(of: selectedStationToAvoid) { _, newStation in
                if let station = newStation {
                    if !avoidedStations.contains(where: { $0.id == station.id }) {
                        avoidedStations.append(station)
                    }
                    selectedStationToAvoid = nil
                }
            }
            .sheet(isPresented: $showStartPicker) {
                SimpleStationPicker(selectedStation: $startStation, currentLocation: currentLocation)
                    .liquidGlassSheetBackground()
            }
            .sheet(isPresented: $showEndPicker) {
                SimpleStationPicker(selectedStation: $endStation, currentLocation: currentLocation)
                    .liquidGlassSheetBackground()
            }
            .sheet(isPresented: $showStationToAvoidPicker) {
                SimpleStationPicker(selectedStation: $selectedStationToAvoid, currentLocation: currentLocation)
                    .liquidGlassSheetBackground()
            }
            .fullScreenCover(item: $selectedJourneyForPreview) { journey in
                JourneyPreviewView(
                    journey: journey,
                    destinationName: destinationName,
                    onStartNavigation: {
                        onStartNavigation(journey)
                    }
                )
            }
    }
}

private struct ItineraryChangesModifier: ViewModifier {
    let startStationId: String?
    let endStationId: String?
    let departureDate: Date
    let isArrivalTime: Bool
    let avoidedStations: [MapStation]
    let avoidedLines: Set<String>
    let avoidedModes: Set<String>
    let isAccessible: Bool
    let onSearch: () -> Void

    func body(content: Content) -> some View {
        content
            .onChange(of: startStationId) { _, _ in onSearch() }
            .onChange(of: endStationId) { _, _ in onSearch() }
            .onChange(of: departureDate) { _, _ in onSearch() }
            .onChange(of: isArrivalTime) { _, _ in onSearch() }
            .onChange(of: avoidedStations) { _, _ in onSearch() }
            .onChange(of: avoidedLines) { _, _ in onSearch() }
            .onChange(of: avoidedModes) { _, _ in onSearch() }
            .onChange(of: isAccessible) { _, _ in onSearch() }
    }
}
