import ActivityKit
import WidgetKit
import SwiftUI

struct StationActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StationActivityAttributes.self) { context in
            // --- Lock Screen / Banner UI ---
            StationActivityView(
                stationName: context.attributes.stationName,
                lineName: context.state.lineName,
                direction: context.state.direction,
                nextDepartures: context.state.nextDepartures
            )
        } dynamicIsland: { context in
            DynamicIsland {
                // --- Expanded UI ---
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Image(systemName: "tram.fill")
                            .foregroundColor(.cyan)
                        Text(context.state.lineName)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .dynamicIsland(verticalPlacement: .belowIfTooWide)
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
                        Text("Direction \(context.state.direction)")
                            .font(.headline)
                            .foregroundStyle(.white)

                        if context.state.nextDepartures.count > 1 {
                            HStack {
                                Text("Suivant:")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                Text(context.state.nextDepartures[1])
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .monospacedDigit()
                            }
                        }
                    }
                    .padding(.horizontal)
                }

            } compactLeading: {
                HStack(spacing: 2) {
                    Image(systemName: "tram.fill")
                        .foregroundStyle(.cyan)
                    Text(context.state.lineName)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
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
                Image(systemName: "tram.fill")
                    .foregroundStyle(.cyan)
            }
        }
    }
}
