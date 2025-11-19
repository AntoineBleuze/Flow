import SwiftUI
import MapKit // Pour la preview

struct TraficDetailView: View {
    // Retiré 'private' pour permettre l'initialisation depuis LignesView
    var ligne: Ligne
    
    // Les services injectés
    @EnvironmentObject var idfmService: IDFMService
    @EnvironmentObject var favoritesManager: FavoritesManager // Nécessaire pour StopRow

    var body: some View {
        VStack(spacing: 0) {
            // Afficher la LigneRow en haut
            LigneRow(ligne: ligne)
                .padding()
                .background(Color(.systemGray6)) // Léger fond pour la distinguer

            // Si le service charge les arrêts pour cette ligne
            if idfmService.isLoading {
                ProgressView("Chargement des arrêts...")
                Spacer()
            } else {
                // Liste des arrêts pour la ligne (depuis idfmService.stops)
                List(idfmService.stops) { stop in
                    // StopRow (défini dans ContentView.swift)
                    StopRow(stop: stop)
                }
            }
        }
        .onAppear {
            // Demander au service de charger les arrêts pour CETTE ligne
            // Doit être dans un Task car fetchStops est async
            Task {
                await idfmService.fetchStops(ligne: ligne)
            }
        }
        .onDisappear {
            // Vider les stops lorsque l'on quitte la vue
            // pour que la prochaine vue de détail les recharge
            idfmService.stops = []
        }
        .navigationTitle("Arrêts Ligne \(ligne.shortName)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
