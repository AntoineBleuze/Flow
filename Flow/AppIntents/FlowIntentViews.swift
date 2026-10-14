//
//  FlowIntentViews.swift
//  Flow
//
//  Created for Siri & Apple Intelligence (SiriAI) support.
//

import SwiftUI

// MARK: - Traffic Status Intent View

struct TrafficStatusIntentView: View {
    let line: TransportLine

    init(line: TransportLine) {
        self.line = line
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                // Line badge
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(badgeColor)
                        .frame(width: 44, height: 32)
                    Text(line.lineId)
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("\(line.type.rawValue) \(line.lineId)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    HStack(spacing: 4) {
                        Image(systemName: line.status.icon)
                            .foregroundColor(line.status.color)
                            .font(.subheadline)
                        Text(line.status.description)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(line.status.color)
                    }
                }
                Spacer()
            }

            if let message = line.message, !message.isEmpty {
                Text(message)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }

    private var badgeColor: Color {
        if let hex = line.colorHex, !hex.isEmpty {
            return Color(hex: hex)
        }
        return line.type.accentColor
    }

    private var textColor: Color {
        if let textHex = line.textColorHex, !textHex.isEmpty {
            return Color(hex: textHex)
        }
        return .white
    }
}

// MARK: - Network Traffic Intent View

struct NetworkTrafficIntentView: View {
    let perturbedLines: [TransportLine]

    init(perturbedLines: [TransportLine]) {
        self.perturbedLines = perturbedLines
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: perturbedLines.isEmpty ? "checkmark.seal.fill" : "exclamationmark.triangle.fill")
                    .foregroundColor(perturbedLines.isEmpty ? .green : .orange)
                    .font(.title3)
                Text(perturbedLines.isEmpty ? "Trafic normal sur le réseau" : "\(perturbedLines.count) ligne(s) perturbée(s)")
                    .font(.headline)
                Spacer()
            }

            if perturbedLines.isEmpty {
                Text("Aucune perturbation majeure signalée sur le métro et le RER.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                ForEach(perturbedLines.prefix(4)) { line in
                    HStack(spacing: 8) {
                        Text(line.lineId)
                            .font(.system(size: 13, weight: .bold))
                            .frame(width: 28, height: 22)
                            .background(line.type.accentColor.opacity(0.8), in: RoundedRectangle(cornerRadius: 6))
                            .foregroundColor(.white)

                        Text(line.status.description)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(line.status.color)

                        if let msg = line.message {
                            Text("— \(msg)")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Departures Intent View

struct DeparturesIntentView: View {
    let stationName: String
    let departures: [DepartureItem]

    init(stationName: String, departures: [DepartureItem]) {
        self.stationName = stationName
        self.departures = departures
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "clock.arrow.circlepath")
                    .foregroundColor(.blue)
                Text("Prochains départs — \(stationName)")
                    .font(.headline)
                    .lineLimit(1)
                Spacer()
            }

            if departures.isEmpty {
                Text("Aucun passage prévu dans l'immédiat.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                VStack(spacing: 6) {
                    ForEach(departures.prefix(5)) { dep in
                        HStack(spacing: 8) {
                            Text(dep.lineCode)
                                .font(.system(size: 13, weight: .bold))
                                .frame(width: 28, height: 22)
                                .background(Color.blue.opacity(0.8), in: RoundedRectangle(cornerRadius: 6))
                                .foregroundColor(.white)

                            Text(dep.destination)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .lineLimit(1)

                            Spacer()

                            Text(dep.minutesRemaining == 0 ? "À l'approche" : "\(dep.minutesRemaining) min")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .foregroundColor(dep.minutesRemaining <= 2 ? .green : .primary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Color.secondary.opacity(0.15), in: Capsule())
                        }
                    }
                }
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Nearby Stations Intent View

struct NearbyStationsIntentView: View {
    let stations: [(name: String, distanceMeters: Int, linesText: String)]

    init(stations: [(name: String, distanceMeters: Int, linesText: String)]) {
        self.stations = stations
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "location.north.circle.fill")
                    .foregroundColor(.blue)
                Text("Stations à proximité")
                    .font(.headline)
                Spacer()
            }

            if stations.isEmpty {
                Text("Aucune station trouvée à proximité.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                ForEach(Array(stations.prefix(4).enumerated()), id: \.offset) { _, item in
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.name)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text(item.linesText)
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(item.distanceMeters) m")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(Color.blue.opacity(0.1), in: Capsule())
                    }
                }
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Itinerary Snippet Intent View

struct ItinerarySnippetIntentView: View {
    let origin: String
    let destination: String
    let durationMinutes: Int
    let transfers: Int
    let summary: String

    init(origin: String, destination: String, durationMinutes: Int, transfers: Int, summary: String) {
        self.origin = origin
        self.destination = destination
        self.durationMinutes = durationMinutes
        self.transfers = transfers
        self.summary = summary
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                    .foregroundColor(.blue)
                Text("Itinéraire Flow")
                    .font(.headline)
                Spacer()
                Text("\(durationMinutes) min")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Circle().fill(Color.green).frame(width: 8, height: 8)
                    Text(origin)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                HStack(spacing: 6) {
                    Circle().fill(Color.red).frame(width: 8, height: 8)
                    Text(destination)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                }
            }

            HStack {
                Text(transfers == 0 ? "Trajet direct" : "\(transfers) correspondance(s)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text(summary)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Elevator Status Intent View

struct ElevatorStatusIntentView: View {
    let stationName: String
    let summary: ElevatorSummary

    init(stationName: String, summary: ElevatorSummary) {
        self.stationName = stationName
        self.summary = summary
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "figure.roll")
                    .foregroundColor(summary.broken == 0 ? .green : .orange)
                Text("Ascenseurs — \(stationName)")
                    .font(.headline)
                Spacer()
            }

            if summary.total == 0 {
                Text("Aucun ascenseur répertorié pour cette station.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else if summary.broken == 0 {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Tous les ascenseurs (\(summary.operational)) sont opérationnels.")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            } else {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                        Text("\(summary.broken) ascenseur(s) en panne sur \(summary.total)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }

                    ForEach(summary.issues.prefix(3), id: \.self) { issue in
                        Text("• \(issue)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Favorites Intent View

struct FavoritesIntentView: View {
    let stations: [String]
    let lines: [String]

    init(stations: [String], lines: [String]) {
        self.stations = stations
        self.lines = lines
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Mes Favoris Flow")
                    .font(.headline)
                Spacer()
            }

            if stations.isEmpty && lines.isEmpty {
                Text("Aucun favori enregistré dans Flow.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                if !stations.isEmpty {
                    Text("Stations")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    ForEach(stations.prefix(4), id: \.self) { st in
                        HStack {
                            Image(systemName: "tram.fill")
                                .font(.caption)
                                .foregroundColor(.blue)
                            Text(st)
                                .font(.subheadline)
                            Spacer()
                        }
                    }
                }

                if !lines.isEmpty {
                    Text("Lignes")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack(spacing: 6) {
                        ForEach(lines.prefix(6), id: \.self) { line in
                            Text(line)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue.opacity(0.15), in: Capsule())
                        }
                    }
                }
            }
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}
