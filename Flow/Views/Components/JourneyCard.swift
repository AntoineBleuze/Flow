import SwiftUI

struct JourneyCard: View {
    let journey: Journey
    var isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header: Times and Duration
            HStack(alignment: .firstTextBaseline) {
                Text(formatTime(journey.departure_date_time ?? ""))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Image(systemName: "arrow.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(formatTime(journey.arrival_date_time ?? ""))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                // Duration Badge
                HStack(spacing: 4) {
                    Image(systemName: "timer")
                        .font(.caption2)
                    Text(formatDuration(journey.duration ?? 0))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(isSelected ? .white : .blue)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(isSelected ? Color.blue : Color.blue.opacity(0.1))
                .clipShape(Capsule())
            }
            
            // Visual Timeline
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    if let sections = journey.sections {
                        internalTimeline(sections: sections)
                    }
                }
            }
            .scrollDisabled(true) // Disable scrolling if it fits, usually it's summary
            
            // Footer: Walking info & CO2 if available
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "figure.walk")
                    Text("\(walkingTime(for: journey) / 60) min à pied")
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
                Spacer()
                
                if let transfers = journey.nb_transfers {
                    Text(transfers == 0 ? "Direct" : "\(transfers) changement\(transfers > 1 ? "s" : "")")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .glassEffect(isSelected ? .standard.interactive() : .standard, in: RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
        )
        .padding(.horizontal)
    }
    
    // MARK: - Helpers
    
    @ViewBuilder
    func internalTimeline(sections: [ItinerarySection]) -> some View {
        ForEach(sections.filter { $0.type != "waiting" }) { section in
            if section.type == "public_transport", let display = section.display_informations {
                // Transport Icon
                LineIcon(
                    type: mapType(display.commercial_mode),
                    lineId: display.code ?? display.label ?? "?",
                    size: 24
                )
            } else if section.mode == "walking" || section.type == "street_network" {
                // Walking dots or icon
                // Only show if significant duration > 3 min
                if (section.duration ?? 0) > 180 {
                    HStack(spacing: 0) {
                        Circle().fill(Color.gray.opacity(0.3)).frame(width: 4, height: 4)
                            .padding(.horizontal, 2)
                        Image(systemName: "figure.walk")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        Circle().fill(Color.gray.opacity(0.3)).frame(width: 4, height: 4)
                            .padding(.horizontal, 2)
                    }
                }
            } else if section.type == "transfer" {
                // Chevron for transfer
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 2)
            }
        }
    }
    
    func mapType(_ mode: String?) -> TransportType {
        guard let mode = mode?.lowercased() else { return .bus }
        if mode.contains("rer") { return .rer }
        if mode.contains("metro") { return .metro }
        if mode.contains("tram") { return .tram }
        if mode.contains("train") || mode.contains("transilien") { return .transilien }
        return .bus
    }
    
    func walkingTime(for journey: Journey) -> Int {
        guard let sections = journey.sections else { return 0 }
        return sections
            .filter { $0.type == "street_network" || $0.mode == "walking" || $0.type == "transfer" }
            .reduce(0) { $0 + ($1.duration ?? 0) }
    }
    
    func formatTime(_ isoDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            return timeFormatter.string(from: date)
        }
        return isoDate
    }
    
    func formatDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let hours = minutes / 60
        let mins = minutes % 60
        if hours > 0 {
            return "\(hours)h\(String(format: "%02d", mins))"
        }
        return "\(mins) min"
    }
}
