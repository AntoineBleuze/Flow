import SwiftUI

// --- Vues Réutilisables ---
// (Déplacées dans FlowApp.swift pour être accessibles partout)

// --- Vues principales (onglets) ---

// Onglet 1: Liste des Lignes
struct LignesView: View {
    @EnvironmentObject var idfmService: IDFMService
    
    var body: some View {
        NavigationView {
            // Liste des lignes chargées par le service
            List(idfmService.lignes) { ligne in
                // Navigation vers TraficDetailView (la vue de détail d'une ligne)
                // Xcode trouvera TraficDetailView car il est dans un autre fichier du projet
                NavigationLink(destination: TraficDetailView(ligne: ligne)) {
                    LigneRow(ligne: ligne) // Trouvera LigneRow depuis FlowApp.swift
                }
            }
            .navigationTitle("Lignes")
        }
    }
}

// Onglet 2: Recherche d'arrêts
struct SearchView: View {
    @State private var searchText: String = ""
    @EnvironmentObject var idfmService: IDFMService
    
    // Filtre les arrêts en fonction de la recherche
    var filteredStops: [Stop] {
        if searchText.isEmpty {
            // Ne rien afficher si la recherche est vide
            // (Afficher 20k+ arrêts n'est pas performant)
            return []
        } else {
            // Filtre les arrêts (limiter les résultats est une bonne idée)
            return idfmService.allStops.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.city.localizedCaseInsensitiveContains(searchText)
            }.prefix(50).map { $0 } // Limiter aux 50 premiers résultats
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText) // Trouvera SearchBar depuis FlowApp.swift
                    .padding(.top)
                
                // Gérer les états de chargement et de recherche vide
                if idfmService.isLoading && idfmService.allStops.isEmpty {
                    ProgressView("Chargement des arrêts...")
                    Spacer()
                } else if searchText.isEmpty {
                    VStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 50))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                        Text("Recherchez un arrêt")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                } else {
                    // Afficher les résultats de recherche
                    List(filteredStops) { stop in
                        StopRow(stop: stop) // Trouvera StopRow depuis FlowApp.swift
                    }
                }
            }
            .navigationTitle("Recherche")
        }
    }
}


// --- Vue Principale (Conteneur TabView) ---
// ContentView est maintenant la vue racine qui contient les onglets
struct ContentView: View {
    var body: some View {
        TabView {
            // Onglet 1: Lignes
            LignesView()
                .tabItem {
                    Image(systemName: "map") // Icône changée
                    Text("Lignes")
                }
            
            // Onglet 2: Recherche
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recherche")
                }

            // Onglet 3: Favoris (utilise FavoritesView.swift)
            // Xcode trouvera FavoritesView car il est dans un autre fichier du projet
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favoris")
                }
        }
    }
}
