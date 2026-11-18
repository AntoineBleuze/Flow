import SwiftUI

enum StationMapZoomLevel: Int, Equatable {
    case minimal   // latitudeDelta >= 0.035 : pastilles seules sur les lignes
    case medium    // 0.012 <= latitudeDelta < 0.035 : pastilles + noms (ferré)
    case detailed  // 0.0045 <= latitudeDelta < 0.012 : logos révélés + noms (ferré), pastille discrète (bus)
    case closeUp   // latitudeDelta < 0.0045 : logos + noms pour tout (y compris bus)

    nonisolated static func from(latitudeDelta: Double) -> StationMapZoomLevel {
        if latitudeDelta >= 0.035 {
            return .minimal
        } else if latitudeDelta >= 0.012 {
            return .medium
        } else if latitudeDelta >= 0.0045 {
            return .detailed
        } else {
            return .closeUp
        }
    }
}

/// Texte détouré façon Apple Maps sans boîte de fond, avec contour de lisibilité.
struct MapHaloText: View {
    let text: String
    var font: Font
    var foregroundColor: Color
    var haloColor: Color = Color(UIColor.systemBackground)

    var body: some View {
        ZStack {
            Group {
                Text(text).offset(x: -1.1, y: 0)
                Text(text).offset(x: 1.1, y: 0)
                Text(text).offset(x: 0, y: -1.1)
                Text(text).offset(x: 0, y: 1.1)
                Text(text).offset(x: -0.8, y: -0.8)
                Text(text).offset(x: 0.8, y: -0.8)
                Text(text).offset(x: -0.8, y: 0.8)
                Text(text).offset(x: 0.8, y: 0.8)
            }
            .font(font)
            .foregroundColor(haloColor)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)

            Text(text)
                .font(font)
                .foregroundColor(foregroundColor)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct StationBadgeView: View {
    let station: MapStation
    let isSelected: Bool
    var zoomLevel: StationMapZoomLevel = .detailed
    var focusedLine: StationLine? = nil
    var showStationName: Bool = true

    private var nonBusLines: [StationLine] {
        if let focusedLine = focusedLine, focusedLine.type != .bus {
            return [focusedLine]
        }
        let lines: [StationLine]
        if FavoritesService.shared.isFavorite(stationId: station.id) {
            lines = station.lines
        } else {
            lines = station.lines.filter { MapDataService.shared.isLineTypeEnabled($0.type) }
        }
        return lines.filter { $0.type != .bus }
    }

    private var hasBusEnabled: Bool {
        if FavoritesService.shared.isFavorite(stationId: station.id) {
            return station.lines.contains { $0.type == .bus }
        } else {
            return station.lines.contains { $0.type == .bus && MapDataService.shared.isLineTypeEnabled(.bus) }
        }
    }

    private var busLines: [StationLine] {
        let lines: [StationLine]
        if FavoritesService.shared.isFavorite(stationId: station.id) {
            lines = station.lines
        } else {
            lines = station.lines.filter { MapDataService.shared.isLineTypeEnabled($0.type) }
        }
        return lines.filter { $0.type == .bus }
    }

    private var sortedBusLines: [StationLine] {
        busLines.sorted { a, b in
            a.name.localizedStandardCompare(b.name) == .orderedAscending
        }
    }

    private var isBusOnly: Bool {
        nonBusLines.isEmpty
    }

    private var shouldShowName: Bool {
        if isSelected { return true }
        guard showStationName else { return false }
        if isBusOnly { return zoomLevel == .closeUp }
        return zoomLevel != .minimal
    }

    /// Hauteur exacte de l'élément d'ancrage (pastille ou badge/pilule en bas de la vue)
    /// pour caler `centerOffset` pile sur la coordonnée GPS de la ligne.
    var markerAnchorHeight: CGFloat {
        if isBusOnly {
            if isSelected || zoomLevel == .closeUp {
                return sortedBusLines.count > 1 ? 20.0 : 14.0
            }
            return 9.0
        }

        if isSelected || zoomLevel == .detailed || zoomLevel == .closeUp {
            if nonBusLines.count == 1 {
                return (!isSelected && zoomLevel == .detailed) ? 16.0 : 20.0
            }
            return 20.0
        }

        // Mode pastille minimale
        if nonBusLines.count > 1 {
            return zoomLevel == .minimal ? 11.0 : 13.0
        }
        return zoomLevel == .minimal ? 9.0 : 11.0
    }

    var body: some View {
        VStack(spacing: 2) {
            if shouldShowName {
                MapHaloText(
                    text: station.name,
                    font: .system(
                        size: isSelected ? 11.0 : (isBusOnly ? 9.0 : 10.0),
                        weight: isSelected ? .bold : .semibold
                    ),
                    foregroundColor: isSelected ? .blue : .primary
                )
            }

            markerSymbol
        }
        .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isSelected)
    }

    @ViewBuilder
    private var markerSymbol: some View {
        if isBusOnly {
            if hasBusEnabled && !sortedBusLines.isEmpty {
                if isSelected || zoomLevel == .closeUp {
                    if sortedBusLines.count == 1, let firstBus = sortedBusLines.first {
                        LineBadge(line: firstBus, mini: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2.5)
                                    .stroke(Color(UIColor.systemBackground), lineWidth: 1.0)
                            )
                            .shadow(
                                color: isSelected
                                    ? resolveLineColor(firstBus.name, type: firstBus.type).opacity(0.6)
                                    : Color.black.opacity(0.18),
                                radius: isSelected ? 5 : 2, x: 0, y: 1
                            )
                            .scaleEffect(isSelected ? 1.2 : 1.0)
                    } else {
                        HStack(spacing: 2) {
                            ForEach(sortedBusLines.prefix(3), id: \.id) { line in
                                LineBadge(line: line, mini: true)
                            }
                            if sortedBusLines.count > 3 {
                                Text("+\(sortedBusLines.count - 3)")
                                    .font(.system(size: 7, weight: .bold))
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal, 1.5)
                            }
                        }
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2.5)
                        .background(
                            Capsule()
                                .fill(Color(UIColor.systemBackground).opacity(0.95))
                        )
                        .overlay(
                            Capsule()
                                .stroke(isSelected ? Color.blue : Color.primary.opacity(0.18), lineWidth: isSelected ? 1.5 : 0.7)
                        )
                        .shadow(color: isSelected ? Color.blue.opacity(0.35) : Color.black.opacity(0.15),
                                radius: isSelected ? 5 : 2.5, x: 0, y: 1)
                        .scaleEffect(isSelected ? 1.15 : 1.0)
                    }
                } else {
                    // Pastille bus discrète (9×9 pt)
                    let dotColor = sortedBusLines.first.map { resolveLineColor($0.name, type: $0.type) } ?? Color(hex: "008B5E")
                    Circle()
                        .fill(dotColor)
                        .frame(width: 9, height: 9)
                        .overlay(
                            Circle()
                                .stroke(Color(UIColor.systemBackground), lineWidth: 1.5)
                        )
                        .shadow(color: Color.black.opacity(0.22), radius: 1.5, x: 0, y: 0.5)
                }
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 9, height: 9)
                    .overlay(Circle().stroke(Color(UIColor.systemBackground), lineWidth: 1.5))
                    .shadow(radius: 1.5)
            }
        } else if isSelected || zoomLevel == .detailed || zoomLevel == .closeUp {
            // Mode Logos Révélés (ferré)
            if nonBusLines.count == 1, let firstLine = nonBusLines.first {
                let useMini = !isSelected && zoomLevel == .detailed
                LineBadge(line: firstLine, mini: useMini, customSize: useMini ? 16 : 20)
                    .overlay(
                        badgeBorder(for: firstLine, cornerRadius: useMini ? 3.5 : 4.5)
                    )
                    .shadow(
                        color: isSelected
                            ? resolveLineColor(firstLine.name, type: firstLine.type).opacity(0.6)
                            : Color.black.opacity(0.2),
                        radius: isSelected ? 6 : 2, x: 0, y: isSelected ? 2 : 1
                    )
                    .scaleEffect(isSelected ? 1.2 : 1.0)
            } else {
                // Pilule épurée style Apple Maps (logos seuls, sans icône générique de mode)
                HStack(spacing: 2.5) {
                    let maxNonBusToShow = 4
                    ForEach(nonBusLines.prefix(maxNonBusToShow), id: \.id) { line in
                        LineBadge(line: line, mini: true)
                    }
                    if nonBusLines.count > maxNonBusToShow {
                        Text("+\(nonBusLines.count - maxNonBusToShow)")
                            .font(.system(size: 7.5, weight: .bold))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 1.5)
                    }
                }
                .padding(.horizontal, 4.5)
                .padding(.vertical, 3)
                .background(
                    Capsule()
                        .fill(Color(UIColor.systemBackground).opacity(0.95))
                )
                .overlay(
                    Capsule()
                        .stroke(isSelected ? Color.blue : Color.primary.opacity(0.18), lineWidth: isSelected ? 1.5 : 0.8)
                )
                .shadow(
                    color: isSelected ? Color.blue.opacity(0.4) : Color.black.opacity(0.18),
                    radius: isSelected ? 6 : 2.5, x: 0, y: 1
                )
                .scaleEffect(isSelected ? 1.15 : 1.0)
            }
        } else {
            // Mode Pastille Minimale sur la ligne (.minimal ou .medium)
            if nonBusLines.count == 1, let firstLine = nonBusLines.first {
                let dotSize: CGFloat = zoomLevel == .minimal ? 9 : 11
                let lineColor = resolveLineColor(firstLine.name, type: firstLine.type)
                Circle()
                    .fill(lineColor)
                    .frame(width: dotSize, height: dotSize)
                    .overlay(
                        Circle()
                            .stroke(Color(UIColor.systemBackground), lineWidth: 2.0)
                    )
                    .shadow(color: Color.black.opacity(0.24), radius: 1.5, x: 0, y: 0.5)
            } else {
                // Hub multi-lignes : pastille blanche avec anneau sombre/primaire style Apple Maps
                let dotSize: CGFloat = zoomLevel == .minimal ? 11 : 13
                Circle()
                    .fill(Color(UIColor.systemBackground))
                    .frame(width: dotSize, height: dotSize)
                    .overlay(
                        Circle()
                            .stroke(Color.primary.opacity(0.85), lineWidth: 2.2)
                    )
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 0.5)
            }
        }
    }

    @ViewBuilder
    private func badgeBorder(for line: StationLine, cornerRadius: CGFloat) -> some View {
        let strokeColor = isSelected ? Color.blue : Color(UIColor.systemBackground)
        let strokeWidth: CGFloat = isSelected ? 1.5 : 1.2
        switch line.type {
        case .metro:
            Circle().stroke(strokeColor, lineWidth: strokeWidth)
        case .tram:
            Capsule().stroke(strokeColor, lineWidth: strokeWidth)
        default:
            RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: strokeWidth)
        }
    }
}

// Badge officiel individuel selon le type de transport
struct LineBadge: View {
    let line: StationLine
    var mini: Bool = false
    var customSize: CGFloat? = nil

    var body: some View {
        let color = resolveLineColor(line.name, type: line.type)
        let size: CGFloat = customSize ?? (mini ? 14 : 20)
        let fontSize: CGFloat = customSize != nil ? (size * 0.55) : (mini ? 8 : 11)
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
                    if line.type == .bus {
                        Text(line.name)
                            .font(.system(size: fontSize, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, mini ? 3 : 5)
                            .frame(height: size)
                            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(color))
                    } else {
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
nonisolated func resolveLineColor(_ name: String, type: TransportType) -> Color {
    if type == .bus && name.uppercased().hasPrefix("N") {
        return Color(hex: "0A1C3F")
    }
    let normalized = name.uppercased()
        .replacingOccurrences(of: "TRAM", with: "")
        .replacingOccurrences(of: "METRO", with: "")
        .replacingOccurrences(of: "RER", with: "")
        .replacingOccurrences(of: "T", with: "")
        .trimmingCharacters(in: .whitespacesAndNewlines)
        
    let officialColors: [String: String] = [
        "1": "FFCD00", "2": "003CA6", "3": "837902", "3bis": "6EC4E8", "3BIS": "6EC4E8", "4": "CF009E",
        "5": "FF7E2E", "6": "6ECA97", "7": "FA9ABA", "7bis": "6ECA97", "7BIS": "6ECA97", "8": "E19BDF",
        "9": "B6BD00", "10": "C9910D", "11": "704B1C", "12": "007852", "13": "6EC4E8",
        "14": "62259D", "15": "A50034", "16": "FF82B4", "17": "D2D200", "18": "00A092",
        "A": "E3051C", "B": "5291CE", "C": "FFCE00", "D": "00643C",
        "E": "B2559C", "H": "8D5E2A", "J": "D5C900", "K": "9F9825", "L": "C9AED0",
        "N": "00A88F", "P": "F28E42", "R": "F3A4BA", "U": "B90845", "V": "9F9825", "3A": "F28E42",
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
    
    if Thread.isMainThread {
        if let cachedColor = MainActor.assumeIsolated({ MapDataService.shared.lineColorCache[name] }) {
            return cachedColor
        }
    }
    
    return Color(type.accentColor)
}

#Preview {
    StationBadgeView(
        station: PreviewMockData.mockStation,
        isSelected: true
    )
    .padding()
    .background(Color.secondary.opacity(0.3))
}

