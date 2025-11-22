import ActivityKit
import WidgetKit
import SwiftUI

struct StationActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StationActivityAttributes.self) { context in
            // --- Lock Screen / Banner UI ---
            // "Apparaît sous forme de bannière... Utilise un fond clair en mode clair et sombre en mode sombre par défaut."
            // On utilise un design propre avec ContainerRelativeShape pour les coins.
            
                StationActivityView(
                    stationName: context.attributes.stationName,
                    lineName: context.state.lineName,
                    direction: context.state.direction,
                    nextDepartures: context.state.nextDepartures
                )
            } dynamicIsland: { context in
                DynamicIsland {
                    // --- Expanded UI ---
                    // "Le contenu doit s'enrouler autour de la caméra TrueDepth"
                    
                    DynamicIslandExpandedRegion(.leading) {
                        HStack {
                            Image(systemName: "tram.fill")
                                .foregroundColor(.blue)
                            Text(context.state.lineName)
                                .font(.headline)
                                .bold()
                        }
                    }
                    
                    DynamicIslandExpandedRegion(.trailing) {
                        if let first = context.state.nextDepartures.first {
                            Text(first)
                                .font(.system(.title, design: .rounded))
                                .bold()
                                .foregroundColor(.green) // "Couleurs vives"
                        }
                    }
                    
                    DynamicIslandExpandedRegion(.bottom) {
                        VStack(alignment: .center, spacing: 4) {
                            Text("Direction \(context.state.direction)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            if context.state.nextDepartures.count > 1 {
                                HStack {
                                    Text("Suivant:")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                    Text(context.state.nextDepartures[1])
                                        .font(.caption)
                                        .bold()
                                }
                            }
                        }
                        .padding(.top, 8)
                    }
                    
                } compactLeading: {
                    // Always show something visible for debugging
                    HStack(spacing: 4) {
                        Image(systemName: "tram.fill")
                            .foregroundColor(.white)
                        Text(!context.state.lineName.isEmpty ? context.state.lineName : "???")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.blue)
                    .clipShape(Capsule())
                } compactTrailing: {
                    // Always show something visible for debugging
                    let timeText = context.state.nextDepartures.first ?? "--"
                    Text(timeText)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.green)
                        .clipShape(Capsule())
                } minimal: {
                    // Always show something visible
                    Image(systemName: "tram.fill")
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
        }
    }
