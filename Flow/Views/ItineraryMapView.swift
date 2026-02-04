import SwiftUI
import MapKit

struct ItineraryMapView: View {
    let journey: Journey
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        ItineraryMapViewRepresentable(journey: journey, region: $region)
            .navigationBarTitle("Trajet", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - UIViewRepresentable

struct ItineraryMapViewRepresentable: UIViewRepresentable {
    let journey: Journey
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        // Clear existing overlays and annotations
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        
        guard let sections = journey.sections else { return }
        
        var allCoordinates: [CLLocationCoordinate2D] = []
        
        // Draw route segments from GeoJSON data
        for section in sections where section.type == "public_transport" {
            guard let geojson = section.geojson,
                  let coordinates = geojson.coordinates,
                  let display = section.display_informations else { continue }
            
            // Get color for this line
            let hexColor = display.color ?? "CCCCCC"
            let color = UIColor(hex: hexColor) ?? .blue
            
            // Convert GeoJSON coordinates to CLLocationCoordinate2D
            // GeoJSON format is [longitude, latitude]
            var routeCoordinates: [CLLocationCoordinate2D] = []
            for coord in coordinates {
                if coord.count >= 2 {
                    let lon = coord[0]
                    let lat = coord[1]
                    let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                    routeCoordinates.append(coordinate)
                    allCoordinates.append(coordinate)
                }
            }
            
            // Create polyline for this section
            if !routeCoordinates.isEmpty {
                let polyline = ColoredPolyline(coordinates: routeCoordinates, count: routeCoordinates.count)
                polyline.color = color
                mapView.addOverlay(polyline)
            }
            
            // Add start marker
            if let fromPlace = section.from, let fromCoord = fromPlace.coordinate {
                let fromStation = StationMarkerAnnotation(
                    coordinate: fromCoord,
                    title: fromPlace.name ?? "Départ",
                    type: .start
                )
                mapView.addAnnotation(fromStation)
                allCoordinates.append(fromCoord)
            }
            
            // Add end marker
            if let toPlace = section.to, let toCoord = toPlace.coordinate {
                let toStation = StationMarkerAnnotation(
                    coordinate: toCoord,
                    title: toPlace.name ?? "Arrivée",
                    type: .end
                )
                mapView.addAnnotation(toStation)
                allCoordinates.append(toCoord)
            }
        }
        
        // Add transfer markers
        for section in sections where section.type == "transfer" {
            if let transferPlace = section.from, let coord = transferPlace.coordinate {
                let transfer = StationMarkerAnnotation(
                    coordinate: coord,
                    title: transferPlace.name ?? "Correspondance",
                    type: .transfer
                )
                mapView.addAnnotation(transfer)
                allCoordinates.append(coord)
            }
        }
        
        // Fit map to show all coordinates
        if !allCoordinates.isEmpty {
            let boundingRect = MKMapRect(coordinates: allCoordinates)
            mapView.setVisibleMapRect(boundingRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let coloredPolyline = overlay as? ColoredPolyline {
                let renderer = MKPolylineRenderer(polyline: coloredPolyline)
                renderer.strokeColor = coloredPolyline.color
                renderer.lineWidth = 4
                renderer.lineJoin = CGLineJoin.round
                renderer.lineCap = CGLineCap.round
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let markerAnnotation = annotation as? StationMarkerAnnotation else { return nil }
            
            let identifier = "StationMarker"
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if view == nil {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view?.canShowCallout = true
            } else {
                view?.annotation = annotation
            }
            
            // Refined marker appearance
            view?.displayPriority = .required
            
            switch markerAnnotation.markerType {
            case .start:
                view?.markerTintColor = .white
                view?.glyphImage = UIImage(systemName: "figure.walk")
                view?.glyphTintColor = .systemBlue
            case .end:
                view?.markerTintColor = .systemRed
                view?.glyphImage = UIImage(systemName: "mappin.and.ellipse")
                view?.glyphTintColor = .white
            case .transfer:
                view?.markerTintColor = .systemOrange
                view?.glyphImage = UIImage(systemName: "arrow.triangle.2.circlepath")
                view?.glyphTintColor = .white
            }
            
            // Soft shadow
            view?.layer.shadowColor = UIColor.black.cgColor
            view?.layer.shadowOpacity = 0.2
            view?.layer.shadowOffset = CGSize(width: 0, height: 2)
            view?.layer.shadowRadius = 4
            
            return view
        }
    }
}

// MARK: - Helper Classes


class StationMarkerAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let markerType: MarkerType
    
    enum MarkerType {
        case start, end, transfer
    }
    
    init(coordinate: CLLocationCoordinate2D, title: String?, type: MarkerType) {
        self.coordinate = coordinate
        self.title = title
        self.markerType = type
    }
}

// MARK: - Helper Extensions

extension MKMapRect {
    init(coordinates: [CLLocationCoordinate2D]) {
        var rect = MKMapRect.null
        for coordinate in coordinates {
            let point = MKMapPoint(coordinate)
            rect = rect.union(MKMapRect(x: point.x, y: point.y, width: 0, height: 0))
        }
        self = rect
    }
}

extension ItineraryPlace {
    var coordinate: CLLocationCoordinate2D? {
        guard let coord = self.coord,
              let latStr = coord.lat,
              let lonStr = coord.lon,
              let lat = Double(latStr),
              let lon = Double(lonStr) else { return nil }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
