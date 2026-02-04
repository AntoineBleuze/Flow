import Combine
import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters  // Reduce battery usage

        // Prevent background updates in Previews to avoid BSActionErrorDomain crash
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" {
            locationManager.allowsBackgroundLocationUpdates = false  // Disabled by default to save battery
        }

        locationManager.pausesLocationUpdatesAutomatically = false
        self.authorizationStatus = locationManager.authorizationStatus
    }

    func setBackgroundUpdates(enabled: Bool) {
        guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else {
            return
        }
        print("📍 Setting background location updates to \(enabled)")
        locationManager.allowsBackgroundLocationUpdates = enabled
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()  // Or Always if needed
        startTracking()
    }

    func startTracking() {
        locationManager.startUpdatingLocation()
    }

    func stopTracking() {
        locationManager.stopUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus

        #if os(iOS)
            if manager.authorizationStatus == .authorizedWhenInUse
                || manager.authorizationStatus == .authorizedAlways
            {
                manager.startUpdatingLocation()
            }
        #elseif os(macOS)
            if manager.authorizationStatus == .authorized
                || manager.authorizationStatus == .authorizedAlways
            {
                manager.startUpdatingLocation()
            }
        #endif
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location.coordinate
        // We can stop updating if we only need it once, but for navigation/itinerary it might be better to keep it or update significantly
        // manager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
}
