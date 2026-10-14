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
                    // Icon (Line Logo or Walking)
                    if let lineName = context.state.lineName, let lineColor = context.state.lineColor {
                        WidgetLineLogo(
                            lineName: lineName,
                            lineColor: lineColor,
                            textColor: context.state.textColor,
                            size: 38
                        )
                    } else {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .frame(width: 38, height: 38)
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
                    .padding(.top, 4)
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
                        WidgetLineLogo(
                            lineName: lineName,
                            lineColor: lineColor,
                            textColor: context.state.textColor,
                            size: 34
                        )
                        .padding(.leading, 2)
                    } else {
                        Image(systemName: "figure.walk")
                            .font(.title2)
                            .foregroundColor(.blue)
                            .padding(.leading, 2)
                    }
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    if let first = context.state.nextDepartures.first {
                        Text(first)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                            .monospacedDigit()
                            .padding(.trailing, 2)
                    }
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(context.state.currentInstruction)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            if let direction = context.state.direction {
                                Text("vers \(direction)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
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
                    .padding(.horizontal, 4)
                }
                
            } compactLeading: {
                if let lineName = context.state.lineName, let lineColor = context.state.lineColor {
                    WidgetLineLogo(
                        lineName: lineName,
                        lineColor: lineColor,
                        textColor: context.state.textColor,
                        size: 20
                    )
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
                if let lineName = context.state.lineName, let lineColor = context.state.lineColor {
                    WidgetLineLogo(
                        lineName: lineName,
                        lineColor: lineColor,
                        textColor: context.state.textColor,
                        size: 16
                    )
                } else {
                    Image(systemName: "figure.walk")
                        .font(.caption2)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

// Shape animable pour tracer une portion de ligne avec embouts ronds
struct TrackLineShape: Shape {
    var startX: CGFloat
    var endX: CGFloat
    var centerY: CGFloat

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(startX, endX) }
        set {
            startX = newValue.first
            endX = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard endX >= startX else { return path }
        path.move(to: CGPoint(x: startX, y: centerY))
        path.addLine(to: CGPoint(x: endX, y: centerY))
        return path
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
        
        let totalStops = stops.count
        let legIndex = min(max(0, currentLegIndex ?? 0), totalStops - 1)
        let prog = min(max(0.0, progress ?? 0.0), 1.0)
        
        // Track color
        let trackColor = lineColor.map { Color(hex: $0) } ?? Color.blue
        
        let currentStopName = stops[safe: legIndex] ?? stops.first ?? ""
        let destinationStopName = stops.last ?? ""

        let dotSize: CGFloat = totalStops > 8 ? 6 : 8
        let indicatorSize: CGFloat = 12
        let step = CGFloat(totalStops - 1)
        // Marge latérale concentrique évitant tout chevauchement avec les bords arrondis
        let sideMargin: CGFloat = 8

        return AnyView(
            VStack(spacing: 6) {
                // Line track and station dots
                GeometryReader { geo in
                    let startX = sideMargin
                    let endX = max(startX, geo.size.width - sideMargin)
                    let usableWidth = endX - startX
                    let activeFraction = min(max(0.0, (CGFloat(legIndex) + CGFloat(prog)) / step), 1.0)
                    let userX = startX + usableWidth * activeFraction
                    let centerY = geo.size.height / 2

                    ZStack {
                        // 1. Ligne de fond (dimmée) : embouts ronds parfaitement concentriques sur startX et endX
                        TrackLineShape(startX: startX, endX: endX, centerY: centerY)
                            .stroke(Color.white.opacity(0.22), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        
                        // 2. Ligne active (pleine couleur) : reliée concentriquement de startX jusqu'au point userX
                        if userX > startX {
                            TrackLineShape(startX: startX, endX: userX, centerY: centerY)
                                .stroke(trackColor, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        }
                        
                        // 3. Nœuds de stations : premier arrêt concentrique à startX, dernier arrêt concentrique à endX
                        ForEach(0..<totalStops, id: \.self) { index in
                            let dotCenter = startX + (CGFloat(index) / step) * usableWidth
                            Circle()
                                .fill(index <= legIndex ? trackColor : Color.gray.opacity(0.6))
                                .frame(width: dotSize, height: dotSize)
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth: 1.5)
                                )
                                .position(x: dotCenter, y: centerY)
                        }
                        
                        // 4. Point indicateur temps réel lumineux concentrique sur userX
                        Circle()
                            .fill(Color.white)
                            .frame(width: indicatorSize, height: indicatorSize)
                            .shadow(color: trackColor.opacity(0.95), radius: 4)
                            .overlay(
                                Circle()
                                    .stroke(trackColor, lineWidth: 2.5)
                            )
                            .overlay(
                                Circle()
                                    .fill(trackColor)
                                    .frame(width: 3.5, height: 3.5)
                            )
                            .position(x: userX, y: centerY)
                    }
                }
                .frame(height: 14)
                
                // Labels sous la timeline alignés concentriquement avec les arrêts extrêmes
                HStack {
                    Text(currentStopName)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Spacer()
                    Text(destinationStopName)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(trackColor)
                        .lineLimit(1)
                }
                .padding(.horizontal, sideMargin)
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
