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

    @State private var selectedStation: MapStation?
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @State private var visibleRegion: MKCoordinateRegion?
    @State private var userTrackingMode: MKUserTrackingMode = .none
    
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
    @State private var iPadPanelHeight: CGFloat = 500
    @GestureState private var iPadPanelDragOffset: CGFloat = 0
    
    @State private var cancellables = Set<AnyCancellable>()

    var showControls: Bool = true

    var body: some View {
        ZStack {
            MapViewControllerBridge(
                data: data,
                selectedStation: $selectedStation,
                userTrackingMode: $userTrackingMode,
                journey: navigationManager.isNavigating ? navigationManager.currentJourney : selectedJourney,
                useMainMap: showControls,
                showAnnotations: showControls
            )
            .ignoresSafeArea()
            
            // ItinerarySearchPanel removed. Integrated into SearchTabContent.
            
            // Immersive Navigation View
            // Immersive Navigation View
            if navigationManager.isNavigating, let journey = navigationManager.currentJourney {
                ImmersiveNavigationView(
                    journey: journey,
                    navigationMode: $navigationManager.isNavigating,
                    userTrackingMode: $userTrackingMode
                )
                .zIndex(20)
                .transition(.move(edge: .bottom))
            }

            // Controls Layer (Recenter Button)
            if showControls && !isNavigatingImmersive {
                VStack(spacing: 0) {
                    Spacer()

                    // Recenter Button (Bottom Right)
                    HStack {
                        Spacer()

                        Button(action: {
                            cycleUserTrackingMode()
                        }) {
                            Image(systemName: userTrackingModeImageName)
                                .font(.title2)
                                .foregroundColor(userTrackingMode == .none ? .primary : .blue)
                                .padding(14)
                                .background(.clear)
                                .glassEffect(.regular.interactive(), in: .circle)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.bottom, 16)
                }
            }

            // iPad: Station detail panel at bottom-left (resizable)
            if horizontalSizeClass == .regular, let station = selectedStation {
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
                                                iPadPanelHeight = min(700, max(350, newHeight))
                                            }
                                        }
                                )

                            StationDetailSheet(
                                station: station,
                                onDismiss: {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        selectedStation = nil
                                    }
                                }
                            )
                        }
                        .frame(width: 380, height: min(700, max(350, iPadPanelHeight - iPadPanelDragOffset)))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 5)
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                        Spacer()
                    }
                }
                .zIndex(10)
            }
        }
        // iPhone: keep classic sheet behavior (iPad uses inline panel above)
        .sheet(item: Binding(
            get: { horizontalSizeClass == .regular ? nil : selectedStation },
            set: { selectedStation = $0 }
        )) { station in
            StationDetailSheet(station: station)
                .presentationDetents([.medium, .large])
        }
        .onAppear {
            LocationManager.shared.requestLocation()
        }
        // Deselect map marker when panel closes
        .onChange(of: selectedStation?.id) { oldId, newId in
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
                selectedStation = station
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

    private var userTrackingModeImageName: String {
        switch userTrackingMode {
        case .none: return "location"
        case .follow: return "location.fill"
        case .followWithHeading: return "location.north.line.fill"
        @unknown default: return "location"
        }
    }

    private func cycleUserTrackingMode() {
        switch userTrackingMode {
        case .none:
            userTrackingMode = .follow
        case .follow:
            userTrackingMode = .followWithHeading
        case .followWithHeading:
            userTrackingMode = .none
        @unknown default:
            userTrackingMode = .none
        }
    }
    
    private func performSearch() {
        guard let start = startStation, let end = endStation else { return }
        
        // Ensure start coordinate is valid or use user location
        // ... (simplified logic)
        
        IDFMItineraryService.shared.searchItinerary(
            from: start.coordinate,
            to: end,
            date: departureDate,
            isArrival: isArrivalTime
        )
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { _ in }, receiveValue: { results in
            self.searchResults = results
            withAnimation {
                self.itineraryPanelState = .results
            }
        })
        .store(in: &cancellables)
    }
}

#if DEBUG
    struct AppMapView_Previews: PreviewProvider {
        static var previews: some View {
            AppMapView()
        }
    }
#endif
