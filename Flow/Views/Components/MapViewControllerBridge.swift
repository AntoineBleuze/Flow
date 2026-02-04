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
        let expectedOverlayCount = data.lines.reduce(0) { $0 + $1.polylines.count }
        if mapView.overlays.count != expectedOverlayCount {
            mapView.removeOverlays(mapView.overlays)

            var allPolylines: [(line: LineTrace, polyline: MKPolyline, index: Int)] = []
            for line in data.lines {
                for (index, polyline) in line.polylines.enumerated() {
                    allPolylines.append((line: line, polyline: polyline, index: index))
                }
            }

            for (lineIndex, item) in allPolylines.enumerated() {
                let overlappingPolylines = allPolylines.enumerated().filter {
                    otherIndex, otherItem in
                    guard otherIndex != lineIndex else { return false }
                    return polylinesOverlap(item.polyline, otherItem.polyline)
                }

                let totalOverlapping = overlappingPolylines.count + 1
                var offsetIndex = 0

                let allInGroup = ([item] + overlappingPolylines.map { $0.element }).sorted {
                    $0.line.name < $1.line.name
                }
                if let myPosition = allInGroup.firstIndex(where: {
                    $0.line.name == item.line.name && $0.index == item.index
                }) {
                    offsetIndex = myPosition
                }

                let offsetDistance: CLLocationDistance
                if totalOverlapping > 1 {
                    let baseOffset: CLLocationDistance = 15.0
                    let centerOffset = Double(totalOverlapping - 1) / 2.0
                    offsetDistance = (Double(offsetIndex) - centerOffset) * baseOffset
                } else {
                    offsetDistance = 0
                }

                let finalPolyline: MKPolyline
                if offsetDistance != 0 {
                    finalPolyline = offsetPolyline(item.polyline, by: offsetDistance)
                } else {
                    finalPolyline = item.polyline
                }

                let coloredPolyline = ColoredPolyline(
                    points: finalPolyline.points(), count: finalPolyline.pointCount)
                coloredPolyline.color = UIColor(item.line.color)
                coloredPolyline.lineName = item.line.name
                mapView.addOverlay(coloredPolyline)
            }
        }
    }

    // MARK: - Helper Functions for Polyline Offset

    /// Check if two polylines overlap (share similar paths)
    private func polylinesOverlap(_ polyline1: MKPolyline, _ polyline2: MKPolyline) -> Bool {
        let points1 = polyline1.points()
        let points2 = polyline2.points()

        // Sample a few points and check if they're close
        let sampleCount = min(5, polyline1.pointCount, polyline2.pointCount)
        var matchingPoints = 0
        let threshold: CLLocationDistance = 50  // 50 meters threshold

        for i in 0..<sampleCount {
            let idx1 = (i * polyline1.pointCount) / sampleCount
            let idx2 = (i * polyline2.pointCount) / sampleCount

            guard idx1 < polyline1.pointCount, idx2 < polyline2.pointCount else { continue }

            let coord1 = points1[idx1].coordinate
            let coord2 = points2[idx2].coordinate

            let location1 = CLLocation(latitude: coord1.latitude, longitude: coord1.longitude)
            let location2 = CLLocation(latitude: coord2.latitude, longitude: coord2.longitude)

            if location1.distance(from: location2) < threshold {
                matchingPoints += 1
            }
        }

        // If more than 60% of sampled points are close, consider them overlapping
        return Double(matchingPoints) / Double(sampleCount) > 0.6
    }

    /// Offset a polyline by a given distance perpendicular to its path
    private func offsetPolyline(_ polyline: MKPolyline, by distance: CLLocationDistance)
        -> MKPolyline
    {
        let points = polyline.points()
        var offsetCoordinates: [CLLocationCoordinate2D] = []

        for i in 0..<polyline.pointCount {
            let currentPoint = points[i].coordinate

            // Calculate perpendicular direction based on neighboring points
            var bearing: Double = 0

            if i == 0 && polyline.pointCount > 1 {
                // First point: use direction to next point
                bearing = calculateBearing(from: currentPoint, to: points[1].coordinate)
            } else if i == polyline.pointCount - 1 {
                // Last point: use direction from previous point
                bearing = calculateBearing(from: points[i - 1].coordinate, to: currentPoint)
            } else {
                // Middle points: use average of incoming and outgoing directions
                let bearingIn = calculateBearing(from: points[i - 1].coordinate, to: currentPoint)
                let bearingOut = calculateBearing(from: currentPoint, to: points[i + 1].coordinate)
                bearing = (bearingIn + bearingOut) / 2
            }

            // Add 90 degrees to get perpendicular direction
            let perpendicularBearing = bearing + 90

            // Calculate offset coordinate
            let offsetCoord = coordinate(
                from: currentPoint, distance: distance, bearing: perpendicularBearing)
            offsetCoordinates.append(offsetCoord)
        }

        return MKPolyline(coordinates: offsetCoordinates, count: offsetCoordinates.count)
    }

    /// Calculate bearing between two coordinates in degrees
    private func calculateBearing(
        from coord1: CLLocationCoordinate2D, to coord2: CLLocationCoordinate2D
    ) -> Double {
        let lat1 = coord1.latitude * .pi / 180
        let lon1 = coord1.longitude * .pi / 180
        let lat2 = coord2.latitude * .pi / 180
        let lon2 = coord2.longitude * .pi / 180

        let dLon = lon2 - lon1
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let bearing = atan2(y, x)

        return bearing * 180 / .pi
    }

    /// Calculate a new coordinate from a starting point, given distance and bearing
    private func coordinate(
        from coord: CLLocationCoordinate2D, distance: CLLocationDistance, bearing: Double
    ) -> CLLocationCoordinate2D {
        let earthRadius: Double = 6_371_000  // meters

        let lat1 = coord.latitude * .pi / 180
        let lon1 = coord.longitude * .pi / 180
        let bearingRad = bearing * .pi / 180

        let lat2 = asin(
            sin(lat1) * cos(distance / earthRadius) + cos(lat1) * sin(distance / earthRadius)
                * cos(bearingRad))

        let lon2 =
            lon1
            + atan2(
                sin(bearingRad) * sin(distance / earthRadius) * cos(lat1),
                cos(distance / earthRadius) - sin(lat1) * sin(lat2))

        return CLLocationCoordinate2D(latitude: lat2 * 180 / .pi, longitude: lon2 * 180 / .pi)
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
            } else if let cluster = annotation as? MKClusterAnnotation {
                // Custom cluster view
                let view =
                    mapView.dequeueReusableAnnotationView(
                        withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier,
                        for: annotation) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(
                        annotation: annotation,
                        reuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
                
                view.markerTintColor = .white
                view.glyphTintColor = .systemBlue
                view.glyphText = "\(cluster.memberAnnotations.count)"
                view.displayPriority = .defaultHigh
                
                // Add a soft shadow to match our markers
                view.layer.shadowColor = UIColor.black.cgColor
                view.layer.shadowOpacity = 0.2
                view.layer.shadowOffset = CGSize(width: 0, height: 2)
                view.layer.shadowRadius = 4
                
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
                stationAnnotation.isSelected = true
                (view as? StationAnnotationView)?.annotation = stationAnnotation // Trigger update
                
                parent.selectedStation = stationAnnotation.station
            }
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            if let stationAnnotation = view.annotation as? StationAnnotation {
                stationAnnotation.isSelected = false
                (view as? StationAnnotationView)?.annotation = stationAnnotation // Trigger update
                
                if parent.selectedStation?.id == stationAnnotation.station.id {
                    parent.selectedStation = nil
                }
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
    var isSelected: Bool = false

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
        let isSelected = (annotation as? StationAnnotation)?.isSelected ?? false
        let stationMarker = StationMarker(
            station: stationAnnotation.station, 
            zoomLevel: 1.0,
            isSelected: isSelected
        )

        // Host it
        let controller = UIHostingController(rootView: stationMarker)
        controller.view.backgroundColor = .clear
        controller.view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(controller.view)

        // Auto Layout to fit content
        NSLayoutConstraint.activate([
            controller.view.centerXAnchor.constraint(equalTo: centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: centerYAnchor),
            // On force une largeur max raisonnable
            controller.view.widthAnchor.constraint(lessThanOrEqualToConstant: 180),
        ])

        // Force layout to calculate size
        controller.view.layoutIfNeeded()
        let size = controller.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        // Update frame to match content size (centered)
        self.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        // Center offset adjustment:
        self.centerOffset = CGPoint(x: 0, y: -size.height / 2)
        
        // Z-Index priority if selected
        self.displayPriority = isSelected ? .required : .defaultHigh
    }
}
