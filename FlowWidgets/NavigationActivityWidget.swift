import ActivityKit
import WidgetKit
import SwiftUI

struct NavigationActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NavigationActivityAttributes.self) { context in
            // --- Lock Screen / Banner UI ---
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.blue)
                    Text("Navigation")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    Spacer()
                    if let remaining = context.state.remainingTime {
                        Text(remaining)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                    }
                }
                
                HStack(alignment: .center, spacing: 12) {
                    // Icon (Line or Walking)
                    if let lineName = context.state.lineName, let lineColor = context.state.lineColor {
                        ZStack {
                            Circle()
                                .fill(Color(hex: lineColor))
                                .frame(width: 36, height: 36)
                            Text(lineName)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color(hex: context.state.textColor ?? "FFFFFF"))
                        }
                    } else {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .frame(width: 36, height: 36)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(context.state.currentInstruction)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        
                        if let direction = context.state.direction {
                            Text("vers \(direction)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
                
                if !context.state.nextDepartures.isEmpty {
                    Divider()
                        .background(Color.white.opacity(0.15))
                    
                    HStack {
                        Text("Prochains départs:")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Spacer()
                        ForEach(context.state.nextDepartures.prefix(3), id: \.self) { time in
                            Text(time)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.green)
                                .monospacedDigit()
                        }
                    }
                }
                
                if context.state.stops != nil {
                    HorizontalLinePlanView(
                        stops: context.state.stops,
                        currentLegIndex: context.state.currentLegIndex,
                        progress: context.state.progress,
                        lineColor: context.state.lineColor
                    )
                    .padding(.top, 2)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.black.opacity(0.85))
            
        } dynamicIsland: { context in
            DynamicIsland {
                // --- Expanded UI ---
                DynamicIslandExpandedRegion(.leading) {
                    if let lineName = context.state.lineName, let lineColor = context.state.lineColor {
                        ZStack {
                            Circle()
                                .fill(Color(hex: lineColor))
                                .frame(width: 40, height: 40)
                            Text(lineName)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(hex: context.state.textColor ?? "FFFFFF"))
                        }
                    } else {
                        Image(systemName: "figure.walk")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    if let first = context.state.nextDepartures.first {
                        Text(first)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                            .monospacedDigit()
                    }
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading) {
                            Text(context.state.currentInstruction)
                                .font(.headline)
                                .fontWeight(.bold)
                            if let direction = context.state.direction {
                                Text("vers \(direction)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        if context.state.stops != nil {
                            HorizontalLinePlanView(
                                stops: context.state.stops,
                                currentLegIndex: context.state.currentLegIndex,
                                progress: context.state.progress,
                                lineColor: context.state.lineColor
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
            } compactLeading: {
                if let lineName = context.state.lineName, let lineColor = context.state.lineColor {
                    ZStack {
                        Circle()
                            .fill(Color(hex: lineColor))
                            .frame(width: 20, height: 20)
                        Text(lineName)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color(hex: context.state.textColor ?? "FFFFFF"))
                    }
                } else {
                    Image(systemName: "figure.walk")
                        .font(.caption2)
                        .foregroundColor(.blue)
                }
            } compactTrailing: {
                if let first = context.state.nextDepartures.first {
                    Text(first)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.green)
                        .monospacedDigit()
                } else {
                    Image(systemName: "arrow.right")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } minimal: {
                Image(systemName: "location.fill")
                    .font(.caption2)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct HorizontalLinePlanView: View {
    let stops: [String]?
    let currentLegIndex: Int?
    let progress: Double?
    let lineColor: String?

    var body: some View {
        guard let stops = stops, stops.count >= 2 else {
            return AnyView(EmptyView())
        }
        
        let legIndex = currentLegIndex ?? 0
        let prog = progress ?? 0.0
        let totalStops = stops.count
        
        // Track color
        let trackColor = lineColor.map { Color(hex: $0) } ?? Color.blue
        
        // Calculate the fractional position of the user along the stops sequence:
        // Position goes from 0.0 to 1.0
        let userPositionFraction: Double = {
            let index = Double(legIndex)
            let step = Double(totalStops - 1)
            guard step > 0 else { return 0.0 }
            return (index + prog) / step
        }()

        let nextStopName = (legIndex + 1 < totalStops) ? stops[legIndex + 1] : stops.last ?? ""
        let currentStopName = stops[safe: legIndex] ?? ""

        return AnyView(
            VStack(spacing: 6) {
                // Line track and station dots
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        // Background track line (dimmed)
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .frame(height: 4)
                        
                        // Active track line (highlighted)
                        Capsule()
                            .fill(trackColor)
                            .frame(width: geo.size.width * CGFloat(userPositionFraction), height: 4)
                        
                        // Station dots
                        HStack(spacing: 0) {
                            ForEach(0..<totalStops, id: \.self) { index in
                                Spacer(minLength: 0)
                                Circle()
                                    .fill(index <= legIndex ? trackColor : Color.gray)
                                    .frame(width: 8, height: 8)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 1.5)
                                    )
                                if index < totalStops - 1 {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                        .frame(width: geo.size.width)
                        
                        // Glowing user/train indicator dot
                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)
                            .shadow(color: trackColor.opacity(0.8), radius: 3)
                            .overlay(
                                Circle()
                                    .stroke(trackColor, lineWidth: 2)
                            )
                            .offset(x: geo.size.width * CGFloat(userPositionFraction) - 6)
                    }
                    .frame(height: 12)
                }
                .frame(height: 12)
                
                // Labels below the track
                HStack {
                    Text(currentStopName)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Spacer()
                    Text(nextStopName)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(trackColor)
                        .lineLimit(1)
                }
            }
        )
    }
}

// Helper array extension for safe indexing
extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
