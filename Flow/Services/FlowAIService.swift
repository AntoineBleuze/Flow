import Combine
import CoreGraphics
import CoreLocation
import Foundation
import FoundationModels
import SwiftUI

public struct FlowAIAvailability {
    public static var isAvailable: Bool {
        if #available(iOS 27.0, *) {
            return true
        } else {
            return false
        }
    }
}

@available(iOS 27.0, *)
@MainActor
public final class FlowAIService: ObservableObject {
    public static let shared = FlowAIService()

    @Published public var isGenerating: Bool = false
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
        Tu es le copilote d'intelligence artificielle de l'application Flow, expert officiel du réseau Île-de-France Mobilités (Métro, RER, Tramway, Transilien).
        Tu réponds en français de façon concise, précise, naturelle et directe.

        Règles d'action :
        - Pour toute demande d'itinéraire ou de trajet (ex: "comment aller à...", "quel itinéraire me recommandes-tu pour aller à..."), utilise impérativement l'outil `searchItinerary`. Cet outil prend en compte la position géographique actuelle de l'utilisateur si aucun point de départ n'est précisé et affiche automatiquement un aperçu du tracé sur la carte Explorer en masquant les autres lignes.
        - Pour afficher ou centrer la carte sur une station spécifique (ex: "montre-moi Châtelet", "où est la station Bastille"), utilise `focusStationOnMap`.
        - Pour connaître les stations à proximité immédiate ou la position GPS de l'utilisateur, utilise `getUserLocation`.
        - Pour une sortie spécifique ou connaître les issues d'une station, utilise `recommendStationExit`.
        - Pour vérifier l'état des ascenseurs (PMR / poussettes / bagages), utilise `checkElevatorStatus`.
        - Pour l'état du trafic, utilise `getTrafficStatus`.
        - IMPORTANT : Ne répète JAMAIS les mêmes phrases, listes ou paragraphes en boucle. Donne une réponse structurée, fluide et agréable à lire.
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
    }

    /// Enrichit le prompt de l'utilisateur avec son contexte de géolocalisation actuel
    private func buildEnrichedPrompt(userPrompt: String) -> String {
        guard let location = LocationManager.shared.userLocation else {
            return userPrompt
        }
        
        let allStations = MapDataService.shared.allStations
        let uLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let nearest = allStations.map { station -> (station: MapStation, dist: Double) in
            let sLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
            return (station, uLoc.distance(from: sLoc))
        }.sorted { $0.dist < $1.dist }.prefix(3)
        
        var context = "[Position GPS actuelle de l'utilisateur : (\(String(format: "%.4f", location.latitude)), \(String(format: "%.4f", location.longitude)))]\n"
        if !nearest.isEmpty {
            let stationsSummary = nearest.map { item in
                let m = Int(item.dist)
                let walkMin = max(1, Int(ceil(Double(m) / 80.0)))
                let lines = item.station.lines.map { $0.name }.joined(separator: ", ")
                return "\(item.station.name) (à \(m)m, ~\(walkMin) min à pied, lignes: \(lines.isEmpty ? "Métro/RER" : lines))"
            }.joined(separator: ", ")
            context += "[Stations les plus proches à pied : \(stationsSummary)]\n"
        }
        context += "[Consigne : Réponds en tenant compte de cette position de départ.]\n\n"
        return "\(context)\(userPrompt)"
    }

    /// Poser une question générale à l'assistant
    public func askAssistant(prompt: String) async throws -> String {
        guard let session = session else {
            initSession()
            guard let session = session else {
                throw NSError(domain: "FlowAI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Session non initialisée"])
            }
            return try await executePrompt(prompt, on: session)
        }
        return try await executePrompt(prompt, on: session)
    }

    private func executePrompt(_ prompt: String, on session: LanguageModelSession) async throws -> String {
        isGenerating = true
        lastError = nil
        defer { isGenerating = false }

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
                self.lastError = nil
                defer { self.isGenerating = false }

                guard let session = self.session else {
                    self.initSession()
                    continuation.finish()
                    return
                }

                do {
                    let enrichedPrompt = self.buildEnrichedPrompt(userPrompt: prompt)
                    let stream = session.streamResponse(to: enrichedPrompt)
                    for try await snapshot in stream {
                        continuation.yield(snapshot.content)
                    }
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
