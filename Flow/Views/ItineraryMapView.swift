import SwiftUI
import MapKit

#if !canImport(UIKit)
import AppKit
#endif

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

// MARK: - UIViewRepresentable / NSViewRepresentable

struct ItineraryMapViewRepresentable: UIViewRepresentable {
    let journey: Journey
    @Binding var region: MKCoordinateRegion
    
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
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    private func updateMapView(_ mapView: MKMapView, context: Context) {
        // Clear existing overlays and annotations
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        
        guard let sections = journey.sections else { return }
        
        var allCoordinates: [CLLocationCoordinate2D] = []
        
        for section in sections {
            let isTransit = section.type == "public_transport"
            
            // Try to extract coordinates from geojson
            var routeCoordinates: [CLLocationCoordinate2D] = []
            if let geojson = section.geojson,
               let coordinates = geojson.coordinates {
                for coord in coordinates {
                    if coord.count >= 2 {
                        let lon = coord[0]
                        let lat = coord[1]
                        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                        routeCoordinates.append(coordinate)
                        allCoordinates.append(coordinate)
                    }
                }
            }
            
            // Fallback: connect from and to if routeCoordinates is empty
            if routeCoordinates.isEmpty {
                if let fromPlace = section.from, let fromCoord = fromPlace.coordinate,
                   let toPlace = section.to, let toCoord = toPlace.coordinate {
                    routeCoordinates = [fromCoord, toCoord]
                    allCoordinates.append(fromCoord)
                    allCoordinates.append(toCoord)
                }
            }
            
            // Create and add polyline
            if !routeCoordinates.isEmpty {
                let polyline = ColoredPolyline(coordinates: routeCoordinates, count: routeCoordinates.count)
                if isTransit {
                    let hexColor = section.display_informations?.color ?? "007AFF"
                    polyline.color = UIColor(hex: hexColor) ?? .blue
                    polyline.isDashed = false
                } else {
                    polyline.color = .systemGray
                    polyline.isDashed = true
                }
                mapView.addOverlay(polyline)
            }
            
            // Add markers
            if isTransit {
                // Add start marker
                if let fromPlace = section.from, let fromCoord = fromPlace.coordinate {
                    let fromStation = StationMarkerAnnotation(
                        coordinate: fromCoord,
                        title: fromPlace.name ?? "Départ",
                        type: .start
                    )
                    mapView.addAnnotation(fromStation)
                    allCoordinates.append(fromCoord)
                    
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
                                allCoordinates.append(exitCoord)
                            }
                        }
                    }
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
                                allCoordinates.append(exitCoord)
                            }
                        }
                    }
                }
            } else if section.type == "transfer" {
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
        }
        
        // Fit map to show all coordinates (only once per journey)
        if !allCoordinates.isEmpty {
            if context.coordinator.lastZoomedJourneyId != journey.id.uuidString {
                context.coordinator.lastZoomedJourneyId = journey.id.uuidString
                let boundingRect = MKMapRect(coordinates: allCoordinates)
                mapView.setVisibleMapRect(boundingRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var lastZoomedJourneyId: String?
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let coloredPolyline = overlay as? ColoredPolyline {
                let renderer = BorderedPolylineRenderer(polyline: coloredPolyline)
                renderer.strokeColor = coloredPolyline.color
                renderer.lineWidth = coloredPolyline.isDashed ? 3.5 : 5.0
                renderer.lineJoin = CGLineJoin.round
                renderer.lineCap = CGLineCap.round
                
                if coloredPolyline.isDashed {
                    renderer.lineDashPattern = [4, 6] // [dashLength, gapLength]
                }
                
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
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
                #if canImport(UIKit)
                view?.glyphImage = UIImage(systemName: "figure.walk")
                #else
                view?.glyphImage = NSImage(systemSymbolName: "figure.walk", accessibilityDescription: nil)
                #endif
                view?.glyphTintColor = .systemBlue
            case .end:
                view?.markerTintColor = .systemRed
                #if canImport(UIKit)
                view?.glyphImage = UIImage(systemName: "mappin.and.ellipse")
                #else
                view?.glyphImage = NSImage(systemSymbolName: "mappin.and.ellipse", accessibilityDescription: nil)
                #endif
                view?.glyphTintColor = .white
            case .transfer:
                view?.markerTintColor = .systemOrange
                #if canImport(UIKit)
                view?.glyphImage = UIImage(systemName: "arrow.triangle.2.circlepath")
                #else
                view?.glyphImage = NSImage(systemSymbolName: "arrow.triangle.2.circlepath", accessibilityDescription: nil)
                #endif
                view?.glyphTintColor = .white
            }
            
            // Soft shadow
            #if canImport(UIKit)
            view?.layer.shadowColor = UIColor.black.cgColor
            view?.layer.shadowOpacity = 0.2
            view?.layer.shadowOffset = CGSize(width: 0, height: 2)
            view?.layer.shadowRadius = 4
            #else
            view?.wantsLayer = true
            view?.layer?.shadowColor = NSColor.black.cgColor
            view?.layer?.shadowOpacity = 0.2
            view?.layer?.shadowOffset = CGSize(width: 0, height: -2)
            view?.layer?.shadowRadius = 4
            #endif
            
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

#Preview {
    ItineraryMapView(journey: PreviewMockData.mockJourney)
}

