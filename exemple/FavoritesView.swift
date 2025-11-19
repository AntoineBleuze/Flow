import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            VStack {
                // Gérer le cas où il n'y a pas de favoris
                if favoritesManager.favoriteStops.isEmpty {
                    VStack {
                        Spacer()
                        Image(systemName: "star.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                        Text("Aucun favori")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Text("Ajoutez des arrêts à vos favoris\ndepuis la recherche ou les lignes.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.top, 5)
                        Spacer()
                    }
                    .padding()
                } else {
                    // La liste des favoris
                    List {
                        // Boucle sur les favoris
                        ForEach(favoritesManager.favoriteStops) { stop in
                            // StopRow (défini dans ContentView.swift) gère l'affichage
                            StopRow(stop: stop)
                        }
                        // Permet de supprimer des favoris en glissant
                        .onDelete { indexSet in
                            removeFavorites(at: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Favoris")
        }
    }
    
    // Fonction pour gérer la suppression via swipe
    private func removeFavorites(at offsets: IndexSet) {
        // Obtenir les arrêts à supprimer
        let stopsToRemove = offsets.map { favoritesManager.favoriteStops[$0] }
        // Les supprimer
        for stop in stopsToRemove {
            favoritesManager.removeFavorite(stop)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesManager())
    }
}
