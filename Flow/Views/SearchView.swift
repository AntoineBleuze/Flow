import SwiftUI
import CoreLocation

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = SearchViewModel()
    @State private var internalSelectedStation: Station? // For navigation when not in picker mode
    @State private var showItinerary = false
    
    // Picker Mode
    @Binding var selection: Station?
    var isPicker: Bool = false
    
    // Optional: Pass current location if available
    var currentLocation: CLLocationCoordinate2D?
    var initialDestination: Station?
    
    init(currentLocation: CLLocationCoordinate2D? = nil, initialDestination: Station? = nil, selection: Binding<Station?> = .constant(nil), isPicker: Bool = false) {
        self.currentLocation = currentLocation
        self.initialDestination = initialDestination
        self._selection = selection
        self.isPicker = isPicker
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Rechercher une station...", text: $viewModel.searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                    if !viewModel.searchText.isEmpty {
                        Button(action: { viewModel.searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                
                // Results List
                List {
                    // "Ma position" option
                    if let location = currentLocation, initialDestination == nil {
                        Button(action: {
                            let myPosStation = viewModel.getMyPositionStation(location: location)
                            if isPicker {
                                self.selection = myPosStation
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                self.internalSelectedStation = myPosStation
                                self.showItinerary = true
                            }
                        }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                                Text("Ma position")
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    ForEach(viewModel.searchResults) { station in
                    Button(action: {
                        if isPicker {
                            self.selection = station
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            self.internalSelectedStation = station
                            self.showItinerary = true
                        }
                    }) {
                        HStack {
                            Image(systemName: iconName(for: station.mainType))
                                .foregroundColor(color(for: station.mainType))
                            VStack(alignment: .leading) {
                                Text(station.name)
                                    .font(.headline)
                                // We could add city name here if available in Station model
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    }
                }
                .listStyle(PlainListStyle())
                
                NavigationLink(destination: ItineraryResultView(destination: internalSelectedStation, currentLocation: currentLocation), isActive: $showItinerary) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Itinéraire", displayMode: .inline)
            .navigationBarItems(trailing: Button("Fermer") {
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let initial = initialDestination, internalSelectedStation == nil && !isPicker {
                    self.internalSelectedStation = initial
                    self.showItinerary = true
                }
            }
        }
    }
    
    func iconName(for type: TransportType) -> String {
        switch type {
        case .metro: return "tram.fill" // SF Symbol approximation
        case .rer: return "tram.circle.fill"
        case .transilien: return "train.side.front.car"
        case .tram: return "tram"
        case .bus: return "bus"
        case .train: return "train.side.front.car"
        }
    }
    
    func color(for type: TransportType) -> Color {
        switch type {
        case .metro: return .blue
        case .rer: return .red
        case .transilien: return .green
        case .tram: return .purple
        case .bus: return .orange
        case .train: return .green
        }
    }
}
