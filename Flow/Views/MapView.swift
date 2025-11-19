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
    @State private var zoomLevel: Double = 0.08 // Initialisé avec le span par défaut
    
    @ObservedObject var data = MapDataService.shared
    
    @State private var selectedStation: Station?
    
    var body: some View {
        ZStack {
            MapViewControllerBridge(data: data, selectedStation: $selectedStation)
                .ignoresSafeArea()
            
            // Optional: Add custom controls on top if needed
        }
        .sheet(item: $selectedStation) { station in
            StationDetailSheet(station: station)
                .presentationDetents([.medium, .large])
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
