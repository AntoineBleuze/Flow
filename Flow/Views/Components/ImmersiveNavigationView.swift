import SwiftUI
import CoreLocation
import MapKit

struct ImmersiveNavigationView: View {
    let journey: Journey
    @Binding var navigationMode: Bool
    @Binding var userTrackingMode: MKUserTrackingMode
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @Environment(\.colorScheme) var colorScheme
    
    private var currentStepIndex: Int {
        guard let sections = journey.sections else { return 0 }
        let currentSectionIdx = navigationManager.currentSectionIndex
        guard currentSectionIdx < sections.count else { return 0 }
        let activeSection = sections[currentSectionIdx]
        
        if let index = steps.firstIndex(where: { $0.id == activeSection.id }) {
            return index
        }
        
        // Fallback: search forward
        for idx in currentSectionIdx..<sections.count {
            let sec = sections[idx]
            if let index = steps.firstIndex(where: { $0.id == sec.id }) {
                return index
            }
        }
        
        // Fallback: search backward
        for idx in (0..<currentSectionIdx).reversed() {
            let sec = sections[idx]
            if let index = steps.firstIndex(where: { $0.id == sec.id }) {
                return index
            }
        }
        
        return 0
    }
    
    // Computed Steps
    private var steps: [ItinerarySection] {
        journey.sections?.filter { $0.type != "waiting" } ?? []
    }
    
    private var currentSection: ItinerarySection? {
        if steps.indices.contains(currentStepIndex) {
            return steps[currentStepIndex]
        }
        return nil
    }
    
    var body: some View {
        GeometryReader { geometry in
            GlassEffectContainer(spacing: 0.0) {
                ZStack {
                    // MAIN CONTENT LAYER
                    VStack {
                        // Top Bar (ETA & Exit) - Unified Glass Container
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Arrivée à \(formatTime(journey.arrival_date_time ?? ""))")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                Text(formatDuration(journey.duration ?? 0))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                if navigationManager.isSimulating {
                                    Button(action: {
                                        withAnimation {
                                            navigationManager.stopSimulation()
                                        }
                                    }) {
                                        Image(systemName: "stop.fill")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(.orange)
                                            .frame(width: 36, height: 36)
                                            .background(Color.orange.opacity(0.15), in: Circle())
                                    }
                                    .buttonStyle(.plain)
                                } else {
                                    Button(action: {
                                        withAnimation {
                                            navigationManager.startSimulation()
                                        }
                                    }) {
                                        Image(systemName: "play.fill")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(.green)
                                            .frame(width: 36, height: 36)
                                            .background(Color.green.opacity(0.15), in: Circle())
                                    }
                                    .buttonStyle(.plain)
                                }
                                
                                Button(action: {
                                    withAnimation {
                                        NavigationManager.shared.stopNavigation()
                                    }
                                }) {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.red)
                                        .frame(width: 36, height: 36)
                                        .background(Color.red.opacity(0.15), in: Circle())
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .padding(.horizontal)
                        .padding(.top, max(60, geometry.safeAreaInsets.top))
                    
                    Spacer()
                    
                    // TRACKING BUTTON & CARD CONTAINER
                    VStack(spacing: 10) {
                        // Tracking Button (Liquid Glass Style)
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    if userTrackingMode == .follow {
                                        userTrackingMode = .followWithHeading
                                    } else {
                                        userTrackingMode = .follow
                                    }
                                }
                            }) {
                                Image(systemName: userTrackingMode == .followWithHeading ? "location.north.line.fill" : "location.fill")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                    .frame(width: 50, height: 50)
                            }
                            .buttonStyle(.plain)
                            .glassEffect(.regular.interactive(), in: .circle)
                            .padding(.trailing, 24)
                        }
                        
                        // Bottom Card Area (Just Instruction)
                        if let step = currentSection {
                            stepCard(for: step)
                                .transition(.move(edge: .bottom))
                                .shadow(color: .black.opacity(0.2), radius: 20, y: 10)
                        }
                    }
                    .padding(.bottom, 100)
                }
                .ignoresSafeArea(edges: .bottom)
                
                // SIDEBAR SCHEMATIC VIEW (Floating Left)
                 if let step = currentSection, 
                    step.type == "public_transport", 
                    let stops = step.stop_date_times, 
                    !stops.isEmpty {
                      
                      let isWaiting: Bool = {
                          if case .waitingAtStation = navigationManager.state { return true }
                          return false
                      }()
                      let bottomPadding: CGFloat = isWaiting ? 430 : 310
                      let viewHeight = max(100, geometry.size.height - 100 - bottomPadding)
                      
                      HStack {
                          VerticalSchematicLineView(
                             color: Color(hex: step.display_informations?.color ?? "000000"),
                             stops: stops,
                             currentLegIndex: navigationManager.currentLegIndex,
                             progress: navigationManager.progress
                          )
                          .frame(width: 50, height: viewHeight)
                          .mask(
                              Rectangle()
                                  .frame(width: 600, height: viewHeight)
                                  .offset(x: 275)
                          )
                          .padding(.leading, 12)
                          
                          Spacer()
                      }
                      .padding(.top, 100)
                      .transition(.move(edge: .leading))
                      .zIndex(2)
                 }
                

            }
        }
    }
    }
    
    // MARK: - Step Card
    func stepCard(for step: ItinerarySection) -> some View {
        let lineHex = step.display_informations?.color ?? "007AFF"
        let lineColor = Color(hex: lineHex)
        
        return VStack(spacing: 20) {
            // Instruction Header
            HStack(alignment: .top, spacing: 16) {
                if step.type == "public_transport", let display = step.display_informations {
                    LineIcon(
                        type: display.transportType,
                        lineId: display.code ?? display.label ?? "?",
                        size: 50,
                        customColor: lineColor
                    )
                    .shadow(color: lineColor.opacity(0.5), radius: 8)
                } else if step.mode == "walking" {
                    Image(systemName: "figure.walk.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                } else if step.type == "transfer" {
                     Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                         .font(.system(size: 50))
                         .foregroundColor(.orange)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    if step.mode == "walking" {
                        Text("Marcher")
                            .font(.title).bold()
                            .foregroundColor(.white)
                        Text("Vers \(step.to?.name ?? "Destination")")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                    } else if let display = step.display_informations {
                        Text("Prendre \(display.commercial_mode ?? "Transport")")
                            .font(.title).bold()
                            .foregroundColor(.white)
                        Text("Direction \(display.direction ?? "")")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                    } else {
                         Text("Correspondance")
                            .font(.title).bold()
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                
                Button(action: nextStep) {
                     Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding()
                        .background(colorScheme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.06), in: Circle())
                }
                .buttonStyle(.plain)
            }
            
            Divider().background(Color.white.opacity(0.2))
            
            VStack(alignment: .leading, spacing: 12) {
                 if case .waitingAtStation = navigationManager.state {
                     Text("Choisissez votre train :")
                         .font(.subheadline)
                         .fontWeight(.bold)
                         .foregroundColor(.white.opacity(0.9))
                     
                     if navigationManager.departuresList.isEmpty {
                         HStack {
                             Text("Pas de départ temps réel disponible")
                                 .font(.caption)
                                 .foregroundColor(.white.opacity(0.6))
                             Spacer()
                             Button(action: {
                                 withAnimation {
                                     navigationManager.confirmBoarding()
                                 }
                             }) {
                                 Text("Démarrer")
                                     .font(.caption).bold()
                                     .foregroundColor(.white)
                                     .padding(.horizontal, 16)
                                     .padding(.vertical, 8)
                                     .background(Color.blue, in: Capsule())
                             }
                             .buttonStyle(.plain)
                         }
                     } else {
                         ScrollView(.horizontal, showsIndicators: false) {
                             HStack(spacing: 10) {
                                 ForEach(navigationManager.departuresList) { departure in
                                     let timeStr = formatTime(departure.stopDateTime.departureDateTime)
                                     let remaining = DateFormat.timeRemaining(from: departure.stopDateTime.departureDateTime)
                                     let isSelected = navigationManager.selectedDeparture?.id == departure.id
                                     
                                     Button(action: {
                                         withAnimation {
                                             navigationManager.selectDeparture(departure)
                                         }
                                     }) {
                                         VStack(alignment: .leading, spacing: 2) {
                                             Text(timeStr)
                                                 .font(.system(size: 13, weight: .bold))
                                             Text(remaining)
                                                 .font(.system(size: 10))
                                         }
                                         .padding(.horizontal, 12)
                                         .padding(.vertical, 6)
                                         .background(isSelected ? Color.blue.opacity(0.8) : Color.white.opacity(0.1))
                                         .foregroundColor(.white)
                                         .cornerRadius(8)
                                         .overlay(
                                             RoundedRectangle(cornerRadius: 8)
                                                 .stroke(isSelected ? Color.white : Color.clear, lineWidth: 1.5)
                                         )
                                     }
                                     .buttonStyle(.plain)
                                 }
                             }
                         }
                         
                         HStack {
                             if let selected = navigationManager.selectedDeparture {
                                 let remaining = DateFormat.timeRemaining(from: selected.stopDateTime.departureDateTime)
                                 Text("Départ auto dans : \(remaining)")
                                     .font(.caption)
                                     .foregroundColor(.green)
                                     .fontWeight(.semibold)
                             }
                             
                             Spacer()
                             
                             Button(action: {
                                 withAnimation {
                                     navigationManager.confirmBoarding()
                                 }
                             }) {
                                 Text("Démarrer maintenant")
                                     .font(.caption).bold()
                                     .foregroundColor(.white)
                                     .padding(.horizontal, 12)
                                     .padding(.vertical, 6)
                                     .background(Color.green.opacity(0.4), in: Capsule())
                             }
                             .buttonStyle(.plain)
                         }
                     }
                 } else {
                     HStack {
                         HStack {
                             Image(systemName: "clock")
                             Text("\(formatDuration(step.duration ?? 0))")
                         }
                         .padding(.horizontal, 12)
                         .padding(.vertical, 6)
                         .background(.ultraThinMaterial)
                         .cornerRadius(8)
                         .foregroundColor(.white.opacity(0.9))
                         
                         Spacer()
                         
                         Text("Étape \(currentStepIndex + 1)/\(steps.count)")
                             .font(.caption)
                             .foregroundColor(.white.opacity(0.6))
                     }
                 }
            }
        }
        .padding(24)
        .background(
            LinearGradient(
                colors: [lineColor.opacity(0.3), Color.black.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        )
        .glassEffect(.regular.interactive(), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(.horizontal)
    }
    
    func nextStep() {
        withAnimation {
            navigationManager.advanceToNextSection()
        }
    }
    
    func formatTime(_ isoDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            return timeFormatter.string(from: date)
        }
        return isoDate
    }
    
    func formatDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let mins = minutes % 60
        if hours > 0 {
            return "\(hours)h\(String(format: "%02d", mins))"
        }
        return "\(mins) min"
    }
}

// MARK: - Vertical Schematic Line View (Compact & Elegant)
struct VerticalSchematicLineView: View {
    let color: Color
    let stops: [ItineraryStopDateTime]
    var currentLegIndex: Int
    var progress: Double
    
    // Layout constants (compact)
    let stopHeight: CGFloat = 48
    let nodeSize: CGFloat = 8
    let lineWidth: CGFloat = 4
    let indicatorSize: CGFloat = 12
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                ZStack(alignment: .topLeading) {
                    // 1. Liste des stations (nœuds fixes et noms)
                    VStack(spacing: 0) {
                        ForEach(Array(stops.enumerated()), id: \.offset) { index, stop in
                            let isFirst = index == 0
                            let isLast = index == stops.count - 1
                            let isPassed = index < currentLegIndex
                            let isCurrent = index == currentLegIndex
                            
                            HStack(spacing: 12) {
                                // Left timeline node & segment
                                ZStack {
                                    VStack(spacing: 0) {
                                        Rectangle()
                                            .fill(color)
                                            .frame(width: lineWidth, height: stopHeight / 2)
                                            .opacity(isFirst ? 0 : 1)
                                        
                                        Rectangle()
                                            .fill(color)
                                            .frame(width: lineWidth, height: stopHeight / 2)
                                            .opacity(isLast ? 0 : 1)
                                    }
                                    
                                    Circle()
                                        .fill(isPassed ? color.opacity(0.4) : color)
                                        .frame(width: nodeSize, height: nodeSize)
                                }
                                .frame(width: 20)
                                
                                // Station Name label (incliné à 45 degrés vers le bas pour économiser de la largeur)
                                Text(stop.stop_point.name ?? "")
                                    .font(.system(size: 9.5, weight: isCurrent ? .bold : .medium))
                                    .foregroundColor(isCurrent ? .primary : (isPassed ? .secondary.opacity(0.8) : .primary))
                                    .fixedSize(horizontal: true, vertical: false)
                                    .rotationEffect(.degrees(45), anchor: .leading)
                                    .offset(x: 4, y: 4)
                                    .allowsHitTesting(false)
                            }
                            .frame(width: 44, height: stopHeight, alignment: .leading)
                            .id(index)
                        }
                    }
                    .padding(.leading, 12)
                    .padding(.vertical, 8)
                    
                    // 2. Le point blanc glissant en temps réel
                    if currentLegIndex < stops.count {
                        let currentY = (CGFloat(currentLegIndex) + 0.5 + CGFloat(progress)) * stopHeight + 8 // +8 pour le padding vertical
                        Circle()
                            .fill(.white)
                            .frame(width: indicatorSize, height: indicatorSize)
                            .shadow(color: color, radius: 4)
                            .offset(x: 10 + 12 - indicatorSize / 2, y: currentY - indicatorSize / 2)
                            .animation(.linear(duration: 1.0), value: currentY)
                    }
                }
            }
            .frame(width: 44)
            .scrollClipDisabled()
            .onAppear {
                withAnimation {
                    proxy.scrollTo(currentLegIndex, anchor: .center)
                }
            }
            .onChange(of: currentLegIndex) { _, newValue in
                withAnimation {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }
        }
    }
}

#Preview {
    ImmersiveNavigationView(
        journey: PreviewMockData.mockJourney,
        navigationMode: .constant(true),
        userTrackingMode: .constant(.follow)
    )
}



