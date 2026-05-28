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
    @State private var showDateTimePicker = false

    @StateObject private var itineraryService = IDFMItineraryService.shared
    @State private var journeys: [Journey] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @Environment(\.colorScheme) var colorScheme

    // Computed: max date = today + 7 days
    private var maxDate: Date {
        Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    }

    // Filter selection
    @State private var selectedFilter: ItineraryFilter = .fastest

    // Favorites
    @ObservedObject private var favoritesService = FavoritesService.shared

    var body: some View {
        VStack(spacing: 0) {
            headerSection
            resultsSection
        }
        .background {
            ZStack {
                ShaderAnimationView(isLoading: isLoading, station: destination ?? startStation)
                (colorScheme == .dark ? Color.black.opacity(0.2) : Color.white.opacity(0.15))
                    .glassEffect(.ultraThin)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            setupInitialStations()
        }
        .onChange(of: startStation?.id) { _, _ in searchItinerary() }
        .onChange(of: endStation?.id) { _, _ in searchItinerary() }
        .onChange(of: departureDate) { _, _ in searchItinerary() }
        .onChange(of: isArrivalTime) { _, _ in searchItinerary() }
        .navigationBarTitle("Itinéraire", displayMode: .inline)
        .sheet(isPresented: $showStartPicker) {
            SimpleStationPicker(selectedStation: $startStation, currentLocation: currentLocation)
        }
        .sheet(isPresented: $showEndPicker) {
            SimpleStationPicker(selectedStation: $endStation, currentLocation: currentLocation)
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 12) {
            stationSelectionRow

            if !favoritesService.favoriteStations.isEmpty {
                favoritesBar
            }

            filterPicker
            dateTimeRow

            if showDateTimePicker {
                datePickerView
            }
        }
        .padding()
        .glassEffect()
        .padding(.horizontal)
        .padding(.top)
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
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
            
            // Swap Button
            Button(action: swapStations) {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.glass)
        }
    }

    @ViewBuilder
    private var favoritesBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(favoritesService.favoriteStations.prefix(5)) { station in
                    FavoriteStationButton(
                        station: station,
                        isSelected: endStation?.id == station.id,
                        action: {
                            endStation = station
                            searchItinerary()
                        }
                    )
                }
            }
        }
    }

    private var filterPicker: some View {
        Picker("Filtre", selection: $selectedFilter) {
            Text("Rapide").tag(ItineraryFilter.fastest)
            Text("Moins marcher").tag(ItineraryFilter.lessWalking)
            Text("Direct").tag(ItineraryFilter.fewerTransfers)
        }
        .pickerStyle(.segmented)
    }

    private var dateTimeRow: some View {
        HStack {
            Picker("", selection: $isArrivalTime) {
                Text("Départ").tag(false)
                Text("Arrivée").tag(true)
            }
            .pickerStyle(.segmented)
            .frame(maxWidth: 150)

            Spacer()

            Button(action: { showDateTimePicker.toggle() }) {
                HStack {
                    Image(systemName: "calendar.circle.fill")
                        .foregroundColor(.green)
                    Text(formatDateTime(departureDate))
                        .font(.subheadline)
                    Image(systemName: showDateTimePicker ? "chevron.up" : "chevron.down")
                        .font(.caption)
                }
            }
        }
    }

    private var datePickerView: some View {
        DatePicker(
            "",
            selection: $departureDate,
            in: Date()...maxDate,
            displayedComponents: [.date, .hourAndMinute]
        )
        .datePickerStyle(.graphical)
        .labelsHidden()
    }

    // MARK: - Results Section

    @ViewBuilder
    private var resultsSection: some View {
        if isLoading {
            Spacer()
            ProgressView("Recherche d'itinéraires...")
            Spacer()
        } else if let error = errorMessage {
            Spacer()
            Text("Erreur : \(error)")
                .foregroundColor(.red)
                .padding()
            Spacer()
        } else if journeys.isEmpty {
            Spacer()
            Text("Aucun itinéraire trouvé.")
                .foregroundColor(.gray)
                .padding()
            Spacer()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filteredJourneys) { journey in
                        JourneyRow(journey: journey)
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
        if startStation != nil && endStation != nil && journeys.isEmpty {
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
            return journeys.sorted { ($0.duration ?? 0) < ($1.duration ?? 0) }
        case .lessWalking:
            return journeys.sorted { walkingTime(for: $0) < walkingTime(for: $1) }
        case .fewerTransfers:
            return journeys.sorted { ($0.nb_transfers ?? 0) < ($1.nb_transfers ?? 0) }
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
            // self.errorMessage = "Veuillez sélectionner un départ et une arrivée."
            return
        }

        self.isLoading = true
        self.errorMessage = nil

        print("🚀 Recherche itinéraire de \(start.name) à \(end.name)")
        print("📍 De: \(start.coordinate.latitude),\(start.coordinate.longitude)")
        print("📍 À: \(end.coordinate.latitude),\(end.coordinate.longitude)")
        print("🕐 Date: \(departureDate) - Type: \(isArrivalTime ? "Arrivée" : "Départ")")

        itineraryService.searchItinerary(
            from: start.coordinate,
            to: end,
            date: departureDate,
            isArrival: isArrivalTime
        )
        .sink(
            receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("❌ Erreur itinéraire: \(error)")

                    // More detailed error message
                    if let decodingError = error as? DecodingError {
                        switch decodingError {
                        case .keyNotFound(let key, let context):
                            self.errorMessage = "Clé manquante: \(key.stringValue)"
                            print(
                                "❌ Key '\(key.stringValue)' not found: \(context.debugDescription)")
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
            receiveValue: { journeys in
                print("✅ Reçu \(journeys.count) itinéraires")
                self.journeys = journeys
            }
        )
        .store(in: &cancellables)
    }

    // Need to hold cancellables
    @State private var cancellables = Set<AnyCancellable>()
}

struct JourneyRow: View {
    let journey: Journey
    @State private var isExpanded = false
    @Environment(\.dismiss) private var dismiss

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
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(formatTime(journey.departure_date_time ?? ""))
                                .fontWeight(.bold)
                                .font(.title3)
                            Image(systemName: "arrow.right")
                                .font(.caption)
                            Text(formatTime(journey.arrival_date_time ?? ""))
                                .fontWeight(.bold)
                                .font(.title3)
                        }

                        // Duration with walking time
                        HStack(spacing: 4) {
                            Text(formatDuration(journey.duration ?? 0))
                            if walkingTime > 0 {
                                Text("•")
                                Image(systemName: "figure.walk")
                                    .font(.caption2)
                                Text("\(walkingTime / 60) min")
                            }
                            Text("•")
                            Text("\(journey.nb_transfers ?? 0) corresp.")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.glass)

            // Summary line icons with real assets
            HStack(spacing: 6) {
                if let sections = journey.sections {
                    ForEach(sections.filter { $0.type == "public_transport" }) { section in
                        if let display = section.display_informations {
                            let assetName = getLineAssetName(
                                mode: display.commercial_mode,
                                code: display.code ?? display.label ?? "")

                            // Try to use real asset, fallback to colored circle
                            if UIImage(named: assetName) != nil {
                                Image(assetName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                            } else {
                                Circle()
                                    .fill(Color(hex: display.color ?? "CCCCCC") ?? .gray)
                                    .frame(width: 26, height: 26)
                                    .overlay(
                                        Text(display.code ?? display.label ?? "?")
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(
                                                Color(hex: display.text_color ?? "FFFFFF")
                                                    ?? .white)
                                    )
                            }
                        }
                    }
                }

                Spacer()

                // Visible Start Navigation Button (Liquid Glass)
                Button(action: {
                    NavigationManager.shared.startNavigation(journey: journey)
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "location.fill")
                        Text("Go")
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                }
                .buttonStyle(.glass)
            }

            // Detailed view when expanded
            if isExpanded {
                Divider()

                // Button to view on map
                NavigationLink(destination: ItineraryMapView(journey: journey)) {
                    HStack {
                        Image(systemName: "map")
                            .foregroundColor(.green)
                        Text("Voir sur la carte")
                            .fontWeight(.medium)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }

                Divider()

                if let sections = journey.sections {
                    ForEach(Array(sections.enumerated()), id: \.element.id) { index, section in
                        SectionDetailView(section: section, isLast: index == sections.count - 1)
                    }
                }
            }
        }
        .padding()
        .glassEffect()
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
                            Circle()
                                .fill(Color(hex: display.color ?? "CCCCCC") ?? .gray)
                                .frame(width: 32, height: 32)
                                .overlay(
                                    Text(display.code ?? display.label ?? "?")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(
                                            Color(hex: display.text_color ?? "FFFFFF") ?? .white)
                                )

                            VStack(alignment: .leading, spacing: 2) {
                                Text(
                                    "\(display.commercial_mode ?? "Transport") \(display.label ?? "")"
                                )
                                .font(.subheadline)
                                .fontWeight(.semibold)

                                if let direction = display.direction {
                                    Text("direction \(direction)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }

                        // Departure and arrival
                        VStack(alignment: .leading, spacing: 6) {
                            if let from = section.from?.name {
                                HStack {
                                    Text(formatTime(section.departure_date_time ?? ""))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(from)
                                        .font(.system(size: 13, weight: .semibold))
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
                                            .font(.caption)
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
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(to)
                                        .font(.system(size: 13, weight: .semibold))
                                }
                            }
                        }
                        .padding(.leading, 40)

                        if let duration = section.duration {
                            Text("\(duration / 60) min")
                                .font(.caption2)
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
                                .font(.subheadline)

                            if let duration = section.duration {
                                Text("\(duration / 60) min")
                                    .font(.caption)
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
                                .font(.subheadline)

                            if let duration = section.duration {
                                Text("\(duration / 60) min")
                                    .font(.caption)
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
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }

    var circleColor: Color {
        if section.type == "public_transport" {
            return Color(hex: section.display_informations?.color ?? "CCCCCC") ?? .blue
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

/// Bouton favori pour éviter les problèmes de type-inference
struct FavoriteStationButton: View {
    let station: MapStation
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .font(.system(size: 10))
                    .foregroundColor(.yellow)
                Text(station.name)
                    .font(.caption)
                    .lineLimit(1)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
        }
        .buttonStyle(.glass)
    }
}
