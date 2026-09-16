import SwiftUI

struct TrafficDetailView: View {
    let line: TransportLine
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                // Header Hero Card avec l'icône et le statut
                LiquidGlassCard(cornerRadius: 20, padding: 16) {
                    HStack(spacing: 16) {
                        LineIcon(line: line, size: 52)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Ligne \(line.lineId)")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            HStack(spacing: 6) {
                                Image(systemName: line.status.icon)
                                    .font(.subheadline)
                                Text(line.status.description)
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(line.status.color)
                        }
                        Spacer()
                    }
                }

                // Section: Détails des incidents
                let activeInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .active })
                if !activeInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.orange)
                            Text("Incidents en cours")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal, 4)

                        ForEach(activeInfos) { info in
                            TrafficInfoCard(line: line, info: info, isActive: true)
                        }
                    }
                } else if line.status == .normal {
                    LiquidGlassCard(cornerRadius: 18, padding: 16) {
                        HStack(spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title3)
                                .foregroundColor(.green)
                            Text("Trafic fluide sur l'ensemble de la ligne.")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                    }
                }

                // Section: Travaux et événements à venir
                let futureInfos = deduplicateInfos(
                    line.trafficInfos.filter { $0.period == .future })
                if !futureInfos.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "calendar.badge.clock")
                                .foregroundColor(.blue)
                            Text("Travaux et événements à venir")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal, 4)
                        .padding(.top, 6)

                        ForEach(futureInfos) { info in
                            TrafficInfoCard(line: line, info: info, isActive: false)
                        }
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
        }
        .liquidGlassBackground()
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
        LiquidGlassCard(cornerRadius: 18, padding: 16) {
            VStack(alignment: .leading, spacing: 12) {
                // Header
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: isActive ? info.severity.icon : "calendar")
                        .font(.body)
                        .foregroundColor(isActive ? info.severity.color : .blue)
                        .frame(width: 28, height: 28)
                        .background((isActive ? info.severity.color : Color.blue).opacity(0.12), in: Circle())
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(info.title)
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }

                // Message épuré
                let messageText = formatMessage(info.message)
                Text(.init(messageText))
                    .font(.subheadline)
                    .lineSpacing(3)
                    .foregroundColor(.primary.opacity(0.9))

                // Section impactée (si dispo)
                if let section = info.impactedSection {
                    HStack(spacing: 6) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.caption2)
                        Text(section)
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.ultraThinMaterial, in: Capsule())
                }

                // Bouton Plan de ligne
                let hasLineData = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId) != nil
                if hasLineData {
                    VStack(alignment: .leading, spacing: 8) {
                        Button(action: {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                showPlan.toggle()
                            }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "map")
                                Text(showPlan ? "Masquer le plan" : "Visualiser sur le plan")
                                Image(systemName: showPlan ? "chevron.up" : "chevron.down")
                                    .font(.caption2)
                            }
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(isActive ? info.severity.color : .blue)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(.ultraThinMaterial, in: Capsule())
                            .overlay(
                                Capsule()
                                    .stroke((isActive ? info.severity.color : Color.blue).opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.liquidGlassInteractive)
                        
                        if showPlan {
                            MiniLinePlanView(line: line, info: info)
                                .padding(.top, 4)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                    }
                }
            }
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
