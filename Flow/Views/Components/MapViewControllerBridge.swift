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
        mapView.showsCompass = false

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
    
    @Environment(\.duoPosture) var duoPosture
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var navigationManager = NavigationManager.shared
    var journey: Journey?  // Optional journey to display
    var focusedLinePreview: FocusedLinePreview? = nil  // Optional full line + stops preview
    var focusedSectionId: String? = nil  // Optional section to focus on
    var useMainMap: Bool = false  // Default to background map if not specified
    var showAnnotations: Bool = true  // If false, skip annotations and overlays (for background mode)

    init(
        data: MapDataService,
        selectedStation: Binding<MapStation?>,
        userTrackingMode: Binding<MKUserTrackingMode>,
        recenterTrigger: Bool = false,
        journey: Journey? = nil,
        focusedLinePreview: FocusedLinePreview? = nil,
        focusedSectionId: String? = nil,
        useMainMap: Bool = false,
        showAnnotations: Bool = true
    ) {
        self._data = ObservedObject(wrappedValue: data)
        self._selectedStation = selectedStation
        self._userTrackingMode = userTrackingMode
        self.recenterTrigger = recenterTrigger
        self.journey = journey
        self.focusedLinePreview = focusedLinePreview
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

        #if canImport(UIKit)
        let targetMargins: UIEdgeInsets = {
            switch duoPosture {
            case .unfoldedDualScreen:
                return UIEdgeInsets(top: 0, left: 484, bottom: 0, right: 0)
            case .foldedSingleScreen:
                return .zero
            }
        }()
        if mapView.layoutMargins != targetMargins {
            mapView.layoutMargins = targetMargins
        }
        #endif

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
            context.coordinator.hasInstalledStandardOverlays = false
            mapView.removeOverlays(mapView.overlays)
            mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation || $0 is SimulatedUserAnnotation) })
            return
        }

        // Check if we have an active journey or a focused full-line preview
        if let journey = journey {
            context.coordinator.lastFocusedLineId = nil
            context.coordinator.hasInstalledStandardOverlays = false
            if context.coordinator.lastDrawnJourneyId != journey.id.uuidString {
                context.coordinator.lastDrawnJourneyId = journey.id.uuidString
                mapView.removeOverlays(mapView.overlays)
                mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation || $0 is SimulatedUserAnnotation) })

                drawJourney(journey, on: mapView)
            }

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
        } else if let linePreview = focusedLinePreview {
            context.coordinator.lastDrawnJourneyId = nil
            context.coordinator.lastZoomedJourneyId = nil
            context.coordinator.lastZoomedSectionId = nil
            context.coordinator.hasInstalledStandardOverlays = false

            if context.coordinator.lastFocusedLineId != linePreview.id {
                context.coordinator.lastFocusedLineId = linePreview.id
                mapView.removeOverlays(mapView.overlays)
                mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation || $0 is SimulatedUserAnnotation) })
                drawFocusedLinePreview(linePreview, on: mapView)
                zoomToFocusedLinePreview(linePreview, on: mapView)
            }
        } else {
            let hadJourney = context.coordinator.lastZoomedJourneyId != nil || context.coordinator.lastDrawnJourneyId != nil
            let hadFocusedLine = context.coordinator.lastFocusedLineId != nil
            if hadJourney || hadFocusedLine {
                context.coordinator.hasInstalledStandardOverlays = false
            }
            context.coordinator.lastDrawnJourneyId = nil
            context.coordinator.lastZoomedJourneyId = nil
            context.coordinator.lastZoomedSectionId = nil
            context.coordinator.lastFocusedLineId = nil
            // Standard behavior: Show all lines
            updateStandardOverlays(mapView, data: data, coordinator: context.coordinator)
            if hadJourney || hadFocusedLine {
                context.coordinator.updateAnnotations(in: mapView.region, for: mapView)
            }
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
                context.coordinator.syncExplorationExits(for: station, on: mapView)
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
                context.coordinator.syncExplorationExits(for: nil, on: mapView)
                
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
        
        // Refresh annotations when active categories change or stations are loaded/snapped
        let stationsChanged = context.coordinator.lastStationsRevision != data.stationsRevision
        let categoriesChanged = context.coordinator.lastActiveCategories != data.activeCategories
        if categoriesChanged || stationsChanged {
            if stationsChanged {
                let existingStationAnnos = mapView.annotations.filter { $0 is StationAnnotation }
                if !existingStationAnnos.isEmpty {
                    mapView.removeAnnotations(existingStationAnnos)
                }
            }
            context.coordinator.lastStationsRevision = data.stationsRevision
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
        var transitCasings: [ColoredPolyline] = []
        var transitFills: [ColoredPolyline] = []

        for section in sections where section.type == "public_transport" {
            guard let display = section.display_informations else { continue }

            let hexColor = display.color ?? "CCCCCC"
            let color = UIColor(hex: hexColor) ?? .blue

            var routeCoordinates: [CLLocationCoordinate2D] = []
            if let geojson = section.geojson, let coordinates = geojson.coordinates {
                for coord in coordinates {
                    if coord.count >= 2 {
                        let coordinate = CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0])
                        if isValidCoordinate(coordinate) {
                            routeCoordinates.append(coordinate)
                        }
                    }
                }
            }

            // Fallback sur TransitTraceService si le trace recu est rectiligne ou trop grossier
            let intermediates = section.stop_date_times?.compactMap { $0.stop_point.coordinate } ?? []
            var usedTransitTrace = false
            if routeCoordinates.count <= max(2, intermediates.count + 2),
               let fromCoord = section.from?.coordinate,
               let toCoord = section.to?.coordinate {
                let lineCode = display.code ?? display.label ?? ""
                if let precise = TransitTraceService.shared.getPreciseCoordinates(
                    forLine: lineCode,
                    commercialMode: display.commercial_mode,
                    physicalMode: display.physical_mode,
                    from: fromCoord,
                    to: toCoord,
                    intermediates: intermediates
                ), precise.count > routeCoordinates.count {
                    routeCoordinates = precise
                    usedTransitTrace = true
                }
            }

            if !routeCoordinates.isEmpty {
                let finalCoordinates = usedTransitTrace
                    ? routeCoordinates
                    : MapDataService.smoothCoordinates(routeCoordinates, passes: 1, maxCornerOffsetMeters: 18.0)
                let cleanLineName = (display.code ?? display.label ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let status = TrafficService.shared.lines.first(where: {
                    $0.lineId.lowercased() == cleanLineName.lowercased()
                })?.status ?? .normal
                let isDashedLine = ["15", "16", "17", "18"].contains(cleanLineName)

                if !isDashedLine {
                    let casingPolyline = ColoredPolyline(
                        coordinates: finalCoordinates, count: finalCoordinates.count)
                    casingPolyline.color = color
                    casingPolyline.lineName = cleanLineName
                    casingPolyline.isDashed = false
                    casingPolyline.isCasing = true
                    casingPolyline.status = status
                    transitCasings.append(casingPolyline)
                }

                let polyline = ColoredPolyline(
                    coordinates: finalCoordinates, count: finalCoordinates.count)
                polyline.color = color
                polyline.lineName = cleanLineName
                polyline.isDashed = isDashedLine
                polyline.isCasing = false
                polyline.status = status
                transitFills.append(polyline)

                allCoordinates.append(contentsOf: finalCoordinates)
            }

            // Add start/end markers for sections
            let currentZoomLevel = StationMapZoomLevel.from(latitudeDelta: mapView.region.span.latitudeDelta)
            if let fromPlace = section.from, let fromCoord = fromPlace.coordinate, isValidCoordinate(fromCoord) {
                let annotation = StationAnnotation(
                    station: MapStation(
                        id: fromPlace.id ?? UUID().uuidString, name: fromPlace.name ?? "",
                        coordinate: fromCoord, platforms: [], isHub: false, mainType: .metro,
                        lines: []),
                    zoomLevel: currentZoomLevel)
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
                                isEntry: true,
                                exitId: exit.exit_id,
                                exitNumber: exit.exit_number,
                                exitName: exit.exit_name,
                                isJourneyExit: true
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
                        lines: []),
                    zoomLevel: currentZoomLevel)
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
                                isEntry: false,
                                exitId: exit.exit_id,
                                exitNumber: exit.exit_number,
                                exitName: exit.exit_name,
                                isJourneyExit: true
                            )
                            mapView.addAnnotation(exitAnnotation)
                        }
                    }
                }
            }
        }

        if !transitCasings.isEmpty {
            mapView.addOverlays(transitCasings, level: .aboveRoads)
        }
        if !transitFills.isEmpty {
            mapView.addOverlays(transitFills, level: .aboveRoads)
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
                let smoothedWalk = MapDataService.smoothCoordinates(routeCoordinates, passes: 1, maxCornerOffsetMeters: 6.0)
                let polyline = ColoredPolyline(
                    coordinates: smoothedWalk, count: smoothedWalk.count)
                polyline.color = .lightGray
                polyline.isDashed = true
                mapView.addOverlay(polyline, level: .aboveRoads)
                allCoordinates.append(contentsOf: smoothedWalk)
            }
        }

        // If this is the first time drawing this journey (or we want to re-center), we could.
        // But maybe we shouldn't force re-center on every update if user is panning.
        // For now, let's not force re-center here, rely on "followUserLocation" or initial setup.
    }

    private func drawFocusedLinePreview(_ preview: FocusedLinePreview, on mapView: MKMapView) {
        let lineColor = UIColor(preview.color)
        let isDashedLine = ["15", "16", "17", "18"].contains(preview.lineName)

        var casings: [ColoredPolyline] = []
        var fills: [ColoredPolyline] = []

        for polyline in preview.polylines {
            if !isDashedLine {
                let casing = ColoredPolyline(points: polyline.points(), count: polyline.pointCount)
                casing.color = lineColor
                casing.lineName = preview.lineName
                casing.type = preview.type
                casing.isDashed = false
                casing.isCasing = true
                casings.append(casing)
            }

            let fill = ColoredPolyline(points: polyline.points(), count: polyline.pointCount)
            fill.color = lineColor
            fill.lineName = preview.lineName
            fill.type = preview.type
            fill.isDashed = isDashedLine
            fill.isCasing = false
            fills.append(fill)
        }

        if !casings.isEmpty {
            mapView.addOverlays(casings, level: .aboveRoads)
        }
        if !fills.isEmpty {
            mapView.addOverlays(fills, level: .aboveRoads)
        }

        let focusedLine = StationLine(name: preview.lineName, type: preview.type)
        let stopAnnotations = preview.stops.map { stop in
            StationAnnotation(
                station: stop,
                coordinate: stop.coordinate,
                focusedLine: focusedLine,
                showStationName: true,
                zoomLevel: .medium
            )
        }
        if !stopAnnotations.isEmpty {
            mapView.addAnnotations(stopAnnotations)
        }

        if preview.showDirectionArrows {
            var arrowAnnotations: [LineDirectionArrowAnnotation] = []
            for polyline in preview.polylines {
                let count = polyline.pointCount
                guard count >= 2 else { continue }
                let pts = polyline.points()

                var totalLength: CLLocationDistance = 0
                for i in 0..<(count - 1) {
                    let c1 = pts[i].coordinate
                    let c2 = pts[i + 1].coordinate
                    totalLength += CLLocation(latitude: c1.latitude, longitude: c1.longitude)
                        .distance(from: CLLocation(latitude: c2.latitude, longitude: c2.longitude))
                }
                guard totalLength >= 140.0 else { continue }

                let spacing: CLLocationDistance = 380.0
                var nextArrowDist: CLLocationDistance = min(180.0, totalLength * 0.5)
                var accumulated: CLLocationDistance = 0

                for i in 0..<(count - 1) {
                    let c1 = pts[i].coordinate
                    let c2 = pts[i + 1].coordinate
                    let segLen = CLLocation(latitude: c1.latitude, longitude: c1.longitude)
                        .distance(from: CLLocation(latitude: c2.latitude, longitude: c2.longitude))
                    guard segLen > 1.0 else { continue }

                    while nextArrowDist <= accumulated + segLen && nextArrowDist <= totalLength - 90.0 {
                        let t = (nextArrowDist - accumulated) / segLen
                        let lat = c1.latitude + (c2.latitude - c1.latitude) * t
                        let lon = c1.longitude + (c2.longitude - c1.longitude) * t
                        let bearing = calculateBearing(from: c1, to: c2)
                        arrowAnnotations.append(
                            LineDirectionArrowAnnotation(
                                coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon),
                                bearingDegrees: bearing,
                                color: lineColor
                            )
                        )
                        nextArrowDist += spacing
                    }
                    accumulated += segLen
                }
            }
            if !arrowAnnotations.isEmpty {
                mapView.addAnnotations(arrowAnnotations)
            }
        }
    }

    private func zoomToFocusedLinePreview(_ preview: FocusedLinePreview, on mapView: MKMapView) {
        var allCoordinates: [CLLocationCoordinate2D] = []
        for polyline in preview.polylines {
            let pts = polyline.points()
            for i in 0..<polyline.pointCount {
                let coord = pts[i].coordinate
                if isValidCoordinate(coord) {
                    allCoordinates.append(coord)
                }
            }
        }
        for stop in preview.stops where isValidCoordinate(stop.coordinate) {
            allCoordinates.append(stop.coordinate)
        }

        guard !allCoordinates.isEmpty else { return }
        let boundingRect = MKMapRect(coordinates: allCoordinates)
        let padding = UIEdgeInsets(top: 100, left: 40, bottom: 130, right: 40)
        mapView.setVisibleMapRect(boundingRect, edgePadding: padding, animated: true)
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

    private func updateStandardOverlays(_ mapView: MKMapView, data: MapDataService, coordinator: Coordinator) {
        let currentFavorites = FavoritesService.shared.favoriteLinesList
        let currentFavCount = currentFavorites.count

        if coordinator.hasInstalledStandardOverlays
            && coordinator.lastCachedOverlaysCount == data.cachedOverlays.count
            && coordinator.lastOverlayCategories == data.activeCategories
            && coordinator.lastOverlayFavoritesCount == currentFavCount
            && coordinator.lastOverlayFavorites == currentFavorites
        {
            return
        }

        if !data.cachedOverlays.isEmpty {
            let activeOverlays = data.cachedOverlays.filter { overlay in
                isLineEnabledOrFavorite(overlay.lineName, type: overlay.type)
            }
            
            let currentOverlays = mapView.overlays.compactMap { $0 as? ColoredPolyline }
            if Set(currentOverlays) != Set(activeOverlays) {
                mapView.removeOverlays(mapView.overlays)
                mapView.addOverlays(activeOverlays, level: .aboveRoads)
            }
            coordinator.lastCachedOverlaysCount = data.cachedOverlays.count
            coordinator.lastOverlayCategories = data.activeCategories
            coordinator.lastOverlayFavoritesCount = currentFavCount
            coordinator.lastOverlayFavorites = currentFavorites
            coordinator.hasInstalledStandardOverlays = true
            return
        }

        let filteredLines = data.lines.filter { line in
            isLineEnabledOrFavorite(line.name, type: line.type)
        }.sorted { $0.type.priority < $1.type.priority }

        var expectedOverlayCount = 0
        for line in filteredLines {
            let isDashedLine = line.isDashed || ["15", "16", "17", "18"].contains(line.name)
            expectedOverlayCount += line.polylines.count * (isDashedLine ? 1 : 2)
        }
        let currentOverlaysCount = mapView.overlays.compactMap { $0 as? ColoredPolyline }.count
        
        if currentOverlaysCount != expectedOverlayCount {
            mapView.removeOverlays(mapView.overlays)

            var casingOverlays: [ColoredPolyline] = []
            var fillOverlays: [ColoredPolyline] = []
            for line in filteredLines {
                let isDashedLine = line.isDashed || ["15", "16", "17", "18"].contains(line.name)
                let lineColor = UIColor(line.color)
                let status = TrafficService.shared.lines.first(where: {
                    $0.lineId == line.name && $0.type == line.type
                })?.status ?? .normal

                for polyline in line.polylines {
                    if !isDashedLine {
                        let casing = ColoredPolyline(
                            points: polyline.points(), count: polyline.pointCount)
                        casing.color = lineColor
                        casing.lineName = line.name
                        casing.type = line.type
                        casing.isDashed = false
                        casing.isCasing = true
                        casing.status = status
                        casingOverlays.append(casing)
                    }

                    let coloredPolyline = ColoredPolyline(
                        points: polyline.points(), count: polyline.pointCount)
                    coloredPolyline.color = lineColor
                    coloredPolyline.lineName = line.name
                    coloredPolyline.type = line.type
                    coloredPolyline.isDashed = isDashedLine
                    coloredPolyline.isCasing = false
                    coloredPolyline.status = status
                    fillOverlays.append(coloredPolyline)
                }
            }

            mapView.addOverlays(casingOverlays + fillOverlays, level: .aboveRoads)
        }

        if !data.lines.isEmpty {
            coordinator.lastCachedOverlaysCount = 0
            coordinator.lastOverlayCategories = data.activeCategories
            coordinator.lastOverlayFavoritesCount = currentFavCount
            coordinator.lastOverlayFavorites = currentFavorites
            coordinator.hasInstalledStandardOverlays = true
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
        var lastDrawnJourneyId: String?
        var lastFocusedLineId: String?
        var lastZoomedJourneyId: String?
        var lastZoomedSectionId: String?
        var lastSelectionTime: Date?
        var lastActiveCategories: Set<String> = []
        var lastRecenterTrigger = false
        var lastSimulatedTrackingMode: MKUserTrackingMode = .none
        var lastStationsRevision: Int = -1
        var lastOverlayCategories: Set<String> = []
        var lastOverlayFavoritesCount: Int = -1
        var lastOverlayFavorites: Set<String> = []
        var lastCachedOverlaysCount: Int = -1
        var hasInstalledStandardOverlays: Bool = false

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
                if exitAnno.isJourneyExit {
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
                    markerView.glyphText = nil
                } else {
                    // Mode exploration libre hors itinéraire : transit blue élégant
                    markerView.markerTintColor = UIColor(red: 0.10, green: 0.45, blue: 0.88, alpha: 1.0)
                    if let number = exitAnno.exitNumber {
                        markerView.glyphText = "\(number)"
                        markerView.glyphImage = nil
                    } else {
                        markerView.glyphText = nil
                        #if canImport(UIKit)
                        markerView.glyphImage = UIImage(systemName: "figure.walk.departure")
                        #else
                        markerView.glyphImage = NSImage(systemSymbolName: "figure.walk.departure", accessibilityDescription: nil)
                        #endif
                    }
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

            if let busAnno = annotation as? BusStopTempAnnotation {
                let reuseId = "busStopTemp"
                let markerView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                markerView.markerTintColor = busAnno.lineColor ?? UIColor(red: 0.0, green: 0.545, blue: 0.369, alpha: 1.0)
                markerView.glyphTintColor = .white
                if let line = busAnno.lineName {
                    markerView.glyphText = line
                } else {
                    markerView.glyphImage = UIImage(systemName: "bus.fill")
                }
                markerView.canShowCallout = true
                markerView.titleVisibility = .visible
                markerView.displayPriority = .defaultLow
                markerView.zPriority = MKAnnotationViewZPriority(rawValue: 100)
                return markerView
            }

            if let arrowAnno = annotation as? LineDirectionArrowAnnotation {
                let reuseId = "lineDirectionArrow"
                let arrowView = (mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? LineDirectionArrowAnnotationView)
                    ?? LineDirectionArrowAnnotationView(annotation: arrowAnno, reuseIdentifier: reuseId)
                arrowView.configure(with: arrowAnno, mapHeading: mapView.camera.heading)
                return arrowView
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
                let renderer = BorderedPolylineRenderer(polyline: coloredPolyline)
                renderer.lineJoin = .round
                renderer.lineCap = .round
                renderer.alpha = 1.0

                if coloredPolyline.isCasing {
                    renderer.strokeColor = UIColor.black.withAlphaComponent(0.22)
                    renderer.lineWidth = 4.8
                } else {
                    renderer.strokeColor = coloredPolyline.color
                    if coloredPolyline.isDashed || ["15", "16", "17", "18"].contains(coloredPolyline.lineName) {
                        renderer.lineDashPattern = [8, 6] as [NSNumber]
                        renderer.lineWidth = 2.8
                    } else {
                        renderer.lineWidth = 3.6
                    }
                }

                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let stationAnnotation = view.annotation as? StationAnnotation {
                if !stationAnnotation.isSelected {
                    stationAnnotation.isSelected = true
                    (view as? StationSwiftUIAnnotationView)?.refreshAppearance()
                }
                
                self.lastSelectionTime = Date()
                let prioritized = stationAnnotation.stationWithPrioritizedLine()
                if parent.focusedLinePreview != nil {
                    DispatchQueue.main.async {
                        NavigationCoordinator.shared.focusedLinePreview = nil
                    }
                }
                if parent.selectedStation?.id != prioritized.id || parent.selectedStation?.prioritizedLine?.id != prioritized.prioritizedLine?.id {
                    parent.selectedStation = prioritized
                }
            }
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            if let stationAnnotation = view.annotation as? StationAnnotation {
                if parent.selectedStation != nil, let lastTime = lastSelectionTime, Date().timeIntervalSince(lastTime) < 0.8 {
                    mapView.selectAnnotation(stationAnnotation, animated: false)
                    return
                }
                
                if stationAnnotation.isSelected {
                    stationAnnotation.isSelected = false
                    (view as? StationSwiftUIAnnotationView)?.refreshAppearance()
                }
                
                if parent.selectedStation?.id == stationAnnotation.station.id && mapView.selectedAnnotations.isEmpty {
                    // Defer state modification to avoid "Modifying state during view update"
                    DispatchQueue.main.async {
                        self.parent.selectedStation = nil
                    }
                }

                if stationAnnotation.isUnifiedHub && StationMapZoomLevel.from(latitudeDelta: mapView.region.span.latitudeDelta) != .minimal {
                    mapView.removeAnnotation(stationAnnotation)
                }
            }
        }

        private func isHeadingRotated(_ heading: CLLocationDirection) -> Bool {
            let normalized = heading.truncatingRemainder(dividingBy: 360)
            let positive = normalized < 0 ? normalized + 360 : normalized
            return positive > 1.5 && positive < 358.5
        }

        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            guard parent.useMainMap else { return }
            let heading = mapView.camera.heading
            let currentHeading = NavigationCoordinator.shared.mapHeading
            let wasRotated = isHeadingRotated(currentHeading)
            let isNowRotated = isHeadingRotated(heading)
            if (wasRotated != isNowRotated) || (isNowRotated && abs(heading - currentHeading) > 2.0) {
                DispatchQueue.main.async {
                    NavigationCoordinator.shared.mapHeading = heading
                }
            }
            if parent.focusedLinePreview?.showDirectionArrows == true {
                for annotation in mapView.annotations {
                    if let arrowAnno = annotation as? LineDirectionArrowAnnotation,
                       let arrowView = mapView.view(for: arrowAnno) as? LineDirectionArrowAnnotationView {
                        arrowView.updateRotation(bearingDegrees: arrowAnno.bearingDegrees, mapHeading: heading)
                    }
                }
            }
        }

        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            if parent.useMainMap {
                let heading = mapView.camera.heading
                let currentHeading = NavigationCoordinator.shared.mapHeading
                let wasRotated = isHeadingRotated(currentHeading)
                let isNowRotated = isHeadingRotated(heading)
                if (wasRotated != isNowRotated) || (isNowRotated && abs(heading - currentHeading) > 0.5) {
                    DispatchQueue.main.async {
                        NavigationCoordinator.shared.mapHeading = heading
                    }
                }
            }
            updateAnnotations(in: mapView.region, for: mapView)
        }



        
        func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
            guard !parent.locationManager.isSimulating else { return }
            DispatchQueue.main.async {
                self.parent.userTrackingMode = mode
            }
        }

        // MARK: - Data Loading Logic

        nonisolated private static func normalizeLineKey(_ name: String, type: TransportType) -> String {
            let upper = name.uppercased().trimmingCharacters(in: .whitespacesAndNewlines)
            if type == .tram && upper.hasPrefix("T") && upper.count > 1 {
                return String(upper.dropFirst())
            }
            return upper
        }

        nonisolated private static func activeNonBusLines(
            for station: MapStation,
            activeCategories: Set<String>,
            favoriteStationIds: Set<String>
        ) -> [StationLine] {
            let isFav = favoriteStationIds.contains(station.id)
            var seenIds = Set<String>()
            return station.lines.filter { line in
                guard line.type != .bus else { return false }
                guard seenIds.insert(line.id).inserted else { return false }
                if isFav { return true }
                switch line.type {
                case .metro: return activeCategories.contains("Métro")
                case .rer, .transilien, .train: return activeCategories.contains("RER / Train")
                case .tram: return activeCategories.contains("Tram")
                case .bus: return activeCategories.contains("Bus")
                case .cable: return true
                }
            }.sorted { a, b in
                if a.type.priority != b.type.priority { return a.type.priority > b.type.priority }
                return a.name.localizedStandardCompare(b.name) == .orderedAscending
            }
        }

        nonisolated private static func snappedLineCoordinate(
            for station: MapStation,
            line: StationLine
        ) -> CLLocationCoordinate2D {
            let normLine = normalizeLineKey(line.name, type: line.type)
            let matchingPlatforms = station.platforms.filter { plat in
                plat.type == line.type && normalizeLineKey(plat.lineName, type: plat.type) == normLine
            }
            guard !matchingPlatforms.isEmpty else { return station.coordinate }
            let avgLat = matchingPlatforms.reduce(0.0) { $0 + $1.coordinate.latitude } / Double(matchingPlatforms.count)
            let avgLon = matchingPlatforms.reduce(0.0) { $0 + $1.coordinate.longitude } / Double(matchingPlatforms.count)
            return CLLocationCoordinate2D(latitude: avgLat, longitude: avgLon)
        }

        nonisolated private static func unifiedCoordinate(
            for station: MapStation,
            activeLines: [StationLine]
        ) -> CLLocationCoordinate2D {
            var lineCentroids: [CLLocationCoordinate2D] = []
            lineCentroids.reserveCapacity(activeLines.count)

            for line in activeLines {
                let normLine = normalizeLineKey(line.name, type: line.type)
                let matchingPlatforms = station.platforms.filter { plat in
                    plat.type == line.type && normalizeLineKey(plat.lineName, type: plat.type) == normLine
                }
                if !matchingPlatforms.isEmpty {
                    let avgLat = matchingPlatforms.reduce(0.0) { $0 + $1.coordinate.latitude } / Double(matchingPlatforms.count)
                    let avgLon = matchingPlatforms.reduce(0.0) { $0 + $1.coordinate.longitude } / Double(matchingPlatforms.count)
                    lineCentroids.append(CLLocationCoordinate2D(latitude: avgLat, longitude: avgLon))
                }
            }

            guard !lineCentroids.isEmpty else { return station.coordinate }
            let avgLat = lineCentroids.reduce(0.0) { $0 + $1.latitude } / Double(lineCentroids.count)
            let avgLon = lineCentroids.reduce(0.0) { $0 + $1.longitude } / Double(lineCentroids.count)
            return CLLocationCoordinate2D(latitude: avgLat, longitude: avgLon)
        }

        nonisolated private static func buildUnifiedMegaPoleStation(
            rule: MegaPoleRule,
            constituents: [MapStation]
        ) -> MapStation {
            let primary = constituents.max { a, b in
                let aRail = a.lines.filter { $0.type != .bus }.count
                let bRail = b.lines.filter { $0.type != .bus }.count
                if aRail != bRail { return aRail < bRail }
                return a.mainType.priority < b.mainType.priority
            } ?? constituents[0]

            var linesById: [String: StationLine] = [:]
            var platformsById: [String: StopPoint] = [:]
            var latSum = 0.0
            var lonSum = 0.0

            for st in constituents {
                latSum += st.coordinate.latitude
                lonSum += st.coordinate.longitude
                for line in st.lines {
                    linesById[line.id] = line
                }
                for platform in st.platforms {
                    platformsById[platform.id] = platform
                }
            }

            let sortedLines = linesById.values.sorted { a, b in
                StationLine.isOrderedBeforeForDisplay(a, b)
            }
            let mergedPlatforms = Array(platformsById.values)
            let count = Double(max(1, constituents.count))
            let mergedCoord = CLLocationCoordinate2D(latitude: latSum / count, longitude: lonSum / count)
            let derivedMainType = sortedLines.max { $0.type.priority < $1.type.priority }?.type ?? primary.mainType

            return MapStation(
                id: primary.id,
                name: rule.displayName,
                coordinate: mergedCoord,
                platforms: mergedPlatforms,
                isHub: true,
                mainType: derivedMainType,
                lines: sortedLines,
                city: primary.city
            )
        }

        nonisolated private static func buildAnnotations(
            for stations: [MapStation],
            zoomLevel: StationMapZoomLevel,
            activeCategories: Set<String>,
            favoriteStationIds: Set<String>
        ) -> [StationAnnotation] {
            var result: [StationAnnotation] = []
            result.reserveCapacity(stations.count)

            if zoomLevel == .minimal {
                var megaPoleBuckets: [String: (rule: MegaPoleRule, stations: [MapStation])] = [:]
                var orderedPoleKeys: [String] = []
                var remainingStations: [MapStation] = []
                remainingStations.reserveCapacity(stations.count)

                for station in stations {
                    if let rule = MapDataService.matchingMegaPoleRule(for: station) {
                        if var bucket = megaPoleBuckets[rule.key] {
                            bucket.stations.append(station)
                            megaPoleBuckets[rule.key] = bucket
                        } else {
                            megaPoleBuckets[rule.key] = (rule: rule, stations: [station])
                            orderedPoleKeys.append(rule.key)
                        }
                    } else {
                        remainingStations.append(station)
                    }
                }

                for key in orderedPoleKeys {
                    guard let bucket = megaPoleBuckets[key], !bucket.stations.isEmpty else { continue }
                    let mergedStation = bucket.stations.count > 1
                        ? buildUnifiedMegaPoleStation(rule: bucket.rule, constituents: bucket.stations)
                        : bucket.stations[0]
                    let activeLines = activeNonBusLines(
                        for: mergedStation,
                        activeCategories: activeCategories,
                        favoriteStationIds: favoriteStationIds
                    )
                    guard !activeLines.isEmpty else { continue }

                    let coord = unifiedCoordinate(for: mergedStation, activeLines: activeLines)
                    result.append(
                        StationAnnotation(
                            station: mergedStation,
                            coordinate: coord,
                            focusedLine: nil,
                            showStationName: false,
                            zoomLevel: zoomLevel,
                            isUnifiedHub: true,
                            isMajorHub: true,
                            annotationIdOverride: "unified__megapole_\(bucket.rule.key)"
                        )
                    )
                }

                for station in remainingStations {
                    let activeLines = activeNonBusLines(
                        for: station,
                        activeCategories: activeCategories,
                        favoriteStationIds: favoriteStationIds
                    )
                    if activeLines.count >= 2 || (station.isHub && !activeLines.isEmpty) {
                        let coord = unifiedCoordinate(for: station, activeLines: activeLines)
                        result.append(
                            StationAnnotation(
                                station: station,
                                coordinate: coord,
                                focusedLine: nil,
                                showStationName: false,
                                zoomLevel: zoomLevel,
                                isUnifiedHub: true,
                                isMajorHub: activeLines.count >= 4,
                                annotationIdOverride: "unified__\(station.id)"
                            )
                        )
                    } else if let singleLine = activeLines.first {
                        let coord = snappedLineCoordinate(for: station, line: singleLine)
                        result.append(
                            StationAnnotation(
                                station: station,
                                coordinate: coord,
                                focusedLine: singleLine,
                                showStationName: false,
                                zoomLevel: zoomLevel,
                                isUnifiedHub: false,
                                isMajorHub: false
                            )
                        )
                    } else {
                        result.append(
                            StationAnnotation(
                                station: station,
                                coordinate: station.coordinate,
                                focusedLine: nil,
                                showStationName: false,
                                zoomLevel: zoomLevel
                            )
                        )
                    }
                }

                return result
            }

            for station in stations {
                let activeLines = activeNonBusLines(
                    for: station,
                    activeCategories: activeCategories,
                    favoriteStationIds: favoriteStationIds
                )

                if activeLines.isEmpty {
                    result.append(
                        StationAnnotation(
                            station: station,
                            coordinate: station.coordinate,
                            focusedLine: nil,
                            showStationName: true,
                            zoomLevel: zoomLevel
                        )
                    )
                    continue
                }

                var placedCoords: [CLLocationCoordinate2D] = []
                var namedCoords: [CLLocationCoordinate2D] = []

                for line in activeLines {
                    var coord = snappedLineCoordinate(for: station, line: line)

                    // Éviter la superposition exacte uniquement en dernier recours si deux marqueurs sont à < 6 m
                    let coordLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
                    let collisionCount = placedCoords.filter {
                        CLLocation(latitude: $0.latitude, longitude: $0.longitude).distance(from: coordLoc) < 6.0
                    }.count
                    if collisionCount > 0 {
                        coord = CLLocationCoordinate2D(
                            latitude: coord.latitude,
                            longitude: coord.longitude + 0.00008 * Double(collisionCount)
                        )
                    }
                    placedCoords.append(coord)

                    // Afficher le nom sur le premier quai et sur tout autre quai éloigné (>= 55 m)
                    let finalLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
                    let hasCloseNamedMarker = namedCoords.contains {
                        CLLocation(latitude: $0.latitude, longitude: $0.longitude).distance(from: finalLoc) < 55.0
                    }
                    let shouldShowName = namedCoords.isEmpty || !hasCloseNamedMarker
                    if shouldShowName {
                        namedCoords.append(coord)
                    }

                    result.append(
                        StationAnnotation(
                            station: station,
                            coordinate: coord,
                            focusedLine: line,
                            showStationName: shouldShowName,
                            zoomLevel: zoomLevel
                        )
                    )
                }
            }

            return result
        }

        func syncExplorationExits(for selectedStation: MapStation?, on mapView: MKMapView) {
            let targetExits = (parent.journey == nil && selectedStation != nil)
                ? StationExitsService.shared.exits(for: selectedStation!)
                : []

            let currentExitAnnotations = mapView.annotations.compactMap {
                $0 as? ExitMarkerAnnotation
            }.filter { !$0.isJourneyExit }

            let currentExitIDs = Set(currentExitAnnotations.compactMap { $0.exitId })
            let targetExitIDs = Set(targetExits.map { $0.exit_id })

            let exitsToRemove = currentExitAnnotations.filter { anno in
                guard let id = anno.exitId else { return true }
                return !targetExitIDs.contains(id)
            }
            if !exitsToRemove.isEmpty {
                mapView.removeAnnotations(exitsToRemove)
            }

            let newExits = targetExits.filter { !currentExitIDs.contains($0.exit_id) }
            if !newExits.isEmpty {
                let newExitAnnotations = newExits.compactMap { exit -> ExitMarkerAnnotation? in
                    guard let coords = exit.coordinates else { return nil }
                    let title: String
                    if let num = exit.exit_number, let name = exit.exit_name, !name.isEmpty {
                        title = "Sortie \(num) : \(name)"
                    } else if let num = exit.exit_number {
                        title = "Sortie \(num)"
                    } else if let name = exit.exit_name, !name.isEmpty {
                        title = "Sortie : \(name)"
                    } else {
                        title = exit.is_entry ? "Accès station" : "Sortie"
                    }

                    let subtitle = exit.stations?.first?.name ?? "Métro / RER"

                    return ExitMarkerAnnotation(
                        coordinate: CLLocationCoordinate2D(latitude: coords.lat, longitude: coords.lon),
                        title: title,
                        subtitle: subtitle,
                        isEntry: exit.is_entry && !exit.is_exit,
                        exitId: exit.exit_id,
                        exitNumber: exit.exit_number,
                        exitName: exit.exit_name,
                        isJourneyExit: false
                    )
                }
                mapView.addAnnotations(newExitAnnotations)
            }
        }

        func updateAnnotations(in region: MKCoordinateRegion, for mapView: MKMapView) {
            currentTask?.cancel()

            if self.parent.journey != nil || self.parent.focusedLinePreview != nil {
                return
            }

            let stationData = self.parent.data
            let activeCategories = stationData.activeCategories
            let favoriteStationIds = FavoritesService.shared.favoriteStationIds

            currentTask = Task.detached(priority: .userInitiated) { [weak self] in
                guard let self = self else { return }
                let token = FlowPerformanceProfiler.beginInterval("UpdateMapAnnotations")
                var detail = "cancelled"
                defer { FlowPerformanceProfiler.endInterval(token, detail: detail) }

                let visibleStations = await stationData.fetchStations(in: region)
                if Task.isCancelled { return }
                let newZoomLevel = StationMapZoomLevel.from(latitudeDelta: region.span.latitudeDelta)
                let targetAnnotations = Self.buildAnnotations(
                    for: visibleStations,
                    zoomLevel: newZoomLevel,
                    activeCategories: activeCategories,
                    favoriteStationIds: favoriteStationIds
                )
                if Task.isCancelled { return }
                let targetIDs = Set(targetAnnotations.map { $0.annotationId })
                detail = "stations=\(visibleStations.count),targets=\(targetAnnotations.count),zoom=\(newZoomLevel.rawValue)"

                await MainActor.run {
                    // 1. Mise à jour des annotations de stations (une annotation par quai ferré)
                    let currentAnnotations = mapView.annotations.compactMap {
                        $0 as? StationAnnotation
                    }
                    let currentIDs = Set(currentAnnotations.map { $0.annotationId })
                    let selectedAnnotationIDs = Set(
                        mapView.selectedAnnotations.compactMap { ($0 as? StationAnnotation)?.annotationId }
                    )

                    let annotationsToAdd = targetAnnotations.filter { !currentIDs.contains($0.annotationId) }
                    let annotationsToRemove = currentAnnotations.filter {
                        !targetIDs.contains($0.annotationId) && !selectedAnnotationIDs.contains($0.annotationId)
                    }

                    if !annotationsToRemove.isEmpty {
                        mapView.removeAnnotations(annotationsToRemove)
                    }

                    // Mettre à jour le niveau de zoom des annotations conservées si le seuil a changé
                    for existingAnnotation in currentAnnotations where targetIDs.contains(existingAnnotation.annotationId) {
                        if existingAnnotation.zoomLevel != newZoomLevel {
                            existingAnnotation.zoomLevel = newZoomLevel
                            if let view = mapView.view(for: existingAnnotation) as? StationSwiftUIAnnotationView {
                                view.refreshZoomLevel()
                            }
                        }
                    }

                    if !annotationsToAdd.isEmpty {
                        mapView.addAnnotations(annotationsToAdd)
                    }

                    if let selected = self.parent.selectedStation, mapView.selectedAnnotations.isEmpty {
                        let stationAnnotations = mapView.annotations.compactMap { $0 as? StationAnnotation }
                        let matching = stationAnnotations.first {
                            $0.station.id == selected.id && $0.focusedLine?.id == selected.prioritizedLine?.id
                        } ?? stationAnnotations.first {
                            $0.station.id == selected.id
                        }
                        if let matching {
                            mapView.selectAnnotation(matching, animated: true)
                        }
                    }
                    
                    // 2. Mise à jour des annotations de sorties uniquement pour la station sélectionnée
                    if self.parent.journey == nil {
                        self.syncExplorationExits(for: self.parent.selectedStation, on: mapView)
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

class LineDirectionArrowAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let bearingDegrees: CLLocationDirection
    let color: UIColor

    init(coordinate: CLLocationCoordinate2D, bearingDegrees: CLLocationDirection, color: UIColor) {
        self.coordinate = coordinate
        self.bearingDegrees = bearingDegrees
        self.color = color
    }
}

class LineDirectionArrowAnnotationView: MKAnnotationView {
    #if canImport(UIKit)
    private let badgeView = UIView()
    private let arrowImageView = UIImageView()
    #endif

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        isEnabled = false
        collisionMode = .none
        displayPriority = .defaultHigh
        zPriority = MKAnnotationViewZPriority(rawValue: 650)

        #if canImport(UIKit)
        backgroundColor = .clear
        frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        badgeView.frame = bounds
        badgeView.layer.cornerRadius = 8
        badgeView.layer.borderWidth = 1.2
        badgeView.layer.borderColor = UIColor.white.withAlphaComponent(0.92).cgColor
        badgeView.layer.shadowColor = UIColor.black.cgColor
        badgeView.layer.shadowOpacity = 0.28
        badgeView.layer.shadowRadius = 2
        badgeView.layer.shadowOffset = CGSize(width: 0, height: 1)
        addSubview(badgeView)

        let config = UIImage.SymbolConfiguration(pointSize: 8.5, weight: .black)
        arrowImageView.image = UIImage(systemName: "arrow.up", withConfiguration: config)
        arrowImageView.tintColor = .white
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.frame = CGRect(x: 3, y: 3, width: 10, height: 10)
        badgeView.addSubview(arrowImageView)
        #endif
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with arrow: LineDirectionArrowAnnotation, mapHeading: CLLocationDirection) {
        #if canImport(UIKit)
        badgeView.backgroundColor = arrow.color
        updateRotation(bearingDegrees: arrow.bearingDegrees, mapHeading: mapHeading)
        #endif
    }

    func updateRotation(bearingDegrees: CLLocationDirection, mapHeading: CLLocationDirection) {
        #if canImport(UIKit)
        let angle = CGFloat((bearingDegrees - mapHeading) * .pi / 180.0)
        arrowImageView.transform = CGAffineTransform(rotationAngle: angle)
        #endif
    }
}

class BusStopTempAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let lineColor: UIColor?
    let lineName: String?

    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, lineColor: UIColor?, lineName: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.lineColor = lineColor
        self.lineName = lineName
    }
}

// Custom Annotation Class
nonisolated class StationAnnotation: NSObject, MKAnnotation {
    let annotationId: String
    let station: MapStation
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let focusedLine: StationLine?
    var showStationName: Bool
    var isSelected: Bool = false
    var zoomLevel: StationMapZoomLevel
    let isUnifiedHub: Bool
    let isMajorHub: Bool

    nonisolated init(
        station: MapStation,
        coordinate: CLLocationCoordinate2D? = nil,
        focusedLine: StationLine? = nil,
        showStationName: Bool = true,
        zoomLevel: StationMapZoomLevel = .detailed,
        isUnifiedHub: Bool = false,
        isMajorHub: Bool = false,
        annotationIdOverride: String? = nil
    ) {
        self.station = station
        self.coordinate = coordinate ?? station.coordinate
        self.focusedLine = focusedLine
        self.showStationName = showStationName
        self.title = station.name
        self.subtitle = station.lines.map { $0.name }.joined(separator: ", ")
        self.zoomLevel = zoomLevel
        self.isUnifiedHub = isUnifiedHub
        self.isMajorHub = isMajorHub
        if let override = annotationIdOverride {
            self.annotationId = override
        } else if isUnifiedHub {
            self.annotationId = "unified__\(station.id)"
        } else if let line = focusedLine {
            self.annotationId = "\(station.id)__\(line.type.rawValue)_\(line.name)"
        } else {
            self.annotationId = station.id
        }
    }

    /// Retourne la station complète en plaçant la ligne du quai cliqué en priorité.
    func stationWithPrioritizedLine() -> MapStation {
        guard let focusedLine = focusedLine else { return station }
        var prioritizedLines = station.lines
        prioritizedLines.sort { a, b in
            if a.id == focusedLine.id { return true }
            if b.id == focusedLine.id { return false }
            return false
        }
        return MapStation(
            id: station.id,
            name: station.name,
            coordinate: self.coordinate,
            platforms: station.platforms,
            isHub: station.isHub,
            mainType: station.mainType,
            lines: prioritizedLines,
            city: station.city,
            prioritizedLine: focusedLine
        )
    }
}

// Custom Annotation View hosting SwiftUI
class StationSwiftUIAnnotationView: MKAnnotationView {
    private static var badgeSizeCache: [String: CGSize] = [:]
    private var hostingController: UIHostingController<StationBadgeView>?
    private var lastAnchorPoint: CGPoint = .zero
    private var lastRenderedKey: String = ""

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
        self.selectedZPriority = .max
        self.collisionMode = .circle
        if annotation != nil {
            setupView()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        let wasSelected = self.isSelected
        super.setSelected(selected, animated: animated)

        guard let stationAnnotation = annotation as? StationAnnotation else { return }
        if stationAnnotation.isSelected != selected || wasSelected != selected {
            stationAnnotation.isSelected = selected
            setupView()

            #if canImport(UIKit)
            if animated && selected, let hostView = hostingController?.view {
                let size = bounds.size
                let anchor = lastAnchorPoint
                let startScale: CGFloat = 0.45
                let tx = (1.0 - startScale) * (anchor.x - size.width / 2.0)
                let ty = (1.0 - startScale) * (anchor.y - size.height / 2.0)
                hostView.transform = CGAffineTransform(translationX: tx, y: ty).scaledBy(x: startScale, y: startScale)
                hostView.alpha = 0.75
                UIView.animate(
                    withDuration: 0.34,
                    delay: 0,
                    usingSpringWithDamping: 0.68,
                    initialSpringVelocity: 0.55,
                    options: [.allowUserInteraction, .beginFromCurrentState]
                ) {
                    hostView.transform = .identity
                    hostView.alpha = 1.0
                }
            }
            #endif
        }
    }

    func refreshZoomLevel() {
        refreshAppearance()
    }

    func refreshAppearance() {
        setupView()
    }

    private func setupView() {
        guard let stationAnnotation = annotation as? StationAnnotation else { return }
        let station = stationAnnotation.station

        let activeCategoriesHash = MapDataService.shared.activeCategories.hashValue
        let renderKey = "\(stationAnnotation.annotationId)|z\(stationAnnotation.zoomLevel.rawValue)|s\(stationAnnotation.isSelected ? 1 : 0)|n\(stationAnnotation.showStationName ? 1 : 0)|u\(stationAnnotation.isUnifiedHub ? 1 : 0)|m\(stationAnnotation.isMajorHub ? 1 : 0)|c\(activeCategoriesHash)"
        if lastRenderedKey == renderKey, hostingController != nil {
            return
        }
        lastRenderedKey = renderKey

        let badgeView = StationBadgeView(
            station: station,
            isSelected: stationAnnotation.isSelected,
            zoomLevel: stationAnnotation.zoomLevel,
            focusedLine: stationAnnotation.focusedLine,
            showStationName: stationAnnotation.showStationName,
            isUnifiedHub: stationAnnotation.isUnifiedHub,
            isMajorHub: stationAnnotation.isMajorHub
        )

        let hc: UIHostingController<StationBadgeView>
        let hadExistingHC = hostingController != nil
        if let existingHC = hostingController {
            #if canImport(UIKit)
            existingHC.view.layer.removeAllAnimations()
            existingHC.view.transform = .identity
            existingHC.view.alpha = 1.0
            #endif
            existingHC.rootView = badgeView
            hc = existingHC
        } else {
            let newHC = UIHostingController(rootView: badgeView)
            #if canImport(UIKit)
            newHC.view.backgroundColor = .clear
            newHC.safeAreaRegions = []
            #endif
            addSubview(newHC.view)
            self.hostingController = newHC
            hc = newHC
        }

        let size: CGSize
        if let cachedSize = Self.badgeSizeCache[renderKey] {
            size = cachedSize
        } else {
            #if canImport(UIKit)
            size = hc.sizeThatFits(in: CGSize(width: 340, height: 220))
            #else
            size = hc.view.fittingSize
            #endif
            if Self.badgeSizeCache.count > 2500 {
                Self.badgeSizeCache.removeAll(keepingCapacity: true)
            }
            Self.badgeSizeCache[renderKey] = size
        }

        self.bounds = CGRect(origin: .zero, size: size)
        if hc.view.frame != self.bounds {
            hc.view.frame = self.bounds
        }
        #if canImport(UIKit)
        if !hadExistingHC || stationAnnotation.isSelected {
            hc.view.layoutIfNeeded()
        }
        #endif

        // Caler le point d'ancrage exact du marqueur (point, icône mode ou point sous ballon) sur la coordonnée GPS
        let anchor = badgeView.anchorPoint(in: size)
        self.lastAnchorPoint = anchor
        self.centerOffset = CGPoint(
            x: (size.width / 2.0) - anchor.x,
            y: (size.height / 2.0) - anchor.y
        )
        self.selectedZPriority = .max
        self.collisionMode = (stationAnnotation.isSelected || stationAnnotation.zoomLevel != .minimal) ? .rectangle : .circle
        
        // Set display priority
        if stationAnnotation.isSelected {
            self.displayPriority = .required
            self.zPriority = .max
        } else if stationAnnotation.isUnifiedHub && stationAnnotation.isMajorHub {
            self.displayPriority = .required
            self.zPriority = MKAnnotationViewZPriority(rawValue: 750)
        } else if stationAnnotation.isUnifiedHub {
            self.displayPriority = .defaultHigh
            self.zPriority = MKAnnotationViewZPriority(rawValue: 620)
        } else {
            let hasPriorityMode = station.lines.contains { line in
                line.type == .metro || line.type == .rer || line.type == .tram || line.type == .transilien
            } || station.mainType == .metro || station.mainType == .rer || station.mainType == .tram || station.mainType == .transilien
            
            if hasPriorityMode {
                self.displayPriority = .defaultHigh
                self.zPriority = MKAnnotationViewZPriority(rawValue: 500)
            } else {
                self.displayPriority = .defaultLow
                self.zPriority = MKAnnotationViewZPriority(rawValue: 100)
            }
        }
    }

    #if canImport(UIKit)
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if bounds.contains(point) {
            return true
        }
        let minTapSize: CGFloat = 36.0
        let dx = max(0, (minTapSize - bounds.width) / 2.0)
        let dy = max(0, (minTapSize - bounds.height) / 2.0)
        let expandedBounds = bounds.insetBy(dx: -dx, dy: -dy)
        return expandedBounds.contains(point)
    }
    #endif
    
    override func prepareForReuse() {
        super.prepareForReuse()
        #if canImport(UIKit)
        hostingController?.view.layer.removeAllAnimations()
        hostingController?.view.transform = .identity
        hostingController?.view.alpha = 1.0
        #endif
        lastAnchorPoint = .zero
        lastRenderedKey = ""
    }
}

