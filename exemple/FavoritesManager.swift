import Foundation
import SwiftUI

class FavoritesManager: ObservableObject {
    // La liste des arrêts favoris, publiée pour la vue
    @Published var favoriteStops: [Stop] = []

    private let favoritesKey = "favoriteStops"

    init() {
        // Charger les favoris au démarrage
        loadFavorites()
    }

    // Ajoute un arrêt aux favoris
    func addFavorite(_ stop: Stop) {
        if !favoriteStops.contains(where: { $0.id == stop.id }) {
            favoriteStops.append(stop)
            saveFavorites()
        }
    }

    // Retire un arrêt des favoris
    func removeFavorite(_ stop: Stop) {
        favoriteStops.removeAll { $0.id == stop.id }
        saveFavorites()
    }

    // Vérifie si un arrêt est déjà en favori
    func isFavorite(_ stop: Stop) -> Bool {
        favoriteStops.contains { $0.id == stop.id }
    }

    // Charge les favoris depuis UserDefaults
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey) {
            // Utilise le décodeur JSON pour décoder [Stop] (grâce à Stop.swift corrigé)
            if let decoded = try? JSONDecoder().decode([Stop].self, from: data) {
                favoriteStops = decoded
            }
        }
    }

    // Sauvegarde les favoris dans UserDefaults
    private func saveFavorites() {
        // Utilise l'encodeur JSON pour encoder [Stop]
        if let encoded = try? JSONEncoder().encode(favoriteStops) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
}
