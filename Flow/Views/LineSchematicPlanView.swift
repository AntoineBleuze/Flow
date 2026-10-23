import SwiftUI

struct LineSchematicPlanView: View {
    let line: TransportLine
    var affectedStations: Set<String> = []
    var severityColor: Color = .red
    var severityIcon: String = "exclamationmark.triangle.fill"
    
    @State private var lineData: LocalLineData?
    @State private var isLoading = true
    
    private let branchWidth: CGFloat = 175
    private let normalOpacity: Double = 1.0
    
    private var resolvedOpacity: Double {
        affectedStations.isEmpty ? 1.0 : 0.45
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            
            if isLoading {
                Spacer()
                ProgressView("Chargement du plan...")
                Spacer()
            } else if let data = lineData {
                let sections = data.schematicSections
                
                if sections.leadIn.isEmpty && sections.trunk.isEmpty && sections.topBranches.isEmpty && sections.branches.isEmpty {
                    emptyView
                } else {
                    let resolvedColor = resolveLineColor(line.lineId, type: line.type)
                    let hasBranches = !sections.topBranches.isEmpty || !sections.branches.isEmpty
                    let maxBranches = max(sections.topBranches.count, sections.branches.count)
                    
                    GeometryReader { geo in
                        let branchesSpanWidth = CGFloat(maxBranches) * branchWidth
                        // Center the central trunk track horizontally across the branches span (or viewport)
                        let trunkAxisX: CGFloat = maxBranches > 1
                            ? max((branchesSpanWidth - branchWidth) / 2.0 + 12.0, 25.0)
                            : 25.0
                        let contentWidth = max(branchesSpanWidth + 48, geo.size.width)
                        
                        ScrollViewReader { scrollProxy in
                            ScrollView(hasBranches ? [.vertical, .horizontal] : .vertical, showsIndicators: true) {
                                VStack(alignment: .leading, spacing: 0) {
                                    let hasLeadIn = !sections.leadIn.isEmpty
                                    let hasTrunk = !sections.trunk.isEmpty
                                    let hasTopBranches = !sections.topBranches.isEmpty
                                    let hasBottomBranches = !sections.branches.isEmpty
                                    let hasLeadOut = !sections.leadOut.isEmpty
                                    
                                    let centralFirstAffected = (sections.leadIn.first ?? sections.trunk.first).map { affectedStations.contains($0.nom) } ?? false
                                    let centralLastAffected = (sections.trunk.last ?? sections.leadIn.last).map { affectedStations.contains($0.nom) } ?? false
                                    
                                    let anyTopLastAffected = sections.topBranches.contains { branch in
                                        branch.stations.last.map { affectedStations.contains($0.nom) } ?? false
                                    }
                                    let anyBottomFirstAffected = sections.branches.contains { branch in
                                        branch.stations.first.map { affectedStations.contains($0.nom) } ?? false
                                    }
                                    
                                    // 1. Top Branches (Merging)
                                    if hasTopBranches {
                                        SchematicMergeView(
                                            branches: sections.topBranches,
                                            lineColor: resolvedColor,
                                            branchWidth: branchWidth,
                                            trunkCenterX: trunkAxisX,
                                            affectedStations: affectedStations,
                                            severityColor: severityColor,
                                            severityIcon: severityIcon,
                                            normalOpacity: resolvedOpacity,
                                            trunkFirstAffected: centralFirstAffected
                                        )
                                    }
                                    
                                    // 2. Lead-In
                                    if hasLeadIn {
                                        SchematicTrackSegment(
                                            stations: sections.leadIn,
                                            lineColor: resolvedColor,
                                            connectTop: hasTopBranches,
                                            connectBottom: hasTrunk || hasBottomBranches || hasLeadOut,
                                            trunkCenterX: trunkAxisX,
                                            affectedStations: affectedStations,
                                            severityColor: severityColor,
                                            severityIcon: severityIcon,
                                            normalOpacity: resolvedOpacity,
                                            externalTopAffected: anyTopLastAffected,
                                            externalBottomAffected: sections.trunk.first.map { affectedStations.contains($0.nom) } ?? anyBottomFirstAffected
                                        )
                                    }
                                    
                                    // 3. Main Trunk
                                    if hasTrunk {
                                        SchematicTrackSegment(
                                            stations: sections.trunk,
                                            lineColor: resolvedColor,
                                            connectTop: hasTopBranches || hasLeadIn,
                                            connectBottom: hasBottomBranches || hasLeadOut,
                                            trunkCenterX: trunkAxisX,
                                            affectedStations: affectedStations,
                                            severityColor: severityColor,
                                            severityIcon: severityIcon,
                                            normalOpacity: resolvedOpacity,
                                            externalTopAffected: hasLeadIn ? (sections.leadIn.last.map { affectedStations.contains($0.nom) } ?? false) : anyTopLastAffected,
                                            externalBottomAffected: hasBottomBranches ? anyBottomFirstAffected : (sections.leadOut.first.map { affectedStations.contains($0.nom) } ?? false),
                                            externalTopUnderConstruction: hasLeadIn ? (sections.leadIn.last?.isUnderConstruction ?? false) : false,
                                            idPrefix: "central_trunk"
                                        )
                                        .id("central_trunk_section")
                                    }
                                    
                                    // 4. Bottom Branches (Forking)
                                    if hasBottomBranches {
                                        SchematicForkView(
                                            branches: sections.branches,
                                            lineColor: resolvedColor,
                                            branchWidth: branchWidth,
                                            trunkCenterX: trunkAxisX,
                                            affectedStations: affectedStations,
                                            severityColor: severityColor,
                                            severityIcon: severityIcon,
                                            normalOpacity: resolvedOpacity,
                                            trunkLastAffected: centralLastAffected
                                        )
                                    }
                                    
                                    // 5. Lead-Out
                                    if hasLeadOut {
                                        SchematicTrackSegment(
                                            stations: sections.leadOut,
                                            lineColor: resolvedColor,
                                            connectTop: hasTrunk || hasBottomBranches || hasLeadIn || hasTopBranches,
                                            connectBottom: false,
                                            trunkCenterX: trunkAxisX,
                                            affectedStations: affectedStations,
                                            severityColor: severityColor,
                                            severityIcon: severityIcon,
                                            normalOpacity: resolvedOpacity,
                                            externalTopAffected: centralLastAffected,
                                            externalBottomAffected: false
                                        )
                                    }
                                }
                                .padding(.vertical, 32)
                                .padding(.trailing, 48)
                                .frame(minWidth: contentWidth, alignment: hasBranches ? .center : .leading)
                            }
                            .onAppear {
                                if hasBranches && !sections.trunk.isEmpty {
                                    let midIndex = sections.trunk.count / 2
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                        withAnimation(.easeOut(duration: 0.25)) {
                                            scrollProxy.scrollTo("central_trunk_\(midIndex)", anchor: .center)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                emptyView
            }
        }
        .liquidGlassBackground()
        .navigationTitle("Plan de la ligne")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadLocalData()
        }
    }
    
    private var emptyView: some View {
        VStack(spacing: 12) {
            Spacer()
            Image(systemName: "map.fill")
                .font(.largeTitle)
                .foregroundColor(.secondary)
            Text("Plan indisponible pour cette ligne.")
                .foregroundColor(.secondary)
            Spacer()
        }
    }
    
    private var headerView: some View {
        HStack(spacing: 16) {
            Image(line.assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .shadow(color: .black.opacity(0.1), radius: 5)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(line.type.rawValue) \(line.lineId)")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
                if !affectedStations.isEmpty {
                    HStack(spacing: 5) {
                        Image(systemName: severityIcon)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(severityColor)
                        Text("\(affectedStations.count) station(s) impactée(s)")
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(severityColor)
                    }
                } else {
                    Text("Schéma de la ligne")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
    }
    
    private func loadLocalData() {
        self.lineData = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId)
        self.isLoading = false
    }
}

// MARK: - Subviews for Schematic Rendering

struct SchematicTrackSegmentBar: View {
    let isVisible: Bool
    let color: Color
    let width: CGFloat
    var isDashed: Bool = false
    
    var body: some View {
        if !isVisible {
            Color.clear.frame(width: width)
        } else if isDashed {
            Canvas { context, size in
                var path = Path()
                path.move(to: CGPoint(x: size.width / 2, y: 0))
                path.addLine(to: CGPoint(x: size.width / 2, y: size.height))
                context.stroke(
                    path,
                    with: .color(color),
                    style: StrokeStyle(lineWidth: width * 0.85, lineCap: .round, dash: [5, 5])
                )
            }
            .frame(width: width)
        } else {
            Rectangle()
                .fill(color)
                .frame(width: width)
        }
    }
}

struct SchematicTrackSegment: View {
    let stations: [LocalStation]
    let lineColor: Color
    let connectTop: Bool
    let connectBottom: Bool
    var trunkCenterX: CGFloat = 25
    var affectedStations: Set<String> = []
    var severityColor: Color = .red
    var severityIcon: String = "exclamationmark.triangle.fill"
    var normalOpacity: Double = 1.0
    var externalTopAffected: Bool = false
    var externalBottomAffected: Bool = false
    var externalTopUnderConstruction: Bool = false
    var externalBottomUnderConstruction: Bool = false
    var idPrefix: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(stations.enumerated()), id: \.offset) { index, station in
                let isFirst = index == 0
                let isLast = index == stations.count - 1
                let isTerminus = (isFirst && !connectTop) || (isLast && !connectBottom)
                let isAffected = affectedStations.contains(station.nom)
                let isUnderConstruction = station.isUnderConstruction
                
                let hasTop = !(isFirst && !connectTop)
                let hasBottom = !(isLast && !connectBottom)
                
                let prevAffected = !isFirst ? affectedStations.contains(stations[index - 1].nom) : externalTopAffected
                let nextAffected = !isLast ? affectedStations.contains(stations[index + 1].nom) : externalBottomAffected
                
                let prevUnderConstruction = !isFirst ? stations[index - 1].isUnderConstruction : externalTopUnderConstruction
                let nextUnderConstruction = !isLast ? stations[index + 1].isUnderConstruction : externalBottomUnderConstruction
                
                let topSegmentAffected = hasTop && isAffected && prevAffected
                let bottomSegmentAffected = hasBottom && isAffected && nextAffected
                
                let topDashed = isUnderConstruction || prevUnderConstruction
                let bottomDashed = isUnderConstruction || nextUnderConstruction
                
                HStack(alignment: .center, spacing: 16) {
                    // Track & Dot
                    ZStack {
                        VStack(spacing: 0) {
                            SchematicTrackSegmentBar(
                                isVisible: hasTop,
                                color: topSegmentAffected ? severityColor : lineColor.opacity(normalOpacity),
                                width: 8,
                                isDashed: topDashed
                            )
                            
                            SchematicTrackSegmentBar(
                                isVisible: hasBottom,
                                color: bottomSegmentAffected ? severityColor : lineColor.opacity(normalOpacity),
                                width: 8,
                                isDashed: bottomDashed
                            )
                        }
                        
                        SchematicDot(
                            isTerminus: isTerminus,
                            hasTransfers: !station.correspondances.isEmpty,
                            lineColor: lineColor,
                            isAffected: isAffected,
                            severityColor: severityColor,
                            normalOpacity: normalOpacity,
                            isUnderConstruction: isUnderConstruction
                        )
                    }
                    .frame(width: 50)
                    
                    // Info
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 6) {
                            Text(station.nom)
                                .font(.system(size: isTerminus ? 17 : 15, weight: isTerminus || isAffected || !station.correspondances.isEmpty ? .bold : .medium, design: .rounded))
                                .foregroundColor(isAffected ? severityColor : (isUnderConstruction ? .secondary : .primary))
                                .fixedSize(horizontal: true, vertical: false)
                            
                            if isUnderConstruction {
                                Text("En travaux")
                                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                                    .foregroundColor(lineColor)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(lineColor.opacity(0.12), in: Capsule())
                            }
                            
                            if isAffected {
                                Image(systemName: severityIcon)
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(severityColor)
                            }
                        }
                        
                        if !station.correspondances.isEmpty {
                            HStack(spacing: 5) {
                                ForEach(station.correspondances, id: \.self) { transfer in
                                    TransferIcon(transferCode: transfer)
                                }
                            }
                        }
                    }
                    .padding(.vertical, 12)
                    
                    Spacer(minLength: 0)
                }
                .frame(minHeight: 56)
                .id(idPrefix.map { "\($0)_\(index)" } ?? "station_\(station.nom)_\(index)")
            }
        }
        .padding(.leading, 16 + max(0, trunkCenterX - 25))
    }
}

struct SchematicDot: View {
    let isTerminus: Bool
    let hasTransfers: Bool
    let lineColor: Color
    var isAffected: Bool = false
    var severityColor: Color = .red
    var normalOpacity: Double = 1.0
    var isCompact: Bool = false
    var isUnderConstruction: Bool = false
    
    var body: some View {
        let baseSize: CGFloat = isCompact ? (isTerminus ? 16 : 12) : (isTerminus ? 22 : (hasTransfers ? 16 : 12))
        let innerSize: CGFloat = isCompact ? 6 : 8
        
        ZStack {
            Circle()
                .fill(.ultraThinMaterial)
                .frame(width: baseSize + 2, height: baseSize + 2)
            
            if isAffected {
                Circle()
                    .fill(severityColor)
                    .frame(width: baseSize, height: baseSize)
                if isTerminus {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: innerSize, height: innerSize)
                }
            } else if isUnderConstruction {
                Circle()
                    .strokeBorder(lineColor, style: StrokeStyle(lineWidth: isCompact ? 2 : 2.5, dash: [3, 2]))
                    .background(Circle().fill(.ultraThinMaterial))
                    .opacity(normalOpacity)
                    .frame(width: baseSize, height: baseSize)
            } else if isTerminus {
                Circle()
                    .strokeBorder(Color.primary, lineWidth: isCompact ? 3 : 4)
                    .background(Circle().fill(lineColor))
                    .opacity(normalOpacity)
                    .frame(width: baseSize, height: baseSize)
            } else if hasTransfers {
                Circle()
                    .strokeBorder(Color.primary, lineWidth: isCompact ? 2.5 : 3)
                    .background(Circle().fill(.ultraThinMaterial))
                    .opacity(normalOpacity)
                    .frame(width: baseSize, height: baseSize)
            } else {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: innerSize, height: innerSize)
                    .overlay(
                        Circle()
                            .stroke(lineColor, lineWidth: 2)
                            .opacity(normalOpacity)
                    )
            }
        }
    }
}

// MARK: - Top Merging Branches (e.g. RER A West, RER B North, RER C North)

struct SchematicMergeView: View {
    let branches: [LocalLineData.SchematicBranch]
    let lineColor: Color
    let branchWidth: CGFloat
    var trunkCenterX: CGFloat = 25
    var affectedStations: Set<String> = []
    var severityColor: Color = .red
    var severityIcon: String = "exclamationmark.triangle.fill"
    var normalOpacity: Double = 1.0
    var trunkFirstAffected: Bool = false
    
    var body: some View {
        let branchesSpan = CGFloat(branches.count) * branchWidth
        let branchGroupOffset = max(0, trunkCenterX - ((branchesSpan - branchWidth) / 2.0 + 12.0))
        let canvasWidth = max(branchesSpan + branchGroupOffset, trunkCenterX) + 50
        
        VStack(alignment: .leading, spacing: 0) {
            // Parallel Branches aligned at bottom (just above the merge curves)
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(Array(branches.enumerated()), id: \.offset) { bIndex, branch in
                    VStack(alignment: .leading, spacing: 0) {
                        // Branch Direction Badge
                        Text(branch.name)
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .foregroundColor(lineColor)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 4)
                            .background(lineColor.opacity(0.14), in: Capsule())
                            .padding(.bottom, 8)
                        
                        ForEach(Array(branch.stations.enumerated()), id: \.offset) { sIndex, station in
                            let isFirst = sIndex == 0
                            let isLast = sIndex == branch.stations.count - 1
                            let isAffected = affectedStations.contains(station.nom)
                            let isUnderConstruction = station.isUnderConstruction
                            
                            let prevAffected = !isFirst ? affectedStations.contains(branch.stations[sIndex - 1].nom) : false
                            let nextAffected = !isLast ? affectedStations.contains(branch.stations[sIndex + 1].nom) : trunkFirstAffected
                            
                            let prevUnderConstruction = !isFirst ? branch.stations[sIndex - 1].isUnderConstruction : false
                            let nextUnderConstruction = !isLast ? branch.stations[sIndex + 1].isUnderConstruction : false
                            
                            HStack(alignment: .center, spacing: 8) {
                                ZStack {
                                    VStack(spacing: 0) {
                                        SchematicTrackSegmentBar(
                                            isVisible: !isFirst,
                                            color: (isAffected && prevAffected) ? severityColor : lineColor.opacity(normalOpacity),
                                            width: 6,
                                            isDashed: isUnderConstruction || prevUnderConstruction
                                        )
                                        SchematicTrackSegmentBar(
                                            isVisible: true,
                                            color: (isAffected && nextAffected) ? severityColor : lineColor.opacity(normalOpacity),
                                            width: 6,
                                            isDashed: isUnderConstruction || nextUnderConstruction
                                        )
                                    }
                                    SchematicDot(
                                        isTerminus: isFirst,
                                        hasTransfers: !station.correspondances.isEmpty,
                                        lineColor: lineColor,
                                        isAffected: isAffected,
                                        severityColor: severityColor,
                                        normalOpacity: normalOpacity,
                                        isCompact: true,
                                        isUnderConstruction: isUnderConstruction
                                    )
                                }
                                .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    HStack(spacing: 4) {
                                        Text(station.nom)
                                            .font(.system(size: isFirst ? 12.5 : 11.5, weight: isFirst || isAffected ? .bold : .medium, design: .rounded))
                                            .foregroundColor(isAffected ? severityColor : (isUnderConstruction ? .secondary : .primary))
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                        
                                        if isAffected {
                                            Image(systemName: severityIcon)
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(severityColor)
                                        }
                                    }
                                    
                                    if !station.correspondances.isEmpty {
                                        HStack(spacing: 3) {
                                            ForEach(station.correspondances.prefix(4), id: \.self) { transfer in
                                                TransferIcon(transferCode: transfer)
                                                    .scaleEffect(0.8)
                                                    .frame(width: 14, height: 14)
                                            }
                                        }
                                    }
                                }
                                .frame(width: branchWidth - 36, alignment: .leading)
                                .padding(.vertical, 6)
                            }
                            .frame(minHeight: 46)
                        }
                    }
                    .frame(width: branchWidth, alignment: .leading)
                }
            }
            .padding(.leading, 16 + branchGroupOffset)
            
            // Merge Curve Canvas
            Canvas { context, size in
                let targetX: CGFloat = trunkCenterX
                for i in 0..<branches.count {
                    let sourceX = branchGroupOffset + CGFloat(i) * branchWidth + 12 // Center of the 24pt wide branch track
                    let branchLastAffected = branches[i].stations.last.map { affectedStations.contains($0.nom) } ?? false
                    let curveAffected = branchLastAffected && trunkFirstAffected
                    
                    var path = Path()
                    path.move(to: CGPoint(x: sourceX, y: 0))
                    path.addCurve(
                        to: CGPoint(x: targetX, y: size.height),
                        control1: CGPoint(x: sourceX, y: size.height * 0.55),
                        control2: CGPoint(x: targetX, y: size.height * 0.45)
                    )
                    
                    let strokeColor = curveAffected ? severityColor : lineColor.opacity(normalOpacity)
                    context.stroke(
                        path,
                        with: .color(strokeColor),
                        style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round)
                    )
                }
            }
            .frame(width: canvasWidth, height: 48)
            .padding(.leading, 16)
        }
    }
}

// MARK: - Bottom Forking Branches (e.g. Metro 7, Metro 13, RER, Transilien)

struct SchematicForkView: View {
    let branches: [LocalLineData.SchematicBranch]
    let lineColor: Color
    let branchWidth: CGFloat
    var trunkCenterX: CGFloat = 25
    var affectedStations: Set<String> = []
    var severityColor: Color = .red
    var severityIcon: String = "exclamationmark.triangle.fill"
    var normalOpacity: Double = 1.0
    var trunkLastAffected: Bool = false
    
    var body: some View {
        let branchesSpan = CGFloat(branches.count) * branchWidth
        let branchGroupOffset = max(0, trunkCenterX - ((branchesSpan - branchWidth) / 2.0 + 12.0))
        let canvasWidth = max(branchesSpan + branchGroupOffset, trunkCenterX) + 50
        
        VStack(alignment: .leading, spacing: 0) {
            // Fork Curve Canvas
            Canvas { context, size in
                let sourceX: CGFloat = trunkCenterX
                for i in 0..<branches.count {
                    let targetX = branchGroupOffset + CGFloat(i) * branchWidth + 12 // Center of the 24pt wide branch track
                    let branchFirstAffected = branches[i].stations.first.map { affectedStations.contains($0.nom) } ?? false
                    let curveAffected = trunkLastAffected && branchFirstAffected
                    
                    var path = Path()
                    path.move(to: CGPoint(x: sourceX, y: 0))
                    path.addCurve(
                        to: CGPoint(x: targetX, y: size.height),
                        control1: CGPoint(x: sourceX, y: size.height * 0.45),
                        control2: CGPoint(x: targetX, y: size.height * 0.55)
                    )
                    
                    let strokeColor = curveAffected ? severityColor : lineColor.opacity(normalOpacity)
                    context.stroke(
                        path,
                        with: .color(strokeColor),
                        style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round)
                    )
                }
            }
            .frame(width: canvasWidth, height: 48)
            .padding(.leading, 16)
            
            // Parallel Branches aligned at top (just below the fork curves)
            HStack(alignment: .top, spacing: 0) {
                ForEach(Array(branches.enumerated()), id: \.offset) { bIndex, branch in
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(branch.stations.enumerated()), id: \.offset) { sIndex, station in
                            let isFirst = sIndex == 0
                            let isLast = sIndex == branch.stations.count - 1
                            let isAffected = affectedStations.contains(station.nom)
                            let isUnderConstruction = station.isUnderConstruction
                            
                            let prevAffected = !isFirst ? affectedStations.contains(branch.stations[sIndex - 1].nom) : trunkLastAffected
                            let nextAffected = !isLast ? affectedStations.contains(branch.stations[sIndex + 1].nom) : false
                            
                            let prevUnderConstruction = !isFirst ? branch.stations[sIndex - 1].isUnderConstruction : false
                            let nextUnderConstruction = !isLast ? branch.stations[sIndex + 1].isUnderConstruction : false
                            
                            HStack(alignment: .center, spacing: 8) {
                                ZStack {
                                    VStack(spacing: 0) {
                                        SchematicTrackSegmentBar(
                                            isVisible: true,
                                            color: (isAffected && prevAffected) ? severityColor : lineColor.opacity(normalOpacity),
                                            width: 6,
                                            isDashed: isUnderConstruction || prevUnderConstruction
                                        )
                                        SchematicTrackSegmentBar(
                                            isVisible: !isLast,
                                            color: (isAffected && nextAffected) ? severityColor : lineColor.opacity(normalOpacity),
                                            width: 6,
                                            isDashed: isUnderConstruction || nextUnderConstruction
                                        )
                                    }
                                    SchematicDot(
                                        isTerminus: isLast,
                                        hasTransfers: !station.correspondances.isEmpty,
                                        lineColor: lineColor,
                                        isAffected: isAffected,
                                        severityColor: severityColor,
                                        normalOpacity: normalOpacity,
                                        isCompact: true,
                                        isUnderConstruction: isUnderConstruction
                                    )
                                }
                                .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    HStack(spacing: 4) {
                                        Text(station.nom)
                                            .font(.system(size: isLast ? 12.5 : 11.5, weight: isLast || isAffected ? .bold : .medium, design: .rounded))
                                            .foregroundColor(isAffected ? severityColor : (isUnderConstruction ? .secondary : .primary))
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                        
                                        if isAffected {
                                            Image(systemName: severityIcon)
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(severityColor)
                                        }
                                    }
                                    
                                    if !station.correspondances.isEmpty {
                                        HStack(spacing: 3) {
                                            ForEach(station.correspondances.prefix(4), id: \.self) { transfer in
                                                TransferIcon(transferCode: transfer)
                                                    .scaleEffect(0.8)
                                                    .frame(width: 14, height: 14)
                                            }
                                        }
                                    }
                                }
                                .frame(width: branchWidth - 36, alignment: .leading)
                                .padding(.vertical, 6)
                            }
                            .frame(minHeight: 46)
                        }
                        
                        // Branch Direction Badge at terminus
                        Text(branch.name)
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .foregroundColor(lineColor)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 4)
                            .background(lineColor.opacity(0.14), in: Capsule())
                            .padding(.top, 8)
                    }
                    .frame(width: branchWidth, alignment: .leading)
                }
            }
            .padding(.leading, 16 + branchGroupOffset)
        }
    }
}

struct TransferIcon: View {
    let transferCode: String
    
    var body: some View {
        let (mode, label) = parseTransfer(transferCode)
        let assetName = TransportType.getAssetName(mode: mode, label: label)
        
        if !assetName.isEmpty, UIImage(named: assetName) != nil {
            Image(assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
        } else {
            Text(label)
                .font(.system(size: 9, weight: .bold, design: .rounded))
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(4)
        }
    }
    
    private func parseTransfer(_ code: String) -> (String, String) {
        let upper = code.uppercased()
        if upper.hasPrefix("M") && upper.count > 1 && (upper.dropFirst().first?.isNumber == true) {
            return ("metro", String(code.dropFirst()))
        } else if upper.hasPrefix("RER ") {
            return ("rer", String(code.dropFirst(4)))
        } else if upper.hasPrefix("T") && upper.count > 1 && (upper.dropFirst().first?.isNumber == true) {
            return ("tram", code)
        } else if ["H", "J", "K", "L", "N", "P", "R", "U", "V"].contains(upper) {
            return ("transilien", upper)
        } else if upper.contains("ORLYVAL") || upper.contains("CDGVAL") {
            return ("train", code)
        } else if upper.hasPrefix("C") && upper.count == 2 && upper.last?.isNumber == true {
            return ("cable", String(code.dropFirst()))
        }
        return ("unknown", code)
    }
}
