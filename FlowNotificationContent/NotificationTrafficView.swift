import SwiftUI

struct NotificationTrafficView: View {
    let payload: TrafficNotificationPayload

    private var lineColor: Color {
        Color(hex: payload.lineColorHex)
    }

    private var textColor: Color {
        Color(hex: payload.textColorHex)
    }

    private var severityColor: Color {
        Color(hex: payload.severityColorHex)
    }

    private var lineTitle: String {
        let prefix = payload.transportTypeRaw == "Métro" ? "Métro" : payload.transportTypeRaw
        return "\(prefix) \(payload.lineId)"
    }

    private var formattedResumption: String {
        if let text = payload.resumptionText, !text.isEmpty {
            return text
        }
        guard let date = payload.resumptionDate else {
            return "Heure de reprise non communiquée"
        }
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "fr_FR")
        timeFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        timeFormatter.dateFormat = "HH:mm"
        let timeStr = timeFormatter.string(from: date)

        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Reprise estimée aujourd'hui à \(timeStr)"
        } else if calendar.isDateInTomorrow(date) {
            return "Reprise estimée demain à \(timeStr)"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "fr_FR")
            dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
            dateFormatter.dateFormat = "d MMM"
            return "Reprise estimée le \(dateFormatter.string(from: date)) à \(timeStr)"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            headerSection
            resumptionAndSectionBanner
            linePlanSection
            if !payload.message.isEmpty {
                Text(payload.message)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var headerSection: some View {
        HStack(spacing: 12) {
            lineBadge
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 8) {
                    Text(lineTitle)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    HStack(spacing: 4) {
                        Image(systemName: payload.severityIcon)
                            .font(.caption2.weight(.bold))
                        Text(payload.statusDescription)
                            .font(.system(.caption2, design: .rounded))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(severityColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(severityColor.opacity(0.14), in: Capsule())
                }

                Text(payload.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary.opacity(0.85))
                    .lineLimit(1)
            }
            Spacer(minLength: 0)
        }
    }

    @ViewBuilder
    private var lineBadge: some View {
        if let data = payload.logoPNGData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        } else {
            let isCircular = payload.transportTypeRaw == "Métro" && payload.lineId.count <= 2
            Text(payload.lineId)
                .font(.system(size: payload.lineId.count > 2 ? 13 : 16, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
                .padding(.horizontal, isCircular ? 0 : 10)
                .frame(minWidth: 38, minHeight: 38)
                .background(
                    Group {
                        if isCircular {
                            Circle().fill(lineColor)
                        } else {
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(lineColor)
                        }
                    }
                )
        }
    }

    private var resumptionAndSectionBanner: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(severityColor)
                Text(formattedResumption)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Spacer(minLength: 0)
            }

            if let section = payload.impactedSection, !section.isEmpty {
                HStack(spacing: 8) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.secondary)
                    Text(section)
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                    Spacer(minLength: 0)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(severityColor.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(severityColor.opacity(0.2), lineWidth: 1)
        )
    }

    @ViewBuilder
    private var linePlanSection: some View {
        if payload.stations.isEmpty {
            HStack(spacing: 10) {
                Circle()
                    .fill(lineColor)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 2)
                    .fill(lineColor)
                    .frame(height: 4)
                Circle()
                    .fill(lineColor)
                    .frame(width: 10, height: 10)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 12)
            .background(Color.primary.opacity(0.04), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        } else {
            let affectedCount = payload.stations.filter(\.isAffected).count
            let hasGridLayout = payload.edges != nil && payload.stations.allSatisfy { $0.col != nil && $0.row != nil }
            let rowCount = max(1, payload.rowCount ?? ((payload.stations.compactMap(\.row).max() ?? 0) + 1))

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(affectedCount > 0 ? "Plan de la ligne • \(affectedCount) arrêt\(affectedCount > 1 ? "s" : "") concerné\(affectedCount > 1 ? "s" : "")" : "Plan de la ligne")
                        .font(.system(.caption2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    Spacer()
                    if affectedCount == 0 {
                        Text("Ensemble de la ligne")
                            .font(.caption2.weight(.semibold))
                            .foregroundColor(severityColor)
                    }
                }

                if hasGridLayout, let edges = payload.edges {
                    NotificationSchematicPlanView(
                        stations: payload.stations,
                        edges: edges,
                        rowCount: rowCount,
                        lineColor: lineColor,
                        severityColor: severityColor,
                        severityIcon: payload.severityIcon,
                        affectedCount: affectedCount
                    )
                } else {
                    let focusStationId = payload.stations.first(where: \.isAffected)?.id ?? payload.stations.first?.id
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(alignment: .bottom, spacing: 0) {
                                ForEach(Array(payload.stations.enumerated()), id: \.element.id) { index, station in
                                    let isFirst = index == 0
                                    let isLast = index == payload.stations.count - 1
                                    let hasBefore = !isFirst
                                    let hasAfter = !isLast
                                    let beforeAffected = hasBefore && station.isAffected && payload.stations[index - 1].isAffected
                                    let afterAffected = hasAfter && station.isAffected && payload.stations[index + 1].isAffected

                                    NotificationStationNodeView(
                                        station: station,
                                        lineColor: lineColor,
                                        severityColor: severityColor,
                                        severityIcon: payload.severityIcon,
                                        hasLineBefore: hasBefore,
                                        hasLineAfter: hasAfter,
                                        isLineBeforeAffected: beforeAffected,
                                        isLineAfterAffected: afterAffected,
                                        hasPartialImpact: affectedCount > 0
                                    )
                                    .id(station.id)
                                }
                            }
                            .padding(.top, 20)
                            .padding(.leading, 14)
                            .padding(.trailing, 70)
                            .padding(.bottom, 12)
                        }
                        .frame(height: 155)
                        .background(Color.primary.opacity(0.04))
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                        )
                        .onAppear {
                            if let focusStationId {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                    proxy.scrollTo(focusStationId, anchor: .center)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

private struct NotificationSchematicPlanView: View {
    let stations: [TrafficNotificationPayload.StationNode]
    let edges: [TrafficNotificationPayload.SchematicEdge]
    let rowCount: Int
    let lineColor: Color
    let severityColor: Color
    let severityIcon: String
    let affectedCount: Int

    private let colSpacing: CGFloat = 38
    private let rowSpacing: CGFloat = 96
    private let topPadding: CGFloat = 94
    private let leftPadding: CGFloat = 24
    private let rightPadding: CGFloat = 90
    private let bottomPadding: CGFloat = 20

    private var maxCol: Int {
        stations.compactMap(\.col).max() ?? 0
    }

    private var effectiveRowCount: Int {
        max(1, rowCount, (stations.compactMap(\.row).max() ?? 0) + 1)
    }

    private var containerHeight: CGFloat {
        if effectiveRowCount <= 1 { return 140 }
        if effectiveRowCount == 2 { return 236 }
        return 290
    }

    private var focusCol: Int {
        if affectedCount > 0, let col = stations.first(where: \.isAffected)?.col {
            return col
        }
        if effectiveRowCount > 1 {
            var degreeById: [String: Int] = [:]
            for edge in edges {
                degreeById[edge.fromId, default: 0] += 1
                degreeById[edge.toId, default: 0] += 1
            }
            if let junctionCol = stations.first(where: { (degreeById[$0.id] ?? 0) >= 3 })?.col {
                return junctionCol
            }
            if let branchCol = stations.first(where: { ($0.row ?? 0) > 0 })?.col {
                return branchCol
            }
        }
        return maxCol / 2
    }

    var body: some View {
        let totalWidth = leftPadding + CGFloat(maxCol) * colSpacing + rightPadding
        let totalHeight = topPadding + CGFloat(effectiveRowCount - 1) * rowSpacing + bottomPadding

        let nodePositions: [String: CGPoint] = Dictionary(
            uniqueKeysWithValues: stations.compactMap { station in
                guard let col = station.col, let row = station.row else { return nil }
                let x = leftPadding + CGFloat(col) * colSpacing
                let y = topPadding + CGFloat(row) * rowSpacing
                return (station.id, CGPoint(x: x, y: y))
            }
        )

        let baseLineColor = affectedCount == 0 ? lineColor : lineColor.opacity(0.65)
        let normalDotColor = affectedCount == 0 ? lineColor : lineColor.opacity(0.75)

        ScrollViewReader { proxy in
            ScrollView(effectiveRowCount > 2 ? [.horizontal, .vertical] : .horizontal, showsIndicators: true) {
                ZStack(alignment: .topLeading) {
                    // Column anchor strip for ScrollViewReader
                    HStack(spacing: 0) {
                        ForEach(0...maxCol, id: \.self) { col in
                            Color.clear
                                .frame(width: colSpacing, height: 1)
                                .id("col_\(col)")
                        }
                    }
                    .padding(.leading, max(0, leftPadding - colSpacing / 2))

                    // Edges & IDFM rounded double-elbow junction connectors
                    Canvas { context, _ in
                        let sortedEdges = edges.filter { !$0.isAffected } + edges.filter { $0.isAffected }
                        for edge in sortedEdges {
                            guard let p1 = nodePositions[edge.fromId],
                                  let p2 = nodePositions[edge.toId] else {
                                continue
                            }

                            var path = Path()
                            if abs(p1.y - p2.y) < 0.5 {
                                path.move(to: p1)
                                path.addLine(to: p2)
                            } else {
                                let midX = (p1.x + p2.x) / 2
                                let r = min(14, abs(p2.x - p1.x) / 2, abs(p2.y - p1.y) / 2)
                                path.move(to: p1)
                                path.addArc(
                                    tangent1End: CGPoint(x: midX, y: p1.y),
                                    tangent2End: CGPoint(x: midX, y: p2.y),
                                    radius: r
                                )
                                path.addArc(
                                    tangent1End: CGPoint(x: midX, y: p2.y),
                                    tangent2End: p2,
                                    radius: r
                                )
                                path.addLine(to: p2)
                            }

                            let strokeColor = edge.isAffected ? severityColor : baseLineColor
                            let style = edge.isDashed
                                ? StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [4, 4])
                                : StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)

                            context.stroke(path, with: .color(strokeColor), style: style)
                        }
                    }
                    .frame(width: totalWidth, height: totalHeight)

                    // Station dots & rotated labels
                    ForEach(stations) { station in
                        if let pos = nodePositions[station.id] {
                            let dotSize: CGFloat = station.isTerminus ? 14 : 11

                            ZStack {
                                if station.isAffected {
                                    Circle()
                                        .fill(severityColor.opacity(0.22))
                                        .frame(width: dotSize + 7, height: dotSize + 7)
                                    Circle()
                                        .fill(severityColor)
                                        .frame(width: dotSize, height: dotSize)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 4, height: 4)
                                } else {
                                    Circle()
                                        .fill(Color(uiColor: .systemBackground))
                                        .frame(width: dotSize + 2, height: dotSize + 2)
                                    if station.isUnderConstruction {
                                        Circle()
                                            .strokeBorder(normalDotColor, style: StrokeStyle(lineWidth: 2, dash: [2.5, 2]))
                                            .frame(width: dotSize, height: dotSize)
                                    } else {
                                        Circle()
                                            .stroke(normalDotColor, lineWidth: station.isTerminus ? 3 : 2.5)
                                            .frame(width: dotSize, height: dotSize)
                                    }
                                }
                            }
                            .frame(width: 20, height: 20)
                            .offset(x: pos.x - 10, y: pos.y - 10)

                            HStack(spacing: 3) {
                                Text(station.name)
                                    .font(.system(size: 10.5, weight: (station.isAffected || station.isTerminus) ? .bold : .medium, design: .rounded))
                                    .foregroundColor(station.isAffected ? severityColor : (station.isUnderConstruction ? .secondary : .primary))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.85)
                                if station.isAffected {
                                    Image(systemName: severityIcon)
                                        .font(.system(size: 9, weight: .bold))
                                        .foregroundColor(severityColor)
                                }
                            }
                            .frame(width: 112, height: 16, alignment: .bottomLeading)
                            .rotationEffect(.degrees(-40), anchor: .bottomLeading)
                            .offset(x: pos.x - 3, y: pos.y - 25)
                        }
                    }
                }
                .frame(width: totalWidth, height: totalHeight, alignment: .topLeading)
            }
            .frame(height: containerHeight)
            .background(Color.primary.opacity(0.04))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.primary.opacity(0.08), lineWidth: 1)
            )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    proxy.scrollTo("col_\(focusCol)", anchor: .center)
                }
            }
        }
    }
}

private struct NotificationStationNodeView: View {
    let station: TrafficNotificationPayload.StationNode
    let lineColor: Color
    let severityColor: Color
    let severityIcon: String
    let hasLineBefore: Bool
    let hasLineAfter: Bool
    let isLineBeforeAffected: Bool
    let isLineAfterAffected: Bool
    let hasPartialImpact: Bool

    var body: some View {
        let normalLineColor = hasPartialImpact ? lineColor.opacity(0.65) : lineColor
        let normalDotColor = hasPartialImpact ? lineColor.opacity(0.75) : lineColor

        VStack(spacing: 0) {
            HStack(spacing: 3) {
                Text(station.name)
                    .font(.system(size: 11, weight: (station.isAffected || station.isTerminus) ? .bold : .medium, design: .rounded))
                    .foregroundColor(station.isAffected ? severityColor : (station.isUnderConstruction ? .secondary : .primary))
                    .lineLimit(1)
                    .fixedSize()
                if station.isAffected {
                    Image(systemName: severityIcon)
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(severityColor)
                }
            }
            .rotationEffect(.degrees(-42), anchor: .bottomLeading)
            .frame(width: 20, height: 95, alignment: .bottomLeading)
            .padding(.bottom, 4)

            ZStack {
                HStack(spacing: 0) {
                    if hasLineBefore {
                        Rectangle()
                            .fill(isLineBeforeAffected ? severityColor : normalLineColor)
                            .frame(width: 20, height: 5)
                    } else {
                        Spacer().frame(width: 20)
                    }

                    if hasLineAfter {
                        Rectangle()
                            .fill(isLineAfterAffected ? severityColor : normalLineColor)
                            .frame(width: 20, height: 5)
                    } else {
                        Spacer().frame(width: 20)
                    }
                }

                let dotSize: CGFloat = station.isTerminus ? 14 : 11
                ZStack {
                    if station.isAffected {
                        Circle()
                            .fill(severityColor.opacity(0.22))
                            .frame(width: dotSize + 7, height: dotSize + 7)
                        Circle()
                            .fill(severityColor)
                            .frame(width: dotSize, height: dotSize)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 4, height: 4)
                    } else {
                        Circle()
                            .fill(Color(uiColor: .systemBackground))
                            .frame(width: dotSize + 2, height: dotSize + 2)
                        Circle()
                            .stroke(normalDotColor, lineWidth: station.isTerminus ? 3 : 2.5)
                            .frame(width: dotSize, height: dotSize)
                    }
                }
            }
            .frame(height: 20)
        }
        .frame(width: 40)
    }
}
