import SwiftUI

struct ShaderAnimationView: View {
    let isLoading: Bool
    let station: MapStation?
    let customColors: [Color]?
    let showMeshGradient: Bool
    
    @Environment(\.colorScheme) var colorScheme
    @State private var waveProgress: CGFloat
    @State private var relativeTimeOffset = Date().timeIntervalSinceReferenceDate - Double.random(in: 0...1000)
    
    @State private var isLowPowerMode: Bool
    
    // Random parameters to ensure the mesh points move differently every time the screen loads
    struct AnimationConfig {
        let dx1: Float = Float.random(in: 0.0...3.0)
        let dy1: Float = Float.random(in: 0.0...3.0)
        let fx1: Float = Float.random(in: 0.7...1.3)
        let fy1: Float = Float.random(in: 0.7...1.3)
        
        let dx2: Float = Float.random(in: 0.0...3.0)
        let dy2: Float = Float.random(in: 0.0...3.0)
        let fx2: Float = Float.random(in: 0.7...1.3)
        let fy2: Float = Float.random(in: 0.7...1.3)
        
        let dx3: Float = Float.random(in: 0.0...3.0)
        let dy3: Float = Float.random(in: 0.0...3.0)
        let fx3: Float = Float.random(in: 0.7...1.3)
        let fy3: Float = Float.random(in: 0.7...1.3)
    }
    @State private var config = AnimationConfig()
    
    init(isLoading: Bool, station: MapStation? = nil, customColors: [Color]? = nil, showMeshGradient: Bool = true, forceLowPowerMode: Bool? = nil) {
        self.isLoading = isLoading
        self.station = station
        self.customColors = customColors
        self.showMeshGradient = showMeshGradient
        self._waveProgress = State(initialValue: isLoading ? 0.0 : 1.0)
        self._isLowPowerMode = State(initialValue: forceLowPowerMode ?? ProcessInfo.processInfo.isLowPowerModeEnabled)
    }
    
    var body: some View {
        Group {
            if isLowPowerMode {
                staticBody
            } else {
                animatedBody
            }
        }
        .ignoresSafeArea()
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name.NSProcessInfoPowerStateDidChange)) { _ in
            self.isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
        }
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
    
    private var staticBody: some View {
        let meshColors = getMeshColors(for: colorScheme)
        let staticPoints: [SIMD2<Float>] = [
            SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
            SIMD2<Float>(0.0, 0.5), SIMD2<Float>(0.5, 0.5), SIMD2<Float>(1.0, 0.5),
            SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0)
        ]
        
        return ZStack {
            // Base background matching the theme
            colorScheme == .dark ? Color.black : Color.white
            
            // 1. Mesh Gradient (Static ambient background)
            if showMeshGradient && waveProgress > 0.0 {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: staticPoints,
                    colors: meshColors,
                    background: colorScheme == .dark ? .black : .white
                )
                .opacity(Double(waveProgress))
            }
            
            // 2. Static black background if loading
            if isLoading {
                Color.black.opacity(0.8)
            }
        }
    }
    
    private var animatedBody: some View {
        TimelineView(.periodic(from: .now, by: 1.0 / 30.0)) { timeline in
            let date = timeline.date
            let elapsed = date.timeIntervalSinceReferenceDate - relativeTimeOffset
            let timeVal = Float(elapsed)
            
            GeometryReader { geometry in
                ZStack {
                    if isLoading {
                        Rectangle()
                            .fill(Color.black)
                            .colorEffect(
                                ShaderLibrary.shaderLoading(
                                    .float(timeVal * 3.0), // match original speed
                                    .float2(geometry.size)
                                )
                            )
                    } else {
                        Rectangle()
                            .fill(Color.black)
                            .colorEffect(
                                ShaderLibrary.shaderActive(
                                    .float(timeVal * 3.0), // match original speed
                                    .float2(geometry.size),
                                    .float(Float(waveProgress))
                                )
                            )
                    }
                }
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

#Preview("Shader Only (Normal Mode)") {
    ShaderAnimationView(isLoading: false, showMeshGradient: false, forceLowPowerMode: false)
}

#Preview("Mesh Gradient (Eco Mode)") {
    ShaderAnimationView(isLoading: false, showMeshGradient: true, forceLowPowerMode: true)
}
