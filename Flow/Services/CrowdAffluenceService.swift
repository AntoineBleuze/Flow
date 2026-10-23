import Foundation

/// Modèle interne de décodage pour les pondérations d'affluence
private struct AffluenceWeightsData: Codable {
    let version: String?
    let description: String?
    let surface_lines: [String: Int]
    let rail_lines: [String: Int]
    let major_hubs: [String]
}

/// Service d'estimation d'affluence pour le réseau Île-de-France Mobilités
/// Exploite les données de validations Open Data (lignes ferrées et surface/tram/bus),
/// les courbes horaires types et le sens pendulaire domicile-travail.
final class CrowdAffluenceService: @unchecked Sendable {
    static let shared = CrowdAffluenceService()

    private let lock = NSLock()
    private var isLoaded = false
    private var surfaceLines: [String: Int] = [:]
    private var railLines: [String: Int] = [:]
    private var majorHubs: Set<String> = []

    // Mots-clés de direction vers Paris / centres d'emplois majeurs
    private let centralKeywords = [
        "paris", "chatelet", "defense", "défense", "saint-lazare", "gare de lyon",
        "gare du nord", "etoile", "étoile", "opera", "opéra", "montparnasse",
        "bercy", "vincennes", "olympiades", "haussmann", "auber", "concorde",
        "franklin", "bastille", "republique", "république"
    ]

    // Mots-clés de direction vers la banlieue / province
    private let suburbanKeywords = [
        "saint-germain", "cergy", "poissy", "boissy", "marne", "chessy",
        "melun", "mantes", "pontoise", "creil", "meaux", "massy", "robinson",
        "saint-remy", "saint-rémy", "versailles", "orly", "roissy", "cdg",
        "saint-denis", "bobigny", "villejuif", "cretéil", "créteil", "boulogne"
    ]

    private init() {
        loadData()
    }

    // MARK: - Chargement des données de référence
    private func loadData() {
        lock.lock()
        defer { lock.unlock() }
        guard !isLoaded else { return }

        var fileUrl = Bundle.main.url(forResource: "affluence_weights", withExtension: "json")
        if fileUrl == nil {
            let fallbackPaths = [
                "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/affluence_weights.json",
                "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/affluence_weights.json",
                "affluence_weights.json"
            ]
            for path in fallbackPaths where FileManager.default.fileExists(atPath: path) {
                fileUrl = URL(fileURLWithPath: path)
                break
            }
        }

        guard let url = fileUrl, let data = try? Data(contentsOf: url) else {
            print("⚠️ [CrowdAffluenceService] Impossible de charger affluence_weights.json")
            isLoaded = true
            return
        }

        do {
            let decoded = try JSONDecoder().decode(AffluenceWeightsData.self, from: data)
            self.surfaceLines = decoded.surface_lines
            self.railLines = decoded.rail_lines
            self.majorHubs = Set(decoded.major_hubs.map { $0.lowercased() })
            self.isLoaded = true
            print("✅ [CrowdAffluenceService] Chargé avec succès (\(surfaceLines.count) surface, \(railLines.count) fer)")
        } catch {
            print("❌ [CrowdAffluenceService] Erreur décodage: \(error)")
            self.isLoaded = true
        }
    }

    // MARK: - Enrichissement des Itinéraires
    func enrichJourneyWithAffluence(_ journey: Journey) -> Journey {
        guard let sections = journey.sections, !sections.isEmpty else { return journey }

        var enrichedSections: [ItinerarySection] = []
        for section in sections {
            if section.type == "public_transport" {
                enrichedSections.append(enrichSectionWithAffluence(section))
            } else {
                enrichedSections.append(section)
            }
        }

        return Journey(
            departure_date_time: journey.departure_date_time,
            arrival_date_time: journey.arrival_date_time,
            duration: journey.duration,
            nb_transfers: journey.nb_transfers,
            sections: enrichedSections
        )
    }

    func enrichSectionWithAffluence(_ section: ItinerarySection) -> ItinerarySection {
        guard section.type == "public_transport",
              let display = section.display_informations else {
            return section
        }

        let lineCode = display.code ?? display.label ?? ""
        let transportType = display.transportType
        let direction = display.direction
        let departureStation = section.from?.name
        let departureDate = parseDate(section.departure_date_time) ?? Date()

        // Affluence globale de la section
        let sectionAffluence = estimateAffluence(
            lineCode: lineCode,
            transportType: transportType,
            direction: direction,
            stationName: departureStation,
            date: departureDate
        )

        // Enrichir chaque arrêt intermédiaire avec sa propre affluence
        var updatedStops: [ItineraryStopDateTime]? = nil
        if let stops = section.stop_date_times, !stops.isEmpty {
            updatedStops = stops.map { stop in
                let stopDate = parseDate(stop.departure_date_time) ?? departureDate
                let stopAffluence = estimateAffluence(
                    lineCode: lineCode,
                    transportType: transportType,
                    direction: direction,
                    stationName: stop.stop_point.name,
                    date: stopDate
                )
                var s = stop
                s.estimated_affluence = stopAffluence
                return s
            }
        }

        return ItinerarySection(
            id: section.id,
            type: section.type,
            mode: section.mode,
            duration: section.duration,
            from: section.from,
            to: section.to,
            departure_date_time: section.departure_date_time,
            arrival_date_time: section.arrival_date_time,
            display_informations: section.display_informations,
            geojson: section.geojson,
            stop_date_times: updatedStops,
            has_closed_stop: section.has_closed_stop,
            closed_stop_alert: section.closed_stop_alert,
            has_skipped_stops: section.has_skipped_stops,
            estimated_affluence: sectionAffluence
        )
    }

    // MARK: - Moteur d'estimation
    func estimateAffluence(
        lineCode: String,
        transportType: TransportType,
        direction: String?,
        stationName: String?,
        date: Date
    ) -> EstimatedAffluence {
        // 1. Score de base selon la ligne et le mode
        let (baseScore, volumeTier) = computeBaseLineScore(lineCode: lineCode, transportType: transportType)

        // 2. Facteur horaire (profil de validations IDFM)
        let timeFactor = computeTimeFactor(for: date)

        // 3. Facteur directionnel (sens pendulaire)
        let directionFactor = computeDirectionFactor(direction: direction, date: date)

        // 4. Facteur station (pôle d'échange majeur)
        let stationFactor = computeStationFactor(stationName: stationName)

        // 5. Calcul du score combiné
        let rawScore = baseScore * timeFactor.multiplier * directionFactor.multiplier * stationFactor.multiplier
        let finalScore = min(max(rawScore, 0.05), 0.98)

        // 6. Détermination du niveau
        let level: CrowdLevel
        if finalScore >= 0.75 {
            level = .veryHigh
        } else if finalScore >= 0.55 {
            level = .high
        } else if finalScore >= 0.35 {
            level = .moderate
        } else {
            level = .low
        }

        // 7. Construction du message d'explication contextuel
        var details: [String] = []
        if !timeFactor.label.isEmpty {
            details.append(timeFactor.label)
        }
        if !directionFactor.label.isEmpty {
            details.append(directionFactor.label)
        }
        if !stationFactor.label.isEmpty {
            details.append(stationFactor.label)
        }

        let detailString = details.isEmpty ? level.shortDescription : details.joined(separator: " • ")

        return EstimatedAffluence(
            level: level,
            score: finalScore,
            detail: detailString,
            lineVolumeTier: volumeTier
        )
    }

    // MARK: - Sous-calculs
    private func computeBaseLineScore(lineCode: String, transportType: TransportType) -> (Double, String) {
        let clean = lineCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        // Ligne de surface (Bus / Tram)
        if transportType == .tram || transportType == .bus {
            // Chercher dans le dictionnaire surface
            if let count = findSurfaceCount(for: clean) {
                if count >= 80_000 {
                    return (0.62, "Ligne de surface ultra-fréquentée (\(clean))")
                } else if count >= 35_000 {
                    return (0.52, "Ligne de surface très fréquentée (\(clean))")
                } else if count >= 15_000 {
                    return (0.42, "Ligne de surface fréquentée (\(clean))")
                } else if count >= 4_000 {
                    return (0.32, "Ligne régulière (\(clean))")
                } else {
                    return (0.22, "Ligne locale peu chargée (\(clean))")
                }
            }

            // Défauts surface
            if transportType == .tram {
                return (0.48, "Réseau Tramway")
            } else {
                return (0.28, "Réseau Bus")
            }
        }

        // Réseau ferré (Métro, RER, Train)
        if let count = findRailCount(for: clean) {
            if count >= 700_000 {
                return (0.65, "Axe majeur à très haute capacité (\(clean))")
            } else if count >= 400_000 {
                return (0.54, "Ligne structurante dense (\(clean))")
            } else if count >= 200_000 {
                return (0.42, "Ligne à forte affluence (\(clean))")
            } else {
                return (0.30, "Ligne secondaire (\(clean))")
            }
        }

        // Défauts selon le mode ferré
        switch transportType {
        case .rer:
            return (0.55, "Réseau RER")
        case .metro:
            return (0.48, "Réseau Métro")
        case .transilien:
            return (0.40, "Réseau Train Transilien")
        case .cable:
            return (0.28, "Câble")
        default:
            return (0.35, "Transport public")
        }
    }

    private func findSurfaceCount(for key: String) -> Int? {
        if let c = surfaceLines[key] { return c }
        for (k, v) in surfaceLines {
            if k.caseInsensitiveCompare(key) == .orderedSame {
                return v
            }
            if k.hasPrefix(key + " ") || k.hasPrefix(key + " -") {
                return v
            }
        }
        return nil
    }

    private func findRailCount(for key: String) -> Int? {
        if let c = railLines[key] { return c }
        let stripped = key.replacingOccurrences(of: "RER ", with: "")
                          .replacingOccurrences(of: "M", with: "")
                          .replacingOccurrences(of: "TRAIN ", with: "")
        if let c = railLines[stripped] { return c }
        return nil
    }

    private func computeTimeFactor(for date: Date) -> (multiplier: Double, label: String) {
        var calendar = Calendar(identifier: .gregorian)
        if let tz = TimeZone(identifier: "Europe/Paris") {
            calendar.timeZone = tz
        }

        let comps = calendar.dateComponents([.weekday, .hour, .minute], from: date)
        let weekday = comps.weekday ?? 2 // 1 = Dimanche, 2 = Lundi... 7 = Samedi
        let hour = comps.hour ?? 12
        let minute = comps.minute ?? 0
        let time = Double(hour) + Double(minute) / 60.0

        let isWeekend = (weekday == 1 || weekday == 7)

        if !isWeekend {
            // Semaine (Lundi - Vendredi)
            if time >= 7.5 && time <= 9.0 {
                return (1.85, "Heure de pointe du matin")
            } else if time >= 7.0 && time <= 9.5 {
                return (1.50, "Pointe matinale")
            } else if time >= 9.5 && time < 12.0 {
                return (0.75, "Heures creuses")
            } else if time >= 12.0 && time <= 14.0 {
                return (1.05, "Pause méridienne")
            } else if time > 14.0 && time < 16.5 {
                return (0.80, "Heures creuses après-midi")
            } else if time >= 17.2 && time <= 19.0 {
                return (1.85, "Heure de pointe du soir")
            } else if time >= 16.5 && time <= 19.5 {
                return (1.50, "Pointe de fin de journée")
            } else if time > 19.5 && time <= 22.0 {
                return (0.65, "Soirée")
            } else if time > 22.0 || time < 6.0 {
                return (0.25, "Trafic de nuit fluide")
            } else {
                return (0.70, "Début de service")
            }
        } else {
            // Week-end (Samedi & Dimanche)
            if time >= 14.0 && time <= 19.0 {
                return (1.10, "Affluence week-end d'après-midi")
            } else if time >= 11.0 && time < 14.0 || time > 19.0 && time <= 22.0 {
                return (0.80, "Trafic régulier de week-end")
            } else {
                return (0.45, "Heures calmes de week-end")
            }
        }
    }

    private func computeDirectionFactor(direction: String?, date: Date) -> (multiplier: Double, label: String) {
        guard let direction = direction?.lowercased(), !direction.isEmpty else {
            return (1.0, "")
        }

        var calendar = Calendar(identifier: .gregorian)
        if let tz = TimeZone(identifier: "Europe/Paris") {
            calendar.timeZone = tz
        }
        let comps = calendar.dateComponents([.weekday, .hour, .minute], from: date)
        let weekday = comps.weekday ?? 2
        let hour = comps.hour ?? 12
        let minute = comps.minute ?? 0
        let time = Double(hour) + Double(minute) / 60.0

        let isWeekend = (weekday == 1 || weekday == 7)
        if isWeekend {
            return (1.0, "")
        }

        let isInbound = centralKeywords.contains { direction.contains($0) }
        let isOutbound = suburbanKeywords.contains { direction.contains($0) }

        // Pointe du matin : flux massif vers Paris / centres d'emploi
        if time >= 7.0 && time <= 9.5 {
            if isInbound {
                return (1.25, "Flux entrant vers Paris")
            } else if isOutbound {
                return (0.80, "Contre-pointe vers banlieue")
            }
        }

        // Pointe du soir : flux massif vers la banlieue
        if time >= 16.5 && time <= 19.5 {
            if isOutbound {
                return (1.25, "Flux sortant vers banlieue")
            } else if isInbound {
                return (0.85, "Contre-pointe")
            }
        }

        return (1.0, "")
    }

    private func computeStationFactor(stationName: String?) -> (multiplier: Double, label: String) {
        guard let station = stationName?.lowercased(), !station.isEmpty else {
            return (1.0, "")
        }

        for hub in majorHubs {
            if station.contains(hub) {
                return (1.15, "Pôle d'échange majeur")
            }
        }

        return (1.0, "")
    }

    private func parseDate(_ isoString: String?) -> Date? {
        guard let str = isoString, !str.isEmpty else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let tz = TimeZone(identifier: "Europe/Paris") {
            formatter.timeZone = tz
        }
        return formatter.date(from: str)
    }
}
