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
        GlassEffectContainer {
            ZStack {
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
                
                if showControls && !navigationManager.isNavigating {
                    // Bottom Stack: Controls Toolbar on right + Bottom AI Bar or AI Action Card
                    VStack(spacing: 12) {
                        Spacer()

                        // 1. Controls Toolbar on the right
                        HStack {
                            Spacer()
                            mapControlToolbar
                        }
                        .padding(.trailing, duoPosture == .unfoldedDualScreen ? 24 : 16)

                        // 2. Either the AI Journey Action Card (if preview active) or the Bottom AI Voice/Text Input Bar
                        // On iPhone Duo unfolded, the left screen already provides full AI and journey controls
                        if duoPosture != .unfoldedDualScreen {
                            if let journey = coordinator.previewJourney {
                                aiJourneyActionCard(journey: journey)
                                    .frame(maxWidth: horizontalSizeClass == .regular ? 480 : .infinity)
                                    .padding(.horizontal, 16)
                                    .transition(.move(edge: .bottom).combined(with: .opacity))
                            } else {
                                HStack(alignment: .center, spacing: 12) {
                                    if horizontalSizeClass == .regular {
                                        Spacer()
                                    }
                                    bottomAIPillBar
                                        .frame(maxWidth: horizontalSizeClass == .regular ? 480 : .infinity)

                                    // Espace réservé pour le bouton de recherche système (TabView) afin d'aligner parfaitement la barre IA
                                    Color.clear
                                        .frame(width: 50, height: 50)
                                        .allowsHitTesting(false)
                                }
                                .padding(.horizontal, 16)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                            }
                        }
                    }
                    .padding(.bottom, duoPosture == .unfoldedDualScreen ? 24 : 16)
                    .ignoresSafeArea(.container, edges: .bottom)
                    .zIndex(15)
                }
                
                // Panneau de navigation flottant en mode fermé (ne prend pas toute la largeur et ne couvre pas la navbar)
                if showControls && navigationManager.isNavigating && duoPosture != .unfoldedDualScreen,
                   let journey = navigationManager.currentJourney {
                    VStack(spacing: 8) {
                        Spacer()

                        // Bouton de recentrage au-dessus de la carte de guidage
                        HStack {
                            Spacer()
                            Button(action: {
                                coordinator.recenterMap()
                            }) {
                                Image(systemName: coordinator.userTrackingModeImageName)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(coordinator.userTrackingMode == .none ? .primary : .blue)
                                    .frame(width: 44, height: 44)
                            }
                            .buttonStyle(.liquidGlassInteractive)
                            .padding(.trailing, 16)
                        }

                        // Carte de guidage flottante élégante
                        ImmersiveNavigationView(journey: journey, isFloating: true)
                            .frame(maxWidth: horizontalSizeClass == .regular ? 480 : .infinity)
                            .padding(.horizontal, 14)
                            .padding(.bottom, 12)
                    }
                    .zIndex(25)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
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
        }
        .ignoresSafeArea(.container, edges: .bottom)
        // iPhone folded: keep classic sheet behavior (iPad uses inline panel above, Duo unfolded uses left pane)
        .sheet(item: Binding(
            get: {
                guard !navigationManager.isNavigating else { return nil }
                guard duoPosture != .unfoldedDualScreen else { return nil }
                guard UIDevice.current.userInterfaceIdiom != .pad else { return nil }
                return coordinator.selectedStation
            },
            set: { coordinator.selectedStation = $0 }
        )) { station in
            StationDetailSheet(station: station, selectedDetent: $sheetDetent)
                .presentationDetents([.fraction(0.22), .medium, .large], selection: $sheetDetent)
                .liquidGlassSheet()
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
        .sheet(isPresented: $showAIAssistant) {
            if #available(iOS 27.0, *) {
                FlowAssistantView()
                    .environmentObject(coordinator)
                    .presentationDetents([.fraction(0.35), .medium, .large])
                    .liquidGlassSheetBackground()
                    .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.35)))
            }
        }
        .onChange(of: coordinator.showAIAssistant) { _, newVal in
            if newVal {
                showAIAssistant = true
                coordinator.showAIAssistant = false
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

    // 1. Horizontal Liquid Glass Control Toolbar
    private var mapControlToolbar: some View {
        HStack(spacing: 4) {
            // Recenter Button
            Button(action: {
                coordinator.recenterMap()
            }) {
                Image(systemName: coordinator.userTrackingModeImageName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(coordinator.userTrackingMode == .none ? .primary : .blue)
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.liquidGlassInteractive)

            Divider()
                .frame(height: 20)
                .overlay(Color.primary.opacity(0.12))

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
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(data.activeCategories.count < 4 ? .blue : .primary)
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.liquidGlassInteractive)

            Divider()
                .frame(height: 20)
                .overlay(Color.primary.opacity(0.12))

            // Polyline Style Selector Menu
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
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(data.polylineStyle != .classic ? .blue : .primary)
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.liquidGlassInteractive)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background {
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                )
                .overlay(
                    Capsule()
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
                )
        }
        .clipShape(Capsule())
        .glassEffect(.regular.interactive(), in: Capsule())
        .shadow(
            color: colorScheme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.12),
            radius: 10,
            x: 0,
            y: 4
        )
    }

    // MARK: - 2. Bottom Liquid Glass AI Search & Dictation Pill Bar
    private var bottomAIPillBar: some View {
        HStack(spacing: 8) {
            // Flow AI Icon & Full Assistant Modal Trigger
            Button {
                showAIAssistant = true
            } label: {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.purple, Color.blue, Color.cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 38, height: 38)
                        .shadow(color: Color.purple.opacity(0.35), radius: 6, x: 0, y: 2)

                    Image(systemName: "sparkles")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .buttonStyle(.liquidGlassInteractive)

            // Direct Text Input Field
            TextField(
                voiceManager.isRecording ? "Écoute en cours..." : "Où allez-vous ? (ex: Concorde)",
                text: $aiInputPrompt
            )
            .focused($isAIFocused)
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .textFieldStyle(.plain)
            .autocorrectionDisabled()
            .onSubmit {
                submitAIPrompt()
            }
            .frame(maxWidth: .infinity)

            if isAIFocused {
                Button {
                    isAIFocused = false
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.secondary.opacity(0.12))
                            .frame(width: 36, height: 36)

                        Image(systemName: "keyboard.chevron.compact.down")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.secondary)
                    }
                }
                .buttonStyle(.liquidGlassInteractive)
                .transition(.scale.combined(with: .opacity))
            }

            // Voice Dictation Button
            Button {
                voiceManager.toggleRecording(
                    onUpdate: { transcript in
                        aiInputPrompt = transcript
                    },
                    onFinished: { finalTranscript in
                        aiInputPrompt = finalTranscript
                        if !finalTranscript.isEmpty {
                            submitAIPrompt()
                        }
                    }
                )
            } label: {
                ZStack {
                    Circle()
                        .fill(
                            voiceManager.isRecording
                                ? Color.red.opacity(0.2)
                                : Color.secondary.opacity(0.12)
                        )
                        .frame(width: 36, height: 36)

                    Image(systemName: voiceManager.isRecording ? "waveform.circle.fill" : "mic.fill")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(voiceManager.isRecording ? .red : .primary)
                        .symbolEffect(.pulse, isActive: voiceManager.isRecording)
                }
            }
            .buttonStyle(.liquidGlassInteractive)

            // Send / Action Button
            if isAISubmitting {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(0.8)
                    .frame(width: 36, height: 36)
            } else if !aiInputPrompt.isEmpty {
                Button {
                    submitAIPrompt()
                } label: {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [Color.blue, Color(hex: "0055D4")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 36, height: 36)

                        Image(systemName: "arrow.up")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.liquidGlassInteractive)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background {
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                )
                .overlay(
                    Capsule()
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
                )
        }
        .clipShape(Capsule())
        .glassEffect(.regular.interactive(), in: Capsule())
        .shadow(
            color: colorScheme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.1),
            radius: 12,
            x: 0,
            y: 4
        )
    }

    private func submitAIPrompt() {
        let query = aiInputPrompt.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return }

        if voiceManager.isRecording {
            voiceManager.stopRecording()
        }

        isAISubmitting = true

        Task {
            defer {
                Task { @MainActor in
                    isAISubmitting = false
                    aiInputPrompt = ""
                }
            }

            if #available(iOS 27.0, *), FlowAIAvailability.isAvailable {
                do {
                    _ = try await FlowAIService.shared.askAssistant(prompt: query)
                    if coordinator.previewJourney != nil {
                        return
                    }
                } catch {
                    print("⚠️ FlowAIService error: \(error), attempting direct graph router")
                }
            }

            await fallbackDirectSearch(query: query)
        }
    }

    private func fallbackDirectSearch(query: String) async {
        let cleanQuery = query.lowercased()
            .replacingOccurrences(of: "emmène-moi à ", with: "")
            .replacingOccurrences(of: "emmene moi a ", with: "")
            .replacingOccurrences(of: "aller à ", with: "")
            .replacingOccurrences(of: "aller a ", with: "")
            .replacingOccurrences(of: "itinéraire vers ", with: "")
            .replacingOccurrences(of: "direction ", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        let allStations = MapDataService.shared.allStations
        let destination = allStations.first { station in
            station.name.localizedCaseInsensitiveContains(cleanQuery)
        }

        guard let destination = destination else {
            Task { @MainActor in
                showAIAssistant = true
            }
            return
        }

        var start: MapStation? = nil
        if let userLoc = LocationManager.shared.userLocation {
            let uLoc = CLLocation(latitude: userLoc.latitude, longitude: userLoc.longitude)
            start = allStations.min(by: {
                uLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                uLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
            })
        }
        if start == nil || start?.name == destination.name {
            start = allStations.first(where: { $0.name.localizedCaseInsensitiveContains("Bir-Hakeim") }) ?? allStations.first
        }

        if let start = start,
           let route = TransitGraphRouter.shared.findOptimalRoute(from: start, to: destination, allStations: allStations) {
            let journey = TransitGraphRouter.shared.buildJourney(from: route, startCoord: start.coordinate)
            Task { @MainActor in
                coordinator.showItineraryPreview(journey: journey)
            }
        } else {
            Task { @MainActor in
                showAIAssistant = true
            }
        }
    }

    // MARK: - 3. Liquid Glass AI Journey Action Card
    private func aiJourneyActionCard(journey: Journey) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            // Header: Sparkles badge + Close button
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    Text("Aperçu Itinéraire IA")
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background {
                    Capsule()
                        .fill(Color.purple.opacity(0.12))
                }

                Spacer()

                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        coordinator.clearItineraryPreview()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.liquidGlassInteractive)
            }

            // Duration, Transfers & Line Badges
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                let durMin = max(1, (journey.duration ?? 1200) / 60)
                Text("~\(durMin) min")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)

                let transfers = journey.nb_transfers ?? 0
                Text(transfers == 0 ? "Direct" : "\(transfers) corresp.")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)

                Spacer()

                if let sections = journey.sections {
                    HStack(spacing: 4) {
                        ForEach(sections.filter { $0.type == "public_transport" }, id: \.id) { section in
                            if let info = section.display_informations {
                                let label = info.code ?? info.label ?? ""
                                let colorHex = info.color ?? "0078D7"
                                Text(label)
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 3)
                                    .background(Color(hex: colorHex))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
            }

            // Endpoints: From -> To
            if let firstSection = journey.sections?.first(where: { $0.from?.name != nil }),
               let lastSection = journey.sections?.last(where: { $0.to?.name != nil }) {
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 8, height: 8)
                    Text(firstSection.from?.name ?? "Départ")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                        .lineLimit(1)

                    Image(systemName: "arrow.right")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.secondary.opacity(0.6))

                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                    Text(lastSection.to?.name ?? "Arrivée")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                }
            }

            // Start Navigation CTA
            Button {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    coordinator.startNavigationFromPreview()
                }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "location.fill")
                        .font(.system(size: 14, weight: .bold))
                    Text("Démarrer l'itinéraire")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .background {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [Color.blue, Color(hex: "0055D4")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
            }
            .buttonStyle(.liquidGlassInteractive)
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: LiquidGlassTheme.largeCornerRadius, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: LiquidGlassTheme.largeCornerRadius, style: .continuous)
                        .fill(LiquidGlassTheme.cardBackgroundTint(for: colorScheme))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: LiquidGlassTheme.largeCornerRadius, style: .continuous)
                        .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.2)
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: LiquidGlassTheme.largeCornerRadius, style: .continuous))
        .glassEffect(.regular.interactive(), in: RoundedRectangle(cornerRadius: LiquidGlassTheme.largeCornerRadius, style: .continuous))
        .shadow(
            color: colorScheme == .dark ? Color.black.opacity(0.5) : Color.black.opacity(0.12),
            radius: 16,
            x: 0,
            y: 6
        )
    }
}

#Preview("Map View") {
    AppMapView()
        .environmentObject(NavigationCoordinator())
}
