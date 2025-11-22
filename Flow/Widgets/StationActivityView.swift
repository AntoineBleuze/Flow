import SwiftUI
import ActivityKit
import WidgetKit

struct StationActivityView: View {
    let stationName: String
    let lineName: String
    let direction: String
    let nextDepartures: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(stationName)
                        .font(.headline)
                        .foregroundColor(.white) // Force white for visibility on dark background
                    
                    HStack(spacing: 6) {
                        Text(lineName)
                            .font(.subheadline)
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                        
                        Text("vers \(direction)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                Image(systemName: "tram.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
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
        .background(Color.black) // Use black background for Live Activity style
        .cornerRadius(15) // Add corner radius
    }
}

#Preview("Notification", traits: .sizeThatFitsLayout) {
    StationActivityView(
        stationName: "Châtelet",
        lineName: "RER A",
        direction: "Boissy-St-Léger",
        nextDepartures: ["12:05", "12:10"]
    )
    .padding()
    .background(Color(UIColor.systemGroupedBackground))
}
