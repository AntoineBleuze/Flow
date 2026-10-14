import SwiftUI
import CoreLocation
import MapKit

/// Nouvelle expérience d'itinéraire intégrée dans une bottom sheet (style Apple Maps)
/// Affiche la barre de progression en temps réel sur la ligne et l'ensemble des étapes de haut en bas.
struct ImmersiveNavigationView: View {
    let journey: Journey
    @Binding var selectedDetent: PresentationDetent
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @Environment(\.colorScheme) var colorScheme
    @State private var expandedSections: Set<String> = []
    var isFloating: Bool = false
    @State private var isExpanded: Bool = false
    
    // Convenience init avec valeur par défaut pour les previews ou appels sans binding
    init(journey: Journey, selectedDetent: Binding<PresentationDetent> = .constant(.fraction(0.18)), isFloating: Bool = false) {
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
        return selectedDetent == .fraction(0.18)
    }
    
    private var contentContainer: some View {
        GlassEffectContainer(spacing: 0.0) {
            VStack(spacing: 0) {
                // 1. Bandeau supérieur d'en-tête (Navbar intégrée avec ETA, simulation et quitter)
                headerNavBar
                
                // 2. Aperçu compact de l'étape active (visible uniquement en mode compact)
                if isCompact {
                    compactStepBanner
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    // 3. Défilement vertical direct de toutes les étapes de haut en bas
                    ScrollViewReader { proxy in
                        ScrollView(.vertical, showsIndicators: true) {
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
                            .padding(.top, 12)
                            .padding(.bottom, isFloating ? 16 : 40)
                        }
                        .frame(maxHeight: isFloating ? 320 : nil)
                        .onAppear {
                            if let cur = currentSection {
                                expandedSections.insert(cur.id)
                                withAnimation {
                                    proxy.scrollTo(cur.id, anchor: .top)
                                }
                            }
                        }
                        .onChange(of: currentStepIndex) { _, _ in
                            if let cur = currentSection {
                                expandedSections.insert(cur.id)
                                withAnimation {
                                    proxy.scrollTo(cur.id, anchor: .top)
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(.ultraThinMaterial)
    }

    var body: some View {
        if isFloating {
            contentContainer
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
    
    // MARK: - Header Nav Bar
    private var headerNavBar: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 12) {
                // ETA & Temps restant
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 6) {
                        Text("Arrivée à \(formatTime(journey.arrival_date_time ?? ""))")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
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
                                selectedDetent = (selectedDetent == .large) ? .fraction(0.18) : .large
                            }
                        }
                    }
                    
                    HStack(spacing: 6) {
                        let durationMinutes = max(1, (journey.duration ?? 0) / 60)
                        HStack(spacing: 4) {
                            Image(systemName: "clock.fill")
                                .font(.system(size: 10))
                            Text("\(durationMinutes) min restantes")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.blue.opacity(0.12), in: Capsule())
                        
                        if let current = currentSection, current.type == "public_transport", let display = current.display_informations {
                            LineIcon(
                                type: display.transportType,
                                lineId: display.code ?? display.label ?? "",
                                size: 24,
                                customColor: Color(hex: display.color ?? "0078D7")
                            )
                        }
                    }
                }
                
                Spacer()
                
                // Boutons d'actions : Simulation & Quitter
                HStack(spacing: 8) {
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
                    
                    // Bouton Quitter
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            navigationManager.stopNavigation()
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
            .padding(.bottom, 6)
            
            Divider()
                .opacity(0.4)
        }
    }
    
    // MARK: - Compact Step Banner (Vue résumée au bas de l'écran)
    private var compactStepBanner: some View {
        Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                if isFloating {
                    isExpanded.toggle()
                } else {
                    selectedDetent = .large
                }
            }
        }) {
            HStack(spacing: 12) {
                if let step = currentSection {
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
                    
                    Spacer()
                    
                    // Bouton passer à l'étape suivante manuellement
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
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
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
                
                Text("Arrivée finale à \(formatTime(journey.arrival_date_time ?? ""))")
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
        let isExpanded = expandedSections.contains(section.id) || isCurrent
        
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
                // Header de la ligne
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
                            
                            if isCurrent {
                                Text("EN COURS")
                                    .font(.system(size: 9, weight: .black))
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(Color.blue)
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
                    
                    if let dur = section.duration {
                        Text(formatDuration(dur))
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
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
                
                // Si en attente à la station et que c'est l'étape active : sélecteur de trains temps réel
                if isCurrent, case .waitingAtStation = navigationManager.state {
                    waitingAtStationView
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
                                    Text("\(stops.count) arrêts (\(formatDuration(section.duration ?? 0)))")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
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
                            isExpanded: isExpanded
                        )
                    }
                    .padding(.leading, 4)
                }
            }
            .padding(.bottom, 16)
        }
    }
    
    // MARK: - Waiting at station departure view
    private var waitingAtStationView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Choisissez votre train :")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
            
            if navigationManager.departuresList.isEmpty {
                HStack {
                    Text("Pas de départ temps réel disponible")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            navigationManager.confirmBoarding()
                        }
                    }) {
                        Text("Démarrer")
                            .font(.caption).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 5)
                            .background(Color.blue, in: Capsule())
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
                            
                            Button(action: {
                                withAnimation {
                                    navigationManager.selectDeparture(departure)
                                }
                            }) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(timeStr)
                                        .font(.system(size: 12, weight: .bold))
                                    Text(remaining)
                                        .font(.system(size: 9))
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(isSelected ? Color.blue : Color.primary.opacity(0.06))
                                .foregroundColor(isSelected ? .white : .primary)
                                .cornerRadius(8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                HStack {
                    if let selected = navigationManager.selectedDeparture {
                        let remaining = DateFormat.timeRemainingWithPast(from: selected.stopDateTime.departureDateTime)
                        Text("Départ : \(remaining)")
                            .font(.caption2)
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            navigationManager.confirmBoarding()
                        }
                    }) {
                        Text("Je monte à bord")
                            .font(.caption).bold()
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
        .background(Color.blue.opacity(0.06), in: RoundedRectangle(cornerRadius: 12))
    }
    
    // MARK: - Walking Step View
    private func walkingStepView(section: ItinerarySection, index: Int, isCurrent: Bool, isPast: Bool) -> some View {
        HStack(alignment: .top, spacing: 14) {
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
                isCurrent ? Color.blue.opacity(0.08) : Color.clear,
                in: RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(isCurrent ? Color.blue.opacity(0.2) : Color.clear, lineWidth: 1)
            )
            .padding(.bottom, 12)
        }
    }
    
    // MARK: - Transfer Step View
    private func transferStepView(section: ItinerarySection, index: Int, isCurrent: Bool, isPast: Bool) -> some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.orange.opacity(isPast ? 0.35 : 0.8))
                    .frame(width: 3)
                    .frame(maxHeight: .infinity)
            }
            .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.orange)
                    
                    Text("Correspondance à \(section.from?.name ?? "station")")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(isCurrent ? .bold : .medium)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    if let dur = section.duration {
                        Text(formatDuration(dur))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(10)
            .background(
                isCurrent ? Color.orange.opacity(0.08) : Color.clear,
                in: RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
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
                            let isPassed = isActiveSection ? (origIndex < currentLegIndex) : false
                            let isCurrent = isActiveSection && (origIndex == currentLegIndex)
                            
                            ZStack {
                                Circle()
                                    .fill(isCurrent ? Color.white : (isPassed ? color.opacity(0.35) : color))
                                    .frame(width: isCurrent ? nodeSize + 2 : nodeSize, height: isCurrent ? nodeSize + 2 : nodeSize)
                                    .overlay(
                                        Circle()
                                            .stroke(color, lineWidth: isCurrent ? 2 : 1)
                                    )
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
                        let isPassed = isActiveSection ? (origIndex < currentLegIndex) : false
                        let isCurrent = isActiveSection && (origIndex == currentLegIndex)
                        let isLast = origIndex == stops.count - 1
                        
                        HStack(spacing: 6) {
                            Text(item.stop.stop_point.name ?? "Station")
                                .font(.system(size: 13, weight: isCurrent ? .bold : (isLast ? .semibold : .medium), design: .rounded))
                                .foregroundColor(isCurrent ? .primary : (isPassed ? .secondary.opacity(0.7) : .primary))
                                .lineLimit(1)
                            
                            if isLast {
                                Text("DESCENTE")
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundColor(.red)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color.red.opacity(0.12), in: Capsule())
                            } else if isCurrent {
                                Text("À BORD")
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(Color.blue.opacity(0.12), in: Capsule())
                            }
                            
                            Spacer()
                            
                            if !item.stop.departure_date_time.isEmpty {
                                Text(formatTime(item.stop.departure_date_time))
                                    .font(.system(size: 11, weight: .regular))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(height: stopHeight)
                    }
                }
            }
        )
    }
    
    private func formatTime(_ isoDate: String) -> String {
        if isoDate.count >= 13 {
            let start = isoDate.index(isoDate.startIndex, offsetBy: 9)
            let end = isoDate.index(isoDate.startIndex, offsetBy: 13)
            let timeSub = String(isoDate[start..<end])
            let hh = timeSub.prefix(2)
            let mm = timeSub.suffix(2)
            return "\(hh):\(mm)"
        }
        return ""
    }
}

#Preview {
    ImmersiveNavigationView(
        journey: PreviewMockData.mockJourney,
        selectedDetent: .constant(.large)
    )
}
