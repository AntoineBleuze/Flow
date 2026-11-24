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
        GeometryReader { mapGeo in
            ZStack(alignment: .bottomTrailing) {
                MapViewControllerBridge(
                    data: data,
                    selectedStation: selectedStationBinding,
                    userTrackingMode: $coordinator.userTrackingMode,
                    recenterTrigger: coordinator.recenterTrigger,
                    journey: navigationManager.isNavigating ? navigationManager.currentJourney : (coordinator.previewJourney ?? selectedJourney),
                    focusedLinePreview: coordinator.focusedLinePreview,
                    focusedSectionId: coordinator.focusedSectionId,
                    sheetHeight: coordinator.sheetHeight,
                    sheetDetent: coordinator.exploreSheetDetent,
                    useMainMap: showControls,
                    showAnnotations: showControls
                )
                .ignoresSafeArea()

                if showControls, let linePreview = coordinator.focusedLinePreview {
                    VStack {
                        HStack(spacing: 10) {
                            LineBadge(
                                line: StationLine(name: linePreview.lineName, type: linePreview.type),
                                mini: false,
                                customSize: 26
                            )
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Ligne \(linePreview.lineName)")
                                    .font(.system(.subheadline, design: .rounded).weight(.bold))
                                    .foregroundColor(.primary)
                                Text("\(linePreview.stops.count) arrêts")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Button(action: {
                                coordinator.clearLinePreview()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.secondary)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .glassEffect(.regular.interactive(), in: Capsule())
                        .shadow(color: Color.black.opacity(0.22), radius: 8, y: 4)
                        .padding(.top, 58)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(20)
                }
                
                if showControls {
                    let toolbarMetrics = mapToolbarMetrics(for: mapGeo.size)
                    // Contrôles flottants alignés avec le haut de la sheet (et boussole au-dessus lors d'une rotation)
                    mapControlToolbar
                        .padding(.trailing, toolbarMetrics.trailing)
                        .padding(.bottom, toolbarMetrics.bottom)
                        .opacity(toolbarMetrics.isHidden ? 0 : 1)
                        .allowsHitTesting(!toolbarMetrics.isHidden)
                        .animation(.spring(response: 0.32, dampingFraction: 0.84), value: toolbarMetrics.bottom)
                        .animation(.easeInOut(duration: 0.2), value: toolbarMetrics.isHidden)
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

    private func mapToolbarMetrics(for mapSize: CGSize) -> (trailing: CGFloat, bottom: CGFloat, isHidden: Bool) {
        switch duoPosture {
        case .unfoldedDualScreen:
            return (trailing: 24, bottom: 24, isHidden: false)
        case .foldedSingleScreen:
            let fallbackHeight: CGFloat = {
                switch coordinator.exploreSheetDetent {
                case NavigationCoordinator.collapsedSheetDetent: return 118
                case NavigationCoordinator.compactRouteSheetDetent: return 250
                default: return 420
                }
            }()
            let currentSheetHeight = coordinator.sheetHeight > 0 ? coordinator.sheetHeight : fallbackHeight
            let isLarge = coordinator.exploreSheetDetent == .large || (mapSize.height > 0 && currentSheetHeight > mapSize.height * 0.65)
            return (trailing: 16, bottom: currentSheetHeight + 20, isHidden: isLarge)
        }
    }

    private var isMapRotated: Bool {
        let normalized = coordinator.mapHeading.truncatingRemainder(dividingBy: 360)
        let positive = normalized < 0 ? normalized + 360 : normalized
        return positive > 1.5 && positive < 358.5
    }

    // 1. Boussole (au-dessus) + Contrôles flottants verticaux alignés avec la sheet
    private var mapControlToolbar: some View {
        GlassEffectContainer(spacing: 10) {
            VStack(spacing: 10) {
                if isMapRotated {
                    Button(action: {
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        #endif
                        coordinator.resetMapHeading()
                    }) {
                        VStack(spacing: -2) {
                            Image(systemName: "arrowtriangle.up.fill")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.red)
                            Image(systemName: "arrowtriangle.down.fill")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.primary.opacity(0.45))
                        }
                        .rotationEffect(.degrees(-coordinator.mapHeading))
                        .frame(width: 44, height: 44)
                        .contentShape(Circle())
                    }
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: Circle())
                    .accessibilityLabel("Réorienter la carte vers le nord")
                    .transition(.scale(scale: 0.7).combined(with: .opacity))
                }

                VStack(spacing: 0) {
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
            .animation(.spring(response: 0.3, dampingFraction: 0.78), value: isMapRotated)
        }
    }
}
