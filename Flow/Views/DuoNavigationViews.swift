import SwiftUI

private func formatTimeHelper(_ isoDate: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
    if let date = dateFormatter.date(from: isoDate) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        return timeFormatter.string(from: date)
    }
    if isoDate.count >= 4 {
        let hour = isoDate.prefix(2)
        let minute = isoDate.suffix(2)
        return "\(hour):\(minute)"
    }
    return isoDate
}

/// Panneau d'aperçu d'itinéraire affiché sur l'écran gauche de l'iPhone Duo déplié
struct DuoJourneyPreviewPanel: View {
    let journey: Journey
    @EnvironmentObject var coordinator: NavigationCoordinator
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.duoPosture) private var duoPosture

    private var durationMinutes: Int {
        max(1, (journey.duration ?? 1200) / 60)
    }

    private var transfersCount: Int {
        journey.nb_transfers ?? 0
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                headerView
                metricsView
                transportSectionsView
                endpointsView
                Divider()
                startNavigationButton
            }
            .padding(16)
        }
        .liquidGlassBackground()
    }

    private var headerView: some View {
        HStack {
            HStack(spacing: 6) {
                Image(systemName: "sparkles")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                Text("Aperçu Itinéraire")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.purple.opacity(0.12), in: Capsule())

            Spacer()

            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    coordinator.clearItineraryPreview()
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.secondary)
            }
            .buttonStyle(.liquidGlassInteractive)
        }
    }

    private var metricsView: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text("~\(durationMinutes) min")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            Text(transfersCount == 0 ? "Direct" : "\(transfersCount) corresp.")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
        }
    }

    private var transportSectionsView: some View {
        Group {
            if let sections = journey.sections {
                let publicTransports = sections.filter { $0.type == "public_transport" }
                if !publicTransports.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(publicTransports.indices, id: \.self) { idx in
                                let sec = publicTransports[idx]
                                if let info = sec.display_informations {
                                    HStack(spacing: 6) {
                                        LineIcon(
                                            type: info.transportType,
                                            lineId: info.code ?? info.label ?? "",
                                            size: 26,
                                            customColor: Color(hex: info.color ?? "0078D7")
                                        )

                                        if let dir = info.direction {
                                            Text(dir)
                                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                                .foregroundColor(.secondary)
                                                .lineLimit(1)
                                        }
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.primary.opacity(0.04), in: Capsule())
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private var endpointsView: some View {
        Group {
            if let first = journey.sections?.first(where: { $0.from?.name != nil }),
               let last = journey.sections?.last(where: { $0.to?.name != nil }) {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 8, height: 8)
                        Text(first.from?.name ?? "Départ")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        Spacer()
                        if let depTime = journey.departure_date_time {
                            Text(formatTimeHelper(depTime))
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.secondary)
                        }
                    }

                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 8, height: 8)
                        Text(last.to?.name ?? "Arrivée")
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        Spacer()
                        if let arrTime = journey.arrival_date_time {
                            Text(formatTimeHelper(arrTime))
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(12)
                .background(Color.primary.opacity(0.03), in: RoundedRectangle(cornerRadius: 12))
            }
        }
    }

    private var startNavigationButton: some View {
        Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                coordinator.startNavigationFromPreview()
            }
        }) {
            HStack(spacing: 8) {
                Image(systemName: "location.north.fill")
                    .font(.system(size: 15, weight: .bold))
                Text("Démarrer la navigation")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                LinearGradient(
                    colors: [Color.blue, Color(hex: "0055D4")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .shadow(color: Color.blue.opacity(0.35), radius: 8, y: 3)
        }
        .buttonStyle(.liquidGlassInteractive)
    }
}

/// Panneau de guidage en direct affiché sur l'écran gauche de l'iPhone Duo déplié
struct DuoNavigationPanel: View {
    let journey: Journey
    @ObservedObject private var navigationManager = NavigationManager.shared
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.duoPosture) private var duoPosture

    private var remainingMinutes: Int {
        max(1, (journey.duration ?? 0) / 60)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header: Arrivée & Contrôles
            headerBar

            Divider()

            // Liste des étapes pas à pas
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if let sections = journey.sections {
                        let activeSections = sections.filter { $0.type != "waiting" }
                        ForEach(activeSections.indices, id: \.self) { idx in
                            stepRow(section: activeSections[idx], isCurrent: idx == navigationManager.currentSectionIndex)
                        }
                    }
                }
                .padding(16)
            }
        }
        .liquidGlassBackground()
    }

    private var headerBar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Arrivée à \(formatTimeHelper(journey.arrival_date_time ?? ""))")
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                HStack(spacing: 6) {
                    Image(systemName: "clock.fill")
                        .font(.system(size: 10))
                    Text("\(remainingMinutes) min restantes")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.semibold)
                }
                .foregroundColor(.blue)
            }

            Spacer()

            HStack(spacing: 8) {
                // Simulation toggle
                Button(action: {
                    withAnimation {
                        if navigationManager.isSimulating {
                            navigationManager.stopSimulation()
                        } else {
                            navigationManager.startSimulation()
                        }
                    }
                }) {
                    Image(systemName: navigationManager.isSimulating ? "stop.fill" : "play.fill")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(navigationManager.isSimulating ? .orange : .green)
                        .frame(width: 34, height: 34)
                        .background(
                            (navigationManager.isSimulating ? Color.orange : Color.green).opacity(0.14),
                            in: Circle()
                        )
                }
                .buttonStyle(.plain)
                .accessibilityLabel(navigationManager.isSimulating ? "Arrêter la simulation" : "Lancer la simulation")

                // Exit Navigation
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        navigationManager.stopNavigation()
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.red)
                        .frame(width: 34, height: 34)
                        .background(Color.red.opacity(0.14), in: Circle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Quitter l'itinéraire")
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 14)
        .padding(.bottom, 12)
    }

    private func stepRow(section: ItinerarySection, isCurrent: Bool) -> some View {
        Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                coordinator.focusedSectionId = section.id
            }
        }) {
            HStack(alignment: .top, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(isCurrent ? Color.blue : Color.secondary.opacity(0.15))
                        .frame(width: 32, height: 32)

                    if section.type == "public_transport", let display = section.display_informations {
                        LineIcon(
                            type: display.transportType,
                            lineId: display.code ?? display.label ?? "",
                            size: 26,
                            customColor: Color(hex: display.color ?? "0078D7")
                        )
                    } else if section.mode == "walking" || section.type == "street_network" {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(isCurrent ? .white : .blue)
                    } else {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(isCurrent ? .white : .secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    if section.type == "street_network" || section.mode == "walking" {
                        Text("Marcher vers \(section.to?.name ?? "destination")")
                            .font(.system(size: 14, weight: isCurrent ? .bold : .medium, design: .rounded))
                            .foregroundColor(.primary)

                        let durSec = section.duration ?? 0
                        Text("\(max(1, durSec / 60)) min • \(section.from?.name ?? "")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } else {
                        HStack(spacing: 6) {
                            if let info = section.display_informations {
                                LineIcon(
                                    type: info.transportType,
                                    lineId: info.code ?? info.label ?? "",
                                    size: 22,
                                    customColor: Color(hex: info.color ?? "0078D7")
                                )
                            }

                            if let dir = section.display_informations?.direction {
                                Text("Direction \(dir)")
                                    .font(.system(size: 13, weight: isCurrent ? .bold : .semibold, design: .rounded))
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                            }
                        }

                        Text("\(section.from?.name ?? "") → \(section.to?.name ?? "")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()
            }
            .padding(12)
            .background(
                isCurrent ? Color.blue.opacity(0.10) : Color.primary.opacity(0.02),
                in: RoundedRectangle(cornerRadius: 14, style: .continuous)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(isCurrent ? Color.blue.opacity(0.35) : Color.primary.opacity(0.06), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
