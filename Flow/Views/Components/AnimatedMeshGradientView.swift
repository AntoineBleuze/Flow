import SwiftUI

struct AnimatedMeshGradientView: View {
    let colors: [Color]
    var speed: Float = 1.0
    var intensity: Float = 0.15
    
    @Environment(\.colorScheme) var colorScheme
    @State private var relativeTimeOffset = Date().timeIntervalSinceReferenceDate
    
    @State private var isLowPowerMode = ProcessInfo.processInfo.isLowPowerModeEnabled
    
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
    }
    
    private var staticBody: some View {
        let meshColors = getMeshColors(for: colorScheme)
        let staticPoints: [SIMD2<Float>] = [
            SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
            SIMD2<Float>(0.0, 0.5), SIMD2<Float>(0.5, 0.5), SIMD2<Float>(1.0, 0.5),
            SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0)
        ]
        
        return MeshGradient(
            width: 3,
            height: 3,
            points: staticPoints,
            colors: meshColors,
            background: colorScheme == .dark ? .black : .white
        )
    }
    
    private var animatedBody: some View {
        TimelineView(.periodic(from: .now, by: 1.0 / 30.0)) { timeline in
            let date = timeline.date
            let elapsed = date.timeIntervalSinceReferenceDate - relativeTimeOffset
            let timeVal = Float(elapsed) * speed
            
            let meshColors = getMeshColors(for: colorScheme)
            
            let animatedPoints: [SIMD2<Float>] = [
                // Top row
                SIMD2<Float>(0.0, 0.0),
                SIMD2<Float>(0.5, 0.0),
                SIMD2<Float>(1.0, 0.0),
                
                // Middle row (animated asynchronously)
                SIMD2<Float>(sinOSC(time: timeVal, d: 0.2, f: 0.8), 0.5 + cosOSC(time: timeVal, d: 0.4, f: 0.6)),
                SIMD2<Float>(0.5 + sinOSC(time: timeVal, d: 0.1, f: 1.0), 0.5 + cosOSC(time: timeVal, d: 0.5, f: 0.7)),
                SIMD2<Float>(1.0 + sinOSC(time: timeVal, d: 0.3, f: 0.9), 0.5 + cosOSC(time: timeVal, d: 0.2, f: 1.1)),
                
                // Bottom row
                SIMD2<Float>(0.0, 1.0),
                SIMD2<Float>(0.5, 1.0),
                SIMD2<Float>(1.0, 1.0)
            ]
            
            MeshGradient(
                width: 3,
                height: 3,
                points: animatedPoints,
                colors: meshColors,
                background: colorScheme == .dark ? .black : .white
            )
        }
    }
    
    // Oscillation helpers
    private func sinOSC(time: Float, d: Float, f: Float) -> Float {
        return sin(time * f + d) * intensity
    }

    private func cosOSC(time: Float, d: Float, f: Float) -> Float {
        return cos(time * f + d) * intensity
    }
    
    private func getMeshColors(for scheme: ColorScheme) -> [Color] {
        let target = scheme == .dark ? Color.black : Color.white
        let baseColors = colors.isEmpty ? [.blue, .purple, .indigo, .cyan] : colors
        
        var finalColors: [Color] = []
        if baseColors.count == 1, let singleColor = baseColors.first {
            let mixtures: [CGFloat] = [0.4, 0.5, 0.6, 0.5, 0.7, 0.8, 0.6, 0.8, 0.9]
            for i in 0..<9 {
                finalColors.append(singleColor.mixed(with: target, amount: mixtures[i]))
            }
        } else {
            for i in 0..<9 {
                let baseColor = baseColors[i % baseColors.count]
                finalColors.append(baseColor.mixed(with: target, amount: 0.65))
            }
        }
        return finalColors
    }
}

#Preview {
    AnimatedMeshGradientView(colors: [.blue, .purple, .indigo, .cyan])
}
