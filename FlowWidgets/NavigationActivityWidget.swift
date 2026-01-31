import ActivityKit
import WidgetKit
import SwiftUI

struct NavigationActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NavigationActivityAttributes.self) { context in
            // --- Lock Screen / Banner UI ---
            VStack(alignment: .leading, spacing: 12) {
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
                                .frame(width: 40, height: 40)
                            Text(lineName)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(hex: context.state.textColor ?? "FFFFFF"))
                        }
                    } else {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(context.state.currentInstruction)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        if let direction = context.state.direction {
                            Text("vers \(direction)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
                
                if !context.state.nextDepartures.isEmpty {
                    Divider()
                        .background(Color.white.opacity(0.2))
                    
                    HStack {
                        Text("Prochains départs:")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Spacer()
                        ForEach(context.state.nextDepartures.prefix(3), id: \.self) { time in
                            Text(time)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.green)
                                .monospacedDigit()
                        }
                    }
                }
            }
            .padding()
            .background(Color.black.opacity(0.8))
            
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
