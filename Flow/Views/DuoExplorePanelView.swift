import SwiftUI
import CoreLocation

// MARK: - Panneau Gauche iPhone Duo (Mode Explore)
/// Offre une expérience d'exploration fluide et concentrée sur l'écran gauche :
/// - En-tête avec raccourci Assistant IA
/// - Vue d'ensemble du trafic en direct (métro/RER)
/// - Stations à proximité immédiate avec temps de marche
/// - Favoris rapides
struct DuoExplorePanelView: View {
    @Binding var searchText: String
    @StateObject private var coordinator = NavigationCoordinator.shared
    @ObservedObject var mapData = MapDataService.shared
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var trafficService = TrafficService.shared
    @ObservedObject var favoritesService = FavoritesService.shared
    @Environment(\.colorScheme) private var colorScheme

    // Stations à proximité immédiate
    private var nearbyStations: [MapStation] {
        StationSuggestionEngine.nearbySuggestions(
            from: mapData.allStations,
            userLocation: locationManager.userLocation,
            maxResults: 6
        )
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                // MARK: - 1. En-tête & Assistant IA
                headerSection

                // MARK: - 2. Statut Réseau IDF en direct
                networkStatusSection

                // MARK: - 3. Stations à Proximité Immédiate
                nearbySection

                // MARK: - 4. Favoris rapides
                if !favoritesService.favoriteLinesList.isEmpty {
                    favoritesSection
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .safeAreaPadding(.top)
        .liquidGlassBackground()
        .onAppear {
            locationManager.requestLocation()
            if mapData.allStations.isEmpty {
                mapData.loadData()
            }
        }
    }

    // MARK: - Header & AI
    private var headerSection: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Explore Paris")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text("Réseau & navigation en temps réel")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Bouton IA Flow Assistant
            Button(action: {
                coordinator.showAIAssistant = true
            }) {
                HStack(spacing: 5) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    Text("IA")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.purple.opacity(0.12), in: Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.purple.opacity(0.2), lineWidth: 1)
                )
            }
            .buttonStyle(.liquidGlassInteractive)
        }
    }

    // MARK: - Statut Réseau IDF
    private var networkStatusSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Trafic Réseau", systemImage: "tram.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()

                Button(action: {
                    coordinator.selectedTab = "Trafic"
                }) {
                    Text("Voir tout")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
            }

            // Cartouche statut rapide
            let disruptedCount = trafficService.lines.filter { $0.status != .normal }.count

            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(disruptedCount == 0 ? Color.green.opacity(0.15) : Color.orange.opacity(0.15))
                        .frame(width: 36, height: 36)

                    Image(systemName: disruptedCount == 0 ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                        .foregroundColor(disruptedCount == 0 ? .green : .orange)
                        .font(.system(size: 18))
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(disruptedCount == 0 ? "Trafic globalement fluide" : "\(disruptedCount) ligne\(disruptedCount > 1 ? "s" : "") perturbée\(disruptedCount > 1 ? "s" : "")")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)

                    Text("Métro, RER, Tramways en Île-de-France")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(Color.primary.opacity(0.08), lineWidth: 1)
            )
            .onTapGesture {
                coordinator.selectedTab = "Trafic"
            }
        }
    }

    // MARK: - Stations Proches
    private var nearbySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("À proximité", systemImage: "location.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()

                Button(action: {
                    coordinator.selectedTab = "Nearby"
                }) {
                    Text("Plus")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
            }

            if nearbyStations.isEmpty {
                HStack {
                    Spacer()
                    Text("Recherche des stations à proximité...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 14)
                    Spacer()
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            } else {
                VStack(spacing: 6) {
                    ForEach(nearbyStations.prefix(4)) { station in
                        DuoStationRow(station: station, userCoordinate: locationManager.userLocation)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    coordinator.selectedStation = station
                                }
                            }
                    }
                }
            }
        }
    }

    // MARK: - Favoris Rapides
    private var favoritesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Label("Lignes favorites", systemImage: "star.fill")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)

                Spacer()

                Button(action: {
                    coordinator.selectedTab = "Favorites"
                }) {
                    Text("Gérer")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Array(favoritesService.favoriteLinesList.prefix(6)), id: \.self) { key in
                        if let entry = FavoriteLineEntry(key: key) {
                            Button(action: {
                                coordinator.selectedTab = "Favorites"
                            }) {
                                HStack(spacing: 6) {
                                    LineIcon(type: entry.type, lineId: entry.lineId, size: 20)

                                    if let stationName = entry.stationName {
                                        Text(stationName)
                                            .font(.system(size: 12, weight: .medium, design: .rounded))
                                            .foregroundColor(.primary)
                                            .lineLimit(1)
                                    }
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(.ultraThinMaterial, in: Capsule())
                                .overlay(
                                    Capsule()
                                        .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                                )
                            }
                            .buttonStyle(.liquidGlassInteractive)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Ligne de station compacte optimisée pour l'iPhone Duo
struct DuoStationRow: View {
    let station: MapStation
    let userCoordinate: CLLocationCoordinate2D?

    private var walkDistanceInfo: String? {
        guard let coord = userCoordinate else { return nil }
        let userLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        let stationLoc = CLLocation(latitude: station.latitude, longitude: station.longitude)
        let meters = userLoc.distance(from: stationLoc)
        let minutes = max(1, Int(ceil(meters / 80.0)))
        if meters < 1000 {
            return "\(minutes) min • \(Int(meters))m"
        } else {
            return String(format: "\(minutes) min • %.1f km", meters / 1000.0)
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            // Icone ou badge premier transport
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.12))
                    .frame(width: 34, height: 34)

                Image(systemName: "tram.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 15))
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(station.name)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                if let distance = walkDistanceInfo {
                    Text(distance)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            // Lignes desservies (max 3 badges compacts)
            HStack(spacing: 4) {
                ForEach(station.lines.prefix(3)) { line in
                    LineIcon(type: line.type, lineId: line.name, size: 18)
                }
            }

            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
        )
    }
}
