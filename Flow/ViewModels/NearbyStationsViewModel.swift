import Combine
import CoreLocation
import Foundation
import SwiftUI

class NearbyStationsViewModel: ObservableObject {
    @Published var nearbyStations: [MapStation] = []
    @Published var isLoading = false
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var permissionDenied = false

    // Rayons disponibles en mètres
    let availableRadii: [Double] = [50, 100, 250, 500, 750, 1000]
    @Published var selectedRadius: Double = 500 {
        didSet {
            // Rafraîchir quand le rayon change
            if let loc = userLocation {
                refreshStations(userLocation: loc)
            }
        }
    }

    private var cancellables = Set<AnyCancellable>()
    private let locationManager = LocationManager.shared
    private let mapDataService = MapDataService.shared

    init() {
        // Observer la localisation
        locationManager.$userLocation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                self?.userLocation = location
                self?.refreshStations(userLocation: location)
            }
            .store(in: &cancellables)

        // Observer les changements dans les stations (chargement initial)
        mapDataService.$allStations
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                // Si on a déjà une localisation, on rafraîchit
                if let loc = self?.userLocation {
                    self?.refreshStations(userLocation: loc)
                }
            }
            .store(in: &cancellables)

        // Initial check
        if let currentLoc = locationManager.userLocation {
            self.userLocation = currentLoc
            refreshStations(userLocation: currentLoc)
        }
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    private func refreshStations(userLocation: CLLocationCoordinate2D?) {
        guard let location = userLocation else { return }

        let all = mapDataService.getAllStationsSync()
        guard !all.isEmpty else { return }

        let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)

        // Calculer les distances et trier
        // On le fait en background pour ne pas bloquer l'UI si beaucoup de stations
        let radius = self.selectedRadius

        DispatchQueue.global(qos: .userInitiated).async {
            let sorted = all.compactMap { station -> (MapStation, Double)? in
                let stationLoc = CLLocation(
                    latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
                let distance = userLoc.distance(from: stationLoc)
                // Filtrer par le rayon sélectionné
                if distance <= radius {
                    return (station, distance)
                }
                return nil
            }
            .sorted { $0.1 < $1.1 }
            .map { $0.0 }

            DispatchQueue.main.async {
                self.nearbyStations = sorted
            }
        }
    }
}
