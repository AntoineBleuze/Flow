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
                            if stop.isSkipped {
                                ZStack {
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 12, height: 12)
                                    Circle()
                                        .stroke(Color.orange, style: StrokeStyle(lineWidth: 2, dash: [2, 2]))
                                        .frame(width: 12, height: 12)
                                    Image(systemName: "xmark")
                                        .font(.system(size: 6, weight: .bold))
                                        .foregroundColor(.orange)
                                }
                            } else {
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
                            }

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
                            HStack(alignment: .center, spacing: 6) {
                                Text(stop.stop_point.name ?? "Station inconnue")
                                    .font(
                                        .system(
                                            size: 14,
                                            weight: isStop(index: index, total: stops.count)
                                                ? .semibold : .regular)
                                    )
                                    .strikethrough(stop.isSkipped, color: .orange)
                                    .foregroundColor(stop.isSkipped ? .secondary : .primary)

                                if let affluence = stop.estimated_affluence, !stop.isSkipped {
                                    StopAffluenceIndicator(level: affluence.level)
                                }

                                if stop.isSkipped {
                                    Text("NON DESSERVI")
                                        .font(.system(size: 8, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 5)
                                        .padding(.vertical, 2)
                                        .background(Color.orange)
                                        .clipShape(Capsule())
                                }
                            }
                            .padding(.top, isStop(index: index, total: stops.count) ? -2 : -4)  // Align with dot

                            if stop.isSkipped {
                                if let reason = stop.disruptionReason, !reason.isEmpty {
                                    Text(reason)
                                        .font(.system(size: 11, weight: .medium))
                                        .foregroundColor(.orange)
                                        .lineLimit(2)
                                } else {
                                    Text("Station fermée — les trains ne marquent pas l'arrêt")
                                        .font(.system(size: 11, weight: .medium))
                                        .foregroundColor(.orange)
                                }
                            } else if isStop(index: index, total: stops.count) {
                                HStack(spacing: 6) {
                                    Text(formatTime(stop.departure_date_time))
                                        .font(.caption)
                                        .foregroundColor(.secondary)

                                    if let affluence = stop.estimated_affluence {
                                        Text("•")
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                        Text("Affluence \(affluence.level.title.lowercased())")
                                            .font(.system(size: 10, weight: .medium, design: .rounded))
                                            .foregroundColor(.secondary)
                                    }
                                }
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

