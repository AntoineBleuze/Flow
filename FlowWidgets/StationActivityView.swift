import SwiftUI
import ActivityKit
import WidgetKit

struct StationActivityView: View {
    let stationName: String
    let lineName: String
    let direction: String
    let nextDepartures: [String]
    let lineColor: String
    let textColor: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(stationName)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("vers \(direction)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color(hex: lineColor))
                        .frame(width: 50, height: 50)
                    Text(lineName)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(hex: textColor))
                }
            }
            
            Divider()
                .background(Color.gray)
            
            HStack(alignment: .lastTextBaseline) {
                Text("Prochains départs")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack(spacing: 12) {
                    ForEach(Array(nextDepartures.enumerated()), id: \.offset) { index, time in
                        Text(time)
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .foregroundColor(index == 0 ? .green : .white)
                    }
                }
            }
        }
        .padding()
        .activityBackgroundTint(Color.black)
        .activitySystemActionForegroundColor(Color.white)
    }
}

#Preview("Notification", traits: .sizeThatFitsLayout) {
    StationActivityView(
        stationName: "Châtelet",
        lineName: "A",
        direction: "Boissy-St-Léger",
        nextDepartures: ["12 min", "17 min"],
        lineColor: "E2231A",
        textColor: "FFFFFF"
    )
    .padding()
    .background(Color(UIColor.systemGroupedBackground))
}
