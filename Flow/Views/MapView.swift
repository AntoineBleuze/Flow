import MapKit
import SwiftUI

struct AppMapView: View {
    // 1. Définition de la région par défaut (Paris)
    static let defaultRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
    )

    // 2. Initialisation sécurisée de la position
    @State private var position: MapCameraPosition = .region(AppMapView.defaultRegion)

    @ObservedObject var data = MapDataService.shared
    @ObservedObject var navigationManager = NavigationManager.shared

    @State private var selectedStation: MapStation?

    @State private var visibleRegion: MKCoordinateRegion?
    @State private var followUserLocation = false
    @State private var showNavigationSteps = false  // For NavigationStepsPanel expansion

    var showControls: Bool = true

    var body: some View {
        ZStack {
            MapViewControllerBridge(
                data: data,
                selectedStation: $selectedStation,
                followUserLocation: $followUserLocation,
                journey: navigationManager.currentJourney,
                useMainMap: showControls,
                showAnnotations: showControls
            )
            .ignoresSafeArea()

            // Top Controls
            VStack(spacing: 0) {
                if navigationManager.isNavigating {
                    NavigationStepsPanel(showFullSteps: $showNavigationSteps)
                        .padding(.horizontal)
                        .padding(.top, 50)  // Adjust for safe area/notch
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .zIndex(2)  // Ensure it's on top
                }

                Spacer()
            }

            if showControls {
                VStack(spacing: 0) {
                    Spacer()

                    // Recenter Button (Bottom Right)
                    HStack {
                        Spacer()

                        Button(action: {
                            followUserLocation = true
                        }) {
                            Image(systemName: followUserLocation ? "location.fill" : "location")
                                .font(.title2)
                                .foregroundColor(followUserLocation ? .blue : .primary)
                                .padding(14)
                                .background(.clear)
                                .glassEffect(.regular.interactive(), in: .circle)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.bottom, 20)  // Juste au-dessus de la tab bar
                }
            }
        }
        .sheet(item: $selectedStation) { station in
            StationDetailSheet(station: station)
                .presentationDetents([.medium, .large])
        }
        .onAppear {
            LocationManager.shared.requestLocation()
        }
        .onChange(of: data.externalSelection) { _, newStation in
            if let station = newStation {
                // Centrer la carte
                withAnimation {
                    position = .region(
                        MKCoordinateRegion(
                            center: station.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        ))
                }
                // Ouvrir le détail
                selectedStation = station
            }
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
