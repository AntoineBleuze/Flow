import CoreLocation
import SwiftUI

/// Feuille modale dédiée aux adresses sélectionnées depuis la recherche.
/// Affiche la distance, le temps de trajet minimum en transport en commun et les actions En partir / Y aller.
struct AddressDetailSheet: View {
    let address: MapStation
    var onDismiss: (() -> Void)? = nil

    @ObservedObject private var locationManager = LocationManager.shared
    @ObservedObject private var mapData = MapDataService.shared
    @ObservedObject private var preferences = UserPreferencesManager.shared
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dismiss) private var dismiss

    @State private var isCalculatingRoute = false
    @State private var fastestJourney: Journey? = nil
    @State private var fallbackMinMinutes: Int? = nil
    @State private var showItinerary = false
    @State private var itineraryAsDeparture = false

    private var primaryGreen: Color {
        colorScheme == .dark ? Color(hex: "30D158") : Color(hex: "008543")
    }

    private var distanceMeters: Double? {
        guard let userCoord = locationManager.userLocation else { return nil }
        let userLoc = CLLocation(latitude: userCoord.latitude, longitude: userCoord.longitude)
        let destLoc = CLLocation(latitude: address.latitude, longitude: address.longitude)
        return userLoc.distance(from: destLoc)
    }

    private var formattedDistance: String {
        guard let meters = distanceMeters else { return "--" }
        if meters < 1000 {
            return "\(Int(meters)) m"
        }
        return String(format: "%.1f km", meters / 1000.0)
    }

    private var walkEstimateLabel: String {
        guard let meters = distanceMeters else { return "Position requise" }
        let walkMin = max(1, Int(ceil(meters / 80.0)))
        if walkMin <= 45 {
            return "~\(walkMin) min à pied"
        }
        return "À vol d'oiseau"
    }

    private var minTransitMinutes: Int? {
        if let duration = fastestJourney?.duration {
            return max(1, duration / 60)
        }
        return fallbackMinMinutes
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                topBar

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        headerSection
                        actionButtonsRow
                        metricsCard
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 96)
                }
                .scrollContentBackground(.hidden)
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $showItinerary) {
                ItineraryResultView(
                    destination: itineraryAsDeparture ? nil : address,
                    currentLocation: locationManager.userLocation,
                    initialStartStation: itineraryAsDeparture ? address : nil
                )
            }
        }
        .liquidGlassSheet()
        .liquidGlassBackground()
        .task(id: address.id) {
            await computeMinimumTransitTime()
        }
    }

    // MARK: - Top Bar

    private var topBar: some View {
        let addressBadge = HStack(spacing: 5) {
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(.red)
                .font(.footnote)
            Text("ADRESSE")
                .font(.system(.caption, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }

        let actionButton = LiquidGlassCircleButton(icon: "xmark", size: 36, iconSize: 14, iconWeight: .bold) {
            preferences.triggerHapticImpact()
            if let onDismiss = onDismiss {
                onDismiss()
            } else {
                NavigationCoordinator.shared.selectedStation = nil
                dismiss()
            }
        }
        .accessibilityLabel("Fermer")

        return HStack(alignment: .center) {
            if preferences.handedness.isBackButtonTrailing {
                addressBadge
                Spacer()
                actionButton
            } else {
                actionButton
                Spacer()
                addressBadge
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 18)
        .padding(.bottom, 6)
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(address.name)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)

            if let city = address.city,
               !city.isEmpty,
               city.caseInsensitiveCompare(address.name) != .orderedSame {
                Text(city)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, 4)
    }

    // MARK: - En partir / Y aller

    private var actionButtonsRow: some View {
        HStack(spacing: 10) {
            Button(action: {
                itineraryAsDeparture = true
                showItinerary = true
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.up.right.circle.fill")
                        .font(.system(size: 16, weight: .semibold))
                    Text("En partir")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                }
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
            }
            .buttonStyle(.liquidGlassInteractive)

            Button(action: {
                itineraryAsDeparture = false
                showItinerary = true
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Y aller")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                }
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .background(primaryGreen)
                .clipShape(Capsule())
                .shadow(color: primaryGreen.opacity(0.3), radius: 6, y: 3)
            }
            .buttonStyle(.liquidGlassInteractive)
        }
    }

    // MARK: - Distance & Minimum Transit Time Card

    private var metricsCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 12) {
                // Distance tile
                VStack(alignment: .leading, spacing: 4) {
                    Label("Distance", systemImage: "location.fill")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundStyle(.secondary)
                        .textCase(.uppercase)

                    Text(formattedDistance)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(.primary)

                    Text(walkEstimateLabel)
                        .font(.system(size: 11.5, weight: .medium, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color.primary.opacity(colorScheme == .dark ? 0.06 : 0.04))
                )

                // Minimum transit time tile
                VStack(alignment: .leading, spacing: 4) {
                    Label("En transport", systemImage: "tram.fill")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundStyle(.blue)
                        .textCase(.uppercase)

                    if isCalculatingRoute && minTransitMinutes == nil {
                        HStack(spacing: 8) {
                            ProgressView()
                                .controlSize(.small)
                            Text("Calcul...")
                                .font(.system(.subheadline, design: .rounded))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    } else if let minMin = minTransitMinutes {
                        Text("~\(minMin) min")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundStyle(primaryGreen)
                    } else {
                        Text("--")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundStyle(.secondary)
                    }

                    Text(transitSubtitle)
                        .font(.system(size: 11.5, weight: .medium, design: .rounded))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color.primary.opacity(colorScheme == .dark ? 0.06 : 0.04))
                )
            }

            if let sections = fastestJourney?.sections {
                let transitSections = sections.filter { $0.type == "public_transport" }
                if !transitSections.isEmpty {
                    Divider()

                    HStack(spacing: 8) {
                        Text("Trajet le plus rapide")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundStyle(.secondary)

                        Spacer(minLength: 4)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(Array(transitSections.enumerated()), id: \.offset) { idx, sec in
                                    if let info = sec.display_informations {
                                        LineIcon(
                                            type: info.transportType,
                                            lineId: info.code ?? info.label ?? "?",
                                            size: 22,
                                            customColor: Color(hex: info.color ?? "0078D7")
                                        )
                                    }
                                    if idx < transitSections.count - 1 {
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 9, weight: .bold))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
        )
    }

    private var transitSubtitle: String {
        if let journey = fastestJourney {
            let transfers = journey.nb_transfers ?? 0
            return transfers == 0 ? "Direct minimum" : "\(transfers) corresp. minimum"
        }
        if fallbackMinMinutes != nil {
            return "Estimation réseau"
        }
        return locationManager.userLocation == nil ? "Position requise" : "Trajet minimum"
    }

    // MARK: - Minimum Transit Computation

    private func computeMinimumTransitTime() async {
        guard let userCoord = locationManager.userLocation else {
            locationManager.requestLocation()
            return
        }

        await MainActor.run {
            isCalculatingRoute = true
            fastestJourney = nil
            fallbackMinMinutes = nil
        }

        do {
            let journeys = try await IDFMItineraryService.shared.searchItineraryAsync(
                from: userCoord,
                to: address
            )
            if let best = journeys.min(by: { ($0.duration ?? Int.max) < ($1.duration ?? Int.max) }) {
                await MainActor.run {
                    self.fastestJourney = best
                    self.isCalculatingRoute = false
                }
                return
            }
        } catch {
            // Fallback local ci-dessous si hors-ligne ou erreur réseau
        }

        await MainActor.run {
            let allStations = mapData.allStations
            let userLoc = CLLocation(latitude: userCoord.latitude, longitude: userCoord.longitude)
            let destLoc = CLLocation(latitude: address.latitude, longitude: address.longitude)

            let startStation = allStations.min {
                userLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                userLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
            }
            let endStation = allStations.min {
                destLoc.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) <
                destLoc.distance(from: CLLocation(latitude: $1.latitude, longitude: $1.longitude))
            }

            if let s = startStation,
               let e = endStation,
               let route = TransitGraphRouter.shared.findOptimalRoute(from: s, to: e, allStations: allStations) {
                let journey = TransitGraphRouter.shared.buildJourney(
                    from: route,
                    startCoord: userCoord,
                    endCoord: address.coordinate,
                    endName: address.name
                )
                self.fastestJourney = journey
                self.fallbackMinMinutes = max(1, (journey.duration ?? route.totalDurationSeconds) / 60)
            } else if let meters = distanceMeters {
                self.fallbackMinMinutes = max(1, Int(ceil(meters / 80.0)))
            }
            self.isCalculatingRoute = false
        }
    }
}
