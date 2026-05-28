import SwiftUI

struct StationBadgeView: View {
    let station: MapStation
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 3) {
            // Nom de la station avec fond légèrement translucide
            Text(station.name)
                .font(.system(size: isSelected ? 9.5 : 8.0, weight: isSelected ? .black : .bold))
                .foregroundColor(isSelected ? .blue : .primary)
                .padding(.horizontal, 5)
                .padding(.vertical, 1.5)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
                .background(
                    RoundedRectangle(cornerRadius: 3.5)
                        .fill(Color(UIColor.systemBackground).opacity(0.85))
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 0.5)
                )
                .scaleEffect(isSelected ? 1.15 : 1.0)

            Group {
                if station.lines.isEmpty {
                    // Station sans ligne (fallback)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 14, height: 14)
                        .shadow(radius: 2)
                } else if station.lines.count == 1, let firstLine = station.lines.first {
                    // Station avec une seule ligne : on affiche directement son badge officiel
                    LineBadge(line: firstLine)
                        .shadow(color: isSelected ? resolveLineColor(firstLine.name, type: firstLine.type).opacity(0.6) : Color.black.opacity(0.15),
                                radius: isSelected ? 6 : 2, x: 0, y: isSelected ? 3 : 1)
                        .scaleEffect(isSelected ? 1.25 : 1.0)
                } else {
                    // Hub multi-lignes : conteneur capsule moderne effet verre (glassmorphism)
                    HStack(spacing: 3) {
                        // Petite icône de transport principal
                        Image(systemName: modeIconName)
                            .font(.system(size: 8, weight: .black))
                            .foregroundColor(.primary.opacity(0.7))
                            .frame(width: 12, height: 12)
                        
                        // Liste horizontale des badges des lignes (limité à 4 pour ne pas surcharger)
                        HStack(spacing: 2) {
                            ForEach(station.lines.prefix(4), id: \.id) { line in
                                LineBadge(line: line, mini: true)
                            }
                            
                            if station.lines.count > 4 {
                                Text("+\(station.lines.count - 4)")
                                    .font(.system(size: 7, weight: .bold))
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal, 2)
                            }
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical, 3)
                    .background(
                        Capsule()
                            .fill(Color(UIColor.systemBackground).opacity(0.75))
                    )
                    .overlay(
                        Capsule()
                            .fill(Color.white.opacity(0.15))
                    )
                    .overlay(
                        Capsule()
                            .stroke(isSelected ? Color.blue : Color.primary.opacity(0.15), lineWidth: isSelected ? 1.5 : 0.5)
                    )
                    .shadow(color: isSelected ? Color.blue.opacity(0.4) : Color.black.opacity(0.15),
                            radius: isSelected ? 6 : 3, x: 0, y: isSelected ? 3 : 1.5)
                    .scaleEffect(isSelected ? 1.2 : 1.0)
                }
            }
        }
        .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isSelected)
    }

    private var modeIconName: String {
        switch station.mainType {
        case .metro: return "tram.fill"
        case .rer: return "train.side.front.car"
        case .transilien: return "train.side.front.car"
        case .tram: return "tram"
        case .bus: return "bus.fill"
        default: return "train.side.front.car"
        }
    }
}

// Badge officiel individuel selon le type de transport
struct LineBadge: View {
    let line: StationLine
    var mini: Bool = false

    var body: some View {
        let color = resolveLineColor(line.name, type: line.type)
        let size: CGFloat = mini ? 14 : 20
        let fontSize: CGFloat = mini ? 8 : 11
        let cornerRadius: CGFloat = mini ? 2.5 : 4

        Group {
            if UIImage(named: line.assetName) != nil {
                Image(line.assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            } else {
                switch line.type {
                case .metro:
                    // Métro : Cercle de couleur avec le numéro/nom
                    Text(line.name)
                        .font(.system(size: fontSize, weight: .black))
                        .foregroundColor(textColorForBg(color))
                        .frame(width: size, height: size)
                        .background(Circle().fill(color))

                case .rer:
                    // RER : Carré arrondi avec la lettre
                    Text(line.name)
                        .font(.system(size: fontSize, weight: .black))
                        .foregroundColor(textColorForBg(color))
                        .frame(width: size, height: size)
                        .background(RoundedRectangle(cornerRadius: cornerRadius).fill(color))

                case .tram:
                    // Tramway : Capsule avec "T" + numéro
                    let cleanName = line.name.hasPrefix("T") ? line.name : "T\(line.name)"
                    Text(cleanName)
                        .font(.system(size: fontSize - 1, weight: .black))
                        .foregroundColor(textColorForBg(color))
                        .padding(.horizontal, mini ? 3 : 5)
                        .frame(height: size)
                        .background(Capsule().fill(color))

                case .transilien:
                    // Transilien : Carré arrondi de couleur
                    Text(line.name)
                        .font(.system(size: fontSize, weight: .black))
                        .foregroundColor(textColorForBg(color))
                        .frame(width: size, height: size)
                        .background(RoundedRectangle(cornerRadius: cornerRadius).fill(color))

                default:
                    // Fallback bus ou autre
                    Text(line.name)
                        .font(.system(size: fontSize, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, mini ? 3 : 5)
                        .frame(height: size)
                        .background(Capsule().fill(color))
                }
            }
        }
    }

    // Détermine si le texte doit être blanc ou noir pour un bon contraste
    private func textColorForBg(_ color: Color) -> Color {
        // Obtenir les composants RGB de la couleur
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        UIColor(color).getRed(&r, green: &g, blue: &b, alpha: &a)
        
        // Formule de luminance relative (YIQ)
        let luminance = (r * 299 + g * 587 + b * 114) / 1000
        return luminance > 0.7 ? .black : .white
    }
}

// Fonction de résolution des couleurs officielles
func resolveLineColor(_ name: String, type: TransportType) -> Color {
    let normalized = name.uppercased()
        .replacingOccurrences(of: "TRAM", with: "")
        .replacingOccurrences(of: "METRO", with: "")
        .replacingOccurrences(of: "RER", with: "")
        .replacingOccurrences(of: "T", with: "")
        .trimmingCharacters(in: .whitespacesAndNewlines)
        
    let officialColors: [String: String] = [
        "1": "FFCD00", "2": "003CA6", "3": "837902", "3bis": "6EC4E8", "4": "CF009E",
        "5": "FF7E2E", "6": "6ECA97", "7": "FA9ABA", "7bis": "6ECA97", "8": "E19BDF",
        "9": "B6BD00", "10": "C9910D", "11": "704B1C", "12": "007852", "13": "6EC4E8",
        "14": "62259D", "15": "A81232", "16": "E47881", "17": "AEC802", "18": "0099C4",
        "A": "E3051C", "B": "5291CE", "C": "FFCE00", "D": "00643C",
        "E": "B2559C", "H": "8D5E2A", "J": "B58800", "K": "B58800", "L": "CECECE",
        "N": "00B092", "P": "F28E42", "R": "E4B4D1", "U": "DE4086", "V": "9F9825", "3A": "F28E42",
        "3B": "00AC8C", "T3A": "F28E42", "T3B": "00AC8C", "T1": "003CA6", "T2": "CF009E",
        "T4": "E69622", "T5": "662483", "T6": "E8391A", "T7": "A4662F", "T8": "7D7F7E",
        "T9": "4092C5", "T10": "D8BC59", "T11": "F1634B", "T12": "AF172B", "T13": "6E5031",
        "T14": "F28E42"
    ]
    
    // For trams, force T-prefix lookup first to avoid clash with metro colors
    let searchKey: String
    if type == .tram {
        searchKey = name.uppercased().hasPrefix("T") ? name.uppercased() : "T\(normalized)"
    } else {
        searchKey = name.uppercased()
    }
    
    if let hex = officialColors[searchKey] ?? officialColors[normalized] {
        return Color(hex: hex)
    }
    
    if let cachedColor = MapDataService.shared.lineColorCache[name] {
        return cachedColor
    }
    
    return Color(type.accentColor)
}
