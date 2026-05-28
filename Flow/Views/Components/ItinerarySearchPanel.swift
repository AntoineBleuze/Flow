import SwiftUI
import CoreLocation

enum ItineraryPanelState {
    case compact
    case expanded
    case results
    case navigation
}

struct ItinerarySearchPanel: View {
    @Binding var startStation: MapStation?
    @Binding var endStation: MapStation?
    @Binding var departureDate: Date
    @Binding var isArrivalTime: Bool
    
    @Binding var journeys: [Journey]
    @Binding var selectedJourney: Journey?
    @Binding var focusedSectionId: String?
    
    @Binding var panelState: ItineraryPanelState
    var onSearch: () -> Void
    var onSwap: () -> Void
    var onCurrentLocation: () -> Void
    var onStartNavigation: () -> Void // Closure to trigger navigation start
    
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    @State private var showDatePicker = false
    
    // Resizable panel properties
    @State private var panelHeight: CGFloat = 500
    @GestureState private var dragOffset: CGFloat = 0
    private let minPanelHeight: CGFloat = 300
    private let maxPanelHeight: CGFloat = 700
    
    // Animation properties
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0) {
            // Drag Handle — interactive for resizing
            Capsule()
                .fill(Color.secondary.opacity(0.5))
                .frame(width: 40, height: 5)
                .padding(.top, 8)
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle().size(width: 120, height: 40))
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.height
                        }
                        .onEnded { value in
                            let newHeight = panelHeight - value.translation.height
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                panelHeight = min(maxPanelHeight, max(minPanelHeight, newHeight))
                            }
                        }
                )
            
            if panelState == .compact {
                compactView
            } else if panelState == .expanded {
                expandedView
            } else if panelState == .results {
                resultsView
            }
        }
        .frame(height: min(maxPanelHeight, max(minPanelHeight, panelHeight - dragOffset)))
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.regularMaterial)
                .shadow(color: .black.opacity(0.1), radius: 10, y: -5)
        }
        .onChange(of: panelState) { _, newValue in
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                switch newValue {
                case .compact:
                    panelHeight = 140
                case .expanded:
                    panelHeight = 420
                case .results:
                    panelHeight = 620
                case .navigation:
                    panelHeight = 350
                }
            }
        }
        .onAppear {
            switch panelState {
            case .compact: panelHeight = 140
            case .expanded: panelHeight = 420
            case .results: panelHeight = 620
            case .navigation: panelHeight = 350
            }
        }
        .sheet(isPresented: $showStartPicker) {
            SimpleStationPicker(selectedStation: $startStation, currentLocation: nil) // TODO: pass location
        }
        .sheet(isPresented: $showEndPicker) {
            SimpleStationPicker(selectedStation: $endStation, currentLocation: nil)
        }
    }
    
    // MARK: - Compact View (Bottom Bar style)
    var compactView: some View {
        HStack(spacing: 16) {
            // Search Bar Look-alike
            Button(action: {
                withAnimation(.spring()) {
                    panelState = .expanded
                }
            }) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    Text("Rechercher un itinéraire")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding()
            }
            .buttonStyle(.glass)
            
            // Profile or Settings button (optional)
            Button(action: {}) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .buttonStyle(.glass)
        }
        .padding(.horizontal)
        .padding(.bottom, 30) // Safe area
    }
    
    // MARK: - Expanded View (Full Input)
    var expandedView: some View {
        VStack(spacing: 20) {
            // Title
            HStack {
                Text("Itinéraire")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        panelState = .compact
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .buttonStyle(.glass)
            }
            .padding(.horizontal)
            
            // Station Inputs — grouped glass card
            VStack(spacing: 0) {
                // From
                HStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundColor(.blue)
                        .frame(width: 24)
                    
                    Button(action: { showStartPicker = true }) {
                        Text(startStation?.name ?? "Ma position")
                            .foregroundColor(startStation == nil ? .blue : .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Button(action: onCurrentLocation) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                Divider().padding(.leading, 40)
                
                // To
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 24)
                    
                    Button(action: { showEndPicker = true }) {
                        Text(endStation?.name ?? "Destination")
                            .foregroundColor(endStation == nil ? .gray : .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
            }
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .overlay(
                 // Swap Button
                 Button(action: onSwap) {
                     Image(systemName: "arrow.up.arrow.down.circle.fill")
                         .font(.title2)
                         .foregroundColor(.blue)
                         .background(Circle().fill(.white))
                 }
                 .offset(x: 0, y: 0) // Exact center needs geometry reader or specific offset logic, keep simple for now
                 .padding(.trailing, 20)
                 , alignment: .trailing
            )
            
            // Options (Date, Filters)
            HStack {
                Button(action: { withAnimation { showDatePicker.toggle() } }) {
                    HStack {
                        Image(systemName: "clock.fill")
                        Text(isArrivalTime ? "Arrivée" : "Départ")
                        Text(formatDate(departureDate))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                }
                .buttonStyle(.glass)
                .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.horizontal)
            
            if showDatePicker {
                DatePicker("", selection: $departureDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.graphical)
                    .padding(.horizontal)
            }
            
            // Search Button
            Button(action: onSearch) {
                Text("Rechercher")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.glass)
            .padding(.horizontal)
            .padding(.bottom, 30) // Safe area
            .disabled(endStation == nil)
            .opacity(endStation == nil ? 0.6 : 1.0)
        }
    }
    
    // MARK: - Results View
    var resultsView: some View {
        VStack(spacing: 0) {
            // Header with summaries (Start -> End)
            HStack {
                Button(action: { 
                    withAnimation { panelState = .expanded }
                }) {
                    HStack {
                         Image(systemName: "chevron.left")
                         Text("Modifier")
                    }
                }
                Spacer()
                Text("Itinéraires")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(.regularMaterial)
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(journeys) { journey in
                          VStack(spacing: 0) {
                              JourneyCard(journey: journey, isSelected: selectedJourney?.id == journey.id)
                                 .onTapGesture {
                                     withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                         if selectedJourney?.id == journey.id {
                                             selectedJourney = nil
                                         } else {
                                             selectedJourney = journey
                                         }
                                     }
                                 }
                              
                              if selectedJourney?.id == journey.id {
                                  // Inline steps timeline
                                  VStack(alignment: .leading, spacing: 16) {
                                      Divider()
                                          .padding(.horizontal)
                                          .padding(.vertical, 8)
                                          
                                      if let sections = journey.sections {
                                          VStack(alignment: .leading, spacing: 0) {
                                              ForEach(Array(sections.enumerated()), id: \.element.id) { index, section in
                                                  PanelSectionDetailView(
                                                      section: section,
                                                      isLast: index == sections.count - 1,
                                                      focusedSectionId: $focusedSectionId
                                                  )
                                              }
                                          }
                                          .padding(.horizontal)
                                      }
                                      
                                      Button(action: onStartNavigation) {
                                          Text("Démarrer la navigation")
                                              .fontWeight(.bold)
                                              .foregroundColor(.green)
                                              .frame(maxWidth: .infinity)
                                              .padding()
                                      }
                                      .buttonStyle(.glass)
                                      .padding(.horizontal)
                                      .padding(.top, 8)
                                  }
                                  .transition(.opacity.combined(with: .move(edge: .top)))
                              }
                          }
                          .padding(.vertical, 4)
                     }
                 }
                 .padding(.vertical)
             }
         }
     }
     
     private func formatDate(_ date: Date) -> String {
         let formatter = DateFormatter()
         formatter.timeStyle = .short
         if Calendar.current.isDateInToday(date) {
             return "Maintenant"
         }
         formatter.dateStyle = .short
         return formatter.string(from: date)
     }
}

// MARK: - Detailed Inline Steps View for bottom panel
struct PanelSectionDetailView: View {
    let section: ItinerarySection
    let isLast: Bool
    @Binding var focusedSectionId: String?
    @State private var isStopsExpanded = false

    var body: some View {
        let isFocused = focusedSectionId == section.id
        
        HStack(alignment: .top, spacing: 12) {
            // Timeline line & dot
            VStack(spacing: 0) {
                Circle()
                    .fill(circleColor)
                    .frame(width: 12, height: 12)
                    .scaleEffect(isFocused ? 1.3 : 1.0)
                    .shadow(color: circleColor.opacity(0.5), radius: isFocused ? 4 : 0)

                if !isLast {
                    Rectangle()
                        .fill(lineColor)
                        .frame(width: 3)
                        .padding(.vertical, 4)
                }
            }

            // Timeline Content
            VStack(alignment: .leading, spacing: 8) {
                if section.type == "public_transport" {
                    if let display = section.display_informations {
                        HStack(spacing: 8) {
                            // Line badge/icon
                            LineIcon(
                                type: mapType(display.commercial_mode),
                                lineId: display.code ?? display.label ?? "?",
                                size: 24
                            )

                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(display.commercial_mode ?? "Transport") \(display.label ?? "")")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.primary)

                                if let direction = display.direction {
                                    Text("direction \(direction)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }

                        // Station name and times
                        VStack(alignment: .leading, spacing: 6) {
                            if let from = section.from?.name {
                                HStack {
                                    Text(formatTime(section.departure_date_time ?? ""))
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.secondary)
                                    Text(from)
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.primary)
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
                                .padding(.vertical, 4)

                                if isStopsExpanded {
                                    VerticalItineraryStopsView(section: section)
                                        .padding(.leading, 8)
                                        .transition(.opacity.combined(with: .move(edge: .top)))
                                }
                            }

                            if let to = section.to?.name {
                                HStack {
                                    Text(formatTime(section.arrival_date_time ?? ""))
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.secondary)
                                    Text(to)
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(.leading, 8)
                    }
                } else if section.type == "street_network" || section.mode == "walking" {
                    // Walking leg
                    HStack(spacing: 8) {
                        Image(systemName: "figure.walk")
                            .foregroundColor(.blue)
                            .font(.system(size: 14, weight: .bold))

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Marcher vers \(section.to?.name ?? "votre destination")")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.primary)

                            if let duration = section.duration {
                                Text("\(duration / 60) min")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                } else if section.type == "transfer" {
                    // Transfer walk
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.orange)
                            .font(.system(size: 14, weight: .bold))

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Correspondance")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.primary)

                            if let duration = section.duration {
                                Text("\(duration / 60) min dans la station")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                } else if section.type == "waiting" {
                    // Waiting for transit
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)

                        Text("Attente \((section.duration ?? 0) / 60) min")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.bottom, isLast ? 0 : 16)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                if focusedSectionId == section.id {
                    focusedSectionId = nil // deselect to zoom out
                } else {
                    focusedSectionId = section.id // select section to zoom in
                }
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isFocused ? Color.blue.opacity(0.06) : Color.clear)
        )
    }

    var circleColor: Color {
        if section.type == "public_transport" {
            return Color(hex: section.display_informations?.color ?? "CCCCCC") ?? .blue
        } else if section.mode == "walking" || section.type == "street_network" {
            return .blue
        } else if section.type == "transfer" {
            return .orange
        } else {
            return .gray
        }
    }

    var lineColor: Color {
        circleColor.opacity(0.4)
    }

    func mapType(_ mode: String?) -> TransportType {
        guard let mode = mode?.lowercased() else { return .bus }
        if mode.contains("rer") { return .rer }
        if mode.contains("metro") { return .metro }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") { return .transilien }
        return .bus
    }

    func formatTime(_ isoDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = dateFormatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            return timeFormatter.string(from: date)
        }
        return isoDate
    }
}
