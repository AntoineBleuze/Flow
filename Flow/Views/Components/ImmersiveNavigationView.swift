import SwiftUI
import CoreLocation
import MapKit

/// Nouvelle expérience d'itinéraire intégrée dans une carte flottante / bottom sheet (style Apple Maps)
/// Affiche la barre de progression en temps réel sur la ligne, les sorties recommandées, les correspondances enrichies et la sélection de départs en direct.
struct ImmersiveNavigationView: View {
    let journey: Journey
    @Binding var selectedDetent: PresentationDetent
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @ObservedObject var coordinator = NavigationCoordinator.shared
    @Environment(\.colorScheme) var colorScheme
    @State private var expandedSections: Set<String> = []
    @State private var showOnBoardTrainPicker: Bool = false
    var isFloating: Bool = false
    @State private var isExpanded: Bool = false
    
    // Convenience init avec valeur par défaut pour les previews ou appels sans binding
    init(journey: Journey, selectedDetent: Binding<PresentationDetent> = .constant(.fraction(0.22)), isFloating: Bool = false) {
        self.journey = journey
        self._selectedDetent = selectedDetent
        self.isFloating = isFloating
    }
    
    // MARK: - Computed Steps
    private var steps: [ItinerarySection] {
        journey.sections?.filter { $0.type != "waiting" } ?? []
    }
    
    private var currentStepIndex: Int {
        guard let sections = journey.sections else { return 0 }
        let currentSectionIdx = navigationManager.currentSectionIndex
        guard currentSectionIdx < sections.count else { return 0 }
        let activeSection = sections[currentSectionIdx]
        
        if let index = steps.firstIndex(where: { $0.id == activeSection.id }) {
            return index
        }
        
        for idx in currentSectionIdx..<sections.count {
            let sec = sections[idx]
            if let index = steps.firstIndex(where: { $0.id == sec.id }) {
                return index
            }
        }
        
        for idx in (0..<currentSectionIdx).reversed() {
            let sec = sections[idx]
            if let index = steps.firstIndex(where: { $0.id == sec.id }) {
                return index
            }
        }
        
        return 0
    }
    
    private var currentSection: ItinerarySection? {
        if steps.indices.contains(currentStepIndex) {
            return steps[currentStepIndex]
        }
        return nil
    }
    
    private var isCompact: Bool {
        if isFloating {
            return !isExpanded
        }
        return selectedDetent == .fraction(0.18) || selectedDetent == .fraction(0.20) || selectedDetent == .fraction(0.22)
    }
    
    // MARK: - Dynamic ETA & Delay Helpers
    private var adjustedArrivalTimeString: String {
        guard let arrivalStr = journey.arrival_date_time else { return "--:--" }
        if let date = DateFormat.navitia.date(from: arrivalStr) {
            let adjusted = date.addingTimeInterval(navigationManager.adjustedTimetableDelay)
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: adjusted)
        }
        return formatTime(arrivalStr)
    }
    
    private var remainingJourneyMinutes: Int {
        if let arrivalStr = journey.arrival_date_time,
           let arrivalDate = DateFormat.navitia.date(from: arrivalStr) {
            let adjusted = arrivalDate.addingTimeInterval(navigationManager.adjustedTimetableDelay)
            let diff = Int(ceil(adjusted.timeIntervalSinceNow / 60.0))
            if diff > 0 && diff < 360 {
                return diff
            }
        }
        // Fallback sur la somme des durées des étapes restantes
        let remainingSec = steps.dropFirst(currentStepIndex).reduce(0) { $0 + ($1.duration ?? 0) }
        if remainingSec > 0 {
            return max(1, remainingSec / 60)
        }
        return max(1, (journey.duration ?? 60) / 60)
    }
    
    private var delayMinutesBadge: (text: String, color: Color)? {
        let isOffline = navigationManager.isOfflineMode || !navigationManager.isServerResponding
        let hasReserve = !navigationManager.upcomingStationsReserve.isEmpty
        let offlineSuffix = hasReserve ? " (en réserve)" : " (hors-ligne)"
        let delayMin = Int(round(navigationManager.adjustedTimetableDelay / 60.0))
        if delayMin >= 2 {
            let label = isOffline ? "+\(delayMin) min\(offlineSuffix)" : "+\(delayMin) min"
            return (label, .orange)
        } else if delayMin <= -2 {
            let label = isOffline ? "\(delayMin) min\(offlineSuffix)" : "\(delayMin) min"
            return (label, .green)
        } else if case .onBoard = navigationManager.state {
            let label = isOffline ? "À l'heure\(offlineSuffix)" : "À l'heure"
            return (label, isOffline ? .secondary : .green)
        }
        return nil
    }
    
    // MARK: - Station Exits & Entries Lookup
    private func recommendedExit(for section: ItinerarySection, index: Int) -> StationExit? {
        // Cas 1 : Section Transport en commun -> sortie à la station d'arrivée (section.to)
        if section.type == "public_transport" {
            guard let toPlace = section.to else { return nil }
            let stationId = toPlace.id ?? toPlace.stop_point?.id
            let stationName = toPlace.name ?? toPlace.stop_point?.name
            let targetCoord = targetCoordinateAfter(stepIndex: index) ?? toPlace.coordinate ?? journey.destinationCoordinate
            guard let coord = targetCoord else { return nil }
            return StationExitsService.shared.closestExit(to: coord, stationId: stationId, stationName: stationName)
        }
        
        // Cas 2 : Marche qui suit un transport en commun -> sortie de la station précédente
        if (section.mode == "walking" || section.type == "street_network"), index > 0 {
            let prev = steps[index - 1]
            if prev.type == "public_transport", let fromStation = prev.to {
                let stationId = fromStation.id ?? fromStation.stop_point?.id
                let stationName = fromStation.name ?? fromStation.stop_point?.name
                let targetCoord = section.to?.coordinate ?? targetCoordinateAfter(stepIndex: index - 1) ?? journey.destinationCoordinate
                guard let coord = targetCoord else { return nil }
                return StationExitsService.shared.closestExit(to: coord, stationId: stationId, stationName: stationName)
            }
        }
        
        return nil
    }
    
    private func recommendedEntry(for section: ItinerarySection, index: Int) -> StationExit? {
        // Marche initiale vers une station de transport en commun
        if (section.mode == "walking" || section.type == "street_network"), index + 1 < steps.count {
            let next = steps[index + 1]
            if next.type == "public_transport", let toStation = next.from {
                let stationId = toStation.id ?? toStation.stop_point?.id
                let stationName = toStation.name ?? toStation.stop_point?.name
                let originCoord = section.from?.coordinate ?? toStation.coordinate
                guard let coord = originCoord else { return nil }
                return StationExitsService.shared.closestEntry(to: coord, stationId: stationId, stationName: stationName)
            }
        }
        return nil
    }
    
    private func targetCoordinateAfter(stepIndex: Int) -> CLLocationCoordinate2D? {
        if stepIndex + 1 < steps.count {
            let nextStep = steps[stepIndex + 1]
            if let toCoord = nextStep.to?.coordinate {
                return toCoord
            }
            if let coords = nextStep.geojson?.coordinates, let last = coords.last, last.count >= 2 {
                return CLLocationCoordinate2D(latitude: last[1], longitude: last[0])
            }
        }
        return journey.destinationCoordinate
    }
    
    private func focusStepOnMap(_ section: ItinerarySection) {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            if coordinator.focusedSectionId == section.id {
                coordinator.focusedSectionId = nil
                coordinator.focusedSectionId = section.id
            } else {
                coordinator.focusedSectionId = section.id
            }
        }
    }

    // MARK: - Main Content Container
    private var contentContainer: some View {
        GlassEffectContainer(spacing: 0.0) {
            VStack(spacing: 0) {
                // 1. Bandeau supérieur d'en-tête (Navbar intégrée avec ETA dynamique, barre d'étapes, simulation et quitter)
                headerNavBar
                
                // 1b. Alerte Incident & Proposition d'Itinéraire Alternatif en direct
                if let incident = navigationManager.activeIncident {
                    incidentAlertBanner(incident: incident)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        .padding(.bottom, 4)
                        .transition(.asymmetric(
                            insertion: .move(edge: .top).combined(with: .opacity),
                            removal: .opacity.combined(with: .scale(scale: 0.96))
                        ))
                }
                
                // 2. Défilement unifié : bannière d'étape active + déroulé complet des étapes
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading, spacing: 12) {
                            // Bannière de guidage d'étape active toujours lisible
                            compactStepBanner
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.primary.opacity(0.04))
                                )
                                .padding(.horizontal, 16)
                            
                            Divider()
                                .opacity(0.3)
                                .padding(.horizontal, 16)
                            
                            // Déroulé complet de l'itinéraire de départ à l'arrivée
                            VStack(alignment: .leading, spacing: 0) {
                                // Point de départ
                                departurePointRow
                                
                                // Liste continue des étapes
                                ForEach(Array(steps.enumerated()), id: \.element.id) { index, section in
                                    let isCurrent = (index == currentStepIndex)
                                    let isPast = (index < currentStepIndex)
                                    
                                    stepItemView(section: section, index: index, isCurrent: isCurrent, isPast: isPast)
                                        .id(section.id)
                                }
                                
                                // Point d'arrivée final
                                arrivalPointRow
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, isFloating ? 16 : 40)
                        }
                        .padding(.top, 8)
                    }
                    .frame(maxHeight: isFloating ? (isExpanded ? 380 : 160) : nil)
                    .onAppear {
                        if let cur = currentSection {
                            expandedSections.insert(cur.id)
                        }
                    }
                    .onChange(of: currentStepIndex) { _, _ in
                        if let cur = currentSection {
                            expandedSections.insert(cur.id)
                            withAnimation {
                                proxy.scrollTo(cur.id, anchor: .center)
                            }
                        }
                    }
                }
            }
        }
    }

    var body: some View {
        Group {
            if isFloating {
                contentContainer
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(Color.primary.opacity(colorScheme == .dark ? 0.14 : 0.08), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.35 : 0.12), radius: 14, y: 4)
            } else {
                contentContainer
            }
        }
        .onChange(of: navigationManager.activeIncident) { _, newIncident in
            if newIncident != nil {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    if isFloating {
                        isExpanded = true
                    } else {
                        selectedDetent = .large
                    }
                }
            }
        }
    }
    
    // MARK: - Incident Alert & Alternative Itinerary Proposal View
    @ViewBuilder
    private func incidentAlertBanner(incident: RouteIncident) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            // En-tête de l'incident
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.orange)
                
                LineIcon(
                    type: incident.lineType,
                    lineId: incident.lineCode,
                    size: 22
                )
                
                VStack(alignment: .leading, spacing: 1) {
                    Text(incident.title)
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    if let section = incident.impactedSection {
                        Text(section)
                            .font(.system(size: 11, weight: .semibold, design: .rounded))
                            .foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        navigationManager.dismissIncidentProposal()
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary.opacity(0.7))
                }
                .buttonStyle(.plain)
            }
            
            // Description du motif
            Text(incident.message)
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .foregroundColor(.primary)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
            
            if !incident.impactedStopNames.isEmpty {
                Text("Arrêts impactés sur votre trajet : \(incident.impactedStopNames.joined(separator: ", "))")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            // Section Proposition d'Itinéraire Alternatif
            if navigationManager.isCalculatingAlternative {
                HStack(spacing: 8) {
                    ProgressView()
                        .scaleEffect(0.8)
                    Text("Recherche d'un itinéraire alternatif...")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.vertical, 4)
            } else if let alternative = navigationManager.proposedAlternativeJourney {
                alternativeProposalView(alternative: alternative)
            } else {
                HStack {
                    Text("Aucun itinéraire alternatif automatique trouvé.")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                    Spacer()
                    Button("Réessayer") {
                        navigationManager.calculateAlternativeRoute(for: incident)
                    }
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.orange.opacity(colorScheme == .dark ? 0.16 : 0.09))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.orange.opacity(0.35), lineWidth: 1)
        )
    }
    
    @ViewBuilder
    private func alternativeProposalView(alternative: Journey) -> some View {
        let altDurationMin = max(1, (alternative.duration ?? 0) / 60)
        let ptSections = alternative.sections?.filter { $0.type == "public_transport" } ?? []
        
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 6) {
                Label("Alternative disponible", systemImage: "arrow.triangle.turn.up.right.diamond.fill")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("\(altDurationMin) min")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                if let arrivalStr = alternative.arrival_date_time {
                    Text("(\(formatTime(arrivalStr)))")
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundColor(.secondary)
                }
            }
            
            // Visualisation des lignes de l'alternative
            HStack(spacing: 6) {
                if ptSections.isEmpty {
                    Label("Trajet à pied", systemImage: "figure.walk")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                } else {
                    ForEach(Array(ptSections.enumerated()), id: \.offset) { idx, sec in
                        if idx > 0 {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundColor(.secondary.opacity(0.6))
                        }
                        if let disp = sec.display_informations {
                            LineIcon(
                                type: disp.transportType,
                                lineId: disp.code ?? disp.label ?? "?",
                                size: 20,
                                customColor: Color(hex: disp.color ?? "0078D7")
                            )
                        }
                    }
                }
                Spacer()
            }
            
            // Boutons d'action : Adopter ou Ignorer
            HStack(spacing: 10) {
                Button(action: {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        navigationManager.applyAlternativeJourney(alternative)
                    }
                }) {
                    HStack(spacing: 5) {
                        Image(systemName: "arrow.triangle.swap")
                            .font(.system(size: 11, weight: .bold))
                        Text("Prendre ce détour")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .foregroundColor(.white)
                }
                .buttonStyle(.plain)
                
                Button(action: {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        navigationManager.dismissIncidentProposal()
                    }
                }) {
                    Text("Conserver")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.primary.opacity(0.08), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.blue.opacity(colorScheme == .dark ? 0.16 : 0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.blue.opacity(0.25), lineWidth: 1)
        )
    }
    
    // MARK: - Header Nav Bar
    private var headerNavBar: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 12) {
                // ETA & Temps restant en direct
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("Arrivée à \(adjustedArrivalTimeString)")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        if let badge = delayMinutesBadge {
                            Text(badge.text)
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .foregroundColor(badge.color)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(badge.color.opacity(0.14), in: Capsule())
                        }
                        
                        Image(systemName: isCompact ? "chevron.up" : "chevron.down")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.secondary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            if isFloating {
                                isExpanded.toggle()
                            } else {
                                selectedDetent = (selectedDetent == .large) ? .fraction(0.22) : .large
                            }
                        }
                    }
                    
                    HStack(spacing: 6) {
                        HStack(spacing: 4) {
                            Image(systemName: "clock.fill")
                                .font(.system(size: 10))
                            Text("\(remainingJourneyMinutes) min restantes")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.blue.opacity(0.12), in: Capsule())
                        
                        if navigationManager.isOfflineMode || !navigationManager.isServerResponding {
                            HStack(spacing: 4) {
                                Image(systemName: "wifi.slash")
                                    .font(.system(size: 9, weight: .bold))
                                Text("Hors ligne • Données conservées")
                                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                            }
                            .foregroundColor(.orange)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 3)
                            .background(Color.orange.opacity(0.12), in: Capsule())
                        }
                        
                        if let rame = navigationManager.activeRameId, case .onBoard = navigationManager.state {
                            HStack(spacing: 3) {
                                Image(systemName: "tram.fill")
                                    .font(.system(size: 9, weight: .bold))
                                Text(rame)
                                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                            }
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 3)
                            .background(Color.primary.opacity(0.06), in: Capsule())
                        }
                    }
                }
                
                Spacer()
                
                // Boutons d'actions : Simulation & Quitter
                HStack(spacing: 8) {
                    // Bouton Simuler un incident (actif en mode simulation)
                    if navigationManager.isSimulating {
                        Button(action: {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                let activeLine = currentSection?.display_informations?.code ?? "1"
                                navigationManager.simulateRouteIncident(lineCode: activeLine)
                            }
                        }) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.orange)
                                .frame(width: 36, height: 36)
                                .background(Color.orange.opacity(0.14), in: Circle())
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Simuler un incident sur le trajet")
                    }

                    // Bouton Simulation
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            if navigationManager.isSimulating {
                                navigationManager.stopSimulation()
                            } else {
                                navigationManager.startSimulation()
                            }
                        }
                    }) {
                        Image(systemName: navigationManager.isSimulating ? "stop.fill" : "play.fill")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(navigationManager.isSimulating ? .orange : .green)
                            .frame(width: 36, height: 36)
                            .background(
                                (navigationManager.isSimulating ? Color.orange : Color.green).opacity(0.14),
                                in: Circle()
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(navigationManager.isSimulating ? "Arrêter la simulation" : "Lancer la simulation")
                    
                    // Bouton Réduire (Navigation libre dans le reste de l'application)
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            RouteNavigationManager.shared.minimizeRouteDetails()
                        }
                    }) {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.primary)
                            .frame(width: 36, height: 36)
                            .background(Color.primary.opacity(0.08), in: Circle())
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Réduire la feuille d'itinéraire")

                    // Bouton Quitter
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            RouteNavigationManager.shared.stopRoute()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.red)
                            .frame(width: 36, height: 36)
                            .background(Color.red.opacity(0.14), in: Circle())
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Quitter l'itinéraire")
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
            
            // Mini-barre synoptique des étapes du trajet (cliquable pour cibler une étape)
            if steps.count > 1 {
                journeyStepsOverviewBar
                    .padding(.horizontal, 16)
                    .padding(.bottom, 4)
            }
            
            Divider()
                .opacity(0.4)
        }
    }
    
    // MARK: - Journey Steps Overview Bar
    private var journeyStepsOverviewBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(Array(steps.enumerated()), id: \.element.id) { idx, sec in
                    let isCur = (idx == currentStepIndex)
                    let isPast = (idx < currentStepIndex)
                    
                    Button(action: {
                        focusStepOnMap(sec)
                        navigationManager.jumpToSection(withId: sec.id)
                    }) {
                        HStack(spacing: 4) {
                            if sec.type == "public_transport", let disp = sec.display_informations {
                                LineIcon(
                                    type: disp.transportType,
                                    lineId: disp.code ?? disp.label ?? "?",
                                    size: 18,
                                    customColor: Color(hex: disp.color ?? "0078D7")
                                )
                            } else if sec.mode == "walking" || sec.type == "street_network" {
                                Image(systemName: "figure.walk")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(isCur ? .blue : .secondary)
                            } else {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(isCur ? .orange : .secondary)
                            }
                            
                            if isCur {
                                Text(shortStepLabel(for: sec))
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.horizontal, isCur ? 8 : 6)
                        .padding(.vertical, 4)
                        .background(
                            isCur ? Color.blue.opacity(0.14) : Color.primary.opacity(isPast ? 0.03 : 0.06),
                            in: Capsule()
                        )
                        .overlay(
                            Capsule()
                                .stroke(isCur ? Color.blue.opacity(0.4) : Color.clear, lineWidth: 1)
                        )
                        .opacity(isPast ? 0.45 : 1.0)
                    }
                    .buttonStyle(.plain)
                    
                    if idx < steps.count - 1 {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(.secondary.opacity(0.5))
                    }
                }
            }
        }
    }
    
    private func shortStepLabel(for sec: ItinerarySection) -> String {
        if sec.type == "public_transport" {
            return sec.to?.name ?? sec.display_informations?.direction ?? "Ligne"
        } else if sec.type == "transfer" {
            return "Corresp."
        } else {
            return sec.to?.name ?? "Marche"
        }
    }
    
    // MARK: - Compact Step Banner (Vue résumée au bas de l'écran)
    private var compactStepBanner: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                if let step = currentSection {
                    Button(action: {
                        focusStepOnMap(step)
                    }) {
                        if step.type == "public_transport", let display = step.display_informations {
                            LineIcon(
                                type: display.transportType,
                                lineId: display.code ?? display.label ?? "?",
                                size: 38,
                                customColor: Color(hex: display.color ?? "0078D7")
                            )
                        } else if step.mode == "walking" || step.type == "street_network" {
                            Image(systemName: "figure.walk.circle.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.orange)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            if isFloating {
                                isExpanded.toggle()
                            } else {
                                selectedDetent = .large
                            }
                        }
                    }) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(stepTitle(for: step))
                                .font(.system(.subheadline, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .lineLimit(1)
                            
                            Text(stepSubtitle(for: step))
                                .font(.system(.caption, design: .rounded))
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    
                    // Action contextuelle rapide : Monter à bord OU Étape suivante
                    if case .waitingAtStation = navigationManager.state {
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                navigationManager.confirmBoarding()
                            }
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "tram.fill")
                                    .font(.system(size: 11, weight: .bold))
                                Text("À bord")
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(Color.green, in: Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Button(action: {
                        withAnimation {
                            navigationManager.advanceToNextSection()
                        }
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.primary)
                            .frame(width: 32, height: 32)
                            .background(Color.primary.opacity(0.08), in: Circle())
                    }
                    .buttonStyle(.plain)
                } else {
                    Text("Navigation en cours...")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            
            // Barre de progression en direct dans la bannière compacte + Sortie recommandée
            if let step = currentSection {
                if step.type == "public_transport", let stops = step.stop_date_times, stops.count > 1 {
                    let lineColor = Color(hex: step.display_informations?.color ?? "0078D7")
                    let totalSegments = Double(max(1, stops.count - 1))
                    let currentOverall = min(1.0, max(0.0, (Double(navigationManager.currentLegIndex) + navigationManager.progress) / totalSegments))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(lineColor.opacity(0.2))
                                    .frame(height: 5)
                                Capsule()
                                    .fill(lineColor)
                                    .frame(width: max(8, geo.size.width * currentOverall), height: 5)
                                    .animation(.easeInOut(duration: 0.35), value: currentOverall)
                            }
                        }
                        .frame(height: 5)
                        
                        HStack {
                            if let nextStop = (navigationManager.currentLegIndex + 1 < stops.count) ? stops[navigationManager.currentLegIndex + 1].stop_point.name : step.to?.name {
                                Text("Prochain : \(nextStop)")
                                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                            Spacer()
                            if let exit = recommendedExit(for: step, index: currentStepIndex) {
                                compactExitPill(exit: exit, isEntry: false)
                            }
                        }
                    }
                } else if let exit = recommendedExit(for: step, index: currentStepIndex) {
                    compactExitPill(exit: exit, isEntry: false)
                } else if let entry = recommendedEntry(for: step, index: currentStepIndex) {
                    compactExitPill(exit: entry, isEntry: true)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    private func compactExitPill(exit: StationExit, isEntry: Bool) -> some View {
        HStack(spacing: 4) {
            Image(systemName: isEntry ? "arrow.down.right.circle.fill" : "figure.walk.departure")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(isEntry ? .green : .red)
            if let num = exit.exit_number {
                Text("\(isEntry ? "Accès" : "Sortie") \(num)")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .foregroundColor(isEntry ? .green : .red)
            } else {
                Text(isEntry ? "Accès conseillé" : "Sortie conseillée")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .foregroundColor(isEntry ? .green : .red)
            }
            if let name = exit.exit_name, !name.isEmpty {
                Text("• \(name)")
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .foregroundColor(.primary)
                    .lineLimit(1)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 3)
        .background((isEntry ? Color.green : Color.red).opacity(0.12), in: Capsule())
    }
    
    // MARK: - Point de Départ
    private var departurePointRow: some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(spacing: 0) {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .shadow(color: Color.blue.opacity(0.4), radius: 3)
                
                Rectangle()
                    .fill(Color.primary.opacity(0.18))
                    .frame(width: 3, height: 24)
            }
            .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(journey.sections?.first?.from?.name ?? "Point de départ")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                if let depTime = journey.departure_date_time {
                    Text("Départ prévu à \(formatTime(depTime))")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.top, -2)
            
            Spacer()
        }
    }
    
    // MARK: - Point d'Arrivée
    private var arrivalPointRow: some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(spacing: 0) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 14, height: 14)
                    .overlay(
                        Image(systemName: "flag.fill")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundColor(.white)
                    )
                    .shadow(color: Color.green.opacity(0.4), radius: 3)
            }
            .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(journey.sections?.last?.to?.name ?? "Destination")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Arrivée estimée à \(adjustedArrivalTimeString)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .padding(.top, -2)
            
            Spacer()
        }
    }
    
    // MARK: - Step Item View (Dispatched by Type)
    @ViewBuilder
    private func stepItemView(section: ItinerarySection, index: Int, isCurrent: Bool, isPast: Bool) -> some View {
        if section.type == "public_transport" {
            publicTransportStepView(section: section, index: index, isCurrent: isCurrent, isPast: isPast)
        } else if section.mode == "walking" || section.type == "street_network" {
            walkingStepView(section: section, index: index, isCurrent: isCurrent, isPast: isPast)
        } else {
            transferStepView(section: section, index: index, isCurrent: isCurrent, isPast: isPast)
        }
    }
    
    // MARK: - Public Transport Step View
    private func publicTransportStepView(section: ItinerarySection, index: Int, isCurrent: Bool, isPast: Bool) -> some View {
        let display = section.display_informations
        let lineHex = display?.color ?? "0078D7"
        let lineColor = Color(hex: lineHex)
        let stops = section.stop_date_times ?? []
        let isSectionExpanded = expandedSections.contains(section.id) || isCurrent
        
        // Permet d'afficher les prochains départs temps réel si c'est l'étape active OU si l'utilisateur marche vers cette station
        let isApproachingThisTransit: Bool = {
            if case .walkingToStation(_, let nextSec) = navigationManager.state {
                return nextSec.id == section.id
            }
            return false
        }()
        let isWaitingForThisTransit: Bool = {
            if isCurrent, case .waitingAtStation = navigationManager.state {
                return true
            }
            return false
        }()
        let isOnBoardThisTransit: Bool = {
            if isCurrent, case .onBoard = navigationManager.state {
                return true
            }
            return false
        }()
        
        return HStack(alignment: .top, spacing: 14) {
            // Ligne verticale de liaison sur le côté gauche
            VStack(spacing: 0) {
                Rectangle()
                    .fill(lineColor.opacity(isPast ? 0.35 : 1.0))
                    .frame(width: 4)
                    .frame(maxHeight: .infinity)
            }
            .frame(width: 24)
            
            // Contenu de l'étape Transport
            VStack(alignment: .leading, spacing: 10) {
                // Header de la ligne (cliquable pour centrer la carte sur ce tronçon)
                Button(action: {
                    focusStepOnMap(section)
                }) {
                    HStack(alignment: .center, spacing: 10) {
                        if let disp = display {
                            LineIcon(
                                type: disp.transportType,
                                lineId: disp.code ?? disp.label ?? "?",
                                size: 32,
                                customColor: lineColor
                            )
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(spacing: 6) {
                                Text(dispTitle(for: section))
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                if isOnBoardThisTransit {
                                    Text("À BORD")
                                        .font(.system(size: 9, weight: .black))
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                } else if isCurrent {
                                    Text("EN COURS")
                                        .font(.system(size: 9, weight: .black))
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                } else if isApproachingThisTransit {
                                    Text("PROCHAIN")
                                        .font(.system(size: 9, weight: .black))
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                }
                            }
                            
                            if let dir = display?.direction {
                                Text("Direction \(dir)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            if isCurrent, let eta = navigationManager.calculateETA(for: section) {
                                Text(eta)
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(lineColor)
                            } else if let dur = section.duration {
                                Text(formatDuration(dur))
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            
                            Image(systemName: "scope")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.secondary.opacity(0.7))
                        }
                    }
                    .padding(10)
                    .background(
                        isCurrent ? lineColor.opacity(0.12) : Color.primary.opacity(0.04),
                        in: RoundedRectangle(cornerRadius: 14, style: .continuous)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .stroke(isCurrent ? lineColor.opacity(0.35) : Color.clear, lineWidth: 1.5)
                    )
                }
                .buttonStyle(.plain)
                
                // Sélecteur de prochains départs temps réel (en attente à la station OU en approche à pied)
                if isWaitingForThisTransit || isApproachingThisTransit {
                    waitingAtStationView(isApproaching: isApproachingThisTransit)
                } else if isOnBoardThisTransit {
                    onBoardStatusView(lineColor: lineColor)
                }
                
                // BARRE DE POSITION ET ARRÊTS SUR LA LIGNE (Intégrée dans la sheet)
                if !stops.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        // Bouton d'expansion si beaucoup d'arrêts
                        if stops.count > 4 {
                            Button(action: {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                    if expandedSections.contains(section.id) {
                                        expandedSections.remove(section.id)
                                    } else {
                                        expandedSections.insert(section.id)
                                    }
                                }
                            }) {
                                HStack(spacing: 6) {
                                    let remainingCount = isCurrent ? max(0, stops.count - 1 - navigationManager.currentLegIndex) : (stops.count - 1)
                                    Text(isCurrent ? "\(remainingCount) arrêts restants (\(formatDuration(section.duration ?? 0)))" : "\(stops.count - 1) arrêts (\(formatDuration(section.duration ?? 0)))")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                    Image(systemName: isSectionExpanded ? "chevron.up" : "chevron.down")
                                        .font(.system(size: 10, weight: .bold))
                                }
                                .foregroundColor(.blue)
                                .padding(.vertical, 4)
                            }
                            .buttonStyle(.plain)
                        }
                        
                        // Composant de progression le long de la ligne
                        TransitLineStopsTimelineView(
                            color: lineColor,
                            stops: stops,
                            isActiveSection: isCurrent,
                            currentLegIndex: isCurrent ? navigationManager.currentLegIndex : (isPast ? stops.count : 0),
                            progress: isCurrent ? navigationManager.progress : 0.0,
                            isExpanded: isSectionExpanded,
                            delaySeconds: isCurrent ? navigationManager.adjustedTimetableDelay : 0,
                            isOnBoard: isOnBoardThisTransit,
                            reserveMap: isCurrent ? navigationManager.upcomingStationsReserve : [:]
                        )
                    }
                    .padding(.leading, 4)
                }
                
                // Carte de Sortie Recommandée à la station de descente
                if let recExit = recommendedExit(for: section, index: index) {
                    recommendedExitCard(exit: recExit, stationName: section.to?.name, isEntry: false, section: section)
                }
            }
            .padding(.bottom, 16)
        }
    }
    
    // MARK: - Waiting / Approaching Station Real-Time Departures View
    private func waitingAtStationView(isApproaching: Bool) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                HStack(spacing: 5) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 6, height: 6)
                    Text(isApproaching ? "Prochains départs à la station :" : "Choisissez votre départ en direct :")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                }
                Spacer()
                if let selected = navigationManager.selectedDeparture {
                    let remaining = DateFormat.timeRemainingWithPast(from: selected.stopDateTime.departureDateTime)
                    Text(remaining)
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                }
            }
            
            if navigationManager.departuresList.isEmpty {
                HStack {
                    Text("Horaires temps réel en cours de récupération...")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Spacer()
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            navigationManager.confirmBoarding()
                        }
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "tram.fill")
                                .font(.system(size: 10, weight: .bold))
                            Text("Je suis à bord")
                                .font(.caption).bold()
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.green, in: Capsule())
                    }
                    .buttonStyle(.plain)
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(navigationManager.departuresList) { departure in
                            let timeStr = formatTime(departure.stopDateTime.departureDateTime)
                            let remaining = DateFormat.timeRemainingWithPast(from: departure.stopDateTime.departureDateTime)
                            let isSelected = navigationManager.selectedDeparture?.id == departure.id
                            let isPastDep = remaining.lowercased().contains("parti") || remaining.hasPrefix("-")
                            
                            Button(action: {
                                withAnimation(.spring(response: 0.25, dampingFraction: 0.8)) {
                                    navigationManager.selectDeparture(departure)
                                }
                            }) {
                                VStack(alignment: .leading, spacing: 2) {
                                    HStack(spacing: 4) {
                                        Text(timeStr)
                                            .font(.system(size: 12, weight: .bold, design: .rounded))
                                        if isSelected {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 10))
                                        }
                                    }
                                    Text(remaining)
                                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                                        .opacity(isSelected ? 0.95 : 0.8)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    isSelected ? Color.blue : Color.primary.opacity(isPastDep ? 0.03 : 0.07),
                                    in: RoundedRectangle(cornerRadius: 10, style: .continuous)
                                )
                                .foregroundColor(isSelected ? .white : (isPastDep ? .secondary : .primary))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                HStack {
                    if let selected = navigationManager.selectedDeparture {
                        let timeStr = formatTime(selected.stopDateTime.departureDateTime)
                        Text("Train sélectionné : \(timeStr)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            navigationManager.confirmBoarding()
                        }
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 11, weight: .bold))
                            Text("Je monte à bord")
                                .font(.caption).bold()
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.green, in: Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(10)
        .background(Color.blue.opacity(0.06), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.blue.opacity(0.18), lineWidth: 1)
        )
    }
    
    // MARK: - On-Board Train & Real-Time Delay Selector
    private func onBoardStatusView(lineColor: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "dot.radiowaves.left.and.right")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.green)
                
                Text(navigationManager.activeRameId ?? "À bord")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                if let badge = delayMinutesBadge {
                    Text("• \(badge.text)")
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundColor(badge.color)
                }
                
                Spacer()
                
                if !navigationManager.departuresList.isEmpty {
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            showOnBoardTrainPicker.toggle()
                        }
                    }) {
                        HStack(spacing: 4) {
                            Text(showOnBoardTrainPicker ? "Masquer" : "Changer de train")
                                .font(.system(size: 11, weight: .semibold, design: .rounded))
                            Image(systemName: showOnBoardTrainPicker ? "chevron.up" : "chevron.down")
                                .font(.system(size: 9, weight: .bold))
                        }
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.1), in: Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
            
            if showOnBoardTrainPicker && !navigationManager.departuresList.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(navigationManager.departuresList) { departure in
                            let timeStr = formatTime(departure.stopDateTime.departureDateTime)
                            let remaining = DateFormat.timeRemainingWithPast(from: departure.stopDateTime.departureDateTime)
                            let isSelected = navigationManager.selectedDeparture?.id == departure.id
                            
                            Button(action: {
                                withAnimation(.spring(response: 0.25, dampingFraction: 0.8)) {
                                    navigationManager.selectDeparture(departure)
                                }
                            }) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(timeStr)
                                        .font(.system(size: 11, weight: .bold, design: .rounded))
                                    Text(remaining)
                                        .font(.system(size: 9, design: .rounded))
                                }
                                .padding(.horizontal, 9)
                                .padding(.vertical, 5)
                                .background(
                                    isSelected ? lineColor : Color.primary.opacity(0.06),
                                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                )
                                .foregroundColor(isSelected ? .white : .primary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .padding(9)
        .background(Color.green.opacity(0.06), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.green.opacity(0.2), lineWidth: 1)
        )
    }
    
    // MARK: - Recommended Exit / Entry Card
    private func recommendedExitCard(exit: StationExit, stationName: String?, isEntry: Bool, section: ItinerarySection) -> some View {
        let accent: Color = isEntry ? .green : .red
        return Button(action: {
            focusStepOnMap(section)
        }) {
            HStack(spacing: 10) {
                // Badge numéro de sortie / accès (style signalétique RATP/IDFM)
                ZStack {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(accent)
                        .frame(width: 32, height: 32)
                    if let num = exit.exit_number {
                        VStack(spacing: -1) {
                            Text(isEntry ? "ACCÈS" : "SORTIE")
                                .font(.system(size: 6, weight: .heavy))
                                .foregroundColor(.white.opacity(0.9))
                            Text("\(num)")
                                .font(.system(size: 14, weight: .black, design: .rounded))
                                .foregroundColor(.white)
                        }
                    } else {
                        Image(systemName: isEntry ? "arrow.down.right" : "figure.walk.departure")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Text(isEntry ? "Accès recommandé" : "Sortie recommandée")
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .foregroundColor(accent)
                        if let stName = stationName, !stName.isEmpty {
                            Text("• \(stName)")
                                .font(.system(size: 10, weight: .medium, design: .rounded))
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                    
                    Text(exit.exit_name ?? (exit.exit_number != nil ? "Sortie n°\(exit.exit_number!)" : "Accès principal"))
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "location.magnifyingglass")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(accent)
            }
            .padding(10)
            .background(accent.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(accent.opacity(0.25), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Walking Step View
    private func walkingStepView(section: ItinerarySection, index: Int, isCurrent: Bool, isPast: Bool) -> some View {
        let recEntry = recommendedEntry(for: section, index: index)
        // Si l'étape précédente n'a pas déjà affiché la sortie (ou si on est sur la marche active), on rappelle la sortie
        let recExit: StationExit? = isCurrent ? recommendedExit(for: section, index: index) : nil
        
        return HStack(alignment: .top, spacing: 14) {
            // Ligne verticale en pointillés pour la marche
            VStack(spacing: 4) {
                Circle()
                    .fill(isCurrent ? Color.blue : (isPast ? Color.secondary.opacity(0.4) : Color.blue.opacity(0.6)))
                    .frame(width: 8, height: 8)
                
                ForEach(0..<4, id: \.self) { _ in
                    Circle()
                        .fill(isPast ? Color.secondary.opacity(0.3) : Color.blue.opacity(0.4))
                        .frame(width: 3, height: 3)
                }
                
                Circle()
                    .fill(isPast ? Color.secondary.opacity(0.4) : Color.blue.opacity(0.6))
                    .frame(width: 8, height: 8)
            }
            .frame(width: 24)
            .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 8) {
                Button(action: {
                    focusStepOnMap(section)
                }) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: "figure.walk")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(isCurrent ? .blue : .secondary)
                            
                            Text("Marcher vers \(section.to?.name ?? "destination")")
                                .font(.system(.subheadline, design: .rounded))
                                .fontWeight(isCurrent ? .bold : .medium)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            if let dur = section.duration {
                                Text(formatDuration(dur))
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        if let from = section.from?.name, !from.isEmpty {
                            Text("Depuis \(from)")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(10)
                    .background(
                        isCurrent ? Color.blue.opacity(0.08) : Color.primary.opacity(0.03),
                        in: RoundedRectangle(cornerRadius: 12, style: .continuous)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(isCurrent ? Color.blue.opacity(0.25) : Color.clear, lineWidth: 1)
                    )
                }
                .buttonStyle(.plain)
                
                if let entry = recEntry {
                    recommendedExitCard(exit: entry, stationName: section.to?.name, isEntry: true, section: section)
                } else if let exit = recExit {
                    recommendedExitCard(exit: exit, stationName: section.from?.name, isEntry: false, section: section)
                }
            }
            .padding(.bottom, 12)
        }
    }
    
    // MARK: - Transfer Step View (Correspondance enrichie entre deux lignes)
    private func transferStepView(section: ItinerarySection, index: Int, isCurrent: Bool, isPast: Bool) -> some View {
        let prevTransit = (0..<index).reversed().compactMap { steps[$0].type == "public_transport" ? steps[$0] : nil }.first
        let nextTransit = ((index + 1)..<steps.count).compactMap { steps[$0].type == "public_transport" ? steps[$0] : nil }.first
        let stationName = section.from?.name ?? section.to?.name ?? "la station"
        
        return HStack(alignment: .top, spacing: 14) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.orange.opacity(isPast ? 0.35 : 0.85))
                    .frame(width: 3)
                    .frame(maxHeight: .infinity)
            }
            .frame(width: 24)
            
            Button(action: {
                focusStepOnMap(section)
            }) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.orange)
                        
                        Text("Correspondance à \(stationName)")
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(isCurrent ? .bold : .semibold)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        if let dur = section.duration {
                            HStack(spacing: 3) {
                                Image(systemName: "figure.walk")
                                    .font(.system(size: 10, weight: .semibold))
                                Text(formatDuration(dur))
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.orange)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 3)
                            .background(Color.orange.opacity(0.12), in: Capsule())
                        }
                    }
                    
                    // Bandeau visuel de transition Ligne A -> Ligne B + Direction
                    if prevTransit != nil || nextTransit != nil {
                        HStack(spacing: 8) {
                            if let prevDisp = prevTransit?.display_informations {
                                LineIcon(
                                    type: prevDisp.transportType,
                                    lineId: prevDisp.code ?? prevDisp.label ?? "?",
                                    size: 22,
                                    customColor: Color(hex: prevDisp.color ?? "0078D7")
                                )
                            }
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.secondary)
                            
                            if let nextDisp = nextTransit?.display_informations {
                                LineIcon(
                                    type: nextDisp.transportType,
                                    lineId: nextDisp.code ?? nextDisp.label ?? "?",
                                    size: 24,
                                    customColor: Color(hex: nextDisp.color ?? "0078D7")
                                )
                                
                                VStack(alignment: .leading, spacing: 1) {
                                    Text("Rejoindre \(nextDisp.commercial_mode ?? "Ligne") \(nextDisp.code ?? nextDisp.label ?? "")")
                                        .font(.system(size: 12, weight: .bold, design: .rounded))
                                        .foregroundColor(.primary)
                                    if let dir = nextDisp.direction {
                                        Text("Direction \(dir)")
                                            .font(.system(size: 11, design: .rounded))
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(8)
                        .background(Color.primary.opacity(0.04), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
                .padding(10)
                .background(
                    isCurrent ? Color.orange.opacity(0.10) : Color.primary.opacity(0.03),
                    in: RoundedRectangle(cornerRadius: 12, style: .continuous)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(isCurrent ? Color.orange.opacity(0.3) : Color.clear, lineWidth: 1)
                )
            }
            .buttonStyle(.plain)
            .padding(.bottom, 12)
        }
    }
    
    // MARK: - Text Helpers
    private func stepTitle(for step: ItinerarySection) -> String {
        if step.mode == "walking" || step.type == "street_network" {
            return "Marcher vers \(step.to?.name ?? "Destination")"
        } else if let display = step.display_informations {
            let mode = display.commercial_mode ?? "Transport"
            let code = display.code ?? display.label ?? ""
            return "\(mode) \(code) vers \(display.direction ?? step.to?.name ?? "")"
        } else if step.type == "transfer" {
            return "Correspondance à \(step.from?.name ?? "")"
        }
        return "Continuer l'itinéraire"
    }
    
    private func stepSubtitle(for step: ItinerarySection) -> String {
        if step.type == "public_transport", let stops = step.stop_date_times, !stops.isEmpty {
            let legIdx = navigationManager.currentLegIndex
            if legIdx < stops.count {
                let remainingStops = max(0, stops.count - 1 - legIdx)
                let currentStation = stops[legIdx].stop_point.name ?? ""
                if remainingStops == 0 {
                    return "Arrêt actuel : \(currentStation) • Descendre ici !"
                } else {
                    return "Arrêt actuel : \(currentStation) • \(remainingStops) arrêts restants"
                }
            }
        }
        if step.type == "transfer", let idx = steps.firstIndex(where: { $0.id == step.id }) {
            if let nextTransit = ((idx + 1)..<steps.count).compactMap({ steps[$0].type == "public_transport" ? steps[$0] : nil }).first,
               let disp = nextTransit.display_informations {
                return "Vers \(disp.commercial_mode ?? "Ligne") \(disp.code ?? disp.label ?? "") (\(disp.direction ?? ""))"
            }
        }
        if let dur = step.duration {
            return "\(formatDuration(dur)) de trajet"
        }
        return ""
    }
    
    private func dispTitle(for section: ItinerarySection) -> String {
        if let display = section.display_informations {
            let mode = display.commercial_mode ?? "Ligne"
            let code = display.code ?? display.label ?? ""
            return "\(mode) \(code)"
        }
        return "Transport"
    }
    
    private func formatTime(_ isoDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            return timeFormatter.string(from: date)
        }
        if isoDate.count >= 13 {
            let start = isoDate.index(isoDate.startIndex, offsetBy: 9)
            let end = isoDate.index(isoDate.startIndex, offsetBy: 13)
            let timeSub = String(isoDate[start..<end])
            let hh = timeSub.prefix(2)
            let mm = timeSub.suffix(2)
            return "\(hh):\(mm)"
        }
        return isoDate
    }
    
    private func formatDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let mins = minutes % 60
        if hours > 0 {
            return "\(hours)h\(String(format: "%02d", mins))"
        }
        return "\(mins) min"
    }
}

// MARK: - Transit Line Stops Timeline View (La barre de position sur la ligne intégrée)
struct TransitLineStopsTimelineView: View {
    let color: Color
    let stops: [ItineraryStopDateTime]
    let isActiveSection: Bool
    let currentLegIndex: Int
    let progress: Double
    let isExpanded: Bool
    var delaySeconds: TimeInterval = 0
    var isOnBoard: Bool = true
    var reserveMap: [String: StationRealTimeReserve] = [:]
    
    private let stopHeight: CGFloat = 38
    private let nodeSize: CGFloat = 8
    private let lineWidth: CGFloat = 4
    private let indicatorSize: CGFloat = 14
    
    // Détermine les arrêts visibles selon l'expansion
    private var displayStops: [(index: Int, stop: ItineraryStopDateTime)] {
        let enumerated = Array(stops.enumerated()).map { (index: $0.offset, stop: $0.element) }
        if isExpanded || stops.count <= 4 {
            return enumerated
        }
        
        // Mode compact : premier, arrêt actif si intermédiaire, et dernier
        var result: [(index: Int, stop: ItineraryStopDateTime)] = []
        if let first = enumerated.first {
            result.append(first)
        }
        if isActiveSection && currentLegIndex > 0 && currentLegIndex < stops.count - 1 {
            result.append(enumerated[currentLegIndex])
        }
        if let last = enumerated.last, last.index != result.last?.index {
            result.append(last)
        }
        return result
    }
    
    var body: some View {
        let items = displayStops
        let count = items.count
        guard count > 0 else { return AnyView(EmptyView()) }
        
        let continuousIndex: CGFloat = {
            if !isOnBoard {
                return 0.0
            }
            if isExpanded || stops.count <= 4 {
                let clampedLeg = min(max(0, currentLegIndex), max(0, stops.count - 1))
                let clampedProg = min(max(0.0, progress), 1.0)
                return min(CGFloat(clampedLeg) + CGFloat(clampedProg), CGFloat(stops.count - 1))
            } else {
                if currentLegIndex == 0 { return CGFloat(progress) * 0.5 }
                if currentLegIndex >= stops.count - 1 { return 2.0 }
                return 1.0 + CGFloat(progress) * 0.5
            }
        }()
        
        let totalTrackHeight = max(0, CGFloat(count - 1) * stopHeight)
        let activeTrackHeight = min(max(0, continuousIndex * stopHeight), totalTrackHeight)
        let indicatorY = continuousIndex * stopHeight + (stopHeight / 2) - (indicatorSize / 2)

        return AnyView(
            HStack(alignment: .top, spacing: 12) {
                // COLONNE TIMELINE CONTINUE (Track + Nœuds + Point Temps Réel)
                ZStack(alignment: .top) {
                    // 1. Ligne de fond reliant le premier au dernier arrêt
                    if count > 1 {
                        Capsule()
                            .fill(color.opacity(0.25))
                            .frame(width: lineWidth, height: totalTrackHeight)
                            .offset(y: stopHeight / 2)
                        
                        // 2. Ligne active (pleine couleur) jusqu'à la position en direct
                        if isActiveSection && activeTrackHeight > 0 {
                            Capsule()
                                .fill(color)
                                .frame(width: lineWidth, height: activeTrackHeight)
                                .offset(y: stopHeight / 2)
                        }
                    }
                    
                    // 3. Nœuds de stations
                    VStack(spacing: 0) {
                        ForEach(0..<count, id: \.self) { row in
                            let origIndex = items[row].index
                            let isSkipped = items[row].stop.isSkipped
                            let isPassed = isActiveSection ? (origIndex < currentLegIndex) : false
                            let isCurrent = isActiveSection && (origIndex == currentLegIndex)
                            
                            ZStack {
                                if isSkipped {
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .frame(width: nodeSize, height: nodeSize)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.orange, style: StrokeStyle(lineWidth: 1.5, dash: [2, 2]))
                                        )
                                    Image(systemName: "xmark")
                                        .font(.system(size: 5, weight: .bold))
                                        .foregroundColor(.orange)
                                } else {
                                    Circle()
                                        .fill(isCurrent ? Color.white : (isPassed ? color.opacity(0.35) : color))
                                        .frame(width: isCurrent ? nodeSize + 2 : nodeSize, height: isCurrent ? nodeSize + 2 : nodeSize)
                                        .overlay(
                                            Circle()
                                                .stroke(color, lineWidth: isCurrent ? 2 : 1)
                                        )
                                }
                            }
                            .frame(width: 24, height: stopHeight)
                        }
                    }
                    
                    // 4. POINT INDICATEUR TEMPS RÉEL (Glisse de façon fluide et continue entre les stations)
                    if isActiveSection {
                        Circle()
                            .fill(Color.white)
                            .frame(width: indicatorSize, height: indicatorSize)
                            .shadow(color: color.opacity(0.9), radius: 6)
                            .overlay(
                                Circle()
                                    .stroke(color, lineWidth: 2.5)
                            )
                            .overlay(
                                Circle()
                                    .fill(color)
                                    .frame(width: 4, height: 4)
                            )
                            .offset(y: indicatorY)
                            .animation(.linear(duration: 0.3), value: progress)
                            .animation(.spring(response: 0.45, dampingFraction: 0.8), value: currentLegIndex)
                    }
                }
                .frame(width: 24)
                
                // COLONNE DES NOMS DE STATIONS
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<count, id: \.self) { row in
                        let item = items[row]
                        let origIndex = item.index
                        let isSkipped = item.stop.isSkipped
                        let isPassed = isActiveSection ? (origIndex < currentLegIndex) : false
                        let isCurrent = isActiveSection && (origIndex == currentLegIndex)
                        let isNext = isActiveSection && (origIndex == currentLegIndex + 1)
                        let isLast = origIndex == stops.count - 1
                        
                        HStack(spacing: 6) {
                            Text(item.stop.stop_point.name ?? "Station")
                                .font(.system(size: 13, weight: (isCurrent || isNext) ? .bold : (isLast ? .semibold : .medium), design: .rounded))
                                .strikethrough(isSkipped, color: .orange)
                                .foregroundColor(isSkipped ? .secondary.opacity(0.7) : (isCurrent ? .primary : (isPassed ? .secondary.opacity(0.7) : .primary)))
                                .lineLimit(1)
                            
                            if isSkipped {
                                Text("NON DESSERVI")
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundColor(.orange)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color.orange.opacity(0.12), in: Capsule())
                            } else if isLast {
                                Text("DESCENTE")
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundColor(.red)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color.red.opacity(0.12), in: Capsule())
                            } else if isCurrent {
                                let badgeText = isOnBoard ? "À BORD" : "DÉPART"
                                let badgeColor: Color = isOnBoard ? .blue : .green
                                Text(badgeText)
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundColor(badgeColor)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(badgeColor.opacity(0.12), in: Capsule())
                            } else if isNext {
                                Text(isOnBoard ? "PROCHAIN" : "DIRECTION")
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundColor(isOnBoard ? .green : .secondary)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background((isOnBoard ? Color.green : Color.secondary).opacity(0.12), in: Capsule())
                            }
                            
                            Spacer()
                            
                            if isSkipped {
                                Text("Sans arrêt")
                                    .font(.system(size: 10, weight: .medium, design: .rounded))
                                    .foregroundColor(.orange)
                            } else if !item.stop.departure_date_time.isEmpty {
                                HStack(spacing: 3) {
                                    if let _ = reserveMap[item.stop.id], !isPassed {
                                        Image(systemName: "clock.arrow.circlepath")
                                            .font(.system(size: 8, weight: .bold))
                                            .foregroundColor(color)
                                    }
                                    Text(formatStopTime(item.stop.departure_date_time, stopId: item.stop.id))
                                        .font(.system(size: 11, weight: isNext ? .semibold : .regular, design: .rounded))
                                        .foregroundColor(abs(delaySeconds) >= 120 && !isPassed ? .orange : .secondary)
                                }
                            }
                        }
                        .frame(height: stopHeight)
                    }
                }
            }
        )
    }
    
    private func formatStopTime(_ isoDate: String, stopId: String? = nil) -> String {
        if let id = stopId, let reserve = reserveMap[id], let est = reserve.estimatedDeparture ?? reserve.estimatedArrival {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: est)
        }
        if let date = DateFormat.navitia.date(from: isoDate) {
            let adjusted = date.addingTimeInterval(delaySeconds)
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: adjusted)
        }
        if isoDate.count >= 13 {
            let start = isoDate.index(isoDate.startIndex, offsetBy: 9)
            let end = isoDate.index(isoDate.startIndex, offsetBy: 13)
            let timeSub = String(isoDate[start..<end])
            let hh = timeSub.prefix(2)
            let mm = timeSub.suffix(2)
            return "\(hh):\(mm)"
        }
        return isoDate
    }
}

#Preview {
    ImmersiveNavigationView(
        journey: PreviewMockData.mockJourney,
        selectedDetent: .constant(.large)
    )
}

