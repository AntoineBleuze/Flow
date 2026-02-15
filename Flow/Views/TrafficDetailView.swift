import SwiftUI

struct TrafficDetailView: View {
    let line: TransportLine

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header avec l'icône et le statut
                HStack(spacing: 15) {
                    LineIcon(line: line)
                        .scaleEffect(1.5)

                    VStack(alignment: .leading) {
                        Text("Ligne \(line.lineId)")
                            .font(.title).bold()
                        Text(line.status.description)
                            .font(.headline)
                            .foregroundColor(line.status.color)
                    }
                    Spacer()
                }
                .padding()
                .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 15))

                // Section: En cours
                let activeInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .active })
                if !activeInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("En cours")
                            .font(.headline)
                            .padding(.bottom, 5)

                        ForEach(activeInfos) { info in
                            TrafficInfoCard(info: info, isActive: true)
                        }
                    }
                } else if line.status == .normal {
                    Text("Aucun incident signalé pour le moment.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding()
                }

                // Section: À venir
                let futureInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .future })
                if !futureInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("À venir")
                            .font(.headline)
                            .padding(.top, 10)
                            .padding(.bottom, 5)

                        ForEach(futureInfos) { info in
                            TrafficInfoCard(info: info, isActive: false)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .background {
            AdaptiveMapBackground()
        }
        .navigationTitle("Info Trafic")
        .navigationBarTitleDisplayMode(.inline)
    }

    /// Déduplique les infos trafic en regroupant celles qui ont le même titre ou message similaire
    private func deduplicateInfos(_ infos: [TrafficInfo]) -> [TrafficInfo] {
        var seen = Set<String>()
        var result: [TrafficInfo] = []

        for info in infos {
            // Créer une clé de déduplication basée sur le titre et les premiers 100 caractères du message
            let messageKey = String(info.message.prefix(100)).lowercased()
                .replacingOccurrences(of: " ", with: "")
            let key = "\(info.title.lowercased())-\(messageKey)"

            if !seen.contains(key) {
                seen.insert(key)
                result.append(info)
            }
        }

        return result
    }
}

/// Carte d'affichage pour une info trafic avec texte résumé
struct TrafficInfoCard: View {
    let info: TrafficInfo
    let isActive: Bool
    @State private var isExpanded = false

    /// Limite de caractères avant de tronquer
    private let maxCharacters = 200

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header avec icône et titre
            HStack {
                Image(systemName: isActive ? info.severity.icon : "calendar")
                    .foregroundColor(isActive ? info.severity.color : .blue)
                Text(info.title)
                    .font(.subheadline).bold()
                Spacer()
            }

            // Message (tronqué ou complet)
            let messageText = formatMessage(info.message)
            let shouldTruncate = messageText.count > maxCharacters && !isExpanded

            VStack(alignment: .leading, spacing: 4) {
                if shouldTruncate {
                    Text(.init(String(messageText.prefix(maxCharacters)) + "..."))
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                } else {
                    Text(.init(messageText))
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }

                // Bouton "Voir plus" / "Voir moins"
                if messageText.count > maxCharacters {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isExpanded.toggle()
                        }
                    }) {
                        Text(isExpanded ? "Voir moins" : "Voir plus")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                    }
                    .buttonStyle(.glass)
                }
            }

            // Section impactée
            if let section = info.impactedSection {
                Text("📍 Section impactée : \(section)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }

            // Arrêts non desservis (limité à 5 max)
            if let stops = info.impactedStops, !stops.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text("📍 Arrêts non desservis :")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    let displayedStops = Array(stops.prefix(5))
                    ForEach(displayedStops, id: \.self) { stop in
                        Text("• \(stop)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    if stops.count > 5 {
                        Text("... et \(stops.count - 5) autres arrêts")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }
                .padding(.top, 4)
            }
        }
        .padding()
        .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 10))
    }

    /// Nettoie et formate le message en supprimant les redondances courantes
    private func formatMessage(_ message: String) -> String {
        var cleaned = message

        // Supprimer les phrases redondantes courantes
        let redundantPhrases = [
            "Rendez-vous sur la rubrique \"Recherche Itinéraire\", pour retrouver un itinéraire prenant en compte cette perturbation.",
            "Pour plus d'informations sur cette perturbation, consultez le fil X du RER C.",
            "Pour plus d'informations sur cette perturbation,",
            "Les horaires du calculateur d'itinéraire tiennent compte des travaux.",
        ]

        for phrase in redundantPhrases {
            cleaned = cleaned.replacingOccurrences(of: phrase, with: "")
        }

        // Nettoyer les espaces multiples et retours à la ligne
        cleaned = cleaned.replacingOccurrences(of: "\n\n\n", with: "\n\n")
        cleaned = cleaned.replacingOccurrences(of: "  ", with: " ")
        cleaned = cleaned.trimmingCharacters(in: .whitespacesAndNewlines)

        return cleaned
    }
}
