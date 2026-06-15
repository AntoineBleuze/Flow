import Combine
import MapKit
import SwiftUI

#if !canImport(UIKit)
import AppKit
#endif

class SharedMapView {
    static let main = SharedMapView()
    static let background = SharedMapView()

    let mapView: MKMapView

    private init() {
        mapView = MKMapView()
        mapView.showsUserLocation = true

        // Register custom annotation view
        mapView.register(
            StationSwiftUIAnnotationView.self,
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

        // Hide clutter POIs (restaurants, cafés, shops…) but keep landmarks & cultural spots
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [
            .publicTransport,
            .restaurant,
            .cafe,
            .bakery,
            .brewery,
            .winery,
            .foodMarket,
            .nightlife,
            .store,
            .gasStation,
            .carRental,
            .evCharger,
            .parking,
            .atm,
            .bank,
            .laundry,
            .postOffice,
        ])
    }
}

class SimulatedUserAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = "Ma position (Simulée)", subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

struct MapViewControllerBridge: UIViewRepresentable {
    @ObservedObject var data: MapDataService
    @Binding var selectedStation: MapStation?
    @Binding var userTrackingMode: MKUserTrackingMode
    var recenterTrigger: Bool
    
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var navigationManager = NavigationManager.shared
    var journey: Journey?  // Optional journey to display
    var focusedSectionId: String? = nil  // Optional section to focus on
    var useMainMap: Bool = false  // Default to background map if not specified
    var showAnnotations: Bool = true  // If false, skip annotations and overlays (for background mode)

    init(
        data: MapDataService,
        selectedStation: Binding<MapStation?>,
        userTrackingMode: Binding<MKUserTrackingMode>,
        recenterTrigger: Bool = false,
        journey: Journey? = nil,
        focusedSectionId: String? = nil,
        useMainMap: Bool = false,
        showAnnotations: Bool = true
    ) {
        self._data = ObservedObject(wrappedValue: data)
        self._selectedStation = selectedStation
        self._userTrackingMode = userTrackingMode
        self.recenterTrigger = recenterTrigger
        self.journey = journey
        self.focusedSectionId = focusedSectionId
        self.useMainMap = useMainMap
        self.showAnnotations = showAnnotations
    }

    #if canImport(UIKit)
    func makeUIView(context: Context) -> MKMapView {
        return makeMapView(context: context)
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        updateMapView(mapView, context: context)
    }
    #else
    func makeNSView(context: Context) -> MKMapView {
        return makeMapView(context: context)
    }

    func updateNSView(_ mapView: MKMapView, context: Context) {
        updateMapView(mapView, context: context)
    }
    #endif

    private func makeMapView(context: Context) -> MKMapView {
        let mapView = useMainMap ? SharedMapView.main.mapView : SharedMapView.background.mapView
        mapView.delegate = context.coordinator

        // Ensure location request happens (idempotent usually)
        LocationManager.shared.requestLocation()

        // Ajouter un geste pour détecter le déplacement manuel de l'utilisateur
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePanGesture(_:)))
        panGesture.delegate = context.coordinator
        mapView.addGestureRecognizer(panGesture)

        return mapView
    }

    private func updateMapView(_ mapView: MKMapView, context: Context) {
        context.coordinator.parent = self

        // Handle Polyline Style Change (force recreation of renderers by removing and re-adding overlays)
        if context.coordinator.lastPolylineStyle != data.polylineStyle {
            context.coordinator.lastPolylineStyle = data.polylineStyle
            mapView.removeOverlays(mapView.overlays)
        }

        // Handle Recenter Trigger (forced recenter)
        if context.coordinator.lastRecenterTrigger != recenterTrigger {
            context.coordinator.lastRecenterTrigger = recenterTrigger
            if let userCoord = locationManager.userLocation, isValidCoordinate(userCoord) {
                mapView.setCenter(userCoord, animated: true)
            }
            #if canImport(UIKit)
            if !locationManager.isSimulating {
                mapView.setUserTrackingMode(userTrackingMode, animated: true)
            }
            #endif
        }

        // Handle Tracking Mode
        #if canImport(UIKit)
        if !locationManager.isSimulating {
            if mapView.userTrackingMode != userTrackingMode {
                mapView.setUserTrackingMode(userTrackingMode, animated: true)
                if userTrackingMode != .none, let userCoord = locationManager.userLocation, isValidCoordinate(userCoord) {
                    mapView.setCenter(userCoord, animated: true)
                }
            }
        } else {
            // In simulation, if userTrackingMode changes, we force-center immediately
            if context.coordinator.lastSimulatedTrackingMode != userTrackingMode {
                context.coordinator.lastSimulatedTrackingMode = userTrackingMode
                if userTrackingMode != .none, let userCoord = locationManager.userLocation, isValidCoordinate(userCoord) {
                    mapView.setCenter(userCoord, animated: true)
                }
            }
        }
        #endif

        // If showAnnotations is false, clear everything and skip updates (background mode)
        if !showAnnotations {
            mapView.removeOverlays(mapView.overlays)
            mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation || $0 is SimulatedUserAnnotation) })
            return
        }

        // Check if we have an active journey
        if let journey = journey {
            // For now, let's remove existing overlays to avoid clutter if we are navigating
            mapView.removeOverlays(mapView.overlays)
            mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation || $0 is SimulatedUserAnnotation) })

            drawJourney(journey, on: mapView)

            // Zoom/pan to focused section or entire journey (only if not simulating to avoid fight with centering)
            if !locationManager.isSimulating {
                if let focusedSectionId = focusedSectionId {
                    if context.coordinator.lastZoomedSectionId != focusedSectionId {
                        context.coordinator.lastZoomedSectionId = focusedSectionId
                        if let sections = journey.sections,
                           let section = sections.first(where: { $0.id == focusedSectionId }) {
                            zoomToSection(section, on: mapView)
                        }
                    }
                } else if context.coordinator.lastZoomedJourneyId != journey.id.uuidString {
                    context.coordinator.lastZoomedJourneyId = journey.id.uuidString
                    context.coordinator.lastZoomedSectionId = nil
                    zoomToJourney(journey, on: mapView)
                }
            }
        } else {
            context.coordinator.lastZoomedJourneyId = nil
            context.coordinator.lastZoomedSectionId = nil
            // Standard behavior: Show all lines
            updateStandardOverlays(mapView, data: data)
        }

        // Center on user at startup
        if !data.hasCenteredOnUser, let userCoord = locationManager.userLocation, isValidCoordinate(userCoord) {
            let region = MKCoordinateRegion(center: userCoord, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: true)
            
            // Set tracking mode to follow and mark as centered on main thread
            DispatchQueue.main.async {
                data.hasCenteredOnUser = true
                self.userTrackingMode = .follow
            }
        }

        // 3D Camera Pitch implementation
        if let station = selectedStation {
            if context.coordinator.lastSelectedStationId != station.id {
                context.coordinator.lastSelectedStationId = station.id
                context.coordinator.lastSelectedStationCoordinate = station.coordinate
                #if canImport(UIKit)
                let isIPad = UIDevice.current.userInterfaceIdiom == .pad
                #else
                let isIPad = false
                #endif
                let targetCenter = isIPad ? station.coordinate : coordinate(from: station.coordinate, distance: 250, bearing: mapView.camera.heading + 180)
                let camera = MKMapCamera(lookingAtCenter: targetCenter, fromDistance: 1200, pitch: 45, heading: mapView.camera.heading)
                mapView.setCamera(camera, animated: true)
            }
        } else if let journey = journey {
            if context.coordinator.lastSelectedStationId != journey.id.uuidString {
                context.coordinator.lastSelectedStationId = journey.id.uuidString
                let camera = mapView.camera
                camera.pitch = 45
                mapView.setCamera(camera, animated: true)
            }
        } else {
            if context.coordinator.lastSelectedStationId != nil {
                let lastCoord = context.coordinator.lastSelectedStationCoordinate
                context.coordinator.lastSelectedStationId = nil
                context.coordinator.lastSelectedStationCoordinate = nil
                
                if let lastCoord = lastCoord {
                    let camera = MKMapCamera(lookingAtCenter: lastCoord, fromDistance: 1500, pitch: 0, heading: mapView.camera.heading)
                    mapView.setCamera(camera, animated: true)
                } else {
                    let camera = mapView.camera
                    camera.pitch = 0
                    mapView.setCamera(camera, animated: true)
                }
            }
        }

        // Handle simulation location tracking and centering
        if locationManager.isSimulating, let userCoord = locationManager.userLocation, isValidCoordinate(userCoord) {
            mapView.showsUserLocation = false
            if let existing = mapView.annotations.first(where: { $0 is SimulatedUserAnnotation }) as? SimulatedUserAnnotation {
                existing.coordinate = userCoord
            } else {
                let simUser = SimulatedUserAnnotation(coordinate: userCoord)
                mapView.addAnnotation(simUser)
            }
            if userTrackingMode != .none {
                mapView.setCenter(userCoord, animated: true)
            }
        } else {
            mapView.showsUserLocation = true
            let simAnnotations = mapView.annotations.filter { $0 is SimulatedUserAnnotation }
            if !simAnnotations.isEmpty {
                mapView.removeAnnotations(simAnnotations)
            }
        }
        
        // Refresh annotations when active categories change
        if context.coordinator.lastActiveCategories != data.activeCategories {
            context.coordinator.lastActiveCategories = data.activeCategories
            context.coordinator.updateAnnotations(in: mapView.region, for: mapView)
        }
    }

    private func isValidCoordinate(_ coordinate: CLLocationCoordinate2D) -> Bool {
        return coordinate.latitude != 0.0 && coordinate.longitude != 0.0 && coordinate.latitude >= -90.0 && coordinate.latitude <= 90.0 && coordinate.longitude >= -180.0 && coordinate.longitude <= 180.0
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
                    let coordinate = CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0])
                    if isValidCoordinate(coordinate) {
                        routeCoordinates.append(coordinate)
                    }
                }
            }

            if !routeCoordinates.isEmpty {
                let polyline = ColoredPolyline(
                    coordinates: routeCoordinates, count: routeCoordinates.count)
                polyline.color = color
                polyline.lineName = display.label ?? ""
                
                let cleanLineName = (display.code ?? display.label ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let status = TrafficService.shared.lines.first(where: {
                    $0.lineId.lowercased() == cleanLineName.lowercased()
                })?.status ?? .normal
                polyline.status = status
                
                mapView.addOverlay(polyline)
                allCoordinates.append(contentsOf: routeCoordinates)
            }

            // Add start/end markers for sections
            if let fromPlace = section.from, let fromCoord = fromPlace.coordinate, isValidCoordinate(fromCoord) {
                let annotation = StationAnnotation(
                    station: MapStation(
                        id: fromPlace.id ?? UUID().uuidString, name: fromPlace.name ?? "",
                        coordinate: fromCoord, platforms: [], isHub: false, mainType: .metro,
                        lines: []))
                mapView.addAnnotation(annotation)
                
                // Add Entry Exits
                if let stationId = fromPlace.id {
                    let exits = StationExitsService.shared.exitsForStation(id: stationId)
                    for exit in exits where exit.is_entry {
                        if let coords = exit.coordinates {
                            let exitCoord = CLLocationCoordinate2D(latitude: coords.lat, longitude: coords.lon)
                            let exitAnnotation = ExitMarkerAnnotation(
                                coordinate: exitCoord,
                                title: "Accès \(exit.exit_number ?? 0): \(exit.exit_name ?? "Entrée")",
                                subtitle: "Entrée pour la station \(fromPlace.name ?? "")",
                                isEntry: true
                            )
                            mapView.addAnnotation(exitAnnotation)
                        }
                    }
                }
            }
            
            if let toPlace = section.to, let toCoord = toPlace.coordinate, isValidCoordinate(toCoord) {
                let annotation = StationAnnotation(
                    station: MapStation(
                        id: toPlace.id ?? UUID().uuidString, name: toPlace.name ?? "",
                        coordinate: toCoord, platforms: [], isHub: false, mainType: .metro,
                        lines: []))
                mapView.addAnnotation(annotation)
                
                // Add Exit Exits
                if let stationId = toPlace.id {
                    let exits = StationExitsService.shared.exitsForStation(id: stationId)
                    for exit in exits where exit.is_exit {
                        if let coords = exit.coordinates {
                            let exitCoord = CLLocationCoordinate2D(latitude: coords.lat, longitude: coords.lon)
                            let exitAnnotation = ExitMarkerAnnotation(
                                coordinate: exitCoord,
                                title: "Sortie \(exit.exit_number ?? 0): \(exit.exit_name ?? "Sortie")",
                                subtitle: "Sortie de la station \(toPlace.name ?? "")",
                                isEntry: false
                            )
                            mapView.addAnnotation(exitAnnotation)
                        }
                    }
                }
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
                    let coordinate = CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0])
                    if isValidCoordinate(coordinate) {
                        routeCoordinates.append(coordinate)
                    }
                }
            }

            if !routeCoordinates.isEmpty {
                let polyline = ColoredPolyline(
                    coordinates: routeCoordinates, count: routeCoordinates.count)
                polyline.color = .lightGray
                polyline.isDashed = true
                mapView.addOverlay(polyline)
                allCoordinates.append(contentsOf: routeCoordinates)
            }
        }

        // If this is the first time drawing this journey (or we want to re-center), we could.
        // But maybe we shouldn't force re-center on every update if user is panning.
        // For now, let's not force re-center here, rely on "followUserLocation" or initial setup.
    }

    private func zoomToJourney(_ journey: Journey, on mapView: MKMapView) {
        guard let sections = journey.sections else { return }
        var allCoordinates: [CLLocationCoordinate2D] = []

        for section in sections {
            if let geojson = section.geojson, let coordinates = geojson.coordinates {
                for coord in coordinates where coord.count >= 2 {
                    let coordinate = CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0])
                    if isValidCoordinate(coordinate) {
                        allCoordinates.append(coordinate)
                    }
                }
            }
            if let from = section.from, let fromCoord = from.coordinate, isValidCoordinate(fromCoord) {
                allCoordinates.append(fromCoord)
            }
            if let to = section.to, let toCoord = to.coordinate, isValidCoordinate(toCoord) {
                allCoordinates.append(toCoord)
            }
        }

        if !allCoordinates.isEmpty {
            let boundingRect = MKMapRect(coordinates: allCoordinates)
            // Apply bottom padding (350pt) to keep the route in the top portion above the bottom panel
            let padding = UIEdgeInsets(top: 80, left: 40, bottom: 350, right: 40)
            mapView.setVisibleMapRect(boundingRect, edgePadding: padding, animated: true)
        }
    }

    private func zoomToSection(_ section: ItinerarySection, on mapView: MKMapView) {
        var sectionCoordinates: [CLLocationCoordinate2D] = []

        if let geojson = section.geojson, let coordinates = geojson.coordinates {
            for coord in coordinates where coord.count >= 2 {
                let coordinate = CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0])
                if isValidCoordinate(coordinate) {
                    sectionCoordinates.append(coordinate)
                }
            }
        }
        if let from = section.from, let fromCoord = from.coordinate, isValidCoordinate(fromCoord) {
            sectionCoordinates.append(fromCoord)
        }
        if let to = section.to, let toCoord = to.coordinate, isValidCoordinate(toCoord) {
            sectionCoordinates.append(toCoord)
        }

        if !sectionCoordinates.isEmpty {
            let boundingRect = MKMapRect(coordinates: sectionCoordinates)
            // Apply bottom padding (350pt) to keep the focused section visible above the bottom panel
            let padding = UIEdgeInsets(top: 100, left: 60, bottom: 350, right: 60)
            mapView.setVisibleMapRect(boundingRect, edgePadding: padding, animated: true)
        }
    }

    private func isLineEnabledOrFavorite(_ lineName: String, type: TransportType) -> Bool {
        if MapDataService.shared.isLineTypeEnabled(type) {
            return true
        }
        return FavoritesService.shared.isFavoriteLine(lineId: lineName, type: type)
    }

    private func updateStandardOverlays(_ mapView: MKMapView, data: MapDataService) {
        if !data.cachedOverlays.isEmpty {
            let activeOverlays = data.cachedOverlays.filter { overlay in
                isLineEnabledOrFavorite(overlay.lineName, type: overlay.type)
            }
            
            let currentOverlays = mapView.overlays.compactMap { $0 as? ColoredPolyline }
            if Set(currentOverlays) != Set(activeOverlays) {
                mapView.removeOverlays(mapView.overlays)
                mapView.addOverlays(activeOverlays)
            }
            return
        }

        let filteredLines = data.lines.filter { line in
            isLineEnabledOrFavorite(line.name, type: line.type)
        }

        let expectedOverlayCount = filteredLines.reduce(0) { $0 + $1.polylines.count }
        let currentOverlaysCount = mapView.overlays.compactMap { $0 as? ColoredPolyline }.count
        
        if currentOverlaysCount != expectedOverlayCount {
            mapView.removeOverlays(mapView.overlays)

            var allPolylines: [(line: LineTrace, polyline: MKPolyline, index: Int)] = []
            for line in filteredLines {
                for (index, polyline) in line.polylines.enumerated() {
                    allPolylines.append((line: line, polyline: polyline, index: index))
                }
            }

            // Sort by priority so higher priority lines (Metro, RER, Tram) are rendered on top of lower priority (Bus, etc.)
            allPolylines.sort { $0.line.type.priority < $1.line.type.priority }

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
                coloredPolyline.type = item.line.type
                
                let status = TrafficService.shared.lines.first(where: {
                    $0.lineId == item.line.name && $0.type == item.line.type
                })?.status ?? .normal
                coloredPolyline.status = status
                
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

    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        var parent: MapViewControllerBridge
        var currentTask: Task<Void, Never>?
        var lastSelectedStationId: String?
        var lastSelectedStationCoordinate: CLLocationCoordinate2D?
        var lastZoomedJourneyId: String?
        var lastZoomedSectionId: String?
        var lastSelectionTime: Date?
        var lastActiveCategories: Set<String> = []
        var lastRecenterTrigger = false
        var lastSimulatedTrackingMode: MKUserTrackingMode = .none
        var lastPolylineStyle: MapPolylineStyle?

        init(_ parent: MapViewControllerBridge) {
            self.parent = parent
        }

        // MARK: - MKMapViewDelegate

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation { return nil }

            if let exitAnno = annotation as? ExitMarkerAnnotation {
                let reuseId = "exitMarker"
                let markerView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                markerView.canShowCallout = true
                markerView.displayPriority = .required
                if exitAnno.isEntry {
                    markerView.markerTintColor = .systemGreen
                    #if canImport(UIKit)
                    markerView.glyphImage = UIImage(systemName: "arrow.down.circle.fill")
                    #else
                    markerView.glyphImage = NSImage(systemSymbolName: "arrow.down.circle.fill", accessibilityDescription: nil)
                    #endif
                } else {
                    markerView.markerTintColor = .systemRed
                    #if canImport(UIKit)
                    markerView.glyphImage = UIImage(systemName: "arrow.up.circle.fill")
                    #else
                    markerView.glyphImage = NSImage(systemSymbolName: "arrow.up.circle.fill", accessibilityDescription: nil)
                    #endif
                }
                return markerView
            }

            if annotation is SimulatedUserAnnotation {
                let reuseId = "simulatedUser"
                let markerView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                markerView.markerTintColor = .systemBlue
                markerView.glyphImage = UIImage(systemName: "location.fill")
                markerView.titleVisibility = .visible
                markerView.displayPriority = .required
                markerView.zPriority = .max
                return markerView
            }

            if annotation is BusStopTempAnnotation {
                let reuseId = "busStopTemp"
                let markerView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                markerView.markerTintColor = UIColor(red: 0.0, green: 0.545, blue: 0.369, alpha: 1.0)
                markerView.glyphImage = UIImage(systemName: "bus.fill")
                markerView.canShowCallout = true
                markerView.titleVisibility = .visible
                markerView.displayPriority = .defaultLow
                markerView.zPriority = MKAnnotationViewZPriority(rawValue: 100)
                return markerView
            }

            if annotation is StationAnnotation {
                let view = mapView.dequeueReusableAnnotationView(
                    withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)

                // Clustering configuration: disabled as requested
                view.clusteringIdentifier = nil
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
                #if canImport(UIKit)
                view.layer.shadowColor = UIColor.black.cgColor
                view.layer.shadowOpacity = 0.2
                view.layer.shadowOffset = CGSize(width: 0, height: 2)
                view.layer.shadowRadius = 4
                #else
                view.wantsLayer = true
                view.layer?.shadowColor = NSColor.black.cgColor
                view.layer?.shadowOpacity = 0.2
                view.layer?.shadowOffset = CGSize(width: 0, height: -2)
                view.layer?.shadowRadius = 4
                #endif
                
                return view
            }

            return nil
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let coloredPolyline = overlay as? ColoredPolyline {
                let style = parent.data.polylineStyle
                let renderer: MKPolylineRenderer
                
                switch style {
                case .classic:
                    renderer = BorderedPolylineRenderer(polyline: coloredPolyline)
                case .neon:
                    renderer = NeonPolylineRenderer(polyline: coloredPolyline)
                case .glass:
                    renderer = GlassPolylineRenderer(polyline: coloredPolyline)
                }
                
                renderer.strokeColor = coloredPolyline.color
                
                if style == .neon {
                    renderer.lineWidth = 4.0
                } else if style == .glass {
                    renderer.lineWidth = 6.0
                } else {
                    renderer.lineWidth = 5.0
                }

                // Smoothing: arrondir les jonctions et les caps
                renderer.lineJoin = .round
                renderer.lineCap = .round

                // Additional smoothing
                renderer.shouldRasterize = false  // Keep vector rendering for smoothness
                renderer.alpha = 0.95

                if ["15", "16", "17", "18"].contains(coloredPolyline.lineName) {
                    renderer.lineDashPattern = [10, 8] as [NSNumber]
                    renderer.lineWidth = style == .glass ? 4.5 : (style == .neon ? 3.0 : 3.5)
                } else if coloredPolyline.isDashed {
                    renderer.lineDashPattern = [6, 6] as [NSNumber]
                    renderer.lineWidth = style == .glass ? 4.5 : (style == .neon ? 3.0 : 3.5)
                }

                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let stationAnnotation = view.annotation as? StationAnnotation {
                stationAnnotation.isSelected = true
                (view as? StationSwiftUIAnnotationView)?.annotation = stationAnnotation // Trigger update
                
                self.lastSelectionTime = Date()
                parent.selectedStation = stationAnnotation.station
            }
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            if let stationAnnotation = view.annotation as? StationAnnotation {
                if let lastTime = lastSelectionTime, Date().timeIntervalSince(lastTime) < 0.8 {
                    mapView.selectAnnotation(stationAnnotation, animated: false)
                    return
                }
                
                stationAnnotation.isSelected = false
                (view as? StationSwiftUIAnnotationView)?.annotation = stationAnnotation // Trigger update
                
                if parent.selectedStation?.id == stationAnnotation.station.id {
                    // Defer state modification to avoid "Modifying state during view update"
                    DispatchQueue.main.async {
                        self.parent.selectedStation = nil
                    }
                }
            }
        }

        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            updateAnnotations(in: mapView.region, for: mapView)
        }



        
        func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
            guard !parent.locationManager.isSimulating else { return }
            DispatchQueue.main.async {
                self.parent.userTrackingMode = mode
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
        
        // MARK: - UIGestureRecognizerDelegate
        
        @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
            if gesture.state == .began {
                DispatchQueue.main.async {
                    self.parent.userTrackingMode = .none
                }
            }
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }
}

class BusStopTempAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?

    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
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
class StationSwiftUIAnnotationView: MKAnnotationView {
    private var hostingController: UIHostingController<StationBadgeView>?

    override var annotation: MKAnnotation? {
        didSet {
            setupView()
        }
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        #if canImport(UIKit)
        self.backgroundColor = .clear
        #endif
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        guard let stationAnnotation = annotation as? StationAnnotation else { return }
        let station = stationAnnotation.station

        // Remove old view
        hostingController?.view.removeFromSuperview()
        hostingController = nil

        // Create SwiftUI view
        let badgeView = StationBadgeView(station: station, isSelected: stationAnnotation.isSelected)
        let hc = UIHostingController(rootView: badgeView)
        #if canImport(UIKit)
        hc.view.backgroundColor = .clear
        let size = hc.view.sizeThatFits(CGSize(width: 300, height: 100))
        #else
        let size = hc.view.fittingSize
        #endif
        self.bounds = CGRect(origin: .zero, size: size)
        hc.view.frame = self.bounds
        
        addSubview(hc.view)
        self.hostingController = hc
        
        // Centrer l'ancre au milieu de la vue de l'annotation
        self.centerOffset = CGPoint.zero
        
        // Set display priority
        if stationAnnotation.isSelected {
            self.displayPriority = .required
            self.zPriority = .max
        } else {
            let hasPriorityMode = station.lines.contains { line in
                line.type == .metro || line.type == .rer || line.type == .tram
            } || station.mainType == .metro || station.mainType == .rer || station.mainType == .tram
            
            if hasPriorityMode {
                self.displayPriority = .defaultHigh
                self.zPriority = MKAnnotationViewZPriority(rawValue: 500)
            } else {
                self.displayPriority = .defaultLow
                self.zPriority = MKAnnotationViewZPriority(rawValue: 100)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hostingController?.view.removeFromSuperview()
        hostingController = nil
    }
}

