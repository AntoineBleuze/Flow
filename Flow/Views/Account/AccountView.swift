import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - Conteneurs partagés de la section Compte

struct AccountSheetHeader: View {
    let title: String
    var fontSize: CGFloat = 28
    var buttonIcon: String = "xmark"
    var accessibilityLabel: String = "Fermer"
    let onAction: () -> Void

    @ObservedObject private var preferences = UserPreferencesManager.shared

    private var actionButton: some View {
        LiquidGlassCircleButton(icon: buttonIcon, size: 36, iconSize: 14, iconWeight: .bold) {
            preferences.triggerHapticImpact()
            onAction()
        }
        .accessibilityLabel(accessibilityLabel)
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            if !preferences.handedness.isBackButtonTrailing {
                actionButton
            }

            Text(title)
                .font(.system(size: fontSize, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
                .lineLimit(1)

            Spacer(minLength: 8)

            if preferences.handedness.isBackButtonTrailing {
                actionButton
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 18)
        .padding(.bottom, 10)
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: preferences.handedness)
    }
}

struct AccountSectionHeader: View {
    let title: String
    let systemImage: String

    var body: some View {
        Label(title, systemImage: systemImage)
            .font(.footnote.weight(.semibold))
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
            .padding(.horizontal, 4)
    }
}

struct AccountSectionGroup<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            content
        }
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
        )
    }
}

// MARK: - Fiche Compte & Préférences

struct AccountView: View {
    private enum PlaceTarget: String, Identifiable {
        case home
        case work

        var id: String { rawValue }

        var sheetTitle: String {
            switch self {
            case .home: return "Définir mon domicile"
            case .work: return "Définir mon travail"
            }
        }
    }

    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    @ObservedObject private var preferences = UserPreferencesManager.shared
    @ObservedObject private var favoritesService = FavoritesService.shared
    @ObservedObject private var historyManager = SearchHistoryManager.shared
    @ObservedObject private var serverService = FlowServerService.shared

    @State private var pickingPlaceTarget: PlaceTarget?

    private var appVersionLabel: String {
        let short = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "v\(short) (\(build))"
    }

    private var dataSummaryLabel: String {
        let favCount = favoritesService.favoriteStationIds.count + favoritesService.favoriteLinesList.count
        let histCount = historyManager.recentStations.count
        let favPart = "\(favCount) favori\(favCount > 1 ? "s" : "")"
        let histPart = "\(histCount) recherche\(histCount > 1 ? "s" : "")"
        return "\(favPart) • \(histPart)"
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                AccountSheetHeader(
                    title: "Compte",
                    fontSize: 28,
                    buttonIcon: "xmark",
                    accessibilityLabel: "Fermer"
                ) {
                    dismiss()
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        profileSection
                        savedPlacesSection
                        itineraryPreferencesSection
                        appearanceSection
                        dataStorageSection
                        serverDiagnosticSection
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 6)
                    .padding(.bottom, 32)
                }
            }
            .liquidGlassBackground()
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                preferences.syncSimulateGPEFromStandardDefaults()
            }
            .sheet(item: $pickingPlaceTarget) { target in
                SavedPlacePickerSheet(title: target.sheetTitle) { selectedPlace in
                    switch target {
                    case .home:
                        preferences.homePlace = selectedPlace
                    case .work:
                        preferences.workPlace = selectedPlace
                    }
                }
            }
        }
        .liquidGlassSheet()
    }

    // MARK: - 1. Profil
    private var profileSection: some View {
        AccountSectionGroup {
            VStack(spacing: 16) {
                HStack(spacing: 14) {
                    AccountAvatarBadge(
                        initials: preferences.userInitials,
                        color: preferences.avatarColor,
                        size: 56
                    )

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Profil Flow")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(.secondary)

                        TextField("Votre prénom ou pseudo", text: $preferences.userName)
                            .font(.system(.headline, design: .rounded))
                            .textFieldStyle(.plain)
                            #if canImport(UIKit)
                            .textInputAutocapitalization(.words)
                            #endif
                            .submitLabel(.done)
                    }

                    if !preferences.userName.isEmpty {
                        Button {
                            preferences.userName = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                }

                Divider()

                HStack(spacing: 12) {
                    Text("Couleur")
                        .font(.system(.subheadline, design: .rounded).weight(.medium))
                        .foregroundStyle(.secondary)

                    Spacer()

                    HStack(spacing: 10) {
                        ForEach(UserPreferencesManager.avatarPalette, id: \.self) { hex in
                            let isSelected = preferences.avatarColorHex == hex
                            Button {
                                preferences.triggerHapticImpact()
                                withAnimation(.spring(response: 0.25, dampingFraction: 0.75)) {
                                    preferences.avatarColorHex = hex
                                }
                            } label: {
                                Circle()
                                    .fill(Color(hex: hex))
                                    .frame(width: 24, height: 24)
                                    .overlay {
                                        if isSelected {
                                            Circle()
                                                .strokeBorder(Color.white, lineWidth: 2)
                                                .padding(2)
                                        }
                                    }
                                    .scaleEffect(isSelected ? 1.12 : 1.0)
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel("Couleur d'avatar")
                        }
                    }
                }
            }
            .padding(16)
        }
    }

    // MARK: - 2. Lieux enregistrés
    private var savedPlacesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            AccountSectionHeader(title: "Lieux enregistrés", systemImage: "mappin.and.ellipse")

            AccountSectionGroup {
                savedPlaceRow(
                    icon: "house.fill",
                    iconColor: .blue,
                    label: "Domicile",
                    place: preferences.homePlace,
                    onTap: { pickingPlaceTarget = .home },
                    onClear: { preferences.homePlace = nil }
                )

                Divider().padding(.leading, 56)

                savedPlaceRow(
                    icon: "briefcase.fill",
                    iconColor: .indigo,
                    label: "Travail",
                    place: preferences.workPlace,
                    onTap: { pickingPlaceTarget = .work },
                    onClear: { preferences.workPlace = nil }
                )
            }
        }
    }

    @ViewBuilder
    private func savedPlaceRow(
        icon: String,
        iconColor: Color,
        label: String,
        place: SavedPlace?,
        onTap: @escaping () -> Void,
        onClear: @escaping () -> Void
    ) -> some View {
        HStack(spacing: 12) {
            Button(action: {
                preferences.triggerHapticImpact()
                onTap()
            }) {
                HStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .fill(iconColor.opacity(0.16))
                            .frame(width: 32, height: 32)
                        Image(systemName: icon)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(iconColor)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(label)
                            .font(.system(.subheadline, design: .rounded).weight(.semibold))
                            .foregroundStyle(.primary)

                        if let place {
                            Text(place.subtitle.map { "\(place.name) • \($0)" } ?? place.name)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        } else {
                            Text("Définir une station ou adresse")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }

                    Spacer()

                    if place == nil {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.secondary.opacity(0.6))
                    }
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            if place != nil {
                Button {
                    preferences.triggerHapticImpact()
                    withAnimation(.easeInOut(duration: 0.2)) {
                        onClear()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 17))
                        .foregroundStyle(.secondary.opacity(0.75))
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Supprimer \(label)")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }

    // MARK: - 3. Préférences d'itinéraire
    private var itineraryPreferencesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            AccountSectionHeader(title: "Préférences d'itinéraire", systemImage: "point.topleft.down.to.point.bottomright.curvepath")

            AccountSectionGroup {
                Toggle(isOn: $preferences.defaultAccessibleRouting) {
                    iconTitleLabel(
                        icon: "figure.roll",
                        color: .blue,
                        title: "Accessibilité PMR par défaut",
                        subtitle: "Privilégie les trajets avec ascenseurs"
                    )
                }
                .tint(.blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.red.opacity(0.16))
                                .frame(width: 30, height: 30)
                            Image(systemName: "nosign")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.red)
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Modes évités par défaut")
                                .font(.system(.subheadline, design: .rounded).weight(.medium))
                            Text(
                                preferences.avoidedTransportModes.isEmpty
                                    ? "Tous les modes sont autorisés"
                                    : "\(preferences.avoidedTransportModes.count) mode(s) exclu(s)"
                            )
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        }
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(AvoidableTransportMode.allCases) { mode in
                                let isAvoided = preferences.avoidedTransportModes.contains(mode.rawValue)
                                Button {
                                    preferences.triggerHapticImpact()
                                    withAnimation(.spring(response: 0.25, dampingFraction: 0.78)) {
                                        preferences.toggleAvoidedMode(mode)
                                    }
                                } label: {
                                    HStack(spacing: 5) {
                                        Image(systemName: mode.systemIcon)
                                            .font(.system(size: 11, weight: .semibold))
                                        Text(mode.displayName)
                                            .font(.system(.caption, design: .rounded).weight(isAvoided ? .bold : .medium))
                                    }
                                    .foregroundStyle(isAvoided ? .white : .primary)
                                    .padding(.horizontal, 11)
                                    .padding(.vertical, 7)
                                    .background(
                                        Capsule().fill(
                                            isAvoided
                                                ? Color.red
                                                : Color.primary.opacity(colorScheme == .dark ? 0.12 : 0.07)
                                        )
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.green.opacity(0.16))
                                .frame(width: 30, height: 30)
                            Image(systemName: "figure.walk")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.green)
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Vitesse de marche")
                                .font(.system(.subheadline, design: .rounded).weight(.medium))
                            Text(preferences.walkingSpeed.detail)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()
                    }

                    Picker("Vitesse de marche", selection: $preferences.walkingSpeed) {
                        ForEach(WalkingSpeed.allCases) { speed in
                            Text(speed.displayName).tag(speed)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                Toggle(isOn: $preferences.simulateGPE) {
                    iconTitleLabel(
                        icon: "sparkles",
                        color: .purple,
                        title: "Simuler Grand Paris Express",
                        subtitle: "Inclut les futures lignes 15, 16, 17 et 18"
                    )
                }
                .tint(.purple)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
    }

    // MARK: - 4. Apparence & Expérience
    private var appearanceSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            AccountSectionHeader(title: "Apparence & Expérience", systemImage: "paintbrush.fill")

            AccountSectionGroup {
                VStack(alignment: .leading, spacing: 10) {
                    iconTitleLabel(
                        icon: "circle.lefthalf.filled",
                        color: .indigo,
                        title: "Thème de l'application",
                        subtitle: "S'adapte ou force le mode clair / sombre"
                    )

                    Picker("Thème", selection: $preferences.appearanceMode) {
                        ForEach(AppAppearanceMode.allCases) { mode in
                            Text(mode.displayName).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                VStack(alignment: .leading, spacing: 10) {
                    iconTitleLabel(
                        icon: "hand.raised.fill",
                        color: .blue,
                        title: "Main préférée",
                        subtitle: preferences.handedness.detail
                    )

                    Picker("Main préférée", selection: $preferences.handedness) {
                        ForEach(HandednessMode.allCases) { mode in
                            Text(mode.displayName).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                Toggle(isOn: $preferences.hapticsEnabled) {
                    iconTitleLabel(
                        icon: "hand.tap.fill",
                        color: .orange,
                        title: "Retours haptiques",
                        subtitle: "Vibrations subtiles lors des interactions"
                    )
                }
                .tint(.blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                Toggle(isOn: $preferences.skipLoadingAnimation) {
                    iconTitleLabel(
                        icon: "bolt.fill",
                        color: .yellow,
                        title: "Démarrage rapide",
                        subtitle: "Passe l'animation d'ouverture au lancement"
                    )
                }
                .tint(.blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
    }

    // MARK: - 5. Données & Stockage
    private var dataStorageSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            AccountSectionHeader(title: "Données & Stockage", systemImage: "externaldrive.fill")

            AccountSectionGroup {
                NavigationLink {
                    AccountDataManagementView()
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.teal.opacity(0.16))
                                .frame(width: 30, height: 30)
                            Image(systemName: "internaldrive.fill")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.teal)
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Gérer les données & réinitialiser")
                                .font(.system(.subheadline, design: .rounded).weight(.medium))
                                .foregroundStyle(.primary)
                            Text(dataSummaryLabel)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.secondary.opacity(0.6))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 13)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
    }

    // MARK: - 6. Serveur & Diagnostic
    private var serverDiagnosticSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            AccountSectionHeader(title: "Serveur & Diagnostic", systemImage: "server.rack")

            AccountSectionGroup {
                HStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill((serverService.isConnected ? Color.green : Color.orange).opacity(0.16))
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(serverService.isConnected ? Color.green : Color.orange)
                            .frame(width: 10, height: 10)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("FlowServer • \(serverService.isConnected ? "Connecté" : "Hors ligne")")
                            .font(.system(.subheadline, design: .rounded).weight(.medium))
                        Text(serverService.baseURL)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }

                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider().padding(.leading, 56)

                Toggle(isOn: $preferences.useFlowServer) {
                    iconTitleLabel(
                        icon: "network",
                        color: .blue,
                        title: "Utiliser FlowServer",
                        subtitle: "Sinon appel direct à l'API IDFM"
                    )
                }
                .tint(.blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                #if canImport(UIKit)
                Divider().padding(.leading, 56)

                Button {
                    preferences.triggerHapticImpact()
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.gray.opacity(0.18))
                                .frame(width: 30, height: 30)
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.primary)
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Réglages système iOS")
                                .font(.system(.subheadline, design: .rounded).weight(.medium))
                                .foregroundStyle(.primary)
                            Text("Localisation, Activités en direct et notifications")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Image(systemName: "arrow.up.forward.app")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                #endif

                Divider().padding(.leading, 56)

                HStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color.blue.opacity(0.12))
                            .frame(width: 30, height: 30)
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.blue)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Flow \(appVersionLabel)")
                            .font(.system(.subheadline, design: .rounded).weight(.medium))
                        Text("Données temps réel Île-de-France Mobilités (PRIM)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
    }

    @ViewBuilder
    private func iconTitleLabel(icon: String, color: Color, title: String, subtitle: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color.opacity(0.16))
                    .frame(width: 30, height: 30)
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(.subheadline, design: .rounded).weight(.medium))
                    .foregroundStyle(.primary)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
