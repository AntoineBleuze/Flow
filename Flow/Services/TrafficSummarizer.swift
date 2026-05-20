import Foundation
import SwiftUI
import FoundationModels

/// Service responsable de résumer les messages de trafic via Foundation Models (Apple Intelligence)
class TrafficSummarizer {
    static let shared = TrafficSummarizer()
    
    private var session: LanguageModelSession?
    
    /// Indique si l'appareil est compatible et prêt pour l'IA
    var isAvailable: Bool {
        return SystemLanguageModel.default.isAvailable
    }
    
    /// Résume un ou plusieurs messages de trafic en une synthèse naturelle (Gestion récursive pour les gros volumes)
    func summarize(messages: [String]) async throws -> String? {
        guard isAvailable else { 
            print("🤖 [IA] Indisponible sur cet appareil")
            return nil 
        }
        
        // 1. Nettoyage et filtrage des messages
        let sanitizedMessages = messages
            .map { sanitize($0) }
            .filter { !$0.isEmpty }
        
        guard !sanitizedMessages.isEmpty else { return nil }
        
        let mergedLength = sanitizedMessages.reduce(0) { $0 + $1.count }
        let threshold = 5000 // Seuil de découpage (~3500-4000 tokens)
        
        // 2. Stratégie Map-Reduce si le contenu est trop volumineux
        if mergedLength > threshold && sanitizedMessages.count >= 2 {
            print("📦 [IA] Volume important (\(mergedLength) chars), passage en mode Map-Reduce...")
            
            let mid = sanitizedMessages.count / 2
            let firstHalf = Array(sanitizedMessages[..<mid])
            let secondHalf = Array(sanitizedMessages[mid...])
            
            // Map : Résumer chaque moitié
            async let summary1 = summarize(messages: firstHalf)
            async let summary2 = summarize(messages: secondHalf)
            
            guard let r1 = try await summary1, let r2 = try await summary2 else { return nil }
            
            // Reduce : Synthèse finale des deux résumés
            print("📉 [IA] Fusion des sous-résumés...")
            return try await summarize(messages: [r1, r2])
        }
        
        // 3. Cas de base : Traitement direct
        let finalPrompt = sanitizedMessages.joined(separator: "\n---\n")
        
        // Initialiser la session si nécessaire
        if session == nil {
            print("⚙️ [IA] Initialisation de la session LanguageModelSession...")
            let instructions = Instructions {
                "Tu es un assistant expert en transport urbain."
                "Ta mission est de synthétiser les alertes de trafic de manière très concise et naturelle."
                "STRUCTURE : Sépare chaque branche ou événement différent par un simple retour à la ligne."
                "CONTENU : Pour chaque point, mentionne obligatoirement la raison, les gares/branches impactées et les dates de début et de fin."
                "TON : Très concis et direct. Évite les phrases d'introduction inutiles comme 'Les transports sont impactés...'"
                "INTERDICTION : Ne jamais utiliser de formatage Markdown (pas de **, pas de *, pas de #)."
                "INTERDICTION : Ne jamais utiliser de labels comme 'Période :', 'Motif :' ou 'Impact :'."
                "Réponds UNIQUEMENT en français, en texte brut avec des retours à la ligne pour aérer."
            }
            session = LanguageModelSession(model: .default, instructions: instructions)
        }
        
        guard let session = session else { return nil }
        
        // Attendre que la session soit libre
        var attempts = 0
        while session.isResponding {
            attempts += 1
            if attempts > 30 { return nil }
            try? await Task.sleep(nanoseconds: 500_000_000)
        }
        
        do {
            print("🚀 [IA] Envoi de la requête (\(finalPrompt.count) chars)...")
            let response = try await session.respond(to: Prompt(finalPrompt))
            let result = response.content.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            print("✅ [IA] Résumé généré (\(result.count) chars)")
            return result
        } catch {
            print("❌ [IA] Erreur FoundationModels: \(error)")
            throw error
        }
    }
    
    /// Nettoie un message pour réduire le nombre de tokens inutiles
    private func sanitize(_ text: String) -> String {
        var clean = text
        let noise = [
            "Rendez-vous sur la rubrique \"Recherche Itinéraire\",",
            "pour retrouver un itinéraire prenant en compte cette perturbation.",
            "Pour plus d'informations sur cette perturbation,",
            "consultez le fil X",
            "Les horaires du calculateur d'itinéraire tiennent compte des travaux.",
            "Consultez les fiches horaires sur le site",
            "ou l'appli",
            "SNCF Réseau"
        ]
        
        for phrase in noise {
            clean = clean.replacingOccurrences(of: phrase, with: "", options: .caseInsensitive)
        }
        
        return clean.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Rétrocompatibilité : résume un seul message
    func summarize(message: String) async throws -> String? {
        return try await summarize(messages: [message])
    }
}
