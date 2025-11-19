import SwiftUI
import CoreLocation
import Combine

struct SearchView: View {
    @StateObject private var itineraryService = IDFMItineraryService()
    @StateObject private var locationManager = LocationManager()
    
    @State private var searchText = ""
    @State private var searchMode: SearchMode = .station
    @State private var itineraries: [Journey] = []
    @State private var isSearching = false
    @State private var errorMessage: String?
    
    // For station search (mock or existing logic)
    // Assuming we have a way to search stations. For now, I'll focus on Itinerary UI structure.
    // The user asked to integrate itinerary in the search page.
    
    enum SearchMode {
        case station
        case itinerary
    }
    
    var body: some View {
        VStack {
            Picker("Mode", selection: $searchMode) {
                Text("Stations").tag(SearchMode.station)
                Text("Itinéraire").tag(SearchMode.itinerary)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if searchMode == .station {
                // Existing station search logic (simplified)
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("Station, ligne...", text: $searchText)
                }
                .padding(10)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Text("Recherche de stations (à implémenter/connecter)")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                // Itinerary Search
                VStack(spacing: 15) {
                    if let location = locationManager.userLocation {
                        HStack {
                            Image(systemName: "location.fill").foregroundColor(.blue)
                            Text("Ma position")
                            Spacer()
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    } else {
                        Button("Activer la localisation") {
                            locationManager.requestLocation()
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    }
                    
                    HStack {
                        Image(systemName: "flag.fill").foregroundColor(.red)
                        TextField("Destination (Station)...", text: $searchText)
                    }
                    .padding(10)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    Button(action: searchItinerary) {
                        if isSearching {
                            ProgressView()
                        } else {
                            Text("Rechercher l'itinéraire")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .disabled(searchText.isEmpty || locationManager.userLocation == nil)
                }
                .padding()
                
                List(itineraries) { journey in
                    ItineraryRow(journey: journey)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Recherche")
        .onAppear {
            locationManager.requestLocation()
        }
        .onReceive(NotificationCenter.default.publisher(for: .triggerItinerary)) { notification in
            if let station = notification.object as? Station {
                self.searchMode = .itinerary
                self.searchText = station.name
                // Trigger search directly
                if let userLoc = locationManager.userLocation {
                    self.isSearching = true
                    itineraryService.searchItinerary(from: userLoc, to: station)
                        .sink(receiveCompletion: { completion in
                            isSearching = false
                            if case .failure(let error) = completion {
                                self.errorMessage = error.localizedDescription
                            }
                        }, receiveValue: { journeys in
                            self.itineraries = journeys
                        })
                        .store(in: &cancellables)
                } else {
                    // If location not yet available, just set text and mode, user will click search or we wait for location
                    locationManager.requestLocation()
                }
            }
        }
    }
    
    func searchItinerary() {
        guard let userLoc = locationManager.userLocation else { return }
        isSearching = true
        errorMessage = nil
        
        // Mock destination station for now as we don't have a full search-station-by-name API ready in this context
        // In a real app, we would search for a station, get its ID/Coords, then call itinerary.
        // Here, I'll create a dummy station with the name provided, but I need coords.
        // For the purpose of this task, maybe I should use the MapDataService to find a station by name?
        
        // Let's try to find a station in MapDataService
        let stations = MapDataService.shared.stations
        if let station = stations.first(where: { $0.name.localizedCaseInsensitiveContains(searchText) }) {
            itineraryService.searchItinerary(from: userLoc, to: station)
                .sink(receiveCompletion: { completion in
                    isSearching = false
                    if case .failure(let error) = completion {
                        self.errorMessage = error.localizedDescription
                    }
                }, receiveValue: { journeys in
                    self.itineraries = journeys
                })
                .store(in: &cancellables)
        } else {
            isSearching = false
            errorMessage = "Station introuvable"
        }
    }
    
    @State private var cancellables = Set<AnyCancellable>()
}

struct ItineraryRow: View {
    let journey: Journey
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(formatTime(journey.departure_date_time))
                Image(systemName: "arrow.right")
                Text(formatTime(journey.arrival_date_time))
                Spacer()
                Text("\(journey.duration / 60) min")
                    .bold()
            }
            .font(.headline)
            
            HStack {
                Text("\(journey.nb_transfers) correspondances")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 5)
    }
    
    func formatTime(_ dateStr: String) -> String {
        // IDFM format: YYYYMMDDTHHMMSS
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: dateStr) {
            let printFormatter = DateFormatter()
            printFormatter.dateFormat = "HH:mm"
            return printFormatter.string(from: date)
        }
        return dateStr
    }
}
