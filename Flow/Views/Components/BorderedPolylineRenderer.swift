import MapKit
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

class BorderedPolylineRenderer: MKPolylineRenderer {
    // Utilise le pipeline vectoriel Metal natif de MKPolylineRenderer sans surcharger draw(_:zoomScale:in:)
}
