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
                        Text(line.status.description)
                            .font(.headline)
                            .foregroundColor(line.status.color)
                    }
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.97))
                .clipShape(RoundedRectangle(cornerRadius: 15))

                // Section: Détails des incidents
                let activeInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .active })
                if !activeInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Détails des incidents")
                            .font(.headline)
                            .padding(.bottom, 5)

                        ForEach(activeInfos) { info in
                            TrafficInfoCard(line: line, info: info, isActive: true)
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
                            TrafficInfoCard(line: line, info: info, isActive: false)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .background {
            ZStack {
                let lineColor: Color = {
                    if let hex = line.colorHex {
                        return Color(hex: hex)
                    } else {
                        return resolveLineColor(line.lineId, type: line.type)
                    }
                }()
                ShaderAnimationView(isLoading: false, customColors: [lineColor])
                (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                    .background(.ultraThinMaterial.opacity(0.65))
            }
            .ignoresSafeArea()
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
    let line: TransportLine
    let info: TrafficInfo
    let isActive: Bool
    @State private var isExpanded = false
    @State private var showPlan = false
    @Environment(\.colorScheme) var colorScheme
    
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
            }

            // Message
            Group {
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
                                .background(colorScheme == .dark ? Color.white.opacity(0.15) : Color.black.opacity(0.08), in: Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

            // Section impactée
            if let section = info.impactedSection {
                Text("📍 \(section)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            // Plan de ligne
            let hasStops = info.impactedStops?.isEmpty == false
            let hasSection = info.impactedSection != nil
            if hasStops || hasSection {
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
                        .background(colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.05), in: Capsule())
                    }
                    .buttonStyle(.plain)
                    
                    if showPlan {
                        MiniLinePlanView(line: line, info: info)
                            .padding(.top, 4)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                    }
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial.opacity(0.97))
        .clipShape(RoundedRectangle(cornerRadius: 10))
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

#Preview {
    NavigationStack {
        TrafficDetailView(line: PreviewMockData.mockTransportLine)
    }
}

