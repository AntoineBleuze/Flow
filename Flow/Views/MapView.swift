import SwiftUI
import MapKit

struct AppMapView: View {
    // 1. Définition de la région par défaut (Paris)
    static let defaultRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
    )
    
    // 2. Initialisation sécurisée de la position
    @State private var position: MapCameraPosition = .region(AppMapView.defaultRegion)
    
    @ObservedObject var data = MapDataService.shared
    
    @State private var selectedStation: Station?
    @State private var showSearch = false
    @State private var itineraryDestination: Station?
    
    // Pour suivre la caméra et charger les stations
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var followUserLocation = false
    
    var body: some View {
        ZStack {
            MapViewControllerBridge(
                data: data,
                selectedStation: $selectedStation,
                followUserLocation: $followUserLocation
            )
            .ignoresSafeArea()
            
            // Controls Overlay
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        // Bouton de géolocalisation custom
                        Button(action: {
                            followUserLocation = true
                        }) {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .padding(12)
                                .background(Color(UIColor.systemBackground))
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        
                        // Autres contrôles si besoin (Zoom, etc.)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 60) // Marge pour éviter la status bar/navigation bar
                }
                Spacer()
            }
        }
        .sheet(item: $selectedStation) { station in
            StationDetailSheet(station: station)
                .presentationDetents([.medium, .large])
        }
        .sheet(isPresented: $showSearch) {
            SearchView(currentLocation: LocationManager.shared.userLocation, initialDestination: itineraryDestination)
        }
        .onReceive(NotificationCenter.default.publisher(for: .triggerItinerary)) { notification in
            if let station = notification.object as? Station {
                self.itineraryDestination = station
                self.showSearch = true
            }
        }
        .onAppear {
            LocationManager.shared.requestLocation()
        }
    }
}


#if DEBUG
struct AppMapView_Previews: PreviewProvider {
    static var previews: some View {
        AppMapView()
    }
}
#endif
