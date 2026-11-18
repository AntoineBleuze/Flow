import Combine
import CoreGraphics
import CoreLocation
import Foundation
import FoundationModels
import SwiftUI

public struct FlowAIAvailability {
    public static var isAvailable: Bool {
        if #available(iOS 26.0, *) {
            return true
        } else {
            return false
        }
    }
}

@available(iOS 26.0, *)
@MainActor
public final class FlowAIService: ObservableObject {
    public static let shared = FlowAIService()

    @Published public var isGenerating: Bool = false
    @Published public var isStreamingText: Bool = false
    @Published public var activeToolStatus: String? = nil
    @Published var latestGeneratedJourneys: [Journey] = []
    @Published public var latestDestinationName: String? = nil
    @Published public var lastResponse: String = ""
    @Published public var lastError: String?

    private var session: LanguageModelSession?

    private init() {
        initSession()
    }

    private func initSession() {
        let tools: [any Tool] = [
            SearchItineraryTool(),
            GetUserLocationTool(),
            RecommendStationExitTool(),
            CheckElevatorStatusTool(),
            GetTrafficStatusTool(),
            FocusStationOnMapTool()
        ]

        let instructions = """
        Tu es Flow IA, le copilote d'intelligence artificielle officiel de l'application Flow pour le réseau Île-de-France Mobilités (Métro, RER, Tramway, Transilien).
        Tu réponds en français de façon concise, structurée, naturelle et directement actionnable.

        Règles d'action :
        - Pour toute demande d'itinéraire, de trajet ou de direction ("comment aller à...", "emmène-moi à...", "quel trajet pour..."), appelle impérativement `searchItinerary`. L'outil utilise automatiquement la position GPS actuelle si aucun départ n'est donné, récupère les horaires réels IDFM et affiche la carte interactive du trajet directement dans la conversation et sur la carte Explorer.
        - Dès que l'utilisateur mentionne une heure d'arrivée ("arriver à 14:50", "être là-bas à 9h") ou de départ ("partir à 14:50"), passe impérativement `time` au format HH:mm (ex: "14:50") et `isArrivalTime: true` (pour une heure d'arrivée) ou `false` (pour une heure de départ) à `searchItinerary`.
        - Si l'utilisateur corrige ou précise l'heure dans un message suivant ("Je ne veux pas partir à 5h, je veux arriver à 14:50"), rappelle OBLIGATOIREMENT `searchItinerary` avec la destination de la conversation, la nouvelle heure `time` et `isArrivalTime`. N'invente JAMAIS d'horaires sans appeler `searchItinerary`.
        - Pour afficher ou centrer la carte sur une station ("montre-moi Châtelet", "où est Bastille"), utilise `focusStationOnMap`.
        - Pour connaître les stations proches ou la position GPS actuelle, utilise `getUserLocation`.
        - Pour trouver la meilleure sortie d'une station, utilise `recommendStationExit`.
        - Pour vérifier les ascenseurs (PMR / poussettes / bagages), utilise `checkElevatorStatus`.
        - Pour l'état du trafic en direct sur une ligne, utilise `getTrafficStatus`.
        - IMPORTANT : Lorsqu'un itinéraire est retourné par `searchItinerary`, la carte interactive détaillée s'affiche automatiquement sous ta réponse. Rédige donc un résumé fluide de 2 à 3 phrases maximum (heure de départ, heure d'arrivée, lignes clés et sortie éventuelle) SANS longue liste à puces et SANS utiliser d'astérisques Markdown (**). Ne répète jamais la même phrase en boucle.
        """

        self.session = LanguageModelSession(
            model: .default,
            tools: tools,
            instructions: instructions
        )
    }

    /// Réinitialiser la session de conversation
    public func resetConversation() {
        initSession()
        lastResponse = ""
        lastError = nil
        activeToolStatus = nil
        latestGeneratedJourneys = []
        latestDestinationName = nil
        isStreamingText = false
    }

    /// Enrichit le prompt de l'utilisateur avec son contexte temps réel (heure locale, GPS, perturbations, trajet actif)
    private func buildEnrichedPrompt(userPrompt: String) -> String {
        var contextBlocks: [String] = []
        let currentTimeStr = DateFormat.shortTime.string(from: Date())
        contextBlocks.append("[Heure actuelle : \(currentTimeStr)]")

        if let location = LocationManager.shared.userLocation {
            let allStations = MapDataService.shared.allStations
            let uLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
            let nearest = allStations.map { station -> (station: MapStation, dist: Double) in
                let sLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
                return (station, uLoc.distance(from: sLoc))
            }.sorted { $0.dist < $1.dist }.prefix(3)

            var gpsBlock = "[Position GPS actuelle : (\(String(format: "%.4f", location.latitude)), \(String(format: "%.4f", location.longitude)))]"
            if !nearest.isEmpty {
                let stationsSummary = nearest.map { item in
                    let m = Int(item.dist)
                    let walkMin = max(1, Int(ceil(Double(m) / 80.0)))
                    let lines = item.station.lines.map { $0.name }.joined(separator: ", ")
                    return "\(item.station.name) (à \(m)m, ~\(walkMin) min à pied, lignes: \(lines.isEmpty ? "Métro/RER" : lines))"
                }.joined(separator: "; ")
                gpsBlock += "\n[Stations les plus proches : \(stationsSummary)]"
            }
            contextBlocks.append(gpsBlock)
        }

        let disruptedLines = TrafficService.shared.lines.filter {
            $0.status == .interrupted || $0.status == .disrupted
        }
        if !disruptedLines.isEmpty {
            let summary = disruptedLines.prefix(6).map {
                "Ligne \($0.lineId) (\($0.status.description))"
            }.joined(separator: ", ")
            contextBlocks.append("[Perturbations majeures en cours : \(summary)]")
        }

        let routeManager = RouteNavigationManager.shared
        if routeManager.isRouteActive, routeManager.activeJourney != nil {
            contextBlocks.append("[Navigation active en cours vers \(routeManager.destinationName), ~\(routeManager.remainingMinutes) min restantes, prochaine étape : \(routeManager.pillHeadline)]")
        }

        guard !contextBlocks.isEmpty else {
            return userPrompt
        }

        let header = contextBlocks.joined(separator: "\n")
        return "\(header)\n[Consigne : Prends en compte ce contexte temps réel.]\n\n\(userPrompt)"
    }

    /// Poser une question générale à l'assistant
    public func askAssistant(prompt: String) async throws -> String {
        if session == nil {
            initSession()
        }
        guard let session = session else {
            throw NSError(domain: "FlowAI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Session non initialisée"])
        }
        return try await executePrompt(prompt, on: session)
    }

    private func executePrompt(_ prompt: String, on session: LanguageModelSession) async throws -> String {
        isGenerating = true
        isStreamingText = false
        lastError = nil
        latestGeneratedJourneys = []
        latestDestinationName = nil
        activeToolStatus = "Analyse de votre demande..."
        defer {
            isGenerating = false
            isStreamingText = false
            activeToolStatus = nil
        }

        do {
            let enrichedPrompt = buildEnrichedPrompt(userPrompt: prompt)
            let response = try await session.respond(to: enrichedPrompt)
            let result = response.content
            self.lastResponse = result
            return result
        } catch {
            self.lastError = error.localizedDescription
            throw error
        }
    }

    /// Streamer la réponse mot à mot pour un rendu visuel fluide
    public func streamAssistant(prompt: String) -> AsyncThrowingStream<String, Error> {
        AsyncThrowingStream { continuation in
            Task { @MainActor in
                self.isGenerating = true
                self.isStreamingText = false
                self.lastError = nil
                self.latestGeneratedJourneys = []
                self.latestDestinationName = nil
                self.activeToolStatus = "Analyse de votre demande..."
                defer {
                    self.isGenerating = false
                    self.isStreamingText = false
                    self.activeToolStatus = nil
                }

                if self.session == nil {
                    self.initSession()
                }
                guard let session = self.session else {
                    continuation.finish(throwing: NSError(domain: "FlowAI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Session non initialisée"]))
                    return
                }

                do {
                    let enrichedPrompt = self.buildEnrichedPrompt(userPrompt: prompt)
                    let stream = session.streamResponse(to: enrichedPrompt)
                    for try await snapshot in stream {
                        if !snapshot.content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            if !self.isStreamingText {
                                self.isStreamingText = true
                            }
                            self.activeToolStatus = nil
                        }
                        continuation.yield(snapshot.content)
                    }
                    self.lastResponse = ""
                    continuation.finish()
                } catch {
                    self.lastError = error.localizedDescription
                    continuation.finish(throwing: error)
                }
            }
        }
    }

    /// Générer une alerte structurée et vulgarisée à partir d'un bulletin brut
    public func generateSmartAlert(from rawDisruption: String) async throws -> SmartTrafficAlert {
        guard let session = session else {
            initSession()
            guard let session = session else {
                throw NSError(domain: "FlowAI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Session non disponible"])
            }
            return try await executeAlert(rawDisruption, on: session)
        }
        return try await executeAlert(rawDisruption, on: session)
    }

    private func executeAlert(_ raw: String, on session: LanguageModelSession) async throws -> SmartTrafficAlert {
        let prompt = "Analyse et résume ce bulletin d'incident de transport en une alerte claire et typée :\n\(raw)"
        let response = try await session.respond(to: prompt, generating: SmartTrafficAlert.self)
        return response.content
    }

    /// Générer un briefing matinal personnalisé basé sur les favoris et le trafic actuel
    public func generateDailyBriefing() async throws -> String {
        let favoriteStations = FavoritesService.shared.favoriteStations
        let trafficLines = TrafficService.shared.lines

        var context = "Voici les informations actuelles sur le réseau :\n"
        if !favoriteStations.isEmpty {
            let names = favoriteStations.map { $0.name }.joined(separator: ", ")
            context += "- Stations favorites de l'utilisateur : \(names)\n"
        }

        let disrupted = trafficLines.filter { $0.status != .normal }
        if disrupted.isEmpty {
            context += "- Trafic global : Aucune perturbation majeure sur les lignes principales.\n"
        } else {
            context += "- Lignes perturbées actuellement : " + disrupted.map { "Ligne \($0.lineId) (\($0.status.description))" }.joined(separator: ", ") + "\n"
        }

        let prompt = """
        \(context)
        Génère un briefing court, dynamique et bienveillant (3-4 phrases maximum) pour la journée de transport de l'usager.
        """

        return try await askAssistant(prompt: prompt)
    }

    /// Analyser la signalétique ou les panneaux d'une station à l'aide de la caméra (.vision)
    @available(iOS 27.0, *)
    public func analyzeStationSign(cgImage: CGImage, targetDestination: String) async throws -> String {
        guard let session = session else {
            initSession()
            guard let session = session else {
                throw NSError(domain: "FlowAI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Session non disponible"])
            }
            return try await executeVision(cgImage: cgImage, target: targetDestination, on: session)
        }
        return try await executeVision(cgImage: cgImage, target: targetDestination, on: session)
    }

    @available(iOS 27.0, *)
    private func executeVision(cgImage: CGImage, target: String, on session: LanguageModelSession) async throws -> String {
        isGenerating = true
        defer { isGenerating = false }

        let response = try await session.respond {
            "Tu es un copilote d'orientation en station de métro. Voici une photo prise par l'utilisateur d'un panneau ou de la signalétique. L'utilisateur souhaite rejoindre la direction ou sortie suivante : '\(target)'. Lis attentivement le panneau et indique-lui directement quelle direction, sortie ou couloir emprunter (gauche, droite, en face, etc.)."
            Attachment(cgImage)
        }
        return response.content
    }
}
