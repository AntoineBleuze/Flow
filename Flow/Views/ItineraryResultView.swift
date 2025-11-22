import SwiftUI
import CoreLocation
import Combine

struct ItineraryResultView: View {
    let destination: Station?
    let currentLocation: CLLocationCoordinate2D?
    
    @State private var startStation: Station?
    @State private var endStation: Station?
    
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    
    // Date/Time selection
    @State private var departureDate = Date()
    @State private var isArrivalTime = false // false = départ, true = arrivée
    @State private var showDateTimePicker = false
    
    @StateObject private var itineraryService = IDFMItineraryService.shared
    @State private var journeys: [Journey] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    // Computed: max date = today + 7 days
    private var maxDate: Date {
        Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header: Start / End Selection
            VStack(spacing: 12) {
                // Start Row
                HStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundColor(.blue)
                    
                    Button(action: { showStartPicker = true }) {
                        HStack {
                            Text(startStation?.name ?? "Choisir un départ")
                                .foregroundColor(startStation == nil ? .gray : .primary)
                            Spacer()
                        }
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }
                
                // End Row
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                    
                    Button(action: { showEndPicker = true }) {
                        HStack {
                            Text(endStation?.name ?? "Choisir une destination")
                                .foregroundColor(endStation == nil ? .gray : .primary)
                            Spacer()
                        }
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }
                
                // Date/Time Row
                VStack(spacing: 8) {
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
                    
                    if showDateTimePicker {
                        DatePicker(
                            "",
                            selection: $departureDate,
                            in: Date()...maxDate,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
            
            // Results
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
                List(journeys) { journey in
                    JourneyRow(journey: journey)
                }
                .listStyle(PlainListStyle())
            }
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
            SearchView(currentLocation: currentLocation, selection: $startStation, isPicker: true)
        }
        .sheet(isPresented: $showEndPicker) {
            SearchView(currentLocation: currentLocation, selection: $endStation, isPicker: true)
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
                startStation = Station(
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
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("❌ Erreur itinéraire: \(error)")
                    
                    // More detailed error message
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
            }, receiveValue: { journeys in
                print("✅ Reçu \(journeys.count) itinéraires")
                self.journeys = journeys
            })
            .store(in: &cancellables)
    }
    
    // Need to hold cancellables
    @State private var cancellables = Set<AnyCancellable>()
}

struct JourneyRow: View {
    let journey: Journey
    @State private var isExpanded = false
    
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
                        
                        Text("\(formatDuration(journey.duration ?? 0)) • \(journey.nb_transfers ?? 0) correspondance\(journey.nb_transfers ?? 0 > 1 ? "s" : "")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.plain)
            
            // Summary line icons
            if !isExpanded {
                HStack(spacing: 8) {
                    if let sections = journey.sections {
                        ForEach(sections.filter { $0.type == "public_transport" }) { section in
                            if let display = section.display_informations {
                                HStack(spacing: 4) {
                                    Circle()
                                        .fill(Color(hex: display.color ?? "CCCCCC") ?? .gray)
                                        .frame(width: 24, height: 24)
                                        .overlay(
                                            Text(display.code ?? display.label ?? "?")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(Color(hex: display.text_color ?? "FFFFFF") ?? .white)
                                        )
                                }
                            }
                        }
                    }
                }
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
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
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

struct SectionDetailView: View {
    let section: Section
    let isLast: Bool
    
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
                                        .foregroundColor(Color(hex: display.text_color ?? "FFFFFF") ?? .white)
                                )
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(display.commercial_mode ?? "Transport") \(display.label ?? "")")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                if let direction = display.direction {
                                    Text("→ \(direction)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        
                        // Departure and arrival
                        VStack(alignment: .leading, spacing: 4) {
                            if let from = section.from?.name {
                                HStack {
                                    Text(formatTime(section.departure_date_time ?? ""))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(from)
                                        .font(.caption)
                                }
                            }
                            
                            if let to = section.to?.name {
                                HStack {
                                    Text(formatTime(section.arrival_date_time ?? ""))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(to)
                                        .font(.caption)
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
