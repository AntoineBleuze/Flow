import ActivityKit
import WidgetKit
import SwiftUI
import AppIntents

struct StationActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StationActivityAttributes.self) { context in
            // --- Lock Screen / Banner UI ---
            StationActivityView(
                stationName: context.attributes.stationName,
                lineName: context.state.lineName,
                direction: context.state.direction,
                nextDepartures: context.state.nextDepartures,
                lineColor: context.state.lineColor,
                textColor: context.state.textColor
            )
        } dynamicIsland: { context in
            DynamicIsland {
                // --- Expanded UI ---
                DynamicIslandExpandedRegion(.leading) {
                    ZStack {
                        Circle()
                            .fill(Color(hex: context.state.lineColor))
                            .frame(width: 36, height: 36)
                        Text(context.state.lineName)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color(hex: context.state.textColor))
                    }
                }

                DynamicIslandExpandedRegion(.trailing) {
                    HStack(spacing: 8) {
                        Button(intent: RefreshDeparturesIntent()) {
                            Image(systemName: "bolt.fill")
                                .font(.caption)
                                .foregroundColor(.pink)
                        }
                        .buttonStyle(.plain)
                        
                        if let first = context.state.nextDepartures.first {
                            Text(first)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundStyle(.green)
                                .monospacedDigit()
                        }
                    }
                }

                DynamicIslandExpandedRegion(.bottom) {
                    HStack(alignment: .bottom) {
                        // Gauche : Station + Direction
                        VStack(alignment: .leading, spacing: 2) {
                            Text(context.attributes.stationName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .lineLimit(2)
                            
                            Text("vers \(context.state.direction)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                        
                        // Droite : Horaire suivant
                        if context.state.nextDepartures.count > 1 {
                            HStack(spacing: 4) {
                                Text("Suivant:")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                Text(context.state.nextDepartures[1])
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .monospacedDigit()
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                }

            } compactLeading: {
                // Logo de ligne (cercle avec lettre/numéro)
                ZStack {
                    Circle()
                        .fill(Color(hex: context.state.lineColor))
                        .frame(width: 20, height: 20)
                    Text(context.state.lineName)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(Color(hex: context.state.textColor))
                }
                .padding(.leading, 4)
            } compactTrailing: {
                if let first = context.state.nextDepartures.first {
                    Text(first)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.green)
                        .monospacedDigit()
                        .padding(.trailing, 4)
                } else {
                    Text("--")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
            } minimal: {
                ZStack {
                    Circle()
                        .fill(Color(hex: context.state.lineColor))
                        .frame(width: 16, height: 16)
                    Text(context.state.lineName)
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(Color(hex: context.state.textColor))
                }
            }
        }
    }
}

#Preview("Dynamic Island — Expanded", as: .dynamicIsland(.expanded), using: StationActivityAttributes(stationName: "Châtelet"), widget: {
    StationActivityWidget()
}, contentStates: {
    
        StationActivityAttributes.ContentState(
            nextDepartures: ["2 min", "7 min", "12 min"],
            lineName: "1",
            direction: "La Défense",
            lineColor: "FFCD00",
            textColor: "000000"
        )
    
})

