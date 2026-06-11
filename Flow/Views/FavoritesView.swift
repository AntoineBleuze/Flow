import SwiftUI
import CoreLocation

struct FavoritesView: View {
    @ObservedObject private var favoritesService = FavoritesService.shared
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationStack {
            Group {
                let favoriteStations = favoritesService.favoriteStations
                
                if favoriteStations.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "star.slash.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Aucun favori")
                            .font(.headline)
                        Text(
                            "Ajoutez des stations à vos favoris en appuyant sur l'icône de cœur dans l'écran de détails d'une station."
                        )
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 20)
                } else {
                    List {
                        ForEach(favoriteStations) { station in
                            NavigationLink(
                                destination: StationDetailScreen(station: station)
                            ) {
                                NearbyStationRow(station: station)
                            }
                            .buttonStyle(.plain)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth: horizontalSizeClass == .regular ? 700 : .infinity)
                    .frame(maxWidth: .infinity) // center within parent
                }
            }
            .background {
                ZStack {
                    ShaderAnimationView(isLoading: true)
                    (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                        .background(.ultraThinMaterial.opacity(0.97))
                }
                .ignoresSafeArea()
            }
            .navigationTitle("Favoris")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FavoritesView()
}
