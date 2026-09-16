import Combine
import CoreLocation
import Foundation
import FoundationModels
import MapKit

// MARK: - Structured Alert Model

@available(iOS 27.0, *)
@Generable(description: "Bulletin d'incident de transport structuré et simplifié")
public struct SmartTrafficAlert: Sendable {
    @Guide(description: "Résumé percutant en une phrase pour notification ou widget")
    public var summary: String
    
    @Guide(description: "Niveau d'impact sur le trajet (ex: Léger, Modéré, Critique)")
    public var impact: String
    
    @Guide(description: "Itinéraire de report ou recommandation pratique")
    public var recommendation: String
}

// MARK: - Tool 1: Calcul et Recommandation d'Itinéraire (Géolocalisé)

@available(iOS 27.0, *)
public struct SearchItineraryTool: Tool, Sendable {
    public let name = "searchItinerary"
    public let description = "Recherche le meilleur itinéraire en transport en commun vers une destination (station ou monument, ex: Champ de Mars Tour Eiffel, Châtelet, La Défense) depuis la position GPS actuelle de l'utilisateur ou un lieu de départ."

    @Generable
    public struct Arguments: Sendable {
        @Guide(description: "Lieu, monument ou station de destination (ex: Champ de Mars Tour Eiffel, Gare de Lyon, Châtelet, Musée du Louvre)")
        public var destination: String

        @Guide(description: "Point ou station de départ si spécifié. Laisser vide ou nil pour utiliser automatiquement la position GPS actuelle de l'utilisateur.")
        public var departure: String?
    }

    public init() {}

    public func call(arguments: Arguments) async throws -> String {
        let destQuery = arguments.destination.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !destQuery.isEmpty else {
            return "Veuillez préciser une destination pour calculer un itinéraire."
        }

        // 1. Stations disponibles
        let allStations = await MainActor.run {
            MapDataService.shared.allStations
        }

        // 2. Position GPS de départ
        let userLocation = await MainActor.run {
            LocationManager.shared.userLocation
        }

        var startStation: MapStation?
        var startCoordinate: CLLocationCoordinate2D?
        var startDescription = ""

        if let dep = arguments.departure, !dep.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let normDep = StationSuggestionEngine.normalize(dep)
            startStation = allStations.first { StationSuggestionEngine.normalize($0.name).contains(normDep) }
            if let st = startStation {
                startCoordinate = st.coordinate
                startDescription = "Station \(st.name)"
            }
        }

        if startCoordinate == nil {
            if let uLoc = userLocation {
                startCoordinate = uLoc
                let uCLLoc = CLLocation(latitude: uLoc.latitude, longitude: uLoc.longitude)
                let closest = allStations.min { a, b in
                    uCLLoc.distance(from: CLLocation(latitude: a.latitude, longitude: a.longitude)) <
                    uCLLoc.distance(from: CLLocation(latitude: b.latitude, longitude: b.longitude))
                }
                if let closest = closest {
                    startStation = closest
                    let dist = Int(uCLLoc.distance(from: CLLocation(latitude: closest.latitude, longitude: closest.longitude)))
                    let walkMin = max(1, Int(ceil(Double(dist) / 80.0)))
                    let lines = closest.lines.map { $0.name }.joined(separator: ", ")
                    startDescription = "Votre position actuelle (à \(dist)m / \(walkMin) min à pied de la station \(closest.name) - Lignes \(lines))"
                } else {
                    startDescription = "Votre position GPS actuelle"
                }
            } else {
                startCoordinate = CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3470)
                startStation = allStations.first { $0.name.lowercased().contains("châtelet") }
                startDescription = "Centre de Paris / Châtelet (position GPS en attente)"
            }
        }

        // 3. Résolution de la destination
        let normDest = StationSuggestionEngine.normalize(destQuery)
        var endStation: MapStation?

        if normDest.contains("champ de mars") || normDest.contains("tour eiffel") {
            endStation = allStations.first { $0.name.lowercased().contains("champ de mars") } ??
                         allStations.first { $0.name.lowercased().contains("bir hakeim") }
        } else if normDest.contains("louvre") {
            endStation = allStations.first { $0.name.lowercased().contains("palais royal") }
        } else if normDest.contains("etoile") || normDest.contains("arc de triomphe") {
            endStation = allStations.first { $0.name.lowercased().contains("charles de gaulle") }
        } else if normDest.contains("notre dame") {
            endStation = allStations.first { $0.name.lowercased().contains("saint michel") }
        }

        if endStation == nil {
            let tokens = normDest.components(separatedBy: " ").filter { !$0.isEmpty }
            endStation = allStations.first { station in
                let normName = StationSuggestionEngine.normalize(station.name)
                return tokens.allSatisfy { normName.contains($0) }
            }
        }

        if endStation == nil {
            endStation = allStations.first { station in
                let normName = StationSuggestionEngine.normalize(station.name)
                return normName.contains(normDest) || normDest.contains(normName)
            }
        }

        guard let destStation = endStation, let startCoord = startCoordinate else {
            return "Destination '\(arguments.destination)' non reconnue sur le réseau. Veuillez préciser le nom d'une station ou d'un monument."
        }

        // 4. Sortie recommandée à l'arrivée
        var exitRecommendation = ""
        let matchingExits = await MainActor.run {
            StationExitsService.shared.allExits.filter { exit in
                exit.stations?.contains(where: {
                    let name = $0.name.lowercased()
                    return name.contains(destStation.name.lowercased()) || destStation.name.lowercased().contains(name)
                }) ?? false
            }
        }
        if let bestExit = matchingExits.first(where: { $0.is_exit }) {
            let num = bestExit.exit_number.map { "Sortie \($0)" } ?? "Sortie"
            let name = bestExit.exit_name ?? ""
            exitRecommendation = "\n- Sortie conseillée à l'arrivée : \(num)\(name.isEmpty ? "" : " (\(name))")"
        }

        // 5. Calcul déterministe via TransitGraphRouter (graphe officiel sans hallucination)
        let resolvedStartStation = startStation
        let calculationResult = await MainActor.run { () -> (TransitRoute, Journey, [String])? in
            guard let startSt = resolvedStartStation,
                  let route = TransitGraphRouter.shared.findOptimalRoute(from: startSt, to: destStation, allStations: allStations) else {
                return nil
            }
            let journey = TransitGraphRouter.shared.buildJourney(from: route, startCoord: startCoord)

            // Info trafic temps réel
            var trafficAlerts: [String] = []
            let usedLines = Set(route.legs.map { $0.lineName })
            let allLinesTraffic = TrafficService.shared.lines
            for lineId in usedLines {
                if let tLine = allLinesTraffic.first(where: { $0.lineId.lowercased() == lineId.lowercased() }), tLine.status != .normal {
                    trafficAlerts.append("⚠️ Info Trafic Ligne \(lineId) : \(tLine.message ?? "Perturbations signalées")")
                }
            }

            // Déclencher l'aperçu sur la carte Explore
            NavigationCoordinator.shared.showItineraryPreview(journey: journey)

            return (route, journey, trafficAlerts)
        }

        if let (route, _, trafficAlerts) = calculationResult {
            let durMin = max(1, route.totalDurationSeconds / 60)
            let transfers = route.numberOfTransfers
            let transferStr = transfers == 0 ? "Direct (sans correspondance)" : "\(transfers) correspondance(s)"

            var details = "🧭 Itinéraire recommandé vers \(destStation.name) :\n"
            details += "- Point de départ : \(startDescription)\n"
            details += "- Destination : \(destStation.name)\n"
            details += "- Durée estimée : ~\(durMin) min (\(transferStr))\n"

            for (idx, leg) in route.legs.enumerated() {
                let mDur = max(1, leg.durationSeconds / 60)
                let numStops = leg.intermediateStations.count + 1
                details += "- Étape \(idx + 1) : Prendre la Ligne \(leg.lineName) (\(leg.transportType.rawValue)) direction \(leg.direction) de \(leg.fromStation.name) jusqu'à \(leg.toStation.name) (\(numStops) arrêt\(numStops > 1 ? "s" : ""), ~\(mDur) min)\n"
                if idx < route.legs.count - 1 {
                    details += "  ↪️ Correspondance à \(leg.toStation.name) vers la ligne \(route.legs[idx + 1].lineName)\n"
                }
            }

            for alert in trafficAlerts {
                details += "\n" + alert
            }

            details += exitRecommendation
            return details
        }

        // 6. Repli API externe si besoin
        do {
            let journeys = try await withTimeout(seconds: 3.0) {
                try await IDFMItineraryService.shared.searchItineraryAsync(from: startCoord, to: destStation)
            }
            if let bestJourney = journeys.first {
                await MainActor.run {
                    NavigationCoordinator.shared.showItineraryPreview(journey: bestJourney)
                }
                return "🧭 Itinéraire calculé pour rejoindre \(destStation.name) depuis votre position." + exitRecommendation
            }
        } catch {
            print("⚠️ API fallback unavailable")
        }

        return "Impossible de trouver un itinéraire direct vers \(destStation.name)."
    }

    private func withTimeout<T: Sendable>(seconds: Double, operation: @Sendable @escaping () async throws -> T) async throws -> T {
        try await withThrowingTaskGroup(of: T.self) { group in
            group.addTask {
                try await operation()
            }
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
                throw NSError(domain: "Timeout", code: -1, userInfo: [NSLocalizedDescriptionKey: "Délai dépassé"])
            }
            let result = try await group.next()!
            group.cancelAll()
            return result
        }
    }
}

// MARK: - Tool 2: Géolocalisation & Stations Proches

@available(iOS 27.0, *)
public struct GetUserLocationTool: Tool, Sendable {
    public let name = "getUserLocation"
    public let description = "Obtient la position GPS précise de l'utilisateur et liste les stations de métro/RER/tram les plus proches avec leur distance à pied."

    @Generable
    public struct Arguments: Sendable {
        @Guide(description: "Rayon de recherche des stations proches en mètres (défaut: 600)")
        public var radiusMeters: Int?
    }

    public init() {}

    public func call(arguments: Arguments) async throws -> String {
        let userLocation = await MainActor.run {
            LocationManager.shared.userLocation
        }
        guard let location = userLocation else {
            return "Position GPS de l'utilisateur non encore disponible. Estimation par défaut au centre de Paris (Châtelet)."
        }

        let allStations = await MainActor.run {
            MapDataService.shared.allStations
        }

        let uLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let sorted = allStations.map { station -> (station: MapStation, dist: Double) in
            let sLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
            return (station, uLoc.distance(from: sLoc))
        }.sorted { $0.dist < $1.dist }.prefix(4)

        var report = "📍 Position actuelle de l'utilisateur (GPS: \(String(format: "%.4f", location.latitude)), \(String(format: "%.4f", location.longitude))) :\n"
        for item in sorted {
            let m = Int(item.dist)
            let walkMin = max(1, Int(ceil(Double(m) / 80.0)))
            let lines = item.station.lines.map { $0.name }.joined(separator: ", ")
            report += "- \(item.station.name) à \(m)m (~\(walkMin) min à pied) - Lignes : \(lines.isEmpty ? "RER/Métro" : lines)\n"
        }
        return report
    }
}

// MARK: - Tool 3: Recommandation de Sortie de Station

@available(iOS 27.0, *)
public struct RecommendStationExitTool: Tool, Sendable {
    public let name = "recommendStationExit"
    public let description = "Recommande la sortie de station optimale (numéro et nom) pour rejoindre une adresse ou coordonnée de destination."

    @Generable
    public struct Arguments: Sendable {
        @Guide(description: "Nom de la station RATP/SNCF où l'utilisateur se trouve ou arrive (ex: Saint-Lazare, Châtelet, Champ de Mars Tour Eiffel)")
        public var stationName: String
        
        @Guide(description: "Latitude de la destination finale si connue")
        public var destinationLatitude: Double?
        
        @Guide(description: "Longitude de la destination finale si connue")
        public var destinationLongitude: Double?
    }

    public init() {}

    public func call(arguments: Arguments) async throws -> String {
        let matchingExits = await MainActor.run {
            let exitsService = StationExitsService.shared
            let targetName = StationSuggestionEngine.normalize(arguments.stationName)
            
            // Recherche des sorties correspondant au nom de station
            return exitsService.allExits.filter { exit in
                exit.stations?.contains(where: {
                    let sName = StationSuggestionEngine.normalize($0.name)
                    return sName.contains(targetName) || targetName.contains(sName)
                }) ?? false
            }
        }
        
        if matchingExits.isEmpty {
            return "Aucune sortie répertoriée pour la station '\(arguments.stationName)'."
        }
        
        // Si des coordonnées de destination sont fournies, on trouve la sortie la plus proche
        if let lat = arguments.destinationLatitude, let lon = arguments.destinationLongitude {
            let destLoc = CLLocation(latitude: lat, longitude: lon)
            
            let bestExit = matchingExits.filter { $0.is_exit }.min { a, b in
                guard let ca = a.coordinates, let cb = b.coordinates else { return false }
                let da = destLoc.distance(from: CLLocation(latitude: ca.lat, longitude: ca.lon))
                let db = destLoc.distance(from: CLLocation(latitude: cb.lat, longitude: cb.lon))
                return da < db
            }
            
            if let best = bestExit {
                let numStr = best.exit_number.map { "Sortie \($0)" } ?? "Sortie"
                let nameStr = best.exit_name ?? "Sans nom spécifique"
                let dist = best.coordinates.map { Int(destLoc.distance(from: CLLocation(latitude: $0.lat, longitude: $0.lon))) } ?? 0
                return "Sortie optimale recommandée : \(numStr) (\(nameStr)), située à environ \(dist) mètres de votre destination."
            }
        }
        
        // Sinon, on liste les principales sorties de la station
        let exitList = matchingExits.prefix(6).map { exit in
            let num = exit.exit_number.map { "Sortie \($0)" } ?? "Accès"
            let name = exit.exit_name ?? "Sans nom"
            return "- \(num) : \(name)"
        }.joined(separator: "\n")
        
        return "Sorties disponibles à \(arguments.stationName) :\n\(exitList)"
    }
}

// MARK: - Tool 4: Vérification des Ascenseurs (Accessibilité)

@available(iOS 27.0, *)
public struct CheckElevatorStatusTool: Tool, Sendable {
    public let name = "checkElevatorStatus"
    public let description = "Vérifie la disponibilité et l'état de fonctionnement des ascenseurs dans une station pour les PMR ou voyageurs avec bagages/poussettes."

    @Generable
    public struct Arguments: Sendable {
        @Guide(description: "Nom de la station de métro, RER ou train (ex: Châtelet, Barbès - Rochechouart, Cité)")
        public var stationName: String
    }

    public init() {}

    public func call(arguments: Arguments) async throws -> String {
        let query = arguments.stationName.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        // Recherche dans le CSV etat-des-ascenseurs
        let csvPaths = [
            Bundle.main.path(forResource: "etat-des-ascenseurs", ofType: "csv"),
            "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/etat-des-ascenseurs.csv"
        ].compactMap { $0 }
        
        guard let path = csvPaths.first(where: { FileManager.default.fileExists(atPath: $0) }),
              let content = try? String(contentsOfFile: path, encoding: .utf8) else {
            return "Impossible d'accéder aux données d'ascenseurs actuellement."
        }
        
        let lines = content.components(separatedBy: .newlines)
        var foundElevators: [(status: String, situation: String, direction: String, reason: String)] = []
        
        for line in lines.dropFirst() {
            let cols = line.components(separatedBy: ";")
            guard cols.count >= 14 else { continue }
            let zdcName = cols[11].lowercased()
            if zdcName.contains(query) {
                let status = cols[5] // available / notavailable
                let reason = cols[4]
                let situation = cols[7]
                let direction = cols[8]
                foundElevators.append((status, situation, direction, reason))
            }
        }
        
        if foundElevators.isEmpty {
            return "Aucun ascenseur répertorié ou station non équipée pour '\(arguments.stationName)'."
        }
        
        let inService = foundElevators.filter { $0.status == "available" }
        let outOfService = foundElevators.filter { $0.status != "available" }
        
        if outOfService.isEmpty {
            return "✅ Tous les ascenseurs (\(inService.count)) sont opérationnels à la station \(arguments.stationName)."
        } else {
            var report = "⚠️ \(outOfService.count) ascenseur(s) hors service sur \(foundElevators.count) à \(arguments.stationName) :\n"
            for out in outOfService {
                report += "- \(out.situation) (\(out.direction)) : \(out.reason.isEmpty ? "Panne" : out.reason)\n"
            }
            if !inService.isEmpty {
                report += "\(inService.count) ascenseur(s) restent opérationnels."
            }
            return report
        }
    }
}

// MARK: - Tool 5: État du Trafic d'une Ligne

@available(iOS 27.0, *)
public struct GetTrafficStatusTool: Tool, Sendable {
    public let name = "getTrafficStatus"
    public let description = "Consulte l'état du trafic en temps réel, les perturbations et les prévisions d'une ligne de transport (métro, RER, tramway, train)."

    @Generable
    public struct Arguments: Sendable {
        @Guide(description: "Nom ou numéro de la ligne (ex: 1, 13, 14, A, B, T2)")
        public var lineName: String
    }

    public init() {}

    public func call(arguments: Arguments) async throws -> String {
        let cleanQuery = arguments.lineName.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            .replacingOccurrences(of: "ligne ", with: "")
            .replacingOccurrences(of: "m", with: "")
            .replacingOccurrences(of: "rer ", with: "")
            .replacingOccurrences(of: "tram ", with: "")
        
        let lineInfo = await MainActor.run { () -> (status: LineStatus, type: TransportType, lineId: String, message: String?)? in
            guard let line = TrafficService.shared.lines.first(where: {
                $0.lineId.lowercased() == cleanQuery ||
                $0.lineId.lowercased() == arguments.lineName.lowercased()
            }) else {
                return nil
            }
            return (line.status, line.type, line.lineId, line.message)
        }
        
        guard let line = lineInfo else {
            return "Ligne '\(arguments.lineName)' non trouvée dans le réseau."
        }
        
        switch line.status {
        case .normal:
            return "🟢 Ligne \(line.lineId) (\(line.type.rawValue)) : Trafic normal sur l'ensemble de la ligne."
        case .disrupted:
            let msg = line.message ?? "Perturbations signalées."
            return "🟠 Ligne \(line.lineId) (\(line.type.rawValue)) - Trafic perturbé : \(msg)"
        case .interrupted:
            let msg = line.message ?? "Trafic interrompu."
            return "🔴 Ligne \(line.lineId) (\(line.type.rawValue)) - Trafic interrompu : \(msg)"
        case .works:
            let msg = line.message ?? "Travaux en cours."
            return "🟡 Ligne \(line.lineId) (\(line.type.rawValue)) - Travaux : \(msg)"
        case .information:
            let msg = line.message ?? "Information voyageur."
            return "ℹ️ Ligne \(line.lineId) (\(line.type.rawValue)) - Info : \(msg)"
        }
    }
}

// MARK: - Tool 6: Afficher une Station sur la Carte

@available(iOS 27.0, *)
public struct FocusStationOnMapTool: Tool, Sendable {
    public let name = "focusStationOnMap"
    public let description = "Centre la carte Explore sur une station spécifique et ouvre sa fiche détaillée avec les lignes et correspondances."

    @Generable
    public struct Arguments: Sendable {
        @Guide(description: "Nom de la station de métro, RER ou tramway à afficher (ex: Châtelet, Bastille, Saint-Lazare)")
        public var stationName: String
    }

    public init() {}

    public func call(arguments: Arguments) async throws -> String {
        let normQuery = StationSuggestionEngine.normalize(arguments.stationName)
        let allStations = await MainActor.run { MapDataService.shared.allStations }
        guard let station = allStations.first(where: {
            StationSuggestionEngine.normalize($0.name).contains(normQuery)
        }) else {
            return "Station '\(arguments.stationName)' introuvable sur le réseau."
        }

        await MainActor.run {
            NavigationCoordinator.shared.switchToExplore()
            NavigationCoordinator.shared.selectedStation = station
        }

        let lines = station.lines.map { $0.name }.joined(separator: ", ")
        return "Station \(station.name) affichée sur la carte. Lignes desservies : \(lines.isEmpty ? "Métro" : lines)."
    }
}

