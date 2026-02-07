import SwiftUI
import CoreLocation
import MapKit

struct ImmersiveNavigationView: View {
    let journey: Journey
    @Binding var navigationMode: Bool
    @Binding var userTrackingMode: MKUserTrackingMode
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @State private var currentStepIndex: Int = 0
    
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
        ZStack {
            // MAIN CONTENT LAYER
            VStack {
                // Top Bar (ETA & Exit)
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Arrivée à \(formatTime(journey.arrival_date_time ?? ""))")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(formatDuration(journey.duration ?? 0))
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .background(.regularMaterial)
                    .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 16))
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            NavigationManager.shared.stopNavigation()
                        }
                    }) {
                        Text("Quitter")
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.red.gradient)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 60)
                
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
                                .padding(16)
                                .background(.regularMaterial)
                                .glassEffect(.standard.interactive(), in: Circle()) // Liquid Glass
                                .shadow(radius: 8)
                        }
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
            .edgesIgnoringSafeArea(.bottom)
            
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
                     // No constraining frame - let the view size itself
                     .padding(.leading, 12)
                     .padding(.bottom, 300)
                     
                     Spacer()
                 }
                 .padding(.top, 150) // Increased to move schematic down
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
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            withAnimation {
                                navigationManager.showBoardingPrompt = false
                            }
                        }) {
                            Text("Pas encore")
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.ultraThinMaterial)
                                .glassEffect(.standard.interactive(), in: RoundedRectangle(cornerRadius: 12))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            withAnimation {
                                navigationManager.showBoardingPrompt = false
                                navigationManager.confirmBoarding()
                            }
                        }) {
                            Text("Oui, c'est parti !")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green.gradient)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(30)
                .background(.regularMaterial)
                .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal, 40)
                .transition(.scale.combined(with: .opacity))
                .zIndex(100)
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
                        .glassEffect(.standard.interactive(), in: Circle())
                } else if step.type == "transfer" {
                     Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                         .font(.system(size: 50))
                         .foregroundColor(.orange)
                         .glassEffect(.standard.interactive(), in: Circle())
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
                        .foregroundColor(.white)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
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
                         .frame(maxWidth: .infinity)
                         .padding()
                         .background(Color.green.gradient)
                         .foregroundColor(.white)
                         .cornerRadius(12)
                         .shadow(radius: 5)
                     }
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
            ZStack {
                Rectangle().fill(.ultraThinMaterial)
                LinearGradient(
                    colors: [lineColor.opacity(0.3), Color.black.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        )
        .glassEffect(.standard.interactive(), in: RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal)
    }
    
    func nextStep() {
        if currentStepIndex < steps.count - 1 {
            withAnimation { currentStepIndex += 1 }
        } else {
            NavigationManager.shared.stopNavigation()
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
    let stopHeight: CGFloat = 45 // Reduced for more compact display
    let nodeSize: CGFloat = 10
    let lineWidth: CGFloat = 4
    let indicatorSize: CGFloat = 16
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // LINE TRACK (Glass Pill)
                    ZStack(alignment: .top) {
                        // The line backbone
                        VStack(spacing: 0) {
                            ForEach(Array(stops.enumerated()), id: \.offset) { index, stop in
                                VStack(spacing: 0) {
                                    // Line Segment Before
                                    Rectangle()
                                        .fill(color)
                                        .frame(width: lineWidth, height: 17)
                                        .opacity(index == 0 ? 0 : 1)
                                    
                                    // Node
                                    Circle()
                                        .fill(color)
                                        .frame(width: nodeSize, height: nodeSize)
                                    
                                    // Line Segment After
                                    Rectangle()
                                        .fill(color)
                                        .frame(width: lineWidth, height: 18)
                                        .opacity(index == stops.count - 1 ? 0 : 1)
                                }
                                .frame(height: stopHeight)
                                .id(index)
                            }
                        }
                        .padding(.vertical, 10)
                        
                        // User Indicator
                        let baseY: CGFloat = 10 + 17 + (nodeSize / 2)
                        let travelY = CGFloat(currentLegIndex) * stopHeight + CGFloat(progress * stopHeight)
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: indicatorSize, height: indicatorSize)
                            .shadow(color: color, radius: 5)
                            .offset(y: baseY + travelY - (indicatorSize / 2))
                    }
                    .frame(width: 28)
                    .background(.ultraThinMaterial.opacity(0.5))
                    .glassEffect(.standard, in: Capsule())
                    
                    // STATION LABELS (Angled, shifted right to avoid overlap)
                    ZStack(alignment: .topLeading) {
                        ForEach(Array(stops.enumerated()), id: \.offset) { index, stop in
                            Text(stop.stop_point.name ?? "")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .fixedSize()
                                .rotationEffect(.degrees(50), anchor: .leading) // Angled downward
                                .offset(
                                    x: 18, // Increased from 8 to prevent overlap with pill
                                    y: 10 + 17 + (nodeSize / 2) + CGFloat(index) * stopHeight - 5
                                )
                        }
                    }
                    .frame(width: 110)
                }
            }
        }
    }
}
