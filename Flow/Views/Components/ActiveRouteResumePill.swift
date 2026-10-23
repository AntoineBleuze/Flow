import SwiftUI

/// Mini-pilule flottante Liquid Glass de rappel "Itinéraire en cours" (Quick Resume).
///
/// S'affiche au-dessus de la barre de navigation ou en bas de l'écran lorsque l'utilisateur
/// consulte une autre section de l'application pendant qu'un itinéraire est actif en arrière-plan.
struct ActiveRouteResumePill: View {
    @ObservedObject var routeManager: RouteNavigationManager
    @Environment(\.colorScheme) private var colorScheme
    @State private var isPressingPill = false

    init(routeManager: RouteNavigationManager = .shared) {
        self.routeManager = routeManager
    }

    var body: some View {
        HStack(spacing: 12) {
            // Bouton principal cliquable pour restaurer l'itinéraire
            Button(action: {
                routeManager.showRouteDetails()
            }) {
                HStack(spacing: 12) {
                    // Icône de mode / ligne de transport
                    transportModeIcon

                    // Informations dynamiques (arrêt suivant + temps restant)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(routeManager.pillHeadline)
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(1)

                        HStack(spacing: 4) {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 6, height: 6)

                            Text(routeManager.pillSubheadline)
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }

                    Spacer(minLength: 4)

                    // Indicateur de reprise
                    HStack(spacing: 4) {
                        Text("Reprendre")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

                        Image(systemName: "chevron.up")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.12), in: Capsule())
                }
            }
            .buttonStyle(.liquidGlassInteractive)

            // Séparateur vertical subtil
            Rectangle()
                .fill(Color.primary.opacity(0.12))
                .frame(width: 1, height: 26)

            // Bouton Arrêter / Fermer la session
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                    routeManager.stopRoute()
                }
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.red)
                    .frame(width: 32, height: 32)
                    .background(Color.red.opacity(0.14), in: Circle())
            }
            .buttonStyle(.liquidGlassInteractive)
            .accessibilityLabel("Arrêter l'itinéraire")
        }
        .padding(.leading, 12)
        .padding(.trailing, 10)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .strokeBorder(
                    LiquidGlassTheme.specularBorder(for: colorScheme),
                    lineWidth: 1.0
                )
        )
        .shadow(
            color: Color.black.opacity(colorScheme == .dark ? 0.35 : 0.12),
            radius: 12,
            x: 0,
            y: 5
        )
    }

    // MARK: - Transport Mode Icon
    @ViewBuilder
    private var transportModeIcon: some View {
        if routeManager.isWalking {
            ZStack {
                Circle()
                    .fill(Color.secondary.opacity(0.16))
                    .frame(width: 34, height: 34)

                Image(systemName: "figure.walk")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
            }
        } else if let line = routeManager.currentLineDisplay {
            LineIcon(
                type: line.transportType,
                lineId: line.code ?? line.label ?? "",
                size: 32,
                customColor: Color(hex: line.color ?? "0078D7")
            )
        } else {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.16))
                    .frame(width: 34, height: 34)

                Image(systemName: "tram.fill")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.blue)
            }
        }
    }
}

/// Bannière compacte Liquid Glass affichée en haut de la fiche station (`StationDetailSheet`)
/// lorsqu'un itinéraire est actif en arrière-plan.
struct StationActiveRouteBanner: View {
    @ObservedObject var routeManager: RouteNavigationManager
    var onResume: () -> Void
    @Environment(\.colorScheme) private var colorScheme

    init(routeManager: RouteNavigationManager = .shared, onResume: @escaping () -> Void) {
        self.routeManager = routeManager
        self.onResume = onResume
    }

    var body: some View {
        HStack(spacing: 10) {
            // Icône
            if routeManager.isWalking {
                Image(systemName: "figure.walk")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.primary)
                    .frame(width: 28, height: 28)
                    .background(Color.secondary.opacity(0.15), in: Circle())
            } else if let line = routeManager.currentLineDisplay {
                LineIcon(
                    type: line.transportType,
                    lineId: line.code ?? line.label ?? "",
                    size: 26,
                    customColor: Color(hex: line.color ?? "0078D7")
                )
            } else {
                Image(systemName: "map.fill")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(width: 28, height: 28)
                    .background(Color.blue.opacity(0.15), in: Circle())
            }

            VStack(alignment: .leading, spacing: 1) {
                HStack(spacing: 5) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 6, height: 6)
                    Text("ITINÉRAIRE EN COURS")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(.secondary)
                }

                Text(routeManager.pillHeadline)
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(1)
            }

            Spacer()

            // Bouton Reprendre
            Button(action: onResume) {
                Text("Reprendre")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue, in: Capsule())
            }
            .buttonStyle(.liquidGlassInteractive)

            // Bouton Quitter
            Button(action: {
                withAnimation {
                    routeManager.stopRoute()
                }
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.secondary)
                    .frame(width: 24, height: 24)
                    .background(Color.primary.opacity(0.08), in: Circle())
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Arrêter l'itinéraire")
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: LiquidGlassTheme.standardCornerRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: LiquidGlassTheme.standardCornerRadius, style: .continuous)
                .strokeBorder(LiquidGlassTheme.specularBorder(for: colorScheme), lineWidth: 1.0)
        )
    }
}
