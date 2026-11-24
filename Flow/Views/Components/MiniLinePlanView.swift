import SwiftUI

struct TimelineItem: Identifiable {
    let id: String
    let name: String
    let isAffected: Bool
    let isGap: Bool
    var isUnderConstruction: Bool = false
}

struct HorizontalTimelineCell: View {
    let item: TimelineItem
    let isAffected: Bool
    let lineColor: Color
    let severityColor: Color
    let severityIcon: String
    let hasLineBefore: Bool
    let hasLineAfter: Bool
    let isLineBeforeAffected: Bool
    let isLineAfterAffected: Bool
    var isLineBeforeDashed: Bool = false
    var isLineAfterDashed: Bool = false
    let normalOpacity: Double
    var isTerminus: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Station name at top, rotated at -45°
            if !item.isGap {
                HStack(spacing: 3) {
                    Text(item.name)
                        .font(.system(size: 11, weight: isAffected || isTerminus ? .bold : .medium, design: .rounded))
                        .foregroundColor(isAffected ? severityColor : (item.isUnderConstruction ? .secondary : .primary))
                        .lineLimit(1)
                        .fixedSize()
                    if isAffected {
                        Image(systemName: severityIcon)
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(severityColor)
                    }
                }
                .rotationEffect(.degrees(-45), anchor: .bottomLeading)
                .frame(width: 20, height: 105, alignment: .bottomLeading)
                .padding(.bottom, 6)
            } else {
                Text("...")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.secondary)
                    .frame(width: 20, height: 105, alignment: .bottom)
                    .padding(.bottom, 6)
            }
            
            // Horizontal timeline graphic (dot + line segments)
            ZStack {
                // Horizontal line segments
                HStack(spacing: 0) {
                    if hasLineBefore {
                        let beforeColor = isLineBeforeAffected ? severityColor : lineColor.opacity(normalOpacity)
                        if isLineBeforeDashed {
                            Canvas { context, size in
                                var path = Path()
                                path.move(to: CGPoint(x: 0, y: size.height / 2))
                                path.addLine(to: CGPoint(x: size.width, y: size.height / 2))
                                context.stroke(
                                    path,
                                    with: .color(beforeColor),
                                    style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [3, 3])
                                )
                            }
                            .frame(width: 19, height: 5)
                        } else {
                            Rectangle()
                                .fill(isLineBeforeAffected ? severityColor : lineColor)
                                .opacity(isLineBeforeAffected ? 1.0 : normalOpacity)
                                .frame(width: 19, height: 5)
                        }
                    } else {
                        Spacer().frame(width: 19)
                    }
                    
                    if hasLineAfter {
                        let afterColor = isLineAfterAffected ? severityColor : lineColor.opacity(normalOpacity)
                        if isLineAfterDashed {
                            Canvas { context, size in
                                var path = Path()
                                path.move(to: CGPoint(x: 0, y: size.height / 2))
                                path.addLine(to: CGPoint(x: size.width, y: size.height / 2))
                                context.stroke(
                                    path,
                                    with: .color(afterColor),
                                    style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [3, 3])
                                )
                            }
                            .frame(width: 19, height: 5)
                        } else {
                            Rectangle()
                                .fill(isLineAfterAffected ? severityColor : lineColor)
                                .opacity(isLineAfterAffected ? 1.0 : normalOpacity)
                                .frame(width: 19, height: 5)
                        }
                    } else {
                        Spacer().frame(width: 19)
                    }
                }
                
                // Dot
                if item.isGap {
                    HStack(spacing: 2) {
                        ForEach(0..<3, id: \.self) { _ in
                            Circle()
                                .fill(lineColor.opacity(normalOpacity))
                                .frame(width: 3, height: 3)
                        }
                    }
                } else {
                    let dotSize: CGFloat = isTerminus ? 15 : 12
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: dotSize + 2, height: dotSize + 2)
                        if isAffected {
                            Circle()
                                .fill(severityColor)
                                .frame(width: dotSize, height: dotSize)
                            if isTerminus {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 5, height: 5)
                            }
                        } else if item.isUnderConstruction {
                            Circle()
                                .strokeBorder(lineColor, style: StrokeStyle(lineWidth: 2, dash: [2.5, 2]))
                                .opacity(normalOpacity)
                                .frame(width: dotSize, height: dotSize)
                        } else {
                            Circle()
                                .stroke(lineColor, lineWidth: isTerminus ? 3 : 2.5)
                                .opacity(normalOpacity)
                                .frame(width: dotSize, height: dotSize)
                        }
                    }
                }
            }
            .frame(height: 20)
        }
        .frame(width: 38)
    }
}

struct MiniLinePlanView: View {
    let line: TransportLine
    let info: TrafficInfo
    
    @State private var lineData: LocalLineData?
    @State private var affectedStations: Set<String> = []
    @State private var isLoading = true
    @State private var showFullPlan = false
    
    var body: some View {
        Group {
            if isLoading {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                .frame(height: 140)
            } else if let data = lineData {
                planContentView(data: data)
            } else {
                MiniFallbackPlanView(line: line, info: info)
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    @ViewBuilder
    private func planContentView(data: LocalLineData) -> some View {
        if data.allStations.isEmpty {
            MiniFallbackPlanView(line: line, info: info)
        } else {
            let layout = data.schematicLayout
            let hasGridBranches = layout.rowCount > 1
            let resolvedLineColor = resolveLineColor(line.lineId, type: line.type)
            let normalOpacity = affectedStations.isEmpty ? 1.0 : 0.45
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Impact sur le plan de la ligne :")
                        .font(.caption).bold()
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Button {
                        showFullPlan = true
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                                .font(.system(size: 10, weight: .bold))
                            Text("Agrandir le plan")
                                .font(.system(size: 11, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(info.severity.color)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(info.severity.color.opacity(0.12), in: Capsule())
                    }
                    .buttonStyle(.plain)
                }
                
                if hasGridBranches {
                    let focusCol = SchematicGridPlanView.recommendedFocusCol(
                        layout: layout,
                        affectedStations: affectedStations
                    )
                    let containerHeight: CGFloat = layout.rowCount == 2 ? 236 : 310
                    ScrollViewReader { proxy in
                        ScrollView([.horizontal, .vertical], showsIndicators: true) {
                            SchematicGridPlanView(
                                layout: layout,
                                affectedStations: affectedStations,
                                lineColor: resolvedLineColor,
                                severityColor: info.severity.color,
                                severityIcon: info.severity.icon,
                                showTransfers: false
                            )
                        }
                        .frame(minHeight: 220, maxHeight: containerHeight)
                        .background(Color.primary.opacity(0.04))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                proxy.scrollTo("grid_col_\(focusCol)", anchor: .center)
                            }
                        }
                    }
                } else {
                    let timelineItems = buildTimeline(data: data)
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .bottom, spacing: 0) {
                            ForEach(Array(timelineItems.enumerated()), id: \.element.id) { index, item in
                                let isFirst = index == 0
                                let isLast = index == timelineItems.count - 1
                                
                                let hasLineBefore = !isFirst
                                let hasLineAfter = !isLast
                                
                                let isLineBeforeAffected = hasLineBefore && item.isAffected && timelineItems[index - 1].isAffected
                                let isLineAfterAffected = hasLineAfter && item.isAffected && timelineItems[index + 1].isAffected
                                
                                let isLineBeforeDashed = hasLineBefore && (item.isUnderConstruction || timelineItems[index - 1].isUnderConstruction)
                                let isLineAfterDashed = hasLineAfter && (item.isUnderConstruction || timelineItems[index + 1].isUnderConstruction)
                                
                                HorizontalTimelineCell(
                                    item: item,
                                    isAffected: item.isAffected,
                                    lineColor: resolvedLineColor,
                                    severityColor: info.severity.color,
                                    severityIcon: info.severity.icon,
                                    hasLineBefore: hasLineBefore,
                                    hasLineAfter: hasLineAfter,
                                    isLineBeforeAffected: isLineBeforeAffected,
                                    isLineAfterAffected: isLineAfterAffected,
                                    isLineBeforeDashed: isLineBeforeDashed,
                                    isLineAfterDashed: isLineAfterDashed,
                                    normalOpacity: normalOpacity,
                                    isTerminus: isFirst || isLast
                                )
                            }
                        }
                        .padding(.top, 24)
                        .padding(.leading, 16)
                        .padding(.trailing, 75)
                        .padding(.bottom, 14)
                    }
                    .frame(minHeight: 165)
                    .background(Color.primary.opacity(0.04))
                    .cornerRadius(14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
            }
            .sheet(isPresented: $showFullPlan) {
                NavigationStack {
                    VStack(spacing: 0) {
                        AccountSheetHeader(
                            title: "Plan de la ligne",
                            fontSize: 22,
                            buttonIcon: "xmark",
                            accessibilityLabel: "Fermer"
                        ) {
                            showFullPlan = false
                        }

                        LineSchematicPlanView(
                            line: line,
                            affectedStations: affectedStations,
                            severityColor: info.severity.color,
                            severityIcon: info.severity.icon
                        )
                    }
                    .liquidGlassBackground()
                    .toolbar(.hidden, for: .navigationBar)
                }
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
                .liquidGlassSheet()
            }
        }
    }
    
    private func loadData() {
        isLoading = true
        
        if let data = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId) {
            self.lineData = data
            
            var affected = Set<String>()
            
            if let stops = info.impactedStops {
                for stopName in stops {
                    for matched in data.allStations where matchesStation(matched.nom, apiName: stopName) {
                        affected.insert(matched.nom)
                    }
                }
            }
            
            if let impactedSection = info.impactedSection {
                let fromAndTo = parseSection(impactedSection)
                if let from = fromAndTo.from, let to = fromAndTo.to {
                    let graph = LineGraph(lineData: data)
                    if let path = graph.findPath(from: from, to: to) {
                        affected.formUnion(path)
                    }
                }
            }
            
            self.affectedStations = affected
        }
        
        self.isLoading = false
    }
    
    private func buildTimeline(data: LocalLineData) -> [TimelineItem] {
        let allStations = data.allStations
        if allStations.isEmpty { return [] }
        
        var items: [TimelineItem] = []
        var seen = Set<String>()
        
        for station in allStations {
            guard !seen.contains(station.nom) else { continue }
            seen.insert(station.nom)
            let isAffected = affectedStations.contains(station.nom)
            items.append(TimelineItem(id: "station-\(station.nom)", name: station.nom, isAffected: isAffected, isGap: false, isUnderConstruction: station.isUnderConstruction))
        }
        
        return items
    }
    
    private func matchesStation(_ localName: String, apiName: String) -> Bool {
        let localNorm = localName.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        let apiNorm = apiName.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        
        let localClean = localNorm.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        let apiClean = apiNorm.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        if localClean == apiClean { return true }
        if localClean.contains(apiClean) || apiClean.contains(localClean) { return true }
        
        let stopWords: Set<String> = [
            "gare", "mairie", "porte", "pont", "saint", "sainte", "rue",
            "avenue", "boulevard", "route", "de", "du", "des", "la",
            "le", "les", "et", "en", "sous", "sur", "aux", "au", "a"
        ]
        
        let localTokens = localNorm.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty && !stopWords.contains($0) }
            
        let apiTokens = apiNorm.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .map { $0.trimmingCharacters(in: CharacterSet.alphanumerics.inverted).lowercased() }
            .filter { !$0.isEmpty && !stopWords.contains($0) }
            
        if localTokens.isEmpty || apiTokens.isEmpty {
            return localClean.contains(apiClean) || apiClean.contains(localClean)
        }
        
        for apiTok in apiTokens {
            for localTok in localTokens {
                if apiTok == localTok ||
                   (apiTok.count >= 4 && localTok.starts(with: apiTok)) ||
                   (localTok.count >= 4 && apiTok.starts(with: localTok)) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func parseSection(_ sectionText: String) -> (from: String?, to: String?) {
        if sectionText.hasPrefix("De ") {
            let parts = sectionText.dropFirst(3).components(separatedBy: " à ")
            if parts.count >= 2 {
                return (parts[0], parts[1])
            }
        }
        let parts = sectionText.components(separatedBy: " - ")
        if parts.count >= 2 {
            return (parts[0], parts[1])
        }
        return (nil, nil)
    }
}

// MARK: - Branched Horizontal Timeline View (RER, Transilien, Metro 7/13, T4/T8)

struct BranchedHorizontalTimelineView: View {
    let sections: LocalLineData.SchematicSections
    let affectedStations: Set<String>
    let lineColor: Color
    let severityColor: Color
    let severityIcon: String
    let normalOpacity: Double
    
    private let rowHeight: CGFloat = 140
    private let rowSpacing: CGFloat = 14
    private let railOffsetFromBottom: CGFloat = 10
    private let connectorWidth: CGFloat = 56
    
    private var centralStations: [LocalStation] {
        var result: [LocalStation] = []
        result.append(contentsOf: sections.leadIn)
        result.append(contentsOf: sections.trunk)
        if sections.branches.isEmpty {
            result.append(contentsOf: sections.leadOut)
        }
        return result
    }
    
    private var maxBranchCount: Int {
        max(1, max(sections.topBranches.count, sections.branches.count))
    }
    
    private var totalHeight: CGFloat {
        CGFloat(maxBranchCount) * rowHeight + CGFloat(max(0, maxBranchCount - 1)) * rowSpacing
    }
    
    private func railY(for branchIndex: Int, totalBranches: Int) -> CGFloat {
        let blockHeight = CGFloat(totalBranches) * rowHeight + CGFloat(max(0, totalBranches - 1)) * rowSpacing
        let startY = (totalHeight - blockHeight) / 2.0
        return startY + CGFloat(branchIndex) * (rowHeight + rowSpacing) + (rowHeight - railOffsetFromBottom)
    }
    
    private var centerRailY: CGFloat {
        railY(for: 0, totalBranches: 1)
    }
    
    var body: some View {
        let central = centralStations
        let firstCentralAffected = central.first.map { affectedStations.contains($0.nom) } ?? false
        let lastCentralAffected = central.last.map { affectedStations.contains($0.nom) } ?? false
        
        HStack(alignment: .center, spacing: 0) {
            // === 1. Top/Left Branches (Merge into trunk) ===
            if !sections.topBranches.isEmpty {
                let maxStations = sections.topBranches.map { $0.stations.count }.max() ?? 0
                
                VStack(alignment: .trailing, spacing: rowSpacing) {
                    ForEach(Array(sections.topBranches.enumerated()), id: \.offset) { bIndex, branch in
                        let missingCount = max(0, maxStations - branch.stations.count)
                        
                        HStack(alignment: .bottom, spacing: 0) {
                            // Branch direction badge
                            Text(branch.name)
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .foregroundColor(lineColor)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(lineColor.opacity(0.14), in: Capsule())
                                .padding(.trailing, 8)
                                .offset(y: -3)
                            
                            if missingCount > 0 {
                                Spacer()
                                    .frame(width: CGFloat(missingCount) * 38)
                            }
                            
                            ForEach(Array(branch.stations.enumerated()), id: \.offset) { sIndex, station in
                                let isFirst = sIndex == 0
                                let isLast = sIndex == branch.stations.count - 1
                                let isAffected = affectedStations.contains(station.nom)
                                
                                let prevAffected = sIndex > 0 ? affectedStations.contains(branch.stations[sIndex - 1].nom) : false
                                let nextAffected = !isLast ? affectedStations.contains(branch.stations[sIndex + 1].nom) : firstCentralAffected
                                
                                let prevUnderConstruction = sIndex > 0 ? branch.stations[sIndex - 1].isUnderConstruction : false
                                let nextUnderConstruction = !isLast ? branch.stations[sIndex + 1].isUnderConstruction : (central.first?.isUnderConstruction ?? false)
                                
                                HorizontalTimelineCell(
                                    item: TimelineItem(id: "top-\(bIndex)-\(sIndex)-\(station.nom)", name: station.nom, isAffected: isAffected, isGap: false, isUnderConstruction: station.isUnderConstruction),
                                    isAffected: isAffected,
                                    lineColor: lineColor,
                                    severityColor: severityColor,
                                    severityIcon: severityIcon,
                                    hasLineBefore: !isFirst,
                                    hasLineAfter: true,
                                    isLineBeforeAffected: !isFirst && isAffected && prevAffected,
                                    isLineAfterAffected: isAffected && nextAffected,
                                    isLineBeforeDashed: !isFirst && (station.isUnderConstruction || prevUnderConstruction),
                                    isLineAfterDashed: station.isUnderConstruction || nextUnderConstruction,
                                    normalOpacity: normalOpacity,
                                    isTerminus: isFirst
                                )
                            }
                        }
                        .frame(height: rowHeight, alignment: .bottom)
                    }
                }
                .frame(height: totalHeight, alignment: .center)
                
                // Merge Bézier Curves
                Canvas { context, size in
                    let targetY = centerRailY
                    for i in 0..<sections.topBranches.count {
                        let sourceY = railY(for: i, totalBranches: sections.topBranches.count)
                        let branchLastAffected = sections.topBranches[i].stations.last.map { affectedStations.contains($0.nom) } ?? false
                        let curveAffected = branchLastAffected && firstCentralAffected
                        
                        var path = Path()
                        path.move(to: CGPoint(x: 0, y: sourceY))
                        path.addCurve(
                            to: CGPoint(x: size.width, y: targetY),
                            control1: CGPoint(x: size.width * 0.5, y: sourceY),
                            control2: CGPoint(x: size.width * 0.5, y: targetY)
                        )
                        
                        let strokeColor = curveAffected ? severityColor : lineColor.opacity(normalOpacity)
                        context.stroke(
                            path,
                            with: .color(strokeColor),
                            style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                        )
                    }
                }
                .frame(width: connectorWidth, height: totalHeight)
            }
            
            // === 2. Central Trunk ===
            if !central.isEmpty {
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(Array(central.enumerated()), id: \.offset) { sIndex, station in
                        let isFirst = sIndex == 0
                        let isLast = sIndex == central.count - 1
                        let isAffected = affectedStations.contains(station.nom)
                        
                        let hasBefore = !isFirst || !sections.topBranches.isEmpty
                        let hasAfter = !isLast || !sections.branches.isEmpty
                        
                        let anyTopLastAffected = sections.topBranches.contains { branch in
                            branch.stations.last.map { affectedStations.contains($0.nom) } ?? false
                        }
                        let anyBottomFirstAffected = sections.branches.contains { branch in
                            branch.stations.first.map { affectedStations.contains($0.nom) } ?? false
                        }
                        
                        let prevAffected = !isFirst ? affectedStations.contains(central[sIndex - 1].nom) : anyTopLastAffected
                        let nextAffected = !isLast ? affectedStations.contains(central[sIndex + 1].nom) : anyBottomFirstAffected
                        
                        let prevUnderConstruction = !isFirst ? central[sIndex - 1].isUnderConstruction : false
                        let nextUnderConstruction = !isLast ? central[sIndex + 1].isUnderConstruction : false
                        
                        HorizontalTimelineCell(
                            item: TimelineItem(id: "trunk-\(sIndex)-\(station.nom)", name: station.nom, isAffected: isAffected, isGap: false, isUnderConstruction: station.isUnderConstruction),
                            isAffected: isAffected,
                            lineColor: lineColor,
                            severityColor: severityColor,
                            severityIcon: severityIcon,
                            hasLineBefore: hasBefore,
                            hasLineAfter: hasAfter,
                            isLineBeforeAffected: hasBefore && isAffected && prevAffected,
                            isLineAfterAffected: hasAfter && isAffected && nextAffected,
                            isLineBeforeDashed: hasBefore && (station.isUnderConstruction || prevUnderConstruction),
                            isLineAfterDashed: hasAfter && (station.isUnderConstruction || nextUnderConstruction),
                            normalOpacity: normalOpacity,
                            isTerminus: (isFirst && sections.topBranches.isEmpty) || (isLast && sections.branches.isEmpty)
                        )
                    }
                }
                .frame(height: rowHeight, alignment: .bottom)
                .frame(height: totalHeight, alignment: .center)
            }
            
            // === 3. Bottom/Right Branches (Fork from trunk) ===
            if !sections.branches.isEmpty {
                // Fork Bézier Curves
                Canvas { context, size in
                    let sourceY = centerRailY
                    for i in 0..<sections.branches.count {
                        let targetY = railY(for: i, totalBranches: sections.branches.count)
                        let branchFirstAffected = sections.branches[i].stations.first.map { affectedStations.contains($0.nom) } ?? false
                        let curveAffected = lastCentralAffected && branchFirstAffected
                        
                        var path = Path()
                        path.move(to: CGPoint(x: 0, y: sourceY))
                        path.addCurve(
                            to: CGPoint(x: size.width, y: targetY),
                            control1: CGPoint(x: size.width * 0.5, y: sourceY),
                            control2: CGPoint(x: size.width * 0.5, y: targetY)
                        )
                        
                        let strokeColor = curveAffected ? severityColor : lineColor.opacity(normalOpacity)
                        context.stroke(
                            path,
                            with: .color(strokeColor),
                            style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                        )
                    }
                }
                .frame(width: connectorWidth, height: totalHeight)
                
                VStack(alignment: .leading, spacing: rowSpacing) {
                    ForEach(Array(sections.branches.enumerated()), id: \.offset) { bIndex, branch in
                        HStack(alignment: .bottom, spacing: 0) {
                            ForEach(Array(branch.stations.enumerated()), id: \.offset) { sIndex, station in
                                let isFirst = sIndex == 0
                                let isLast = sIndex == branch.stations.count - 1
                                let isAffected = affectedStations.contains(station.nom)
                                
                                let prevAffected = !isFirst ? affectedStations.contains(branch.stations[sIndex - 1].nom) : lastCentralAffected
                                let nextAffected = !isLast ? affectedStations.contains(branch.stations[sIndex + 1].nom) : false
                                
                                let prevUnderConstruction = !isFirst ? branch.stations[sIndex - 1].isUnderConstruction : (central.last?.isUnderConstruction ?? false)
                                let nextUnderConstruction = !isLast ? branch.stations[sIndex + 1].isUnderConstruction : false
                                
                                HorizontalTimelineCell(
                                    item: TimelineItem(id: "bot-\(bIndex)-\(sIndex)-\(station.nom)", name: station.nom, isAffected: isAffected, isGap: false, isUnderConstruction: station.isUnderConstruction),
                                    isAffected: isAffected,
                                    lineColor: lineColor,
                                    severityColor: severityColor,
                                    severityIcon: severityIcon,
                                    hasLineBefore: true,
                                    hasLineAfter: !isLast,
                                    isLineBeforeAffected: isAffected && prevAffected,
                                    isLineAfterAffected: !isLast && isAffected && nextAffected,
                                    isLineBeforeDashed: station.isUnderConstruction || prevUnderConstruction,
                                    isLineAfterDashed: !isLast && (station.isUnderConstruction || nextUnderConstruction),
                                    normalOpacity: normalOpacity,
                                    isTerminus: isLast
                                )
                            }
                            
                            // Branch direction badge at terminus
                            Text(branch.name)
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .foregroundColor(lineColor)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(lineColor.opacity(0.14), in: Capsule())
                                .padding(.leading, 8)
                                .offset(y: -3)
                        }
                        .frame(height: rowHeight, alignment: .bottom)
                    }
                }
                .frame(height: totalHeight, alignment: .center)
            }
        }
    }
}

struct MiniFallbackPlanView: View {
    let line: TransportLine
    let info: TrafficInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tronçon affecté :")
                .font(.caption).bold()
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 12) {
                if let section = info.impactedSection {
                    let fromAndTo = parseSection(section)
                    if let from = fromAndTo.from,
                       let to = fromAndTo.to {
                        
                        HStack(spacing: 12) {
                            VStack(spacing: 3) {
                                Circle()
                                    .fill(info.severity.color)
                                    .frame(width: 8, height: 8)
                                Rectangle()
                                    .fill(info.severity.color)
                                    .frame(width: 3, height: 26)
                                Circle()
                                    .fill(info.severity.color)
                                    .frame(width: 8, height: 8)
                            }
                            
                            VStack(alignment: .leading, spacing: 14) {
                                Text(from)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.primary)
                                Text(to)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            
                            Image(systemName: info.severity.icon)
                                .font(.title2)
                                .foregroundColor(info.severity.color)
                                .padding(.trailing, 10)
                        }
                        .padding()
                        .background(Color.primary.opacity(0.04))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(info.severity.color.opacity(0.3), lineWidth: 1)
                        )
                    }
                } else if let stops = info.impactedStops, !stops.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 6) {
                            Image(systemName: info.severity.icon)
                                .font(.caption)
                                .foregroundColor(info.severity.color)
                            Text("\(stops.count) arrêt(s) non desservi(s) :")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(info.severity.color)
                        }
                        
                        FlowLayout(spacing: 6) {
                            ForEach(stops, id: \.self) { stop in
                                Text(stop)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(info.severity.color)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(info.severity.color.opacity(0.12))
                                    .cornerRadius(6)
                            }
                        }
                    }
                    .padding()
                    .background(Color.primary.opacity(0.04))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(info.severity.color.opacity(0.3), lineWidth: 1)
                    )
                } else {
                    HStack(spacing: 8) {
                        Image(systemName: info.severity.icon)
                            .foregroundColor(info.severity.color)
                        Text("Perturbation sur l'ensemble de la ligne.")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .padding()
                    .background(Color.primary.opacity(0.04))
                    .cornerRadius(8)
                }
            }
        }
    }
    
    private func parseSection(_ sectionText: String) -> (from: String?, to: String?) {
        if sectionText.hasPrefix("De ") {
            let parts = sectionText.dropFirst(3).components(separatedBy: " à ")
            if parts.count >= 2 {
                return (parts[0], parts[1])
            }
        }
        let parts = sectionText.components(separatedBy: " - ")
        if parts.count >= 2 {
            return (parts[0], parts[1])
        }
        return (nil, nil)
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat
    
    init(spacing: CGFloat = 8) {
        self.spacing = spacing
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let width = proposal.width ?? 300
        
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0
        var maxRowWidth: CGFloat = 0
        
        for size in sizes {
            if currentX > 0 && currentX + size.width > width + 0.5 {
                maxRowWidth = max(maxRowWidth, currentX - spacing)
                currentX = 0
                currentY += rowHeight + spacing
                rowHeight = 0
            }
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
        maxRowWidth = max(maxRowWidth, currentX - spacing)
        
        let finalWidth = proposal.width ?? maxRowWidth
        return CGSize(width: finalWidth, height: currentY + rowHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let width = bounds.width
        
        var currentX: CGFloat = bounds.minX
        var currentY: CGFloat = bounds.minY
        var rowHeight: CGFloat = 0
        
        for index in subviews.indices {
            let size = sizes[index]
            if currentX > bounds.minX && currentX + size.width > bounds.minX + width + 0.5 {
                currentX = bounds.minX
                currentY += rowHeight + spacing
                rowHeight = 0
            }
            subviews[index].place(at: CGPoint(x: currentX, y: currentY), proposal: ProposedViewSize(size))
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}

struct SchematicGridPlanView: View {
    let layout: LocalLineData.SchematicLayout
    let affectedStations: Set<String>
    let lineColor: Color
    let severityColor: Color
    let severityIcon: String
    var showTransfers: Bool = false

    private var colSpacing: CGFloat { showTransfers ? 54 : 40 }
    private var rowSpacing: CGFloat { showTransfers ? 136 : 104 }
    private var topPadding: CGFloat { showTransfers ? 110 : 98 }
    private var leftPadding: CGFloat { showTransfers ? 34 : 28 }
    private var rightPadding: CGFloat { showTransfers ? 115 : 95 }
    private var bottomPadding: CGFloat { showTransfers ? 48 : 26 }

    static func recommendedFocusCol(
        layout: LocalLineData.SchematicLayout,
        affectedStations: Set<String>
    ) -> Int {
        if !affectedStations.isEmpty,
           let affectedNode = layout.nodes.first(where: { affectedStations.contains($0.station.nom) }) {
            return affectedNode.col
        }
        if let junctionNode = layout.nodes.first(where: \.isJunction) {
            return junctionNode.col
        }
        if let branchNode = layout.nodes.first(where: { $0.row > 0 }) {
            return branchNode.col
        }
        return max(0, layout.colCount / 2)
    }

    var body: some View {
        let maxCol = max(0, layout.colCount - 1)
        let effectiveRowCount = max(1, layout.rowCount)
        let totalWidth = leftPadding + CGFloat(maxCol) * colSpacing + rightPadding
        let totalHeight = topPadding + CGFloat(effectiveRowCount - 1) * rowSpacing + bottomPadding

        let normalOpacity: Double = affectedStations.isEmpty ? 1.0 : 0.55
        let baseLineColor = lineColor.opacity(normalOpacity)
        let normalDotColor = affectedStations.isEmpty ? lineColor : lineColor.opacity(0.75)

        let positions: [CGPoint] = layout.nodes.map { node in
            CGPoint(
                x: leftPadding + CGFloat(node.col) * colSpacing,
                y: topPadding + CGFloat(node.row) * rowSpacing
            )
        }

        ZStack(alignment: .topLeading) {
            // Column anchor strip for ScrollViewReader
            HStack(spacing: 0) {
                ForEach(0...maxCol, id: \.self) { col in
                    Color.clear
                        .frame(width: colSpacing, height: 1)
                        .id("grid_col_\(col)")
                }
            }
            .padding(.leading, max(0, leftPadding - colSpacing / 2))

            // Edges & IDFM rounded double-elbow junction connectors
            Canvas { context, _ in
                let isEdgeAffected: (LocalLineData.SchematicEdge) -> Bool = { edge in
                    let u = layout.nodes[edge.fromIndex].station.nom
                    let v = layout.nodes[edge.toIndex].station.nom
                    return affectedStations.contains(u) && affectedStations.contains(v)
                }

                let orderedEdges = layout.edges.filter { !isEdgeAffected($0) } + layout.edges.filter { isEdgeAffected($0) }
                let strokeWidth: CGFloat = showTransfers ? 6 : 5

                for edge in orderedEdges {
                    let p1 = positions[edge.fromIndex]
                    let p2 = positions[edge.toIndex]

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

                    let affected = isEdgeAffected(edge)
                    let strokeColor = affected ? severityColor : baseLineColor
                    let style = edge.isDashed
                        ? StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round, dash: [4, 4])
                        : StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round)

                    context.stroke(path, with: .color(strokeColor), style: style)
                }
            }
            .frame(width: totalWidth, height: totalHeight)

            // Station dots, rotated labels, and optional transfer icons
            ForEach(Array(layout.nodes.enumerated()), id: \.element.id) { idx, node in
                let pos = positions[idx]
                let isAffected = affectedStations.contains(node.station.nom)
                let dotSize: CGFloat = node.isTerminus ? (showTransfers ? 18 : 15) : (showTransfers ? 13 : 11)

                ZStack {
                    if isAffected {
                        Circle()
                            .fill(severityColor.opacity(0.22))
                            .frame(width: dotSize + 8, height: dotSize + 8)
                        Circle()
                            .fill(severityColor)
                            .frame(width: dotSize, height: dotSize)
                        Circle()
                            .fill(Color.white)
                            .frame(width: showTransfers ? 6 : 4.5, height: showTransfers ? 6 : 4.5)
                    } else if node.station.isUnderConstruction {
                        Circle()
                            .fill(Color(uiColor: .systemBackground))
                            .frame(width: dotSize + 2, height: dotSize + 2)
                        Circle()
                            .strokeBorder(normalDotColor, style: StrokeStyle(lineWidth: 2, dash: [2.5, 2]))
                            .frame(width: dotSize, height: dotSize)
                    } else if node.isTerminus {
                        Circle()
                            .fill(Color(uiColor: .systemBackground))
                            .frame(width: dotSize + 2, height: dotSize + 2)
                        Circle()
                            .stroke(normalDotColor, lineWidth: showTransfers ? 3.5 : 3)
                            .frame(width: dotSize, height: dotSize)
                    } else {
                        Circle()
                            .fill(Color(uiColor: .systemBackground))
                            .frame(width: dotSize + 2, height: dotSize + 2)
                        Circle()
                            .stroke(normalDotColor, lineWidth: showTransfers ? 2.5 : 2.2)
                            .frame(width: dotSize, height: dotSize)
                    }
                }
                .frame(width: 24, height: 24)
                .offset(x: pos.x - 12, y: pos.y - 12)

                HStack(spacing: 3) {
                    Text(node.station.nom)
                        .font(.system(size: showTransfers ? 11.5 : 10.5, weight: (isAffected || node.isTerminus || node.isJunction) ? .bold : .medium, design: .rounded))
                        .foregroundColor(isAffected ? severityColor : (node.station.isUnderConstruction ? .secondary : .primary))
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)
                    if isAffected {
                        Image(systemName: severityIcon)
                            .font(.system(size: showTransfers ? 10 : 9, weight: .bold))
                            .foregroundColor(severityColor)
                    }
                }
                .frame(width: showTransfers ? 128 : 114, height: 16, alignment: .bottomLeading)
                .rotationEffect(.degrees(-40), anchor: .bottomLeading)
                .offset(x: pos.x - 3, y: pos.y - 25)

                if showTransfers && !node.station.correspondances.isEmpty {
                    HStack(spacing: 2) {
                        ForEach(node.station.correspondances.prefix(3), id: \.self) { transfer in
                            TransferIcon(transferCode: transfer)
                                .scaleEffect(0.78)
                                .frame(width: 14, height: 14)
                        }
                    }
                    .frame(width: colSpacing - 4, alignment: .center)
                    .offset(x: pos.x - (colSpacing - 4) / 2, y: pos.y + 13)
                }
            }
        }
        .frame(width: totalWidth, height: totalHeight, alignment: .topLeading)
    }
}

struct LineGraph {
    var adjList: [String: Set<String>] = [:]
    
    init(lineData: LocalLineData) {
        let layout = lineData.schematicLayout
        
        func addEdge(_ u: String, _ v: String) {
            adjList[u, default: []].insert(v)
            adjList[v, default: []].insert(u)
        }
        
        for edge in layout.edges {
            let u = layout.nodes[edge.fromIndex].station.nom
            let v = layout.nodes[edge.toIndex].station.nom
            addEdge(u, v)
        }
    }
    
    func findPath(from startName: String, to endName: String) -> Set<String>? {
        guard let pathArray = findOrderedPath(from: startName, to: endName) else {
            return nil
        }
        return Set(pathArray)
    }
    
    func findOrderedPath(from startName: String, to endName: String) -> [String]? {
        guard let startKey = adjList.keys.first(where: { matchesStation($0, apiName: startName) }),
              let endKey = adjList.keys.first(where: { matchesStation($0, apiName: endName) }) else {
            return nil
        }
        
        var queue: [String] = [startKey]
        var visited: Set<String> = [startKey]
        var parent: [String: String] = [:]
        
        var found = false
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            if curr == endKey {
                found = true
                break
            }
            
            for neighbor in adjList[curr] ?? [] {
                if !visited.contains(neighbor) {
                    visited.insert(neighbor)
                    parent[neighbor] = curr
                    queue.append(neighbor)
                }
            }
        }
        
        if !found { return nil }
        
        var path: [String] = []
        var curr: String? = endKey
        while let c = curr {
            path.insert(c, at: 0)
            curr = parent[c]
        }
        return path
    }
    
    private func matchesStation(_ localName: String, apiName: String) -> Bool {
        let localNorm = localName.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        let apiNorm = apiName.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        
        let localClean = localNorm.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        let apiClean = apiNorm.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        if localClean == apiClean { return true }
        if localClean.contains(apiClean) || apiClean.contains(localClean) { return true }
        
        let stopWords: Set<String> = [
            "gare", "mairie", "porte", "pont", "saint", "sainte", "rue",
            "avenue", "boulevard", "route", "de", "du", "des", "la",
            "le", "les", "et", "en", "sous", "sur", "aux", "au", "a"
        ]
        
        let localTokens = localNorm.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty && !stopWords.contains($0) }
            
        let apiTokens = apiNorm.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .map { $0.trimmingCharacters(in: CharacterSet.alphanumerics.inverted).lowercased() }
            .filter { !$0.isEmpty && !stopWords.contains($0) }
            
        if localTokens.isEmpty || apiTokens.isEmpty {
            return localClean.contains(apiClean) || apiClean.contains(localClean)
        }
        
        for apiTok in apiTokens {
            for localTok in localTokens {
                if apiTok == localTok ||
                   (apiTok.count >= 4 && localTok.starts(with: apiTok)) ||
                   (localTok.count >= 4 && apiTok.starts(with: localTok)) {
                    return true
                }
            }
        }
        
        return false
    }
}
