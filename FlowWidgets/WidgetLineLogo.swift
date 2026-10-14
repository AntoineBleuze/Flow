import SwiftUI

struct WidgetLineLogo: View {
    let lineName: String?
    let lineColor: String?
    let textColor: String?
    let size: CGFloat

    private enum LineCharter {
        case metro(display: String)
        case rer(display: String)
        case transilien(display: String)
        case tram(display: String)
        case cable(display: String)
        case bus(display: String)
        case fallback(display: String)
    }

    private var charter: LineCharter {
        let raw = (lineName ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !raw.isEmpty else {
            return .fallback(display: "?")
        }

        let upperRaw = raw.uppercased()

        // Nettoyage des préfixes usuels (MÉTRO, RER, TRAM, TRANSILIEN, etc.)
        var clean = upperRaw
            .replacingOccurrences(of: "MÉTRO", with: "")
            .replacingOccurrences(of: "METRO", with: "")
            .replacingOccurrences(of: "RER", with: "")
            .replacingOccurrences(of: "TRAMWAY", with: "")
            .replacingOccurrences(of: "TRAM", with: "")
            .replacingOccurrences(of: "TRANSILIEN", with: "")
            .replacingOccurrences(of: "TRAIN", with: "")
            .replacingOccurrences(of: "LIGNE", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        // 1. TRAMWAY
        // Ex: "T1", "T2", "T3a", "T3b", "T4" ... "T14", ou contenant TRAM
        if upperRaw.contains("TRAM") || (upperRaw.hasPrefix("T") && upperRaw.count <= 4 && upperRaw.dropFirst().first?.isNumber == true) {
            var tramNum = clean
            if tramNum.hasPrefix("T") {
                tramNum = String(tramNum.dropFirst()).trimmingCharacters(in: .whitespacesAndNewlines)
            }
            if tramNum == "3A" { tramNum = "3a" }
            else if tramNum == "3B" { tramNum = "3b" }
            return .tram(display: "T\(tramNum)")
        }

        // 2. RER
        // Ex: "A", "B", "C", "D", "E" ou "RER A"
        let rerLines: Set<String> = ["A", "B", "C", "D", "E"]
        if upperRaw.contains("RER") || rerLines.contains(clean) {
            return .rer(display: clean)
        }

        // 3. TRANSILIEN
        // Ex: "H", "J", "K", "L", "N", "P", "R", "U", "V" ou "TRANSILIEN H"
        let transilienLines: Set<String> = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]
        if upperRaw.contains("TRANSILIEN") || upperRaw.contains("TRAIN") || transilienLines.contains(clean) {
            return .transilien(display: clean)
        }

        // 4. MÉTRO
        // Ex: 1..18, 3bis, 7bis, M1..M18
        var metroClean = clean
        if metroClean.hasPrefix("M") && metroClean.count > 1 && metroClean.dropFirst().first?.isNumber == true {
            metroClean = String(metroClean.dropFirst()).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        if metroClean == "3B" || metroClean == "3BIS" { metroClean = "3bis" }
        else if metroClean == "7B" || metroClean == "7BIS" { metroClean = "7bis" }

        let metroLines: Set<String> = [
            "1", "2", "3", "3B", "3BIS", "3bis", "4", "5", "6", "7", "7B", "7BIS", "7bis",
            "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"
        ]
        if upperRaw.contains("METRO") || upperRaw.contains("MÉTRO") || metroLines.contains(metroClean) {
            return .metro(display: metroClean)
        }

        // 5. CÂBLE
        if upperRaw.contains("CABLE") || upperRaw.contains("CÂBLE") || clean == "C1" {
            return .cable(display: "C1")
        }

        // 6. BUS ou fallback
        return .bus(display: clean.isEmpty ? raw : clean)
    }

    private var bgFillColor: Color {
        if let hex = lineColor, !hex.isEmpty {
            return Color(hex: hex)
        }
        return Color.blue
    }

    private var textFillColor: Color {
        if let hex = textColor, !hex.isEmpty {
            return Color(hex: hex)
        }
        if let hex = lineColor, !hex.isEmpty {
            return contrastColor(for: hex)
        }
        return .white
    }

    private func contrastColor(for hex: String) -> Color {
        let cleanHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: cleanHex).scanHexInt64(&int)
        let r, g, b: Double
        if cleanHex.count == 6 {
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        } else {
            return .white
        }
        let luminance = 0.299 * r + 0.587 * g + 0.114 * b
        return luminance > 0.65 ? Color.black : Color.white
    }

    /// Calcule un micro-décalage optique recommandé par Apple HIG (Icons: Best practices)
    /// pour compenser l'asymétrie géométrique des glyphes majuscules et l'espace de descender sous la baseline.
    private func opticalOffset(for text: String, size: CGFloat) -> (x: CGFloat, y: CGFloat) {
        let clean = text.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var offsetX: CGFloat = 0
        // Décalage vertical standard pour centrer la cap-height dans le carré/cercle
        var offsetY: CGFloat = -size * 0.022

        switch clean {
        case "C":
            // Le "C" est ouvert à droite : sa masse visuelle est concentrée à gauche.
            // On le compense légèrement vers la droite (+x) et vers le haut pour un centrage optique parfait.
            offsetX = size * 0.022
            offsetY = -size * 0.020
        case "E", "F", "K", "L":
            offsetX = size * 0.012
            offsetY = -size * 0.022
        case "J":
            offsetX = -size * 0.015
            offsetY = -size * 0.022
        case "A":
            // Base large triangulaire : ajustement vers le haut
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
        switch charter {
        case .metro(let display):
            // Charte Métro : Disque plein
            let isBis = display.count > 2
            let fontSize = isBis ? size * 0.36 : (display.count > 1 ? size * 0.48 : size * 0.56)
            let offset = opticalOffset(for: display, size: size)
            ZStack {
                Circle()
                    .fill(bgFillColor)
                Text(display)
                    .font(.system(size: fontSize, weight: .bold, design: .default))
                    .foregroundColor(textFillColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .offset(x: offset.x, y: offset.y)
            }
            .frame(width: size, height: size)

        case .rer(let display):
            // Charte RER : Carré arrondi avec ratio officiel rx = 0.225 (conforme aux fichiers SVG IDFM)
            let cornerRadius = size * 0.225
            let offset = opticalOffset(for: display, size: size)
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(bgFillColor)
                Text(display)
                    .font(.system(size: size * 0.58, weight: .bold, design: .default))
                    .foregroundColor(textFillColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .offset(x: offset.x, y: offset.y)
            }
            .frame(width: size, height: size)

        case .transilien(let display):
            // Charte Transilien : Carré arrondi
            let cornerRadius = size * 0.225
            let offset = opticalOffset(for: display, size: size)
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(bgFillColor)
                Text(display)
                    .font(.system(size: size * 0.58, weight: .bold, design: .default))
                    .foregroundColor(textFillColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .offset(x: offset.x, y: offset.y)
            }
            .frame(width: size, height: size)

        case .tram(let display):
            // Charte Tramway inspirée des logos SVG RATP/IDFM :
            // Fond blanc, deux barres horizontales (haut et bas) de la couleur de la ligne,
            // et au centre "T" + numéro en couleur sombre #25303B
            let cornerRadius = size * 0.18
            let barHeight = max(2.0, size * 0.14)
            let fontSize = display.count > 3 ? size * 0.36 : (display.count > 2 ? size * 0.40 : size * 0.46)

            ZStack {
                // Fond blanc
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(Color.white)

                // Barres supérieure et inférieure
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: size * 0.08, style: .continuous)
                        .fill(bgFillColor)
                        .frame(height: barHeight)
                        .padding(.horizontal, 1.5)
                        .padding(.top, 1.5)

                    Spacer(minLength: 0)

                    RoundedRectangle(cornerRadius: size * 0.08, style: .continuous)
                        .fill(bgFillColor)
                        .frame(height: barHeight)
                        .padding(.horizontal, 1.5)
                        .padding(.bottom, 1.5)
                }

                // Texte sombre central #25303B (style Parisine)
                Text(display)
                    .font(.system(size: fontSize, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 0.145, green: 0.188, blue: 0.231))
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                    .offset(y: -size * 0.01)
            }
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))

        case .cable(let display):
            let cornerRadius = size * 0.225
            let offset = opticalOffset(for: display, size: size)
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(bgFillColor)
                Text(display)
                    .font(.system(size: size * 0.44, weight: .bold, design: .default))
                    .foregroundColor(textFillColor)
                    .offset(x: offset.x, y: offset.y)
            }
            .frame(width: size, height: size)

        case .bus(let display), .fallback(let display):
            // Bus & autres : rectangle arrondi
            let cornerRadius = size * 0.225
            let isLong = display.count > 3
            let offset = opticalOffset(for: display, size: size)
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(bgFillColor)
                Text(display)
                    .font(.system(size: isLong ? size * 0.34 : (display.count > 2 ? size * 0.40 : size * 0.48), weight: .bold, design: .default))
                    .foregroundColor(textFillColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 2)
                    .offset(x: offset.x, y: offset.y)
            }
            .frame(width: size, height: size)
        }
    }
}
