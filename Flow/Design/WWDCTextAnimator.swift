import SwiftUI



/// An animator component that renders a string with fluid transitions of font weight and width,
/// inspired by Apple WWDC typography animations.
struct WWDCTextAnimator: View {
    let text: String
    var fontSize: CGFloat = 36
    var animationType: AnimationType = .reveal
    var speed: Double = 1.0
    var delay: Double = 0.0
    
    enum AnimationType {
        case reveal      // One-shot entrance animation (fades in + S-curve ripple)
        case pulseOnce   // One-shot wave ripple over already visible bold text
        case pulse       // Continuous wave ripple over visible text
    }
    
    @State private var entryProgress: CGFloat = 0.0
    
    // Split the text into words
    private var words: [String] {
        text.components(separatedBy: " ")
    }
    
    // Helper to calculate absolute character indices
    private func getCharOffsetStart(for wordIndex: Int) -> Int {
        var count = 0
        for i in 0..<wordIndex {
            count += words[i].count
        }
        return count
    }
    
    private var totalChars: Int {
        text.replacingOccurrences(of: " ", with: "").count
    }
    
    var body: some View {
        Group {
            switch animationType {
            case .reveal:
                HStack(spacing: fontSize * 0.24) {
                    ForEach(Array(words.enumerated()), id: \.offset) { wordIndex, word in
                        Text(word)
                            .font(.system(size: fontSize))
                            .fontWeight(.bold)
                            .fontWidth(.standard)
                            .opacity(0.0)
                            .overlay(
                                HStack(spacing: 0) {
                                    ForEach(Array(word.enumerated()), id: \.offset) { charIndex, char in
                                        let absoluteIndex = getCharOffsetStart(for: wordIndex) + charIndex
                                        WWDCTextCharacterView(
                                            char: char,
                                            index: absoluteIndex,
                                            totalChars: totalChars,
                                            progress: entryProgress,
                                            baseFontSize: fontSize,
                                            animationType: .reveal
                                        )
                                    }
                                },
                                alignment: .center
                            )
                    }
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .onAppear {
                    // Start reveal animation
                    withAnimation(.spring(response: 1.0 * speed, dampingFraction: 0.82).delay(delay)) {
                        entryProgress = 1.0
                    }
                }
                
            case .pulseOnce:
                HStack(spacing: fontSize * 0.24) {
                    ForEach(Array(words.enumerated()), id: \.offset) { wordIndex, word in
                        Text(word)
                            .font(.system(size: fontSize))
                            .fontWeight(.bold)
                            .fontWidth(.standard)
                            .opacity(0.0)
                            .overlay(
                                HStack(spacing: 0) {
                                    ForEach(Array(word.enumerated()), id: \.offset) { charIndex, char in
                                        let absoluteIndex = getCharOffsetStart(for: wordIndex) + charIndex
                                        WWDCTextCharacterView(
                                            char: char,
                                            index: absoluteIndex,
                                            totalChars: totalChars,
                                            progress: entryProgress,
                                            baseFontSize: fontSize,
                                            animationType: .pulseOnce
                                        )
                                    }
                                },
                                alignment: .center
                            )
                    }
                }
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .onAppear {
                    // Start pulseOnce animation (runs once)
                    withAnimation(.spring(response: 1.0 * speed, dampingFraction: 0.82).delay(delay)) {
                        entryProgress = 1.0
                    }
                }
                
            case .pulse:
                // Continuous wave animated via TimelineView (very high performance)
                TimelineView(.animation) { timelineContext in
                    let time = timelineContext.date.timeIntervalSinceReferenceDate * speed
                    // Continuous wave progress looping from 0 to 1
                    let waveProgress = CGFloat((time.truncatingRemainder(dividingBy: 2.0)) / 2.0)
                    HStack(spacing: fontSize * 0.24) {
                        ForEach(Array(words.enumerated()), id: \.offset) { wordIndex, word in
                            Text(word)
                                .font(.system(size: fontSize))
                                .fontWeight(.bold)
                                .fontWidth(.standard)
                                .opacity(0.0)
                                .overlay(
                                    HStack(spacing: 0) {
                                        ForEach(Array(word.enumerated()), id: \.offset) { charIndex, char in
                                            let absoluteIndex = getCharOffsetStart(for: wordIndex) + charIndex
                                            WWDCTextCharacterView(
                                                char: char,
                                                index: absoluteIndex,
                                                totalChars: totalChars,
                                                progress: waveProgress,
                                                baseFontSize: fontSize,
                                                animationType: .pulse
                                            )
                                        }
                                    },
                                    alignment: .center
                                )
                        }
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                }
            }
        }
    }
}

/// Renders a single character with custom width and weight based on the animation wave position.
struct WWDCTextCharacterView: View, Animatable {
    let char: Character
    let index: Int
    let totalChars: Int
    var progress: CGFloat
    let baseFontSize: CGFloat
    let animationType: WWDCTextAnimator.AnimationType
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    var body: some View {
        let fraction = totalChars > 1 ? CGFloat(index) / CGFloat(totalChars - 1) : 0.0
        
        let opacity: Double
        let fontWidth: Font.Width
        let fontWeight: Font.Weight
        let scale: CGFloat
        
        if animationType == .pulseOnce || animationType == .pulse {
            // S-shaped sine wave curve (dip-and-swell) over fully visible bold text
            let waveCenter = progress * 1.5 - 0.25 // Travels from -0.25 to 1.25
            let signedDistance = fraction - waveCenter
            let maxDistance: CGFloat = 0.25
            
            if abs(signedDistance) < maxDistance {
                // u ranges from -1.0 to 1.0
                let u = signedDistance / maxDistance
                // factor is a sine wave: negative on left, positive on right
                let factor = sin(u * .pi)
                
                opacity = 1.0
                
                if factor < 0 {
                    // Dip phase: condensed, thin, slightly smaller scale
                    fontWidth = Font.Width(1.0 + (factor * 0.40)) // shrinks down to 0.60
                    scale = 1.0 + (factor * 0.10)                 // shrinks down to 0.90
                    
                    if factor < -0.7 {
                        fontWeight = .light
                    } else if factor < -0.3 {
                        fontWeight = .medium
                    } else {
                        fontWeight = .bold
                    }
                } else {
                    // Swell phase: expanded, thick, larger scale
                    fontWidth = Font.Width(1.0 + (factor * 0.50)) // expands up to 1.50
                    scale = 1.0 + (factor * 0.12)                 // expands up to 1.12
                    
                    if factor > 0.7 {
                        fontWeight = .black
                    } else if factor > 0.3 {
                        fontWeight = .heavy
                    } else {
                        fontWeight = .bold
                    }
                }
            } else {
                // Baseline: bold and standard width/scale
                opacity = 1.0
                scale = 1.0
                fontWidth = .standard
                fontWeight = .bold
            }
        } else {
            // One-shot entrance reveal (fades in + S-curve ripple)
            let waveCenter = progress * 1.5 - 0.25 // Travels from -0.25 to 1.25
            let waveHalfWidth: CGFloat = 0.20
            let startPoint = fraction - waveHalfWidth
            let endPoint = fraction + waveHalfWidth
            
            if waveCenter < startPoint {
                // Not reached yet: transparent but starting at bold layout
                opacity = 0.0
                fontWidth = .standard
                fontWeight = .bold
                scale = 0.90
            } else if waveCenter > endPoint {
                // Fully passed and settled: bold and standard width/scale
                opacity = 1.0
                fontWidth = .standard
                fontWeight = .bold
                scale = 1.0
            } else {
                // Inside the wave: morphing
                let waveProgress = (waveCenter - startPoint) / (2.0 * waveHalfWidth) // 0 to 1
                
                opacity = min(1.0, waveProgress * 2.5) // Fades in quickly
                
                if waveProgress < 0.45 {
                    let t = waveProgress / 0.45
                    scale = 0.90 + (t * 0.22) // swells to 1.12
                    fontWidth = Font.Width(1.0 + (t * 0.45)) // expands to 1.45
                    
                    if t < 0.5 {
                        fontWeight = .bold
                    } else {
                        fontWeight = .heavy
                    }
                } else {
                    let t = (waveProgress - 0.45) / 0.55
                    scale = 1.12 - (t * 0.12) // settles to 1.0
                    fontWidth = Font.Width(1.45 - (t * 0.45)) // settles to 1.0
                    
                    if t < 0.5 {
                        fontWeight = .black
                    } else {
                        fontWeight = .bold
                    }
                }
            }
        }
        
        return Text(String(char))
            .font(.system(size: baseFontSize))
            .fontWeight(fontWeight)
            .fontWidth(fontWidth)
            .scaleEffect(scale)
            .opacity(opacity)
            .contentTransition(.interpolate) // Native iOS 17+ glyph interpolation
    }
}

// MARK: - PREVIEW DEMO VIEW

struct WWDCTextAnimatorDemo: View {
    @State private var resetID = UUID()
    @State private var speed: Double = 1.0
    @State private var selectedType: WWDCTextAnimator.AnimationType = .pulseOnce
    
    var body: some View {
        VStack(spacing: 30) {
            Text("WWDC Typography Preview")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            // Preview card with matching TVOS-orange theme
            VStack {
                WWDCTextAnimator(
                    text: "Prepare your tvOS apps for Dynamic Type",
                    fontSize: 32,
                    animationType: selectedType,
                    speed: speed,
                    delay: 0.1
                )
                .id(resetID) // Force redraw on reset
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(40)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .background(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color(red: 0.95, green: 0.45, blue: 0.05)) // Apple Orange
                    .shadow(color: Color(red: 0.95, green: 0.45, blue: 0.05).opacity(0.4), radius: 15, x: 0, y: 10)
            )
            .padding(.horizontal)
            
            Spacer()
            
            // Interactive Controls
            VStack(spacing: 20) {
                Picker("Mode", selection: $selectedType) {
                    Text("Reveal").tag(WWDCTextAnimator.AnimationType.reveal)
                    Text("Pulse Once").tag(WWDCTextAnimator.AnimationType.pulseOnce)
                    Text("Pulse Loop").tag(WWDCTextAnimator.AnimationType.pulse)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                HStack {
                    Text("Vitesse: \(String(format: "%.1f", speed))x")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(width: 100, alignment: .leading)
                    
                    Slider(value: $speed, in: 0.3...2.5, step: 0.1)
                }
                .padding(.horizontal)
                
                if selectedType != .pulse {
                    Button(action: {
                        resetID = UUID() // Force refresh
                    }) {
                        Label("Rejouer l'animation", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding()
        }
        .padding(.vertical)
    }
}

#Preview {
    WWDCTextAnimatorDemo()
}
