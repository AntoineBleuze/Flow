import SwiftUI
import ActivityKit
import WidgetKit
import AppIntents

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
                
                HStack(spacing: 12) {
                    // Interactive refresh button
                    Button(intent: RefreshDeparturesIntent()) {
                        Image(systemName: "bolt.fill")
                            .font(.title3)
                            .foregroundColor(.pink)
                            .padding(10)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)

                    WidgetLineLogo(
                        lineName: lineName,
                        lineColor: lineColor,
                        textColor: textColor,
                        size: 46
                    )
                }
            }
            
            Divider()
                .background(Color.gray)
            
            HStack(alignment: .lastTextBaseline) {
                Text("Prochains départs")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack(spacing: 16) {
                    ForEach(nextDepartures.prefix(2), id: \.self) { departure in
                        Text(departure)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.green)
                            .monospacedDigit()
                    }
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
    }
}
