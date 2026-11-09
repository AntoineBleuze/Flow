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
    @Environment(\.duoPosture) private var duoPosture

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
    @State private var sheetDetent: PresentationDetent = .medium
    @State private var navigationSheetDetent: PresentationDetent = .fraction(0.18)
    @State private var showAIAssistant: Bool = false
    @StateObject private var voiceManager = VoiceDictationManager.shared
    @State private var aiInputPrompt: String = ""
    @FocusState private var isAIFocused: Bool
    @State private var isAISubmitting: Bool = false
    @State private var aiSpeechTip: String? = nil
    
    // iPad panel resize state
    @State private var iPadPanelHeight: CGFloat = 600
    @GestureState private var iPadPanelDragOffset: CGFloat = 0
    
    var showControls: Bool = true

    var body: some View {
        ZStack(alignment: .topTrailing) {
            MapViewControllerBridge(
                data: data,
                selectedStation: selectedStationBinding,
                userTrackingMode: $coordinator.userTrackingMode,
                recenterTrigger: coordinator.recenterTrigger,
                journey: navigationManager.isNavigating ? navigationManager.currentJourney : (coordinator.previewJourney ?? selectedJourney),
                focusedSectionId: coordinator.focusedSectionId,
                useMainMap: showControls,
                showAnnotations: showControls
            )
            .ignoresSafeArea()
            
            if showControls {
                // Contrôles flottants en haut à droite (Carte, Filtres & Localisation)
                // Regroupés dans un GlassEffectContainer pour unifier l'échantillonnage optique (Style Localiser iOS 26)
                mapControlToolbar
                    .padding(.top, 58)
                    .padding(.trailing, duoPosture == .unfoldedDualScreen ? 24 : 16)
                    .zIndex(15)
            }

            // iPad: Station detail panel at bottom-left (resizable) - only when not in Duo dual-screen mode
            if duoPosture != .unfoldedDualScreen && UIDevice.current.userInterfaceIdiom == .pad, let station = coordinator.selectedStation {
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
        .ignoresSafeArea(.container, edges: .bottom)
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
            if newId != nil {
                sheetDetent = .medium
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
            }
        }
        .onChange(of: navigationManager.isNavigating) { _, isNavigating in
            if isNavigating {
                navigationSheetDetent = .fraction(0.18)
            }
        }
        .onAppear {
            if data.allStations.isEmpty {
                data.loadData()
            }
        }
    }

    // MARK: - Liquid Glass Map Subviews

    // 1. Contrôles flottants verticaux en haut à droite (Style Localiser iOS 26)
    private var mapControlToolbar: some View {
        GlassEffectContainer(spacing: 12) {
            VStack(spacing: 0) {
                // Polyline Style Selector Menu (Mode cartographique)
                Menu {
                    ForEach(MapPolylineStyle.allCases) { style in
                        Button(action: {
                            data.polylineStyle = style
                        }) {
                            HStack {
                                Text(style.rawValue)
                                if data.polylineStyle == style {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                } label: {
                    Image(systemName: data.polylineStyle.systemImageName)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(data.polylineStyle != .classic ? Color.blue : Color.primary)
                        .frame(width: 44, height: 46)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Divider()
                    .frame(width: 28)

                // Transport Category Filter Menu
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
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(data.activeCategories.count < 4 ? Color.blue : Color.primary)
                        .frame(width: 44, height: 46)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Divider()
                    .frame(width: 28)

                // Recenter / Location Button
                Button(action: {
                    coordinator.recenterMap()
                }) {
                    Image(systemName: coordinator.userTrackingModeImageName)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(coordinator.userTrackingMode == .none ? Color.primary : Color.blue)
                        .frame(width: 44, height: 46)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
            .foregroundStyle(.primary)
            .glassEffect(.regular.interactive(), in: .capsule)
        }
    }
}
