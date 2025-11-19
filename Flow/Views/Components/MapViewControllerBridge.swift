import SwiftUI
import MapKit
import Combine

struct MapViewControllerBridge: UIViewRepresentable {
    @ObservedObject var data: MapDataService
    @Binding var selectedStation: Station?
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        
        // Register custom annotation view
        mapView.register(StationAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        // Set initial region if needed
        let defaultRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
        mapView.setRegion(defaultRegion, animated: false)
        
        // Hide built-in public transport markers to avoid duplicates
        mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [.publicTransport])
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        context.coordinator.parent = self
        
        // Update lines
        if mapView.overlays.count != data.lines.count {
            mapView.removeOverlays(mapView.overlays)
            for line in data.lines {
                for segment in line.coordinates {
                    let coloredPolyline = ColoredPolyline(coordinates: segment, count: segment.count)
                    coloredPolyline.color = UIColor(line.color)
                    mapView.addOverlay(coloredPolyline)
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
                let view = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
                
                // Clustering configuration
                view.clusteringIdentifier = "stationCluster"
                view.canShowCallout = false // We handle selection manually
                
                return view
            } else if annotation is MKClusterAnnotation {
                // Default cluster view
                let view = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier, for: annotation) as? MKMarkerAnnotationView
                    ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
                view.markerTintColor = .systemBlue
                view.glyphText = "\( (annotation as? MKClusterAnnotation)?.memberAnnotations.count ?? 0 )"
                return view
            }
            
            return nil
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let coloredPolyline = overlay as? ColoredPolyline {
                let renderer = MKPolylineRenderer(polyline: coloredPolyline)
                renderer.strokeColor = coloredPolyline.color
                renderer.lineWidth = 3
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
        
        // MARK: - Data Loading Logic
        
        func updateAnnotations(in region: MKCoordinateRegion, for mapView: MKMapView) {
            currentTask?.cancel()
            
            currentTask = Task.detached(priority: .userInitiated) { [weak self] in
                guard let self = self else { return }
                
                let visibleStations = await self.parent.data.fetchStations(in: region)
                
                await MainActor.run {
                    let currentAnnotations = mapView.annotations.compactMap { $0 as? StationAnnotation }
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
    let station: Station
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(station: Station) {
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
            controller.view.widthAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
        
        // Force layout to calculate size
        controller.view.layoutIfNeeded()
        let size = controller.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        // Update frame to match content size (centered)
        self.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        // Center offset (MKAnnotationView is centered on coordinate by default, but frame origin is top-left)
        // We don't need centerOffset if we set the frame centered? 
        // Actually MKAnnotationView behavior: center of the view is placed at the coordinate if centerOffset is (0,0).
        // So we just need to set the bounds/frame size.
    }
}

// Custom Polyline to hold color
class ColoredPolyline: MKPolyline {
    var color: UIColor = .blue
}
