import Combine
import MapKit
import SwiftUI

class SharedMapView {
    static let main = SharedMapView()
    static let background = SharedMapView()

    let mapView: MKMapView

    private init() {
        mapView = MKMapView()
        mapView.showsUserLocation = true

        // Register custom annotation view
        mapView.register(
            StationAnnotationView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(
            MKMarkerAnnotationView.self,
            forAnnotationViewWithReuseIdentifier:
                MKMapViewDefaultClusterAnnotationViewReuseIdentifier)

        // Set initial region
        let defaultRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
        mapView.setRegion(defaultRegion, animated: false)

        // Hide built-in public transport markers
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [.publicTransport])
    }
}

struct MapViewControllerBridge: UIViewRepresentable {
    @ObservedObject var data: MapDataService
    @Binding var selectedStation: MapStation?
    @Binding var followUserLocation: Bool
    var journey: Journey?  // Optional journey to display
    var useMainMap: Bool = false  // Default to background map if not specified
    var showAnnotations: Bool = true  // If false, skip annotations and overlays (for background mode)

    func makeUIView(context: Context) -> MKMapView {
        let mapView = useMainMap ? SharedMapView.main.mapView : SharedMapView.background.mapView
        mapView.delegate = context.coordinator

        // Ensure location request happens (idempotent usually)
        LocationManager.shared.requestLocation()

        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        context.coordinator.parent = self

        // Handle centering
        if followUserLocation {
            if let userLocation = mapView.userLocation.location {
                let region = MKCoordinateRegion(
                    center: userLocation.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
                mapView.setRegion(region, animated: true)
            }

            DispatchQueue.main.async {
                followUserLocation = false
            }
        }

        // If showAnnotations is false, clear everything and skip updates (background mode)
        if !showAnnotations {
            mapView.removeOverlays(mapView.overlays)
            mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation) })
            return
        }

        // Check if we have an active journey
        if let journey = journey {
            // For now, let's remove existing overlays to avoid clutter if we are navigating
            mapView.removeOverlays(mapView.overlays)
            mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation) })

            drawJourney(journey, on: mapView)
        } else {
            // Standard behavior: Show all lines
            updateStandardOverlays(mapView, data: data)
        }
    }

    private func drawJourney(_ journey: Journey, on mapView: MKMapView) {
        guard let sections = journey.sections else { return }

        var allCoordinates: [CLLocationCoordinate2D] = []

        for section in sections where section.type == "public_transport" {
            guard let geojson = section.geojson,
                let coordinates = geojson.coordinates,
                let display = section.display_informations
            else { continue }

            let hexColor = display.color ?? "CCCCCC"
            let color = UIColor(hex: hexColor) ?? .blue

            var routeCoordinates: [CLLocationCoordinate2D] = []
            for coord in coordinates {
                if coord.count >= 2 {
                    routeCoordinates.append(
                        CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0]))
                }
            }

            if !routeCoordinates.isEmpty {
                let polyline = ColoredPolyline(
                    coordinates: routeCoordinates, count: routeCoordinates.count)
                polyline.color = color
                mapView.addOverlay(polyline)
                allCoordinates.append(contentsOf: routeCoordinates)
            }

            // Add start/end markers for sections
            if let fromPlace = section.from, let fromCoord = fromPlace.coordinate {
                let annotation = StationAnnotation(
                    station: MapStation(
                        id: fromPlace.id ?? UUID().uuidString, name: fromPlace.name ?? "",
                        coordinate: fromCoord, platforms: [], isHub: false, mainType: .metro,
                        lines: []))
                mapView.addAnnotation(annotation)
            }
        }

        // Walking sections
        for section in sections where section.type == "street_network" || section.mode == "walking"
        {
            guard let geojson = section.geojson,
                let coordinates = geojson.coordinates
            else { continue }

            var routeCoordinates: [CLLocationCoordinate2D] = []
            for coord in coordinates {
                if coord.count >= 2 {
                    routeCoordinates.append(
                        CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0]))
                }
            }

            if !routeCoordinates.isEmpty {
                let polyline = ColoredPolyline(
                    coordinates: routeCoordinates, count: routeCoordinates.count)
                polyline.color = .lightGray
                // Dashed line style is handled in renderer, but ColoredPolyline doesn't support it yet.
                // We'll just use light gray for now.
                mapView.addOverlay(polyline)
                allCoordinates.append(contentsOf: routeCoordinates)
            }
        }

        // If this is the first time drawing this journey (or we want to re-center), we could.
        // But maybe we shouldn't force re-center on every update if user is panning.
        // For now, let's not force re-center here, rely on "followUserLocation" or initial setup.
    }

    private func updateStandardOverlays(_ mapView: MKMapView, data: MapDataService) {
        // Optimization: Use cached overlays to prevent freeze
        if !data.cachedOverlays.isEmpty {
            // Check if we need to update (simple count check or difference check)
            // For now, if count implies we have something, we assume it's the right set.
            // But we must check if current overlays match cached ones.

            let currentColoredPolylines = mapView.overlays.compactMap { $0 as? ColoredPolyline }
            if currentColoredPolylines.count != data.cachedOverlays.count {
                mapView.removeOverlays(mapView.overlays)
                mapView.addOverlays(data.cachedOverlays)
            }
        } else {
            // If cache is empty, maybe trigger load? Or wait?
            // If lines exist but cache empty, trigger calculation
            if !data.lines.isEmpty {
                Task {
                    await data.precalculateOverlays()
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewControllerBridge
        var currentTask: Task<Void, Never>?

        init(_ parent: MapViewControllerBridge) {
            self.parent = parent
        }

        // MARK: - MKMapViewDelegate

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation { return nil }

            if annotation is StationAnnotation {
                let view = mapView.dequeueReusableAnnotationView(
                    withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)

                // Clustering configuration
                view.clusteringIdentifier = "stationCluster"
                view.canShowCallout = false  // We handle selection manually

                return view
            } else if annotation is MKClusterAnnotation {
                // Default cluster view
                let view =
                    mapView.dequeueReusableAnnotationView(
                        withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier,
                        for: annotation) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(
                        annotation: annotation,
                        reuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
                view.markerTintColor = .systemBlue
                view.glyphText =
                    "\( (annotation as? MKClusterAnnotation)?.memberAnnotations.count ?? 0 )"
                return view
            }

            return nil
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let coloredPolyline = overlay as? ColoredPolyline {
                let renderer = MKPolylineRenderer(polyline: coloredPolyline)
                renderer.strokeColor = coloredPolyline.color
                renderer.lineWidth = 5  // Increased from 3 for better visibility

                // Smoothing: arrondir les jonctions et les caps
                renderer.lineJoin = .round
                renderer.lineCap = .round

                // Additional smoothing
                renderer.shouldRasterize = false  // Keep vector rendering for smoothness
                renderer.alpha = 0.85  // Slight transparency helps with overlapping

                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let stationAnnotation = view.annotation as? StationAnnotation {
                parent.selectedStation = stationAnnotation.station
                // Deselect immediately to allow re-selection if needed, or keep selected to show state
                mapView.deselectAnnotation(stationAnnotation, animated: true)
            }
        }

        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            updateAnnotations(in: mapView.region, for: mapView)
        }

        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            if !parent.data.hasCenteredOnUser && userLocation.location != nil {
                let region = MKCoordinateRegion(
                    center: userLocation.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
                mapView.setRegion(region, animated: true)
                parent.data.hasCenteredOnUser = true
            }
        }

        // MARK: - Data Loading Logic

        func updateAnnotations(in region: MKCoordinateRegion, for mapView: MKMapView) {
            currentTask?.cancel()

            currentTask = Task.detached(priority: .userInitiated) { [weak self] in
                guard let self = self else { return }

                let visibleStations = await self.parent.data.fetchStations(in: region)

                await MainActor.run {
                    let currentAnnotations = mapView.annotations.compactMap {
                        $0 as? StationAnnotation
                    }
                    let currentIDs = Set(currentAnnotations.map { $0.station.id })

                    let newStations = visibleStations.filter { !currentIDs.contains($0.id) }
                    let stationsToRemove = currentAnnotations.filter { annotation in
                        !visibleStations.contains { $0.id == annotation.station.id }
                    }

                    if !stationsToRemove.isEmpty {
                        mapView.removeAnnotations(stationsToRemove)
                    }

                    if !newStations.isEmpty {
                        let newAnnotations = newStations.map { StationAnnotation(station: $0) }
                        mapView.addAnnotations(newAnnotations)
                    }
                }
            }
        }
    }
}

// Custom Annotation Class
class StationAnnotation: NSObject, MKAnnotation {
    let station: MapStation
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?

    init(station: MapStation) {
        self.station = station
        self.coordinate = station.coordinate
        self.title = station.name
        self.subtitle = station.lines.map { $0.name }.joined(separator: ", ")
    }
}

// Custom Annotation View hosting SwiftUI
class StationAnnotationView: MKAnnotationView {

    override var annotation: MKAnnotation? {
        didSet { configure() }
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        guard let stationAnnotation = annotation as? StationAnnotation else { return }

        // Remove existing subviews
        subviews.forEach { $0.removeFromSuperview() }

        // Create SwiftUI view
        let stationMarker = StationMarker(station: stationAnnotation.station, zoomLevel: 1.0)

        // Host it
        let controller = UIHostingController(rootView: stationMarker)
        controller.view.backgroundColor = .clear
        controller.view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(controller.view)

        // Auto Layout to fit content
        NSLayoutConstraint.activate([
            controller.view.centerXAnchor.constraint(equalTo: centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: centerYAnchor),
            // On force une largeur max raisonnable pour éviter des textes géants
            controller.view.widthAnchor.constraint(lessThanOrEqualToConstant: 150),
        ])

        // Force layout to calculate size
        controller.view.layoutIfNeeded()
        let size = controller.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        // Update frame to match content size (centered)
        self.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        // Center offset adjustment:
        // MKAnnotationView is centered on the coordinate by default.
        // We want the bottom-center of our view (the pointer tip) to be at the coordinate.
        // So we need to shift the view UP by half its height.
        // centerOffset is defined in the view's coordinate system.
        // Positive x moves right, positive y moves down.
        // To move the view UP relative to the anchor, we need a negative Y offset.
        self.centerOffset = CGPoint(x: 0, y: -size.height / 2)
    }
}
