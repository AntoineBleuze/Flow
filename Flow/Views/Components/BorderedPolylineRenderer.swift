import MapKit
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

class BorderedPolylineRenderer: MKPolylineRenderer {
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        if self.path == nil {
            self.createPath()
        }
        guard let path = self.path else { return }
        
        // 1. Calculate the dynamic line width in screen points based on zoom scale
        let baseWidth = self.lineWidth
        let scaleFactor: CGFloat
        if zoomScale >= 0.05 {
            scaleFactor = 1.0
        } else if zoomScale <= 0.002 {
            scaleFactor = 0.3 // Minimum 30% of base width when fully zoomed out
        } else {
            // Smooth linear interpolation
            scaleFactor = 0.3 + 0.7 * (zoomScale - 0.002) / (0.05 - 0.002)
        }
        
        let targetLineWidth = baseWidth * scaleFactor
        let borderPadding: CGFloat = 0.8 * scaleFactor // Scale border padding proportionally
        
        context.saveGState()
        
        // Enable high-quality anti-aliasing
        context.setAllowsAntialiasing(true)
        context.setShouldAntialias(true)
        
        // 1. Draw the black border first (wider line)
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setStrokeColor(PlatformColor.black.cgColor)
        context.setLineWidth((targetLineWidth + borderPadding) / zoomScale)
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        // 2. Draw the inner colored line on top
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setLineWidth(targetLineWidth / zoomScale)
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        context.restoreGState()
    }
}
