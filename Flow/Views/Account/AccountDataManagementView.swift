import SwiftUI

/// Vue dédiée à la gestion des données locales, du cache et de la réinitialisation.
struct AccountDataManagementView: View {
    @Environment(\.dismiss) private var dismiss

    private enum ResetAction: Identifiable {
        case clearHistory
        case clearFavorites
        case clearCaches
        case resetTransportDB
        case resetPreferences
        case fullReset

        var id: Self { self }

        var title: String {
            switch self {
            case .clearHistory: return "Effacer l'historique ?"
            case .clearFavorites: return "Supprimer tous les favoris ?"
            case .clearCaches: return "Vider les caches temporaires ?"
            case .resetTransportDB: return "Réinitialiser les données de transport ?"
            case .resetPreferences: return "Réinitialiser les préférences ?"
            case .fullReset: return "Tout réinitialiser ?"
            }
        }

        var message: String {
            switch self {
            case .clearHistory:
                return "Les dernières stations et adresses recherchées seront supprimées."
            case .clearFavorites:
                return "Toutes vos stations et lignes favorites seront retirées."
            case .clearCaches:
                return "Le cache réseau et le cache d'état des ascenseurs seront purgés."
            case .resetTransportDB:
                return "Les tracés et arrêts locaux seront réimportés proprement au prochain rechargement."
            case .resetPreferences:
                return "Vos préférences d'itinéraire, d'apparence, lieux enregistrés et profil reviendront aux réglages d'origine."
            case .fullReset:
                return "Cette action effacera vos favoris, historique, lieux enregistrés, préférences et caches locaux. Elle est irréversible."
            }
        }

        var confirmLabel: String {
            switch self {
            case .clearHistory: return "Effacer l'historique"
            case .clearFavorites: return "Supprimer les favoris"
            case .clearCaches: return "Vider les caches"
            case .resetTransportDB: return "Réinitialiser la base"
            case .resetPreferences: return "Réinitialiser les préférences"
            case .fullReset: return "Tout réinitialiser"
            }
        }

        var feedbackText: String {
            switch self {
            case .clearHistory: return "Historique de recherche effacé"
            case .clearFavorites: return "Tous les favoris ont été supprimés"
            case .clearCaches: return "Caches temporaires vidés"
            case .resetTransportDB: return "Réimport programmé au prochain lancement"
            case .resetPreferences: return "Préférences réinitialisées"
            case .fullReset: return "Application entièrement réinitialisée"
            }
        }
    }

    @State private var stats = DataResetService.currentStats()
    @State private var pendingAction: ResetAction?
    @State private var feedbackMessage: String?

    private var formattedURLCacheSize: String {
        ByteCountFormatter.string(fromByteCount: Int64(stats.urlCacheBytes), countStyle: .file)
    }

    var body: some View {
        VStack(spacing: 0) {
            AccountSheetHeader(
                title: "Données & Stockage",
                fontSize: 22,
                buttonIcon: "xmark",
                accessibilityLabel: "Fermer"
            ) {
                dismiss()
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                if let feedbackMessage {
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                        Text(feedbackMessage)
                            .font(.system(.subheadline, design: .rounded).weight(.semibold))
                            .foregroundStyle(.primary)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.green.opacity(0.14))
                    )
                    .transition(.move(edge: .top).combined(with: .opacity))
                }

                // MARK: - Aperçu du stockage local
                VStack(alignment: .leading, spacing: 8) {
                    AccountSectionHeader(title: "Stockage local", systemImage: "internaldrive.fill")

                    AccountSectionGroup {
                        statRow(
                            icon: "star.fill",
                            iconColor: .yellow,
                            title: "Stations favorites",
                            value: "\(stats.favoriteStationsCount)"
                        )
                        Divider().padding(.leading, 52)
                        statRow(
                            icon: "tram.fill",
                            iconColor: .blue,
                            title: "Lignes suivies",
                            value: "\(stats.favoriteLinesCount)"
                        )
                        Divider().padding(.leading, 52)
                        statRow(
                            icon: "clock.arrow.circlepath",
                            iconColor: .orange,
                            title: "Recherches récentes",
                            value: "\(stats.searchHistoryCount)"
                        )
                        Divider().padding(.leading, 52)
                        statRow(
                            icon: "archivebox.fill",
                            iconColor: .purple,
                            title: "Cache réseau & ascenseurs",
                            value: "\(formattedURLCacheSize) • \(stats.elevatorCacheEntriesCount) entr."
                        )
                    }
                }

                // MARK: - Nettoyage ciblé
                VStack(alignment: .leading, spacing: 8) {
                    AccountSectionHeader(title: "Nettoyage ciblé", systemImage: "sparkles")

                    AccountSectionGroup {
                        actionRow(
                            icon: "clock.badge.xmark",
                            iconColor: .orange,
                            title: "Effacer l'historique de recherche",
                            subtitle: stats.searchHistoryCount == 0 ? "Déjà vide" : "\(stats.searchHistoryCount) élément(s)",
                            disabled: stats.searchHistoryCount == 0
                        ) {
                            pendingAction = .clearHistory
                        }
                        Divider().padding(.leading, 52)

                        actionRow(
                            icon: "star.slash.fill",
                            iconColor: .yellow,
                            title: "Supprimer tous les favoris",
                            subtitle: stats.totalFavoritesCount == 0 ? "Aucun favori" : "\(stats.totalFavoritesCount) élément(s)",
                            disabled: stats.totalFavoritesCount == 0
                        ) {
                            pendingAction = .clearFavorites
                        }
                        Divider().padding(.leading, 52)

                        actionRow(
                            icon: "trash.fill",
                            iconColor: .purple,
                            title: "Vider les caches temporaires",
                            subtitle: "\(formattedURLCacheSize) • \(stats.elevatorCacheEntriesCount) ascenseur(s)",
                            disabled: false
                        ) {
                            pendingAction = .clearCaches
                        }
                        Divider().padding(.leading, 52)

                        actionRow(
                            icon: "arrow.triangle.2.circlepath",
                            iconColor: .blue,
                            title: "Reconstruire la base de transport",
                            subtitle: "Force un réimport propre des tracés et arrêts",
                            disabled: false
                        ) {
                            pendingAction = .resetTransportDB
                        }
                        Divider().padding(.leading, 52)

                        actionRow(
                            icon: "slider.horizontal.3",
                            iconColor: .teal,
                            title: "Réinitialiser les préférences",
                            subtitle: "Conserve vos favoris et votre historique",
                            disabled: false
                        ) {
                            pendingAction = .resetPreferences
                        }
                    }
                }

                // MARK: - Zone de danger
                VStack(alignment: .leading, spacing: 8) {
                    AccountSectionHeader(title: "Zone de danger", systemImage: "exclamationmark.triangle.fill")

                    AccountSectionGroup {
                        Button(role: .destructive) {
                            UserPreferencesManager.shared.triggerHapticImpact(1)
                            pendingAction = .fullReset
                        } label: {
                            HStack(spacing: 12) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .fill(Color.red.opacity(0.16))
                                        .frame(width: 30, height: 30)
                                    Image(systemName: "arrow.counterclockwise")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(.red)
                                }

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Réinitialiser toute l'application")
                                        .font(.system(.subheadline, design: .rounded).weight(.semibold))
                                        .foregroundStyle(.red)
                                    Text("Supprime favoris, historique, préférences et caches")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
                .padding(.horizontal, 16)
                .padding(.top, 6)
                .padding(.bottom, 32)
            }
        }
        .liquidGlassBackground()
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            stats = DataResetService.currentStats()
        }
        .confirmationDialog(
            pendingAction?.title ?? "",
            isPresented: Binding(
                get: { pendingAction != nil },
                set: { if !$0 { pendingAction = nil } }
            ),
            titleVisibility: .visible
        ) {
            if let action = pendingAction {
                Button(action.confirmLabel, role: .destructive) {
                    executeReset(action)
                }
                Button("Annuler", role: .cancel) {
                    pendingAction = nil
                }
            }
        } message: {
            if let action = pendingAction {
                Text(action.message)
            }
        }
    }

    @ViewBuilder
    private func statRow(icon: String, iconColor: Color, title: String, value: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(iconColor.opacity(0.16))
                    .frame(width: 30, height: 30)
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(iconColor)
            }

            Text(title)
                .font(.system(.subheadline, design: .rounded).weight(.medium))
                .foregroundStyle(.primary)

            Spacer()

            Text(value)
                .font(.system(.subheadline, design: .rounded).weight(.semibold))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }

    @ViewBuilder
    private func actionRow(
        icon: String,
        iconColor: Color,
        title: String,
        subtitle: String,
        disabled: Bool,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            UserPreferencesManager.shared.triggerHapticImpact()
            action()
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(iconColor.opacity(0.16))
                        .frame(width: 30, height: 30)
                    Image(systemName: icon)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(iconColor)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(.subheadline, design: .rounded).weight(.medium))
                        .foregroundStyle(disabled ? .secondary : .primary)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.secondary.opacity(0.6))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .disabled(disabled)
        .opacity(disabled ? 0.55 : 1)
    }

    private func executeReset(_ action: ResetAction) {
        switch action {
        case .clearHistory:
            DataResetService.clearSearchHistory()
        case .clearFavorites:
            DataResetService.clearFavorites()
        case .clearCaches:
            DataResetService.clearCaches()
        case .resetTransportDB:
            DataResetService.resetTransportDatabaseFlags()
        case .resetPreferences:
            DataResetService.resetPreferences()
        case .fullReset:
            DataResetService.performFullReset()
        }

        stats = DataResetService.currentStats()
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            feedbackMessage = action.feedbackText
        }

        Task {
            try? await Task.sleep(for: .seconds(2.5))
            await MainActor.run {
                withAnimation(.easeOut(duration: 0.25)) {
                    feedbackMessage = nil
                }
            }
        }
    }
}
