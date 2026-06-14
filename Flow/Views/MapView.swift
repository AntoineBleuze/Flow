import MapKit
import SwiftUI
import Combine


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

    private var selectedStationBinding: Binding<MapStation?> {
        Binding(
            get: { coordinator.selectedStation },
            set: { coordinator.selectedStation = $0 }
        )
    }
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme

    @EnvironmentObject var coordinator: NavigationCoordinator
    @State private var visibleRegion: MKCoordinateRegion?
    
    // MARK: - Itinerary State
    @State private var startStation: MapStation?
    @State private var endStation: MapStation?
    @State private var departureDate = Date()
    @State private var isArrivalTime = false
    @State private var searchResults: [Journey] = []
    @State private var selectedJourney: Journey?
    @State private var itineraryPanelState: ItineraryPanelState = .compact
    @State private var isNavigatingImmersive = false
    
    // iPad panel resize state
    @State private var iPadPanelHeight: CGFloat = 600
    @GestureState private var iPadPanelDragOffset: CGFloat = 0
    
    var showControls: Bool = true

    var body: some View {
        GlassEffectContainer {
            ZStack {
                MapViewControllerBridge(
                    data: data,
                    selectedStation: selectedStationBinding,
                    userTrackingMode: $coordinator.userTrackingMode,
                    recenterTrigger: coordinator.recenterTrigger,
                    journey: navigationManager.isNavigating ? navigationManager.currentJourney : selectedJourney,
                    useMainMap: showControls,
                    showAnnotations: showControls
                )
                .ignoresSafeArea()
                
                if showControls && !navigationManager.isNavigating {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack(spacing: 12) {
                                // Recenter Button
                                Button(action: {
                                    coordinator.recenterMap()
                                }) {
                                    Image(systemName: coordinator.userTrackingModeImageName)
                                        .font(.title3)
                                        .foregroundColor(coordinator.userTrackingMode == .none ? .primary : .blue)
                                        .frame(width: 44, height: 44)
                                }
                                .buttonStyle(.plain)
                                .glassEffect(.regular.interactive(), in: .circle)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
                                
                                // Transport Filter Button
                                Menu {
                                    ForEach(["Métro", "RER / Train", "Tram", "Bus"], id: \.self) { category in
                                        Button(action: {
                                            if data.activeCategories.contains(category) {
                                                data.activeCategories.remove(category)
                                            } else {
                                                data.activeCategories.insert(category)
                                            }
                                        }) {
                                            HStack {
                                                Text(category)
                                                if data.activeCategories.contains(category) {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    Image(systemName: data.activeCategories.count < 4 ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                                        .font(.title3)
                                        .foregroundColor(data.activeCategories.count < 4 ? .blue : .primary)
                                        .frame(width: 44, height: 44)
                                }
                                .buttonStyle(.plain)
                                .glassEffect(.regular.interactive(), in: .circle)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
                            }
                            .padding(.trailing, 16)
                            .padding(.bottom, 16)
                        }
                    }
                    .zIndex(15)
                }
                
                // Immersive Navigation View
                // Immersive Navigation View
                if navigationManager.isNavigating, let journey = navigationManager.currentJourney {
                    ImmersiveNavigationView(
                        journey: journey,
                        navigationMode: $navigationManager.isNavigating,
                        userTrackingMode: $coordinator.userTrackingMode
                    )
                    .zIndex(20)
                    .transition(.move(edge: .bottom))
                }



                // iPad: Station detail panel at bottom-left (resizable)
                if horizontalSizeClass == .regular, let station = coordinator.selectedStation {
                    GeometryReader { geometry in
                        let maxAvailableHeight = geometry.size.height - 96
                        VStack {
                            Spacer()
                            HStack(alignment: .bottom) {
                                VStack(spacing: 0) {
                                    // Drag handle at top for resizing
                                    Capsule()
                                        .fill(Color.secondary.opacity(0.5))
                                        .frame(width: 40, height: 5)
                                        .padding(.top, 8)
                                        .padding(.bottom, 4)
                                        .frame(maxWidth: .infinity)
                                        .contentShape(Rectangle().size(width: 120, height: 40))
                                        .gesture(
                                            DragGesture()
                                                .updating($iPadPanelDragOffset) { value, state, _ in
                                                    state = value.translation.height
                                                }
                                                .onEnded { value in
                                                    let newHeight = iPadPanelHeight - value.translation.height
                                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                                        iPadPanelHeight = min(maxAvailableHeight, max(350, newHeight))
                                                    }
                                                }
                                        )

                                    StationDetailSheet(
                                        station: station,
                                        onDismiss: {
                                             withAnimation(.easeInOut(duration: 0.3)) {
                                                 coordinator.selectedStation = nil
                                             }
                                        }
                                    )
                                }
                                .frame(width: 380, height: min(maxAvailableHeight, max(350, iPadPanelHeight - iPadPanelDragOffset)))
                                .background(colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 5)
                                .padding(.leading, 16)
                                .padding(.bottom, 16)
                                .transition(.move(edge: .leading).combined(with: .opacity))
                                Spacer()
                            }
                        }
                    }
                    .zIndex(10)
                }
            }
        }
        // iPhone: keep classic sheet behavior (iPad uses inline panel above)
        .sheet(item: Binding(
            get: { horizontalSizeClass == .regular ? nil : coordinator.selectedStation },
            set: { coordinator.selectedStation = $0 }
        )) { station in
            StationDetailSheet(station: station)
                .presentationDetents([.medium, .large])
        }
        .onAppear {
            LocationManager.shared.requestLocation()
        }
        // Deselect map marker when panel closes
        .onChange(of: coordinator.selectedStation?.id) { oldId, newId in
            if newId == nil, oldId != nil {
                let mapView = SharedMapView.main.mapView
                for annotation in mapView.selectedAnnotations {
                    mapView.deselectAnnotation(annotation, animated: true)
                }
            }
        }
        .onChange(of: data.externalSelection) { _, newStation in
            if let station = newStation {
                withAnimation {
                    // Center roughly on station
                }
                coordinator.selectedStation = station
            }
        }
        // Start Navigation Trigger
        .onChange(of: selectedJourney?.id) { _, newId in
            if newId != nil {
                // Determine if we should auto-start navigation or just show route on map
                // For now, user taps "Start" in the JourneyCard? 
                // Wait, JourneyCard is just display. We need a "Start" button in the results or card details.
                // The Panel shows results. Tapping a card selects it.
                // We should add a "Start Navigation" button in the Panel when a journey is selected.
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
