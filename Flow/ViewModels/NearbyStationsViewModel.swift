import Combine
import CoreLocation
import Foundation
import SwiftUI
import SwiftData

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

        let allRailStations = mapDataService.getAllStationsSync()
        let radius = self.selectedRadius
        let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)

        self.isLoading = true
        let container = SwiftDataStack.shared.container

        DispatchQueue.global(qos: .userInitiated).async {
            // 1. Filter rail stations in memory
            let filteredStations = allRailStations.compactMap { station -> (MapStation, Double)? in
                let stationLoc = CLLocation(latitude: station.coordinate.latitude, longitude: station.coordinate.longitude)
                let distance = userLoc.distance(from: stationLoc)
                if distance <= radius {
                    return (station, distance)
                }
                return nil
            }

            // 2. Fetch nearby bus stops from SwiftData using a bounding box
            let context = ModelContext(container)
            let deltaLat = radius / 111111.0
            let latRad = location.latitude * .pi / 180.0
            let deltaLon = radius / (111111.0 * cos(latRad))

            let minLat = location.latitude - deltaLat
            let maxLat = location.latitude + deltaLat
            let minLon = location.longitude - deltaLon
            let maxLon = location.longitude + deltaLon

            let descriptor = FetchDescriptor<StopPointModel>(
                predicate: #Predicate<StopPointModel> { stop in
                    stop.type == "Bus" &&
                    stop.latitude >= minLat && stop.latitude <= maxLat &&
                    stop.longitude >= minLon && stop.longitude <= maxLon
                }
            )

            var busStations: [(MapStation, Double)] = []

            do {
                let busStops = try context.fetch(descriptor)
                // Group bus stops by name and city to form "Bus stations"
                let grouped = Dictionary(grouping: busStops) { "\($0.name)_\($0.city)" }

                for (_, stops) in grouped {
                    guard let first = stops.first else { continue }
                    let name = first.name

                    let totalLat = stops.reduce(0.0) { $0 + $1.latitude }
                    let totalLon = stops.reduce(0.0) { $0 + $1.longitude }
                    let count = Double(stops.count)
                    let center = CLLocationCoordinate2D(latitude: totalLat / count, longitude: totalLon / count)

                    let stationLoc = CLLocation(latitude: center.latitude, longitude: center.longitude)
                    let distance = userLoc.distance(from: stationLoc)

                    if distance <= radius {
                        let platforms = stops.compactMap { entity -> StopPoint? in
                            let coordinate = CLLocationCoordinate2D(latitude: entity.latitude, longitude: entity.longitude)

                            // Map string to enum
                            let type: TransportType = {
                                let typeLower = entity.type.lowercased()
                                if typeLower.contains("metro") { return .metro }
                                if typeLower.contains("rer") { return .rer }
                                if typeLower.contains("tram") { return .tram }
                                if typeLower.contains("transilien") || typeLower.contains("train") { return .transilien }
                                return .bus
                            }()

                            return StopPoint(
                                id: entity.id,
                                stopAreaId: entity.stopAreaId,
                                name: name,
                                coordinate: coordinate,
                                type: type,
                                lineName: entity.lineName
                            )
                        }

                        // Extract lines
                        let lines = Array(Set(platforms.map { $0.lineName })).map { lineName in
                            StationLine(name: lineName, type: .bus)
                        }

                        let busStation = MapStation(
                            id: first.stopAreaId.isEmpty ? first.id : first.stopAreaId,
                            name: name,
                            coordinate: center,
                            platforms: platforms,
                            isHub: false,
                            mainType: .bus,
                            lines: lines,
                            city: first.city.isEmpty ? "Paris" : first.city
                        )

                        busStations.append((busStation, distance))
                    }
                }
            } catch {
                print("⚠️ CoreData fetch bus stations error: \(error)")
            }

            // 3. Merge and sort all by distance
            let merged = (filteredStations + busStations).sorted { $0.1 < $1.1 }.map { $0.0 }

            DispatchQueue.main.async {
                self.nearbyStations = merged
                self.isLoading = false
            }
        }
    }
}
