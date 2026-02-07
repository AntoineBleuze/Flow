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
    
    @Binding var panelState: ItineraryPanelState
    var onSearch: () -> Void
    var onSwap: () -> Void
    var onCurrentLocation: () -> Void
    var onStartNavigation: () -> Void // Closure to trigger navigation start
    
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    @State private var showDatePicker = false
    
    // Animation properties
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0) {
            // Drag Handle
            Capsule()
                .fill(Color.secondary.opacity(0.5))
                .frame(width: 40, height: 5)
                .padding(.top, 8)
                .padding(.bottom, 12)
            
            if panelState == .compact {
                compactView
            } else if panelState == .expanded {
                expandedView
            } else if panelState == .results {
                resultsView
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.regularMaterial)
                .shadow(color: .black.opacity(0.1), radius: 10, y: -5)
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
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            
            // Profile or Settings button (optional)
            Button(action: {}) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
                    .foregroundColor(.blue)
            }
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
            }
            .padding(.horizontal)
            
            // Station Inputs
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
                .background(Color(.systemGray6))
                
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
                .background(Color(.systemGray6))
            }
            .cornerRadius(12)
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
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
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
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 12))
            }
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
                         VStack {
                             JourneyCard(journey: journey, isSelected: selectedJourney?.id == journey.id)
                                .onTapGesture {
                                    withAnimation {
                                        selectedJourney = journey
                                    }
                                }
                             
                             if selectedJourney?.id == journey.id {
                                 Button(action: onStartNavigation) {
                                     Text("Démarrer la navigation")
                                         .fontWeight(.bold)
                                         .foregroundColor(.white)
                                         .frame(maxWidth: .infinity)
                                         .padding()
                                         .background(Color.green)
                                         .cornerRadius(12)
                                 }
                                 .padding(.horizontal)
                                 .transition(.scale)
                             }
                         }
                    }
                }
                .padding(.vertical)
            }
        }
        .frame(maxHeight: 500) // Limit height or let it expand
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
