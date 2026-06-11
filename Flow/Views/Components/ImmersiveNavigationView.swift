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
                                        HStack(spacing: 4) {
                                            Image(systemName: "stop.fill")
                                            Text("Arrêter")
                                        }
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.orange)
                                        .padding(.horizontal, 12)
                                        .frame(height: 36)
                                        .background(Color.orange.opacity(0.15), in: Capsule())
                                    }
                                    .buttonStyle(.plain)
                                } else {
                                    Button(action: {
                                        withAnimation {
                                            navigationManager.startSimulation()
                                        }
                                    }) {
                                        HStack(spacing: 4) {
                                            Image(systemName: "play.fill")
                                            Text("Simuler")
                                        }
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                        .padding(.horizontal, 12)
                                        .frame(height: 36)
                                        .background(Color.green.opacity(0.15), in: Capsule())
                                    }
                                    .buttonStyle(.plain)
                                }
                                
                                Button(action: {
                                    withAnimation {
                                        NavigationManager.shared.stopNavigation()
                                    }
                                }) {
                                    Text("Quitter")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .padding(.horizontal, 14)
                                        .frame(height: 36)
                                        .background(Color.red.opacity(0.15), in: Capsule())
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
                      
                      HStack {
                          VerticalSchematicLineView(
                             color: Color(hex: step.display_informations?.color ?? "000000"),
                             stops: stops,
                             currentLegIndex: navigationManager.currentLegIndex,
                             progress: navigationManager.progress
                          )
                          .padding(.leading, 12)
                          
                          Spacer()
                      }
                      .padding(.top, 180)
                      .transition(.move(edge: .leading))
                      .zIndex(2)
                 }
                
                // BOARDING PROMPT OVERLAY
                if navigationManager.showBoardingPrompt {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("Êtes-vous monté dans le transport ?")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                withAnimation {
                                    navigationManager.showBoardingPrompt = false
                                }
                            }) {
                                Text("Pas encore")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                            
                            Divider()
                                .frame(height: 30)
                            
                            Button(action: {
                                withAnimation {
                                    navigationManager.showBoardingPrompt = false
                                    navigationManager.confirmBoarding()
                                }
                            }) {
                                Text("Oui, c'est parti !")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .background(Color.white.opacity(0.08), in: Capsule())
                    }
                    .padding(30)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 24))
                    .padding(.horizontal, 40)
                    .transition(.scale.combined(with: .opacity))
                    .zIndex(100)
                }
            }
        }
    }
    }
    
    // MARK: - Step Card
    func stepCard(for step: ItinerarySection) -> some View {
        let lineHex = step.display_informations?.color ?? "007AFF"
        let lineColor = Color(hex: lineHex)
        let textColor = Color(hex: step.display_informations?.text_color ?? "FFFFFF")
        
        return VStack(spacing: 20) {
            // Instruction Header
            HStack(alignment: .top, spacing: 16) {
                if step.type == "public_transport", let display = step.display_informations {
                    ZStack {
                        Circle()
                            .fill(lineColor)
                            .frame(width: 50, height: 50)
                            .shadow(color: lineColor.opacity(0.5), radius: 8)
                        
                        Text(display.code ?? display.label ?? "?")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(textColor)
                    }
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
            
            HStack {
                 if case .waitingAtStation = navigationManager.state {
                     Button(action: {
                         withAnimation {
                             navigationManager.confirmBoarding()
                         }
                     }) {
                         HStack {
                             Image(systemName: "figure.wave")
                             Text("Je suis monté")
                                 .fontWeight(.bold)
                         }
                         .foregroundColor(.green)
                         .frame(maxWidth: .infinity)
                         .padding()
                     }
                     .buttonStyle(.plain)
                     .background(Color.green.opacity(0.15), in: Capsule())
                 } else {
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
    let stopHeight: CGFloat = 40
    let nodeSize: CGFloat = 10
    let lineWidth: CGFloat = 4
    let indicatorSize: CGFloat = 14
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
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
                                    .fill(isPassed ? color.opacity(0.5) : color)
                                    .frame(width: nodeSize, height: nodeSize)
                                
                                if isCurrent {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: indicatorSize, height: indicatorSize)
                                        .shadow(color: color, radius: 4)
                                }
                            }
                            .frame(width: 20)
                            
                            // Station Name label (horizontal)
                            Text(stop.stop_point.name ?? "")
                                .font(.system(size: 11, weight: isCurrent ? .bold : .medium))
                                .foregroundColor(isCurrent ? .primary : (isPassed ? .secondary : .primary))
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            
                            Spacer()
                        }
                        .frame(height: stopHeight)
                        .id(index)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
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
        .frame(width: 170, height: 260)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ImmersiveNavigationView(
        journey: PreviewMockData.mockJourney,
        navigationMode: .constant(true),
        userTrackingMode: .constant(.follow)
    )
}

