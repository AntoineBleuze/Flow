import SwiftUI

struct TrafficDetailView: View {
    let line: TransportLine
    
    @Environment(\.colorScheme) var colorScheme

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
                            .foregroundColor(.white)
                        Text(line.status.description)
                            .font(.headline)
                            .foregroundColor(line.status.color)
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
                
                Divider()
                    .background(Color.white.opacity(0.15))

                // Section: Détails des incidents
                let activeInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .active })
                if !activeInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Détails des incidents")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)

                        ForEach(activeInfos) { info in
                            TrafficInfoCard(line: line, info: info, isActive: true)
                        }
                    }
                } else if line.status == .normal {
                    Text("Aucun incident signalé pour le moment.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding()
                }

                // Section: Travaux et événements à venir
                let futureInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .future })
                if !futureInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Travaux et événements à venir")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.bottom, 5)

                        ForEach(futureInfos) { info in
                            TrafficInfoCard(line: line, info: info, isActive: false)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
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
    let line: TransportLine
    let info: TrafficInfo
    let isActive: Bool
    @State private var showPlan = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: isActive ? info.severity.icon : "calendar")
                    .foregroundColor(isActive ? info.severity.color : .blue)
                Text(info.title)
                    .font(.subheadline).bold()
                    .foregroundColor(.white)
                Spacer()
            }

            // Message
            Group {
                let messageText = formatMessage(info.message)
                Text(.init(messageText))
                    .font(.body)
                    .foregroundColor(.white)
            }

            // Section impactée
            if let section = info.impactedSection {
                Text("📍 \(section)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            // Plan de ligne
            let hasLineData = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId) != nil
            if hasLineData {
                VStack(alignment: .leading, spacing: 8) {
                    Button(action: {
                        withAnimation { showPlan.toggle() }
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "map")
                            Text(showPlan ? "Masquer le plan" : "Visualiser sur le plan")
                            Image(systemName: showPlan ? "chevron.up" : "chevron.down")
                        }
                        .font(.caption).bold()
                        .foregroundColor(isActive ? info.severity.color : .blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.white.opacity(0.12), in: Capsule())
                    }
                    .buttonStyle(.plain)
                    
                    if showPlan {
                        MiniLinePlanView(line: line, info: info)
                            .padding(.top, 4)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                    }
                }
            }
            
            Divider()
                .background(Color.white.opacity(0.15))
                .padding(.top, 4)
        }
        .padding(.vertical, 8)
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
        // Collapse excessive blank lines (3+ newlines → 2)
        while cleaned.contains("\n\n\n") {
            cleaned = cleaned.replacingOccurrences(of: "\n\n\n", with: "\n\n")
        }
        return cleaned.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    NavigationStack {
        TrafficDetailView(line: PreviewMockData.mockTransportLine)
    }
}

