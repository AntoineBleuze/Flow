import SwiftUI

struct ShaderAnimationView: View {
    let isLoading: Bool
    let station: MapStation?
    let customColors: [Color]?
    
    @Environment(\.colorScheme) var colorScheme
    @State private var waveProgress: CGFloat
    @State private var relativeTimeOffset = Date().timeIntervalSinceReferenceDate
    
    init(isLoading: Bool, station: MapStation? = nil, customColors: [Color]? = nil) {
        self.isLoading = isLoading
        self.station = station
        self.customColors = customColors
        self._waveProgress = State(initialValue: isLoading ? 0.0 : 1.0)
    }
    
    var body: some View {
        TimelineView(.animation) { timeline in
            let date = timeline.date
            let elapsed = date.timeIntervalSinceReferenceDate - relativeTimeOffset
            let timeVal = Float(elapsed)
            
            let meshColors = getMeshColors(for: colorScheme)
            
            // Generate animated mesh points using the unpredictable oscillation pattern
            let animatedPoints: [SIMD2<Float>] = [
                // Top row
                SIMD2<Float>(0.0, 0.0),
                SIMD2<Float>(0.5, 0.0),
                SIMD2<Float>(1.0, 0.0),
                
                // Middle row (animated asynchronously)
                SIMD2<Float>(sinOSC(time: timeVal, d: 0.2, f: 1.0), 0.5 + cosOSC(time: timeVal, d: 0.4, f: 0.8)),
                SIMD2<Float>(0.5 + sinOSC(time: timeVal, d: 0.1, f: 1.2), 0.5 + cosOSC(time: timeVal, d: 0.5, f: 0.9)),
                SIMD2<Float>(1.0 + sinOSC(time: timeVal, d: 0.3, f: 1.1), 0.5 + cosOSC(time: timeVal, d: 0.2, f: 1.3)),
                
                // Bottom row
                SIMD2<Float>(0.0, 1.0),
                SIMD2<Float>(0.5, 1.0),
                SIMD2<Float>(1.0, 1.0)
            ]
            
            GeometryReader { geometry in
                ZStack {
                    // Base background matching the theme
                    colorScheme == .dark ? Color.black : Color.white
                    
                    // 1. Mesh Gradient (Gently animated ambient background)
                    if waveProgress > 0.0 {
                        MeshGradient(
                            width: 3,
                            height: 3,
                            points: animatedPoints,
                            colors: meshColors,
                            background: colorScheme == .dark ? .black : .white
                        )
                        .opacity(Double(waveProgress))
                    }
                    
                    // 2. Metal Shader (Glowing rings and wave)
                    if isLoading || waveProgress < 1.0 {
                        Rectangle()
                            .fill(Color.black)
                            .colorEffect(
                                ShaderLibrary.shaderAnimation(
                                    .float(timeVal * 3.0), // match original speed
                                    .float2(geometry.size),
                                    .float(Float(waveProgress))
                                )
                            )
                            .opacity(isLoading ? 1.0 : Double(1.0 - waveProgress))
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onChange(of: isLoading) { oldValue, newValue in
            if newValue {
                // Instantly reset wave progress to hide mesh gradient when loading starts
                waveProgress = 0.0
            } else if oldValue == true && newValue == false {
                // Trigger transition to reveal mesh gradient when loading finishes
                triggerWave()
            }
        }
    }
    
    private func triggerWave() {
        waveProgress = 0.0
        withAnimation(.easeOut(duration: 1.5)) {
            waveProgress = 1.0
        }
    }
    
    // Oscillation helpers
    private func sinOSC(time: Float, d: Float, f: Float) -> Float {
        return sin(time * f + d) * 0.15
    }

    private func cosOSC(time: Float, d: Float, f: Float) -> Float {
        return cos(time * f + d) * 0.15
    }
    
    // Resolve and compute ambient shades of the station's line colors
    private func getMeshColors(for scheme: ColorScheme) -> [Color] {
        let target = scheme == .dark ? Color.black : Color.white
        
        let rawColors: [Color]
        if let customColors = customColors, !customColors.isEmpty {
            rawColors = customColors
        } else if let station = station, !station.lines.isEmpty {
            rawColors = station.lines.map { resolveLineColor($0.name, type: $0.type) }
        } else {
            // Default ambient colors
            rawColors = [Color.blue, Color.purple, Color.indigo, Color.cyan]
        }
        
        var finalColors: [Color] = []
        if rawColors.count == 1, let singleColor = rawColors.first {
            // Generate shades of this single color mixed with the target background
            let mixtures: [CGFloat] = [0.4, 0.5, 0.6, 0.5, 0.7, 0.8, 0.6, 0.8, 0.9]
            for i in 0..<9 {
                finalColors.append(singleColor.mixed(with: target, amount: mixtures[i]))
            }
        } else {
            // Cycle through the colors and mix with target background
            for i in 0..<9 {
                let baseColor = rawColors[i % rawColors.count]
                finalColors.append(baseColor.mixed(with: target, amount: 0.65)) // 65% background blend for a subtle texture
            }
        }
        return finalColors
    }
}

// Helper to blend colors smoothly
extension Color {
    func mixed(with other: Color, amount: CGFloat) -> Color {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        #if canImport(UIKit)
        UIColor(self).getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        UIColor(other).getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        #endif
        
        return Color(
            red: Double(r1 * (1 - amount) + r2 * amount),
            green: Double(g1 * (1 - amount) + g2 * amount),
            blue: Double(b1 * (1 - amount) + b2 * amount),
            opacity: Double(a1 * (1 - amount) + a2 * amount)
        )
    }
}

#Preview {
    ShaderAnimationView(isLoading: false, station: nil)
}
