import Combine
import CoreLocation
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
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.white.opacity(0.12), in: Circle())
            }
            .buttonStyle(.plain)
            
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

    var body: some View {
        ZStack {
            // Background gradient fading from clear to black to blend with the map
            VStack(spacing: 0) {
                LinearGradient(
                    colors: [.clear, .black.opacity(0.6), .black.opacity(0.95), .black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 180)
                
                Color.black
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                customHeaderRow
                
                headerSection
                
                resultsSection
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            setupInitialStations()
        }
        .onChange(of: startStation?.id) { _, _ in searchItinerary() }
        .onChange(of: endStation?.id) { _, _ in searchItinerary() }
        .onChange(of: departureDate) { _, _ in searchItinerary() }
        .onChange(of: isArrivalTime) { _, _ in searchItinerary() }
        .onChange(of: avoidedStations) { _, _ in searchItinerary() }
        .onChange(of: avoidedLines) { _, _ in searchItinerary() }
        .onChange(of: avoidedModes) { _, _ in searchItinerary() }
        .onChange(of: isAccessible) { _, _ in searchItinerary() }
        .sheet(isPresented: $showStartPicker) {
            SimpleStationPicker(selectedStation: $startStation, currentLocation: currentLocation)
        }
        .sheet(isPresented: $showEndPicker) {
            SimpleStationPicker(selectedStation: $endStation, currentLocation: currentLocation)
        }
        .sheet(isPresented: $showStationToAvoidPicker) {
            SimpleStationPicker(selectedStation: $selectedStationToAvoid, currentLocation: currentLocation)
        }
        .onChange(of: selectedStationToAvoid) { _, newStation in
            if let station = newStation {
                if !avoidedStations.contains(where: { $0.id == station.id }) {
                    avoidedStations.append(station)
                }
                selectedStationToAvoid = nil
            }
        }
        .sheet(item: $selectedJourneyForPreview) { journey in
            JourneyPreviewSheet(
                journey: journey,
                destinationName: endStation?.name ?? destination?.name ?? "Destination",
                onStartNavigation: {
                    coordinator.startNavigation(journey: journey)
                    selectedJourneyForPreview = nil
                }
            )
        }
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
            .background(Color.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            )
            
            // Swap Button
            Button(action: swapStations) {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(width: 44, height: 44)
                    .background(Color(hex: "2C2C2E"), in: Circle())
            }
            .buttonStyle(.plain)
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
                        .foregroundColor(selectedFilter == filter ? .white : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(selectedFilter == filter ? Color.white.opacity(0.15) : Color.clear, in: Capsule())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(Color.white.opacity(0.08), in: Capsule())
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
                        .foregroundColor(!isArrivalTime ? .white : .gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(!isArrivalTime ? Color.white.opacity(0.15) : Color.clear, in: Capsule())
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
                        .foregroundColor(isArrivalTime ? .white : .gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(isArrivalTime ? Color.white.opacity(0.15) : Color.clear, in: Capsule())
                }
                .buttonStyle(.plain)
            }
            .padding(3)
            .background(Color.white.opacity(0.08), in: Capsule())
            
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
                        .foregroundColor(.green)
                    Text(formatDateOnly(departureDate))
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                    Image(systemName: showDatePicker ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.08), in: Capsule())
            }
            .buttonStyle(.plain)

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
                    Image(systemName: showTimePicker ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.08), in: Capsule())
            }
            .buttonStyle(.plain)
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
                                    .foregroundColor(.yellow)
                                Text("MEILLEUR ITINÉRAIRE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
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
                                    selectedJourneyForPreview = bestJourney
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
                                    selectedJourneyForPreview = journey
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
                if case let [] = Optional<[Int]>.none { } // Keep standard structure
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
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.15))
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)

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
            isBestResult ? Color(hex: "0A84FF").opacity(0.08) : Color.clear,
            in: RoundedRectangle(cornerRadius: 16)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isBestResult ? Color(hex: "0A84FF").opacity(0.4) : Color.clear, lineWidth: isBestResult ? 1.5 : 0)
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
                        .padding(.leading, 40)

                        if let duration = section.duration {
                            Text("\(duration / 60) min")
                                .font(.system(.caption2, design: .rounded))
                                .foregroundColor(.secondary)
                                .padding(.leading, 40)
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

struct JourneyPreviewSheet: View {
    @Environment(\.dismiss) var dismiss
    let journey: Journey
    let destinationName: String
    let onStartNavigation: () -> Void
    
    @Environment(\.colorScheme) var colorScheme

    /// Temps de marche total (incluant les correspondances)
    private var walkingTime: Int {
        guard let sections = journey.sections else { return 0 }
        return
            sections
            .filter { $0.type == "street_network" || $0.mode == "walking" || $0.type == "transfer" }
            .reduce(0) { $0 + ($1.duration ?? 0) }
    }

    var body: some View {
        ZStack {
            // Background gradient fading from clear to black to blend with the map
            VStack(spacing: 0) {
                LinearGradient(
                    colors: [.clear, .black.opacity(0.6), .black.opacity(0.95), .black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 180)
                
                Color.black
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header Row (Destination + Close Button)
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("ITINÉRAIRE VERS")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        // Destination station name
                        HStack(spacing: 6) {
                            ForEach(Array(destinationName.components(separatedBy: " ").enumerated()), id: \.offset) { index, word in
                                AnimatedStationWordView(text: word, sequenceIndex: index, size: 24)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Close button
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.white.opacity(0.12), in: Circle())
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive())
                }
                .padding(.horizontal)
                .padding(.top, 16)
                .padding(.bottom, 8)
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Summary card (Duration, walking time)
                        VStack(spacing: 12) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("DURÉE TOTALE")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    Text(formatDuration(journey.duration ?? 0))
                                        .font(.system(size: 26, weight: .black, design: .rounded))
                                        .foregroundColor(.green)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("TEMPS DE MARCHE")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    Text("\(walkingTime / 60) MIN")
                                        .font(.system(size: 26, weight: .black, design: .rounded))
                                        .foregroundColor(.yellow)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("CORRESPONDANCES")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    Text("\(journey.nb_transfers ?? 0)")
                                        .font(.system(size: 26, weight: .black, design: .rounded))
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        
                        Divider()
                            .background(Color.white.opacity(0.15))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        
                        // Steps Timeline Card
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Étapes du trajet")
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top, 12)
                            
                            VStack(spacing: 0) {
                                if let sections = journey.sections {
                                    ForEach(Array(sections.enumerated()), id: \.element.id) { index, section in
                                        SectionDetailView(section: section, isLast: index == sections.count - 1)
                                            .padding(.horizontal)
                                            .padding(.vertical, 8)
                                        
                                        if index < sections.count - 1 {
                                            Divider().padding(.leading, 40)
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                        }
                        
                        // Action buttons
                        VStack(spacing: 12) {
                            // View on Map button
                            NavigationLink(destination: ItineraryMapView(journey: journey)) {
                                HStack {
                                    Image(systemName: "map")
                                    Text("Voir sur la carte")
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.15))
                                .clipShape(Capsule())
                            }
                            .buttonStyle(.plain)
                            .glassEffect(.regular.interactive())
                            
                            // Go Button
                            Button(action: onStartNavigation) {
                                HStack {
                                    Image(systemName: "location.fill")
                                    Text("Démarrer la navigation")
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "0A84FF"))
                                .clipShape(Capsule())
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 24)
                    }
                }
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

