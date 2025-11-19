import SwiftUI

@main
struct FlowApp: App {
    // Créer les instances des services en tant que @StateObject
    // pour qu'ils persistent pendant toute la vie de l'app
    @StateObject private var idfmService = IDFMService()
    @StateObject private var favoritesManager = FavoritesManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Injecter les instances en tant qu'objets d'environnement
                .environmentObject(idfmService)
                .environmentObject(favoritesManager)
        }
    }
}

// --- Vues Réutilisables ---
// (Placées ici pour être accessibles par tous les fichiers de l'application)

// Vue pour la barre de recherche
struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Rechercher un arrêt...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.horizontal)
    }
}

// Vue pour une rangée d'arrêt (StopRow)
struct StopRow: View {
    let stop: Stop
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stop.name)
                    .font(.headline)
                Text(stop.city)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            // Bouton pour ajouter/retirer des favoris
            Button(action: {
                if favoritesManager.isFavorite(stop) {
                    favoritesManager.removeFavorite(stop)
                } else {
                    favoritesManager.addFavorite(stop)
                }
            }) {
                Image(systemName: favoritesManager.isFavorite(stop) ? "star.fill" : "star")
                    .foregroundColor(favoritesManager.isFavorite(stop) ? .yellow : .gray)
            }
            .buttonStyle(PlainButtonStyle()) // Permet au bouton de fonctionner dans une List
        }
        .padding(.vertical, 4)
    }
}

// Vue pour une rangée de Ligne
struct LigneRow: View {
    let ligne: Ligne

    var body: some View {
        HStack(spacing: 15) {
            // Assure que le nom de l'icône existe dans vos Assets
            Image(ligne.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(ligne.name)
                    .font(.headline)
                Text(ligne.shortName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
}
