import SwiftUI

struct VerticalItineraryStopsView: View {
    let section: ItinerarySection

    var body: some View {
        if let stops = section.stop_date_times, !stops.isEmpty {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(Array(stops.enumerated()), id: \.element.id) { index, stop in
                    HStack(alignment: .top, spacing: 12) {
                        // Vertical line and dot
                        VStack(spacing: 0) {
                            // Upper line (connect to previous)
                            if index > 0 {
                                Rectangle()
                                    .fill(lineColor)
                                    .frame(width: 4)
                                    .frame(maxHeight: .infinity)
                            } else {
                                Color.clear
                                    .frame(width: 4, height: 10)  // Spacing for first item
                            }

                            // Dot
                            Circle()
                                .fill(isStop(index: index, total: stops.count) ? .white : lineColor)
                                .frame(
                                    width: isStop(index: index, total: stops.count) ? 12 : 8,
                                    height: isStop(index: index, total: stops.count) ? 12 : 8
                                )
                                .overlay(
                                    Circle()
                                        .stroke(
                                            lineColor,
                                            lineWidth: isStop(index: index, total: stops.count)
                                                ? 3 : 0)
                                )

                            // Lower line (connect to next)
                            if index < stops.count - 1 {
                                Rectangle()
                                    .fill(lineColor)
                                    .frame(width: 4)
                                    .frame(maxHeight: .infinity)
                            } else {
                                Color.clear
                                    .frame(width: 4, height: 10)  // Spacing for last item
                            }
                        }
                        .frame(width: 20)

                        // Content
                        VStack(alignment: .leading, spacing: 4) {
                            Text(stop.stop_point.name ?? "Station inconnue")
                                .font(
                                    .system(
                                        size: 14,
                                        weight: isStop(index: index, total: stops.count)
                                            ? .semibold : .regular)
                                )
                                .foregroundColor(.primary)
                                .padding(.top, isStop(index: index, total: stops.count) ? -2 : -4)  // Align with dot

                            if isStop(index: index, total: stops.count) {
                                Text(formatTime(stop.departure_date_time))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.bottom, 24)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.vertical, 8)
        } else {
            EmptyView()
        }
    }

    private var lineColor: Color {
        if let colorHex = section.display_informations?.color {
            return Color(hex: colorHex)
        }
        return .blue
    }

    // Check if it's the first or last stop (boarding/alighting)
    // Or maybe we treat all of them as equal stops?
    // For now, let's highlight start and end of this list matching the section bounds
    private func isStop(index: Int, total: Int) -> Bool {
        // In the stop list, all are stops.
        // But maybe we want to emphasize the one we are currently at?
        // For now, just "Start" and "End" of the section might be same as first and last in list.
        return true
    }

    private func formatTime(_ isoDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = dateFormatter.date(from: isoDate) {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
        return ""
    }
}

#Preview {
    if let section = PreviewMockData.mockJourney.sections?.first {
        VerticalItineraryStopsView(section: section)
            .padding()
    } else {
        Text("No mock section")
    }
}

