import SwiftUI

struct TrafficDetailView: View {
    let line: TransportLine
    
    @AppStorage("isTrafficSummaryEnabled") private var isTrafficSummaryEnabled = false

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

                // Section: Détails des incidents
                let activeInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .active })
                if !activeInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Détails des incidents")
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

                // Section: Travaux et événements à venir
                let futureInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .future })
                if !futureInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Travaux et événements à venir")
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

    /// Déduplique les infos trafic
    private func deduplicateInfos(_ infos: [TrafficInfo]) -> [TrafficInfo] {
        var seen = Set<String>()
        var result: [TrafficInfo] = []
        for info in infos {
            let messageKey = String(info.message.prefix(100)).lowercased().replacingOccurrences(of: " ", with: "")
            let key = "\(info.title.lowercased())-\(messageKey)"
            if !seen.contains(key) {
                seen.insert(key)
                result.append(info)
            }
        }
        return result
    }
}

struct TrafficInfoCard: View {
    let info: TrafficInfo
    let isActive: Bool
    @State private var isExpanded = false
    @State private var summary: String? = nil
    @AppStorage("isTrafficSummaryEnabled") private var isTrafficSummaryEnabled = false
    
    private let maxCharacters = 150

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: isActive ? info.severity.icon : "calendar")
                    .foregroundColor(isActive ? info.severity.color : .blue)
                Text(info.title)
                    .font(.subheadline).bold()
                Spacer()
                
                if isTrafficSummaryEnabled && summary != nil {
                    Image(systemName: "sparkles")
                        .font(.caption)
                        .foregroundColor(.purple)
                }
            }

            // Message (IA ou Original)
            Group {
                if isTrafficSummaryEnabled && TrafficSummarizer.shared.isAvailable, let aiSummary = summary {
                    Text(verbatim: aiSummary)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                } else {
                    let messageText = formatMessage(info.message)
                    let shouldTruncate = messageText.count > maxCharacters && !isExpanded

                    VStack(alignment: .leading, spacing: 6) {
                        if shouldTruncate {
                            Text(.init(String(messageText.prefix(maxCharacters)) + "..."))
                                .font(.body)
                        } else {
                            Text(.init(messageText))
                                .font(.body)
                        }

                        if messageText.count > maxCharacters {
                            Button(action: {
                                withAnimation { isExpanded.toggle() }
                            }) {
                                Text(isExpanded ? "Voir moins" : "Voir plus")
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                            }
                            .buttonStyle(.glass)
                        }
                    }
                }
            }
            .task(id: info.id) {
                await loadSummaryIfNeeded()
            }
            .onChange(of: isTrafficSummaryEnabled) { newValue in
                if newValue { Task { await loadSummaryIfNeeded() } }
            }

            // Section impactée
            if let section = info.impactedSection {
                Text("📍 \(section)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .glassEffect(.standard, in: RoundedRectangle(cornerRadius: 10))
    }
    
    private func loadSummaryIfNeeded() async {
        guard isTrafficSummaryEnabled, TrafficSummarizer.shared.isAvailable, summary == nil else { return }
        
        do {
            let rawMessage = info.message
            if let result = try await TrafficSummarizer.shared.summarize(message: rawMessage) {
                await MainActor.run {
                    self.summary = result
                }
            }
        } catch {
            print("❌ [UI] Erreur résumé pour \(info.title): \(error)")
        }
    }

    private func formatMessage(_ message: String) -> String {
        var cleaned = message
        let redundantPhrases = [
            "Rendez-vous sur la rubrique \"Recherche Itinéraire\",",
            "Pour plus d'informations sur cette perturbation,",
            "Les horaires du calculateur d'itinéraire tiennent compte des travaux.",
        ]
        for phrase in redundantPhrases {
            cleaned = cleaned.replacingOccurrences(of: phrase, with: "")
        }
        return cleaned.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
