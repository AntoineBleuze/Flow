import Combine
import Foundation
import SwiftUI
import UserNotifications

@MainActor
final class TrafficWatchlistService: ObservableObject {
    static let shared = TrafficWatchlistService()

    @Published private(set) var watchedLineKeys: Set<String> = []
    @Published var lastTestNotificationScheduledAt: Date?

    private let watchlistKey = "traffic_watchlist_lines"
    private let notifiedDisruptionsKey = "traffic_watchlist_notified_ids"
    private let sharedDefaults: UserDefaults

    /// Mémorise les IDs de perturbations déjà notifiées par clé de ligne ("type|lineId")
    private var notifiedDisruptionIds: [String: Set<String>] = [:]

    private init() {
        self.sharedDefaults = UserDefaults(suiteName: TrafficNotificationPayload.appGroupSuite) ?? .standard
        loadWatchlist()
        loadNotifiedIds()
    }

    // MARK: - Key Helpers

    func key(for line: TransportLine) -> String {
        key(type: line.type, lineId: line.lineId)
    }

    func key(type: TransportType, lineId: String) -> String {
        "\(type.rawValue)|\(lineId)"
    }

    func isWatched(_ line: TransportLine) -> Bool {
        watchedLineKeys.contains(key(for: line))
    }

    func isWatched(type: TransportType, lineId: String) -> Bool {
        watchedLineKeys.contains(key(type: type, lineId: lineId))
    }

    // MARK: - Watchlist Management

    func toggleWatch(for line: TransportLine) {
        let lineKey = key(for: line)
        if watchedLineKeys.contains(lineKey) {
            watchedLineKeys.remove(lineKey)
            notifiedDisruptionIds.removeValue(forKey: lineKey)
            saveNotifiedIds()
        } else {
            watchedLineKeys.insert(lineKey)
            requestNotificationAuthorizationIfNeeded()
            // Enregistre les perturbations déjà actives pour ne notifier que les nouvelles
            let currentActiveIds = Set(
                line.trafficInfos
                    .filter { $0.period == .active && $0.severity < .information }
                    .map { $0.id }
            )
            if !currentActiveIds.isEmpty {
                notifiedDisruptionIds[lineKey] = currentActiveIds
                saveNotifiedIds()
            }
        }
        saveWatchlist()
    }

    func watchedLines(from allLines: [TransportLine]) -> [TransportLine] {
        allLines.filter { isWatched($0) }
    }

    // MARK: - Traffic Evaluation

    func evaluateTrafficUpdate(_ updatedLines: [TransportLine]) {
        guard !watchedLineKeys.isEmpty else { return }

        var didUpdateNotifiedIds = false

        for line in updatedLines {
            let lineKey = key(for: line)
            guard watchedLineKeys.contains(lineKey) else { continue }

            let activeDisruptions = line.trafficInfos.filter {
                $0.period == .active && $0.severity < .information
            }
            let activeIds = Set(activeDisruptions.map { $0.id })
            let previouslyNotified = notifiedDisruptionIds[lineKey] ?? []

            // Trouver les nouvelles perturbations actives non encore notifiées
            let newDisruptions = activeDisruptions.filter { !previouslyNotified.contains($0.id) }

            if let primaryDisruption = newDisruptions.sorted(by: { $0.severity < $1.severity }).first {
                sendTrafficNotification(for: line, info: primaryDisruption)
                notifiedDisruptionIds[lineKey] = previouslyNotified.union(activeIds)
                didUpdateNotifiedIds = true
            } else if activeIds.isEmpty && !previouslyNotified.isEmpty {
                // La ligne est revenue à un trafic normal : on réinitialise pour les futurs incidents
                notifiedDisruptionIds[lineKey] = []
                didUpdateNotifiedIds = true
            }
        }

        if didUpdateNotifiedIds {
            saveNotifiedIds()
        }
    }

    // MARK: - Notification Scheduling

    func sendTrafficNotification(
        for line: TransportLine,
        info: TrafficInfo,
        delaySeconds: TimeInterval = 0.5
    ) {
        requestNotificationAuthorizationIfNeeded()

        let payload = buildPayload(for: line, info: info)
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "TRAFFIC_ALERT"
        content.sound = .default

        let typePrefix = line.type == .metro ? "Métro" : line.type.rawValue
        content.title = "\(typePrefix) \(line.lineId) • \(info.severity.description)"

        if let section = info.impactedSection, !section.isEmpty {
            content.subtitle = section
        } else {
            content.subtitle = info.title
        }

        var bodyParts: [String] = []
        if let resumption = info.resumptionDescription {
            bodyParts.append(resumption)
        }
        let cleanSummary = info.message
            .replacingOccurrences(of: "**", with: "")
            .replacingOccurrences(of: "\n", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !cleanSummary.isEmpty {
            bodyParts.append(String(cleanSummary.prefix(160)))
        }
        content.body = bodyParts.isEmpty
            ? "Perturbation signalée sur la ligne. Tirez vers le bas pour voir le plan."
            : bodyParts.joined(separator: "\n")

        if let encodedData = try? JSONEncoder().encode(payload),
           let jsonString = String(data: encodedData, encoding: .utf8)
        {
            content.userInfo[TrafficNotificationPayload.userInfoKey] = jsonString
            let groupKey = TrafficNotificationPayload.appGroupKey(
                typeRaw: line.type.rawValue,
                lineId: line.lineId
            )
            sharedDefaults.set(encodedData, forKey: groupKey)
        }

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: max(0.5, delaySeconds),
            repeats: false
        )
        let requestId = "traffic_alert_\(line.type.rawValue)_\(line.lineId)_\(info.id)"
        let request = UNNotificationRequest(identifier: requestId, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print("⚠️ [Watchlist] Erreur envoi notification trafic: \(error.localizedDescription)")
            } else {
                print("🔔 [Watchlist] Notification trafic programmée pour \(line.type.rawValue) \(line.lineId)")
            }
        }
    }

    /// Programme une notification de démonstration dans 2 secondes pour tester l'extension sans attendre d'incident réel.
    func sendTestNotification(for line: TransportLine) {
        let testInfo: TrafficInfo
        if let existing = line.trafficInfos.first(where: { $0.period == .active }) ?? line.trafficInfos.first {
            testInfo = existing
        } else {
            let lineData = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId)
            let stations = lineData?.allStations ?? []
            let sampleStops: [String]?
            let sampleSection: String?
            if stations.count >= 5 {
                let startIdx = max(0, stations.count / 3)
                let endIdx = min(stations.count - 1, startIdx + 3)
                sampleStops = (startIdx...endIdx).map { stations[$0].nom }
                sampleSection = "De \(stations[startIdx].nom) à \(stations[endIdx].nom)"
            } else if !stations.isEmpty {
                sampleStops = stations.prefix(2).map { $0.nom }
                sampleSection = nil
            } else {
                sampleStops = nil
                sampleSection = nil
            }

            let estimatedResumption = Calendar.current.date(byAdding: .hour, value: 2, to: Date())
            testInfo = TrafficInfo(
                id: "test-\(UUID().uuidString.prefix(8))",
                title: "Incident d'exploitation (Test)",
                message: "Le trafic est interrompu sur la section concernée suite à un incident technique. Tirez cette notification vers le bas pour visualiser le plan de la ligne.",
                period: .active,
                severity: .interrupted,
                startTime: Date(),
                endTime: estimatedResumption,
                impactedStops: sampleStops,
                impactedSection: sampleSection
            )
        }

        sendTrafficNotification(for: line, info: testInfo, delaySeconds: 2.0)
        lastTestNotificationScheduledAt = Date()
    }

    // MARK: - Payload Builder

    private func buildPayload(for line: TransportLine, info: TrafficInfo) -> TrafficNotificationPayload {
        let lineData = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId)
        let affectedNames = resolveAffectedStationNames(lineData: lineData, info: info)

        var nodes: [TrafficNotificationPayload.StationNode] = []
        var schematicEdges: [TrafficNotificationPayload.SchematicEdge]?
        var layoutRowCount: Int?

        if let lineData {
            let layout = lineData.schematicLayout
            layoutRowCount = layout.rowCount
            nodes = layout.nodes.map { node in
                TrafficNotificationPayload.StationNode(
                    id: node.id,
                    name: node.station.nom,
                    isAffected: affectedNames.contains(node.station.nom),
                    isTerminus: node.isTerminus,
                    isUnderConstruction: node.station.isUnderConstruction,
                    col: node.col,
                    row: node.row
                )
            }
            schematicEdges = layout.edges.map { edge in
                let fromNode = layout.nodes[edge.fromIndex]
                let toNode = layout.nodes[edge.toIndex]
                let fromAffected = affectedNames.contains(fromNode.station.nom)
                let toAffected = affectedNames.contains(toNode.station.nom)
                return TrafficNotificationPayload.SchematicEdge(
                    fromId: fromNode.id,
                    toId: toNode.id,
                    isAffected: fromAffected && toAffected,
                    isDashed: edge.isDashed
                )
            }
        }

        let lineColorHex = resolveLineColorHex(for: line)
        let textColorHex = resolveTextColorHex(for: line, backgroundHex: lineColorHex)
        let logoPNGData = renderLineLogoPNG(for: line)
        let severityColorHex = hexForSeverity(info.severity)

        return TrafficNotificationPayload(
            lineId: line.lineId,
            transportTypeRaw: line.type.rawValue,
            lineColorHex: lineColorHex,
            textColorHex: textColorHex,
            logoPNGData: logoPNGData,
            statusRaw: statusIdentifier(info.severity),
            statusDescription: info.severity.description,
            severityColorHex: severityColorHex,
            severityIcon: info.severity.icon,
            title: info.title,
            message: info.message.replacingOccurrences(of: "**", with: ""),
            impactedSection: info.impactedSection,
            resumptionDate: info.endTime,
            resumptionText: info.resumptionDescription,
            stations: nodes,
            totalStationsCount: nodes.count,
            edges: schematicEdges,
            rowCount: layoutRowCount
        )
    }

    private func resolveAffectedStationNames(lineData: LocalLineData?, info: TrafficInfo) -> Set<String> {
        guard let data = lineData else { return [] }
        var affected = Set<String>()

        if let stops = info.impactedStops {
            for stopName in stops {
                for station in data.allStations where matchesStation(station.nom, apiName: stopName) {
                    affected.insert(station.nom)
                }
            }
        }

        if let impactedSection = info.impactedSection {
            let endpoints = parseSection(impactedSection)
            if let from = endpoints.from, let to = endpoints.to {
                let graph = LineGraph(lineData: data)
                if let path = graph.findPath(from: from, to: to) {
                    affected.formUnion(path)
                }
            }
        }

        return affected
    }

    private func matchesStation(_ localName: String, apiName: String) -> Bool {
        let localNorm = localName.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        let apiNorm = apiName.lowercased().folding(options: .diacriticInsensitive, locale: .current)

        let localClean = localNorm.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        let apiClean = apiNorm.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        if localClean == apiClean { return true }
        if !localClean.isEmpty, !apiClean.isEmpty,
           localClean.contains(apiClean) || apiClean.contains(localClean) {
            return true
        }

        let stopWords: Set<String> = [
            "gare", "mairie", "porte", "pont", "saint", "sainte", "rue",
            "avenue", "boulevard", "route", "de", "du", "des", "la",
            "le", "les", "et", "en", "sous", "sur", "aux", "au", "a"
        ]

        let localTokens = localNorm.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty && !stopWords.contains($0) }

        let apiTokens = apiNorm.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .map { $0.trimmingCharacters(in: CharacterSet.alphanumerics.inverted).lowercased() }
            .filter { !$0.isEmpty && !stopWords.contains($0) }

        if localTokens.isEmpty || apiTokens.isEmpty { return false }

        for apiTok in apiTokens {
            for localTok in localTokens {
                if apiTok == localTok ||
                    (apiTok.count >= 4 && localTok.starts(with: apiTok)) ||
                    (localTok.count >= 4 && apiTok.starts(with: localTok))
                {
                    return true
                }
            }
        }
        return false
    }

    private func parseSection(_ sectionText: String) -> (from: String?, to: String?) {
        if sectionText.hasPrefix("De ") {
            let parts = sectionText.dropFirst(3).components(separatedBy: " à ")
            if parts.count >= 2 {
                return (parts[0], parts[1])
            }
        }
        let parts = sectionText.components(separatedBy: " - ")
        if parts.count >= 2 {
            return (parts[0], parts[1])
        }
        return (nil, nil)
    }

    private func resolveLineColorHex(for line: TransportLine) -> String {
        if let hex = line.colorHex, !hex.isEmpty {
            return hex
        }
        if let cachedHex = MapDataService.shared.lineColorCache[line.lineId]?.toHex() {
            return cachedHex
        }
        return resolveLineColor(line.lineId, type: line.type).toHex() ?? "007AFF"
    }

    private func resolveTextColorHex(for line: TransportLine, backgroundHex: String) -> String {
        if let textHex = line.textColorHex, !textHex.isEmpty {
            return textHex
        }
        let cleaned = backgroundHex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted).uppercased()
        let brightLines: Set<String> = ["FFCD00", "FFCE00", "D5C900", "B6BD00", "D2D200", "D8BC59"]
        return brightLines.contains(cleaned) ? "000000" : "FFFFFF"
    }

    private func renderLineLogoPNG(for line: TransportLine) -> Data? {
        let renderer = ImageRenderer(content: LineIcon(line: line, size: 40))
        renderer.scale = 3.0
        return renderer.uiImage?.pngData()
    }

    private func hexForSeverity(_ status: LineStatus) -> String {
        switch status {
        case .interrupted: return "FF3B30"
        case .disrupted: return "FF9500"
        case .works: return "007AFF"
        case .information: return "5856D6"
        case .normal: return "34C759"
        }
    }

    private func statusIdentifier(_ status: LineStatus) -> String {
        switch status {
        case .interrupted: return "interrupted"
        case .disrupted: return "disrupted"
        case .works: return "works"
        case .information: return "information"
        case .normal: return "normal"
        }
    }

    // MARK: - Permissions & Persistence

    private func requestNotificationAuthorizationIfNeeded() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error {
                print("⚠️ [Watchlist] Erreur permission notifications: \(error.localizedDescription)")
            } else {
                print("🔔 [Watchlist] Permission notifications: \(granted)")
            }
        }
    }

    private func loadWatchlist() {
        if let saved = sharedDefaults.array(forKey: watchlistKey) as? [String] {
            watchedLineKeys = Set(saved)
        } else if let fallback = UserDefaults.standard.array(forKey: watchlistKey) as? [String] {
            watchedLineKeys = Set(fallback)
        }
    }

    private func saveWatchlist() {
        let array = Array(watchedLineKeys)
        sharedDefaults.set(array, forKey: watchlistKey)
        UserDefaults.standard.set(array, forKey: watchlistKey)
    }

    private func loadNotifiedIds() {
        if let saved = sharedDefaults.dictionary(forKey: notifiedDisruptionsKey) as? [String: [String]] {
            notifiedDisruptionIds = saved.mapValues { Set($0) }
        }
    }

    private func saveNotifiedIds() {
        let encoded = notifiedDisruptionIds.mapValues { Array($0) }
        sharedDefaults.set(encoded, forKey: notifiedDisruptionsKey)
    }
}
