import SwiftUI

#if canImport(UIKit)
    import UIKit
#endif

struct LineIcon: View {
    let type: TransportType
    let lineId: String
    let size: CGFloat
    let customColor: Color?

    // Init depuis un objet TransportLine complet
    init(line: TransportLine, size: CGFloat = 30) {
        self.type = line.type
        self.lineId = line.lineId
        self.size = size
        if let hex = line.colorHex {
            self.customColor = Color(hex: hex)
        } else if let cached = MapDataService.shared.lineColorCache[line.lineId] {
            self.customColor = cached
        } else {
            self.customColor = resolveLineColor(line.lineId, type: line.type)
        }
    }

    // Init manuel
    init(type: TransportType, lineId: String, size: CGFloat = 30, customColor: Color? = nil) {
        self.type = type
        self.lineId = lineId
        self.size = size
        self.customColor = customColor ?? MapDataService.shared.lineColorCache[lineId] ?? resolveLineColor(lineId, type: type)
    }

    private func opticalOffset(for text: String, size: CGFloat) -> (x: CGFloat, y: CGFloat) {
        let clean = text.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var offsetX: CGFloat = 0
        var offsetY: CGFloat = -size * 0.022

        switch clean {
        case "C":
            offsetX = size * 0.022
            offsetY = -size * 0.020
        case "E", "F", "K", "L":
            offsetX = size * 0.012
            offsetY = -size * 0.022
        case "J":
            offsetX = -size * 0.015
            offsetY = -size * 0.022
        case "A":
            offsetX = 0
            offsetY = -size * 0.028
        case "T", "Y":
            offsetX = 0
            offsetY = size * 0.005
        default:
            break
        }
        return (offsetX, offsetY)
    }

    var body: some View {
        // Tentative d'affichage de l'image asset
        if let asset = self.resolvedAssetName {
            Image(asset)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        } else {
            // Rendu vectoriel natif selon la charte IDFM
            let effectiveBg = customColor ?? type.accentColor
            let textColor = LiquidGlassTheme.contrastTextColor(forColor: effectiveBg)
            let clean = cleanLineId
            
            switch type {
            case .metro:
                // Charte Ronde pour le Métro
                let isBis = clean.contains("BIS") || clean.contains("B")
                let fontSize = isBis ? size * 0.36 : (clean.count > 1 ? size * 0.48 : size * 0.56)
                let offset = opticalOffset(for: clean, size: size)
                ZStack {
                    Circle()
                        .fill(effectiveBg)
                    Text(clean)
                        .font(.system(size: fontSize, weight: .bold, design: .default))
                        .foregroundColor(textColor)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .offset(x: offset.x, y: offset.y)
                }
                .frame(width: size, height: size)
                
            case .rer, .transilien, .train:
                // Carré arrondi pour RER et Transiliens (rx = 0.225 officiel)
                let cornerRadius = size * 0.225
                let offset = opticalOffset(for: clean, size: size)
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(effectiveBg)
                    Text(clean)
                        .font(.system(size: size * 0.58, weight: .bold, design: .default))
                        .foregroundColor(textColor)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .offset(x: offset.x, y: offset.y)
                }
                .frame(width: size, height: size)
                
            case .tram:
                // Charte Tramway inspirée des logos .SVG (fond blanc, 2 barres couleur, texte sombre #25303B)
                let cornerRadius = size * 0.18
                let barHeight = max(2.0, size * 0.14)
                let tramDisplay = tramDisplayText(from: clean)
                let fontSize = tramDisplay.count > 3 ? size * 0.36 : (tramDisplay.count > 2 ? size * 0.40 : size * 0.46)
                
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(Color.white)
                    
                    VStack(spacing: 0) {
                        RoundedRectangle(cornerRadius: size * 0.08, style: .continuous)
                            .fill(effectiveBg)
                            .frame(height: barHeight)
                            .padding(.horizontal, 1.5)
                            .padding(.top, 1.5)
                        
                        Spacer(minLength: 0)
                        
                        RoundedRectangle(cornerRadius: size * 0.08, style: .continuous)
                            .fill(effectiveBg)
                            .frame(height: barHeight)
                            .padding(.horizontal, 1.5)
                            .padding(.bottom, 1.5)
                    }
                    
                    Text(tramDisplay)
                        .font(.system(size: fontSize, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 0.145, green: 0.188, blue: 0.231))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .offset(y: -size * 0.01)
                }
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                
            case .bus, .cable:
                let cornerRadius = size * 0.20
                let offset = opticalOffset(for: clean, size: size)
                let isLong = clean.count > 3
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(effectiveBg)
                    Text(clean)
                        .font(.system(size: isLong ? size * 0.34 : (clean.count > 2 ? size * 0.40 : size * 0.48), weight: .bold, design: .default))
                        .foregroundColor(textColor)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .offset(x: offset.x, y: offset.y)
                }
                .frame(width: max(size, CGFloat(clean.count) * size * 0.4 + size * 0.4), height: size)
            }
        }
    }

    private func tramDisplayText(from clean: String) -> String {
        var num = clean
        if num.hasPrefix("T") {
            num = String(num.dropFirst()).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        if num == "3A" { num = "3a" }
        else if num == "3B" { num = "3b" }
        return "T\(num)"
    }

    private var resolvedAssetName: String? {
        let primary = self.assetName
        if UIImage(named: primary) != nil {
            return primary
        }
        
        let clean = cleanLineId
        let candidates = [
            "metro\(clean.lowercased())",
            "rer\(clean)",
            "T\(clean.replacingOccurrences(of: "T", with: "", options: .caseInsensitive))",
            "transilien\(clean)",
            clean
        ]
        for candidate in candidates {
            if UIImage(named: candidate) != nil {
                return candidate
            }
        }
        
        return nil
    }

    private var cleanLineId: String {
        var clean = lineId.trimmingCharacters(in: .whitespacesAndNewlines)
        let prefixes = ["MÉTRO ", "METRO ", "RER ", "TRAMWAY ", "TRAM ", "TRANSILIEN ", "TRAIN ", "BUS ", "LIGNE "]
        for prefix in prefixes {
            if clean.uppercased().hasPrefix(prefix) {
                clean = String(clean.dropFirst(prefix.count)).trimmingCharacters(in: .whitespacesAndNewlines)
                break
            }
        }
        return clean
    }

    private var assetName: String {
        let clean = cleanLineId
        switch type {
        case .metro:
            return "metro\(clean.lowercased())"
        case .rer:
            return "rer\(clean)"
        case .tram:
            let tramNum = clean.replacingOccurrences(of: "T", with: "", options: .caseInsensitive)
            return "T\(tramNum)"
        case .transilien, .train:
            return "transilien\(clean)"
        case .cable:
            return "cable1"
        case .bus:
            return "bus\(clean)"
        }
    }
}
