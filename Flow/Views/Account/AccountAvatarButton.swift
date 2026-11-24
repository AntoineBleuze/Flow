import SwiftUI

/// Badge circulaire affichant les initiales ou l'icône utilisateur avec la couleur choisie.
struct AccountAvatarBadge: View {
    let initials: String
    let color: Color
    var size: CGFloat = 36

    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(initials.isEmpty ? 0.14 : 0.24))

            if initials.isEmpty {
                Image(systemName: "person.fill")
                    .font(.system(size: size * 0.42, weight: .semibold))
                    .foregroundStyle(color)
            } else {
                Text(initials)
                    .font(.system(size: size * 0.38, weight: .bold, design: .rounded))
                    .foregroundStyle(color)
            }
        }
        .frame(width: size, height: size)
    }
}

/// Bouton profil Liquid Glass ouvrant la fiche Compte & Préférences.
struct AccountAvatarButton: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @ObservedObject private var preferences = UserPreferencesManager.shared
    var size: CGFloat = 38

    var body: some View {
        Button {
            preferences.triggerHapticImpact()
            coordinator.showAccountSheet = true
        } label: {
            AccountAvatarBadge(
                initials: preferences.userInitials,
                color: preferences.avatarColor,
                size: size
            )
            .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive(), in: Circle())
        .accessibilityLabel("Mon compte")
    }
}
