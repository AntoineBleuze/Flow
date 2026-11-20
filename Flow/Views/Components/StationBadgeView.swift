import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

nonisolated final class AssetPresenceCache: @unchecked Sendable {
    private static let shared = AssetPresenceCache()
    private let lock = NSLock()
    private var cache: [String: Bool] = [:]

    static func exists(_ name: String) -> Bool {
        guard !name.isEmpty else { return false }
        return shared.check(name)
    }

    private func check(_ name: String) -> Bool {
        lock.lock()
        if let cached = cache[name] {
            lock.unlock()
            return cached
        }
        lock.unlock()

        #if canImport(UIKit)
        let present = UIImage(named: name) != nil
        #else
        let present = false
        #endif

        lock.lock()
        cache[name] = present
        lock.unlock()
        return present
    }
}

enum StationMapZoomLevel: Int, Equatable {
    case minimal   // latitudeDelta >= 0.035 : points colorés seuls sur les lignes
    case medium    // 0.008 <= latitudeDelta < 0.035 : points colorés + nom + badge ligne (ferré)
    case detailed  // 0.004 <= latitudeDelta < 0.008 : logo mode de transport + nom + badge ligne (ferré), point discret (bus)
    case closeUp   // latitudeDelta < 0.004 : logo mode + nom + badges pour tout (y compris bus)

    nonisolated static func from(latitudeDelta: Double) -> StationMapZoomLevel {
        if latitudeDelta >= 0.035 {
            return .minimal
        } else if latitudeDelta >= 0.008 {
            return .medium
        } else if latitudeDelta >= 0.004 {
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
        Text(text)
            .font(font)
            .foregroundColor(foregroundColor)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
            .shadow(color: haloColor, radius: 0.6, x: 0, y: 0)
            .shadow(color: haloColor, radius: 0.6, x: 0, y: 0)
    }
}

/// Ballon épingle natif Apple Maps (corps squircle prolongé par une pointe centrée en bas).
struct AppleMapsPinBalloonShape: Shape {
    var tailHeight: CGFloat = 8
    var cornerRadius: CGFloat = 16

    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let bodyH = max(0, h - tailHeight)
        let r = min(cornerRadius, min(w, bodyH) / 2.0)
        let midX = rect.midX
        let tailHalfWidth: CGFloat = 9.0

        var path = Path()
        path.move(to: CGPoint(x: r, y: 0))
        path.addLine(to: CGPoint(x: w - r, y: 0))
        path.addQuadCurve(to: CGPoint(x: w, y: r), control: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w, y: bodyH - r))
        path.addQuadCurve(to: CGPoint(x: w - r, y: bodyH), control: CGPoint(x: w, y: bodyH))

        // Pointe centrée vers le bas
        path.addLine(to: CGPoint(x: midX + tailHalfWidth, y: bodyH))
        path.addQuadCurve(
            to: CGPoint(x: midX + 1.5, y: h - 1.0),
            control: CGPoint(x: midX + 3.5, y: bodyH)
        )
        path.addQuadCurve(
            to: CGPoint(x: midX - 1.5, y: h - 1.0),
            control: CGPoint(x: midX, y: h)
        )
        path.addQuadCurve(
            to: CGPoint(x: midX - tailHalfWidth, y: bodyH),
            control: CGPoint(x: midX - 3.5, y: bodyH)
        )

        path.addLine(to: CGPoint(x: r, y: bodyH))
        path.addQuadCurve(to: CGPoint(x: 0, y: bodyH - r), control: CGPoint(x: 0, y: bodyH))
        path.addLine(to: CGPoint(x: 0, y: r))
        path.addQuadCurve(to: CGPoint(x: r, y: 0), control: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}

/// Logo officiel du mode de transport entouré d'un léger halo translucide sombre (état zoomé).
struct MapModeBadge: View {
    let type: TransportType
    var size: CGFloat = 20

    var body: some View {
        let corner = size * 0.22
        let outerCorner = (size + 4.0) * 0.22

        Group {
            if type == .metro {
                TransportTypeIcon(type: type)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .padding(2.0)
                    .background(Circle().fill(Color.black.opacity(0.45)))
            } else {
                TransportTypeIcon(type: type)
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: corner, style: .continuous))
                    .padding(2.0)
                    .background(RoundedRectangle(cornerRadius: outerCorner, style: .continuous).fill(Color.black.opacity(0.45)))
            }
        }
    }
}

private func contrastTextColor(for backgroundColor: Color, darkColor: Color = .black) -> Color {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0

    UIColor(backgroundColor).getRed(&r, green: &g, blue: &b, alpha: &a)

    let luminance = (r * 299 + g * 587 + b * 114) / 1000
    return luminance > 0.7 ? darkColor : .white
}

/// Tuile de ligne officielle affichée dans le bandeau multi-logos lors de la sélection d'une station.
struct SelectedLineTileView: View {
    let line: StationLine
    let size: CGFloat

    private static let svgExactHexByAssetName: [String: String] = [
        "metro1": "FFCE00", "metro2": "0064B0", "metro3": "9F9825", "metro3bis": "98D4E2",
        "metro4": "C04191", "metro5": "F28E42", "metro6": "83C491", "metro7": "F3A4BA",
        "metro7bis": "83C491", "metro8": "CEADD2", "metro9": "D5C900", "metro10": "E3B32A",
        "metro11": "8D5E2A", "metro12": "00814F", "metro13": "98D4E2", "metro14": "662483",
        "metro15": "B90845", "metro16": "F3A4BA", "metro17": "D5C900", "metro18": "00A88F",
        "rerA": "E3051C", "rerB": "5291CE", "rerC": "FFCE00", "rerD": "00814F", "rerE": "C04191",
        "transilienH": "8D5E2A", "transilienJ": "D5C900", "transilienK": "9F9825",
        "transilienL": "CEADD2", "transilienN": "00A88F", "transilienP": "F28E42",
        "transilienR": "F3A4BA", "transilienU": "B90845", "transilienV": "9F9825",
        "T1": "0064B0", "T2": "C04191", "T3a": "F28E42", "T3b": "00814F", "T4": "E3B32A",
        "T5": "662483", "T6": "E3051C", "T7": "8D5E2A", "T8": "9F9825", "T9": "5291CE",
        "T10": "9F9825", "T11": "F28E42", "T12": "B90845", "T13": "8D5E2A", "T14": "00A88F",
        "Cable1": "5291CE"
    ]

    private var exactLineColor: Color {
        if let hex = Self.svgExactHexByAssetName[line.assetName] {
            return Color(hex: hex)
        }
        return resolveLineColor(line.name, type: line.type)
    }

    var body: some View {
        ZStack {
            if AssetPresenceCache.exists(line.assetName) {
                if line.type == .tram || line.type == .cable {
                    let barColor = exactLineColor
                    let barHeight = size * 0.199

                    Color.white
                    VStack(spacing: 0) {
                        barColor.frame(height: barHeight)
                        Spacer(minLength: 0)
                        barColor.frame(height: barHeight)
                    }
                    Image(line.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size * 0.86, height: size * 0.86)
                } else {
                    exactLineColor
                    Image(line.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size * 0.86, height: size * 0.86)
                }
            } else {
                let bgColor = resolveLineColor(line.name, type: line.type)
                bgColor
                Text(line.name)
                    .font(.system(size: size * 0.36, weight: .black, design: .rounded))
                    .foregroundColor(contrastTextColor(for: bgColor, darkColor: Color(hex: "25303B")))
                    .lineLimit(1)
                    .minimumScaleFactor(0.55)
                    .padding(.horizontal, 4)
            }
        }
        .frame(width: size, height: size)
    }
}

struct StationBadgeView: View {
    let station: MapStation
    let isSelected: Bool
    var zoomLevel: StationMapZoomLevel = .detailed
    var focusedLine: StationLine? = nil
    var showStationName: Bool = true
    var isUnifiedHub: Bool = false
    var isMajorHub: Bool = false

    private static let balloonFrameColor = Color(
        UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? UIColor(red: 0.36, green: 0.37, blue: 0.39, alpha: 1.0)
                : UIColor(red: 0.44, green: 0.46, blue: 0.49, alpha: 1.0)
        }
    )

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

    private var allSelectedLines: [StationLine] {
        let activeLines: [StationLine]
        if FavoritesService.shared.isFavorite(stationId: station.id) {
            activeLines = station.lines
        } else {
            activeLines = station.lines.filter { MapDataService.shared.isLineTypeEnabled($0.type) }
        }
        let targetLines = isBusOnly ? sortedBusLines : activeLines.filter { $0.type != .bus }
        let base = targetLines.isEmpty ? nonBusLines : targetLines
        let sorted = base.sorted { a, b in
            StationLine.isOrderedBeforeForDisplay(a, b)
        }
        var seenIds = Set<String>()
        return sorted.filter { seenIds.insert($0.id).inserted }
    }

    private var displayedBannerLines: [StationLine] {
        if allSelectedLines.count <= 6 {
            return allSelectedLines
        }
        return Array(allSelectedLines.prefix(5))
    }

    private var overflowBannerCount: Int {
        allSelectedLines.count > 6 ? (allSelectedLines.count - 5) : 0
    }

    private var bannerTileCount: Int {
        max(1, displayedBannerLines.count + (overflowBannerCount > 0 ? 1 : 0))
    }

    private var selectedTileSize: CGFloat {
        switch bannerTileCount {
        case 1: return 50
        case 2...4: return 46
        case 5: return 44
        default: return 42
        }
    }

    private var primaryModeType: TransportType {
        focusedLine?.type ?? nonBusLines.first?.type ?? station.mainType
    }

    private var isModeIconZoom: Bool {
        if isBusOnly {
            return zoomLevel == .closeUp
        }
        return zoomLevel == .detailed || zoomLevel == .closeUp
    }

    private var showsSideLabel: Bool {
        guard showStationName else { return false }
        if isBusOnly {
            return zoomLevel == .closeUp
        }
        return zoomLevel != .minimal
    }

    private var dotColor: Color {
        if isBusOnly {
            if hasBusEnabled, let firstBus = sortedBusLines.first {
                return resolveLineColor(firstBus.name, type: firstBus.type)
            }
            return Color.gray
        }
        if let firstLine = focusedLine ?? nonBusLines.first {
            return resolveLineColor(firstLine.name, type: firstLine.type)
        }
        return Color.gray
    }

    /// Coordonnée exacte (dans la taille rendue de la vue) à aligner sur la coordonnée GPS de la station.
    func anchorPoint(in size: CGSize) -> CGPoint {
        if isSelected {
            // Top padding (6) + ballon (tileSize + border 4 + tail 8) + espace (2) + moitié du point d'ancrage (3.5)
            return CGPoint(x: size.width / 2.0, y: selectedTileSize + 23.5)
        }
        if !showsSideLabel {
            return CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        }
        if isModeIconZoom {
            let box: CGFloat = isBusOnly ? 20.0 : 24.0
            return CGPoint(x: 3.0 + box / 2.0, y: 3.0 + box / 2.0)
        }
        return CGPoint(x: 3.0 + 9.5 / 2.0, y: 3.0 + 2.5 + 9.5 / 2.0)
    }

    var body: some View {
        Group {
            if isSelected {
                selectedPinView
            } else if showsSideLabel {
                sideLabeledMarkerView
            } else {
                compactMarkerView
            }
        }
    }

    private var selectedPinView: some View {
        let tileSize = selectedTileSize
        let borderWidth: CGFloat = 2.0
        let tailHeight: CGFloat = 8.0
        let outerCornerRadius: CGFloat = 14.0
        let innerCornerRadius: CGFloat = 12.0
        let stripWidth = CGFloat(bannerTileCount) * tileSize
        let outerWidth = stripWidth + borderWidth * 2
        let outerHeight = tileSize + borderWidth * 2 + tailHeight

        return VStack(spacing: 0) {
            ZStack(alignment: .top) {
                AppleMapsPinBalloonShape(tailHeight: tailHeight, cornerRadius: outerCornerRadius)
                    .fill(Self.balloonFrameColor)
                    .shadow(color: Color.black.opacity(0.36), radius: 6, x: 0, y: 3)

                HStack(spacing: 0) {
                    if displayedBannerLines.isEmpty {
                        // Fallback si aucune ligne (ex: annotation départ/arrivée d'itinéraire) : asset mode officiel
                        ZStack {
                            Color.white
                            TransportTypeIcon(type: primaryModeType)
                                .frame(width: tileSize * 0.78, height: tileSize * 0.78)
                        }
                        .frame(width: tileSize, height: tileSize)
                    } else {
                        ForEach(Array(displayedBannerLines.enumerated()), id: \.element.id) { index, line in
                            SelectedLineTileView(line: line, size: tileSize)
                                .overlay(alignment: .leading) {
                                    if index > 0 {
                                        Rectangle()
                                            .fill(Color.black.opacity(0.16))
                                            .frame(width: 0.5)
                                    }
                                }
                        }
                        if overflowBannerCount > 0 {
                            ZStack {
                                Color(red: 0.22, green: 0.23, blue: 0.26)
                                Text("+\(overflowBannerCount)")
                                    .font(.system(size: tileSize * 0.34, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            .frame(width: tileSize, height: tileSize)
                            .overlay(alignment: .leading) {
                                Rectangle()
                                    .fill(Color.black.opacity(0.16))
                                    .frame(width: 0.5)
                            }
                        }
                    }
                }
                .frame(width: stripWidth, height: tileSize)
                .clipShape(RoundedRectangle(cornerRadius: innerCornerRadius, style: .continuous))
                .padding(.top, borderWidth)
            }
            .frame(width: outerWidth, height: outerHeight)

            Spacer().frame(height: 2)

            Circle()
                .fill(Self.balloonFrameColor)
                .frame(width: 7, height: 7)
                .overlay(
                    Circle()
                        .stroke(Color.black.opacity(0.35), lineWidth: 0.8)
                )

            Spacer().frame(height: 3)

            MapHaloText(
                text: station.name,
                font: .system(size: 13.0, weight: .bold),
                foregroundColor: .primary
            )

            if !allSelectedLines.isEmpty {
                Spacer().frame(height: 3)

                HStack(spacing: 3.5) {
                    ForEach(allSelectedLines.prefix(6), id: \.id) { line in
                        LineBadge(line: line, mini: false, customSize: 18)
                    }
                    if allSelectedLines.count > 6 {
                        Text("+\(allSelectedLines.count - 6)")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(.top, 6)
        .padding(.bottom, 4)
        .padding(.horizontal, 6)
    }

    private var sideLabeledMarkerView: some View {
        let linesToShow = isBusOnly ? Array(sortedBusLines.prefix(3)) : nonBusLines
        let extraBusCount = isBusOnly ? max(0, sortedBusLines.count - 3) : 0

        return HStack(alignment: .top, spacing: isModeIconZoom ? 5 : 4) {
            if isModeIconZoom {
                MapModeBadge(type: primaryModeType, size: isBusOnly ? 16 : 20)
            } else {
                Circle()
                    .fill(dotColor)
                    .frame(width: 9.5, height: 9.5)
                    .overlay(
                        Circle()
                            .stroke(Color.black.opacity(0.45), lineWidth: 1.0)
                    )
                    .padding(.top, 2.5)
            }

            VStack(alignment: .leading, spacing: 2) {
                MapHaloText(
                    text: station.name,
                    font: .system(
                        size: isBusOnly ? 10.0 : (isModeIconZoom ? 11.5 : 11.0),
                        weight: .bold
                    ),
                    foregroundColor: .primary
                )

                if !linesToShow.isEmpty {
                    HStack(spacing: 2.5) {
                        ForEach(linesToShow, id: \.id) { line in
                            LineBadge(line: line, mini: true, customSize: 15)
                        }
                        if extraBusCount > 0 {
                            Text("+\(extraBusCount)")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .padding(3)
    }

    @ViewBuilder
    private var compactMarkerView: some View {
        if isUnifiedHub {
            let dotSize: CGFloat = isMajorHub ? 13.0 : 10.5
            let strokeWidth: CGFloat = isMajorHub ? 2.4 : 2.0
            Circle()
                .fill(Color.white)
                .frame(width: dotSize, height: dotSize)
                .overlay(
                    Circle()
                        .stroke(Color(white: 0.12), lineWidth: strokeWidth)
                )
                .shadow(
                    color: Color.black.opacity(isMajorHub ? 0.45 : 0.32),
                    radius: isMajorHub ? 2.5 : 1.5,
                    x: 0,
                    y: 1
                )
                .padding(4)
        } else if isModeIconZoom && !isBusOnly {
            MapModeBadge(type: primaryModeType, size: 20)
                .padding(3)
        } else {
            let dotSize: CGFloat = isBusOnly ? 7.5 : (zoomLevel == .minimal ? 8.0 : 9.5)
            let strokeWidth: CGFloat = isBusOnly ? 0.9 : 1.0
            Circle()
                .fill(dotColor)
                .frame(width: dotSize, height: dotSize)
                .overlay(
                    Circle()
                        .stroke(Color.black.opacity(0.45), lineWidth: strokeWidth)
                )
                .padding(3)
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
            if AssetPresenceCache.exists(line.assetName) {
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
        contrastTextColor(for: color, darkColor: .black)
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

