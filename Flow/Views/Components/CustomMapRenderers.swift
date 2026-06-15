import MapKit
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// MARK: - MapPolylineStyle

enum MapPolylineStyle: String, CaseIterable, Identifiable {
    case classic = "Classique"
    case neon = "Néon"
    case glass = "Verre Liquide"
    
    var id: String { self.rawValue }
    
    var systemImageName: String {
        switch self {
        case .classic:
            return "line.diagonal"
        case .neon:
            return "bolt.fill"
        case .glass:
            return "sparkles"
        }
    }
    
    static var current: MapPolylineStyle {
        get {
            if let value = UserDefaults.standard.string(forKey: "MapPolylineStyle"),
               let style = MapPolylineStyle(rawValue: value) {
                return style
            }
            return .glass // Par défaut
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "MapPolylineStyle")
        }
    }
}

// MARK: - NeonPolylineRenderer

class NeonPolylineRenderer: MKPolylineRenderer {
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        if self.path == nil {
            self.createPath()
        }
        guard let path = self.path else { return }
        
        // 1. Calcul de la largeur de ligne dynamique basée sur le zoom
        let baseWidth = self.lineWidth
        let scaleFactor: CGFloat
        if zoomScale >= 0.05 {
            scaleFactor = 1.0
        } else if zoomScale <= 0.002 {
            scaleFactor = 0.3
        } else {
            scaleFactor = 0.3 + 0.7 * (zoomScale - 0.002) / (0.05 - 0.002)
        }
        
        let targetLineWidth = baseWidth * scaleFactor
        
        context.saveGState()
        context.setAllowsAntialiasing(true)
        context.setShouldAntialias(true)
        
        // Couleur de base (sécurisée)
        let strokeColor = self.strokeColor ?? PlatformColor.systemBlue
        
        // 1. Halo extérieur (grand et diffus)
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setLineWidth((targetLineWidth * 2.8) / zoomScale)
        context.setStrokeColor(strokeColor.withAlphaComponent(0.2).cgColor)
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        // 2. Halo intermédiaire (lumière concentrée)
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setLineWidth((targetLineWidth * 1.6) / zoomScale)
        context.setStrokeColor(strokeColor.withAlphaComponent(0.55).cgColor)
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        // 3. Cœur blanc de haute intensité
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setLineWidth((targetLineWidth * 0.6) / zoomScale)
        #if canImport(UIKit)
        context.setStrokeColor(UIColor.white.cgColor)
        #else
        context.setStrokeColor(NSColor.white.cgColor)
        #endif
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        context.restoreGState()
    }
}

// MARK: - GlassPolylineRenderer

class GlassPolylineRenderer: MKPolylineRenderer {
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        if self.path == nil {
            self.createPath()
        }
        guard let path = self.path else { return }
        
        // 1. Calcul de la largeur de ligne dynamique basée sur le zoom
        let baseWidth = self.lineWidth
        let scaleFactor: CGFloat
        if zoomScale >= 0.05 {
            scaleFactor = 1.0
        } else if zoomScale <= 0.002 {
            scaleFactor = 0.3
        } else {
            scaleFactor = 0.3 + 0.7 * (zoomScale - 0.002) / (0.05 - 0.002)
        }
        
        let targetLineWidth = baseWidth * scaleFactor
        
        context.saveGState()
        context.setAllowsAntialiasing(true)
        context.setShouldAntialias(true)
        
        let strokeColor = self.strokeColor ?? PlatformColor.systemBlue
        
        // 1. Ombre portée (effet de flottement 3D)
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        #if canImport(UIKit)
        let shadowColor = UIColor.black.withAlphaComponent(0.35).cgColor
        #else
        let shadowColor = NSColor.black.withAlphaComponent(0.35).cgColor
        #endif
        context.setShadow(offset: CGSize(width: 0, height: targetLineWidth * 0.35), blur: targetLineWidth * 0.45, color: shadowColor)
        
        // Corps extérieur transparent
        context.setLineWidth(targetLineWidth / zoomScale)
        context.setStrokeColor(strokeColor.withAlphaComponent(0.25).cgColor)
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        // 2. Cœur interne liquide (saturé et coloré)
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setLineWidth((targetLineWidth * 0.6) / zoomScale)
        context.setStrokeColor(strokeColor.withAlphaComponent(0.85).cgColor)
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        // 3. Liseré spéculaire (reflet brillant blanc)
        context.saveGState()
        self.applyStrokeProperties(to: context, atZoomScale: zoomScale)
        context.setLineWidth((targetLineWidth * 0.15) / zoomScale)
        #if canImport(UIKit)
        context.setStrokeColor(UIColor.white.withAlphaComponent(0.9).cgColor)
        #else
        context.setStrokeColor(NSColor.white.withAlphaComponent(0.9).cgColor)
        #endif
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
        
        context.restoreGState()
    }
}
