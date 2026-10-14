import SwiftUI

struct ShaderAnimationView: View {
    let isLoading: Bool
    let station: MapStation?
    let customColors: [Color]?
    let showAmbientGradient: Bool
    
    @Environment(\.colorScheme) var colorScheme
    @State private var waveProgress: CGFloat
    @State private var relativeTimeOffset = Date().timeIntervalSinceReferenceDate - Double.random(in: 0...1000)
    
    @State private var isLowPowerMode: Bool
    
    init(isLoading: Bool, station: MapStation? = nil, customColors: [Color]? = nil, showAmbientGradient: Bool = true, forceLowPowerMode: Bool? = nil) {
        self.isLoading = isLoading
        self.station = station
        self.customColors = customColors
        self.showAmbientGradient = showAmbientGradient
        self._waveProgress = State(initialValue: isLoading ? 0.0 : 1.0)
        self._isLowPowerMode = State(initialValue: forceLowPowerMode ?? ProcessInfo.processInfo.isLowPowerModeEnabled)
    }
    
    var body: some View {
        Group {
            if isPreview || isLowPowerMode {
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
    
    private var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    private var staticBody: some View {
        let colors = getAmbientColors(for: colorScheme)
        
        return ZStack {
            // Base background matching the theme
            colorScheme == .dark ? Color.black : Color.white
            
            // 1. Static ambient background
            if showAmbientGradient && waveProgress > 0.0 {
                LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
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
    
    // Resolve and compute ambient shades of the station's line colors
    private func getAmbientColors(for scheme: ColorScheme) -> [Color] {
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
        let env = EnvironmentValues()
        let c1 = self.resolve(in: env)
        let c2 = other.resolve(in: env)
        let t = Float(amount)
        
        return Color(
            red: Double(c1.red * (1.0 - t) + c2.red * t),
            green: Double(c1.green * (1.0 - t) + c2.green * t),
            blue: Double(c1.blue * (1.0 - t) + c2.blue * t),
            opacity: Double(c1.opacity * (1.0 - t) + c2.opacity * t)
        )
    }
}

#Preview("Shader Only (Normal Mode)") {
    ShaderAnimationView(isLoading: false, showAmbientGradient: false, forceLowPowerMode: false)
}

#Preview("Linear Gradient (Eco Mode)") {
    ShaderAnimationView(isLoading: false, showAmbientGradient: true, forceLowPowerMode: true)
}
