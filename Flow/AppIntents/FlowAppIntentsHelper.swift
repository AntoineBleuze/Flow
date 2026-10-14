//
//  FlowAppIntentsHelper.swift
//  Flow
//
//  Created for Siri & Apple Intelligence (SiriAI) support.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine

public struct DepartureItem: Identifiable, Sendable {
    public let id: String
    public let lineCode: String
    public let direction: String
    public let destination: String
    public let minutesRemaining: Int
    public let formattedTime: String
    public let colorHex: String?
}

public struct ElevatorSummary: Sendable {
    public let total: Int
    public let operational: Int
    public let broken: Int
    public let issues: [String]
}

enum FlowAppIntentsHelper {

    // MARK: - Stations

    @MainActor
    static func getAllStations() -> [MapStation] {
        if !MapDataService.shared.allStations.isEmpty {
            return MapDataService.shared.allStations
        }

        // Tenter de charger les données
        MapDataService.shared.loadData()
        if !MapDataService.shared.allStations.isEmpty {
            return MapDataService.shared.allStations
        }

        // Fallback mock en cas de cold start sous Siri sans cache persistant
        MapDataService.shared.loadPreviewMockData()
        return MapDataService.shared.allStations
    }

    nonisolated static func toStationEntity(_ station: MapStation) -> StationEntity {
        let linesDesc = station.lines.map { $0.name }.joined(separator: ", ")
        return StationEntity(
            id: station.id,
            name: station.name,
            linesDescription: linesDesc,
            city: station.city,
            isHub: station.isHub,
            latitude: station.latitude,
            longitude: station.longitude
        )
    }

    @MainActor
    static func findStation(named query: String) -> MapStation? {
        let stations = getAllStations()
        let cleanQuery = StationSuggestionEngine.normalize(query)
        guard !cleanQuery.isEmpty else { return nil }

        // 1. Match exact par nom
        if let exact = stations.first(where: { StationSuggestionEngine.normalize($0.name) == cleanQuery }) {
            return exact
        }

        // 2. Ranking intelligent
        let ranked = StationSuggestionEngine.rank(
            stations: stations,
            query: query,
            userLocation: LocationManager.shared.userLocation,
            favoriteIds: [],
            recentIds: []
        )
        return ranked.first
    }

    // MARK: - Transit Lines

    @MainActor
    static func getAllTransitLines() -> [TransitLineEntity] {
        let lines = TrafficService.shared.lines
        return lines.map { line in
            let fullTitle: String
            switch line.type {
            case .metro: fullTitle = "Métro \(line.lineId)"
            case .rer: fullTitle = "RER \(line.lineId)"
            case .tram: fullTitle = line.lineId.uppercased().hasPrefix("T") ? line.lineId : "Tram T\(line.lineId)"
            case .transilien: fullTitle = "Ligne \(line.lineId)"
            case .train: fullTitle = "Train \(line.lineId)"
            case .cable: fullTitle = "Câble \(line.lineId)"
            case .bus: fullTitle = "Bus \(line.lineId)"
            }

            return TransitLineEntity(
                id: "\(line.type.rawValue)-\(line.lineId)",
                lineCode: line.lineId,
                name: fullTitle,
                typeName: line.type.rawValue,
                colorHex: line.colorHex
            )
        }
    }

    @MainActor
    static func findTransportLine(codeOrName: String) -> TransportLine? {
        let lines = TrafficService.shared.lines
        let clean = codeOrName.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        // Match direct par lineId (ex: "1", "14", "A", "T3a")
        if let direct = lines.first(where: { $0.lineId.lowercased() == clean }) {
            return direct
        }

        // Nettoyage des préfixes comme "ligne", "métro", "rer", "tram"
        let stripped = clean
            .replacingOccurrences(of: "ligne", with: "")
            .replacingOccurrences(of: "métro", with: "")
            .replacingOccurrences(of: "metro", with: "")
            .replacingOccurrences(of: "rer", with: "")
            .replacingOccurrences(of: "tramway", with: "")
            .replacingOccurrences(of: "tram", with: "")
            .trimmingCharacters(in: .whitespaces)

        if let match = lines.first(where: { $0.lineId.lowercased() == stripped }) {
            return match
        }

        return lines.first(where: {
            $0.lineId.lowercased().contains(clean) || clean.contains($0.lineId.lowercased())
        })
    }

    // MARK: - Departures

    static func fetchNextDepartures(for station: MapStation, lineCode: String? = nil) async throws -> [DepartureItem] {
        let departures: [Departure] = try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            var hasResumed = false

            cancellable = IDFMService.shared.fetchDepartures(for: station.id)
                .first()
                .sink(
                    receiveCompletion: { completion in
                        guard !hasResumed else { return }
                        if case .failure(let error) = completion {
                            hasResumed = true
                            continuation.resume(throwing: error)
                        }
                        _ = cancellable
                    },
                    receiveValue: { deps in
                        guard !hasResumed else { return }
                        hasResumed = true
                        continuation.resume(returning: deps)
                        _ = cancellable
                    }
                )
        }

        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        isoFormatter.locale = Locale(identifier: "en_US_POSIX")

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"

        let now = Date()

        var items: [DepartureItem] = []

        for dep in departures {
            let label = dep.displayInformations.label ?? dep.displayInformations.code ?? "?"
            if let targetLine = lineCode, !targetLine.isEmpty {
                if !label.localizedCaseInsensitiveContains(targetLine) &&
                   !targetLine.localizedCaseInsensitiveContains(label) {
                    continue
                }
            }

            let dest = dep.displayInformations.direction ?? "Direction inconnue"
            let depDate = isoFormatter.date(from: dep.stopDateTime.departureDateTime)
            let minutes = depDate.map { max(0, Int($0.timeIntervalSince(now) / 60)) } ?? 0
            let timeStr = depDate.map { timeFormatter.string(from: $0) } ?? "--:--"

            items.append(
                DepartureItem(
                    id: dep.id,
                    lineCode: label,
                    direction: dest,
                    destination: dest,
                    minutesRemaining: minutes,
                    formattedTime: timeStr,
                    colorHex: dep.displayInformations.color
                )
            )
        }

        // Tri chronologique
        items.sort { $0.minutesRemaining < $1.minutesRemaining }
        return Array(items.prefix(8))
    }

    // MARK: - Elevators / Accessibilité

    nonisolated static func checkElevators(stationName: String) -> ElevatorSummary {
        let query = StationSuggestionEngine.normalize(stationName)
        let csvPaths = [
            Bundle.main.path(forResource: "etat-des-ascenseurs", ofType: "csv"),
            "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/etat-des-ascenseurs.csv"
        ].compactMap { $0 }

        guard let path = csvPaths.first(where: { FileManager.default.fileExists(atPath: $0) }),
              let content = try? String(contentsOfFile: path, encoding: .utf8) else {
            return ElevatorSummary(total: 0, operational: 0, broken: 0, issues: ["Données d'ascenseurs momentanément indisponibles."])
        }

        let lines = content.components(separatedBy: .newlines)
        var found: [(status: String, situation: String, direction: String, reason: String)] = []

        for line in lines.dropFirst() {
            let cols = line.components(separatedBy: ";")
            guard cols.count >= 14 else { continue }
            let zdcName = StationSuggestionEngine.normalize(cols[11])
            if zdcName.contains(query) || query.contains(zdcName) {
                let status = cols[5]
                let reason = cols[4]
                let situation = cols[7]
                let direction = cols[8]
                found.append((status, situation, direction, reason))
            }
        }

        if found.isEmpty {
            return ElevatorSummary(total: 0, operational: 0, broken: 0, issues: [])
        }

        let inService = found.filter { $0.status == "available" }
        let outOfService = found.filter { $0.status != "available" }

        let issues = outOfService.map {
            let desc = $0.situation.isEmpty ? "Ascenseur" : $0.situation
            let dir = $0.direction.isEmpty ? "" : " (\($0.direction))"
            let rsn = $0.reason.isEmpty ? "Hors service" : $0.reason
            return "\(desc)\(dir) : \(rsn)"
        }

        return ElevatorSummary(
            total: found.count,
            operational: inService.count,
            broken: outOfService.count,
            issues: issues
        )
    }
}
