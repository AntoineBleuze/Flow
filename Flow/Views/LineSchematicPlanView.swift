import SwiftUI
import Combine

struct LineSchematicPlanView: View {
    let line: TransportLine
    @State private var lineData: LocalLineData?
    @State private var isLoading = true
    @State private var errorMessage: String? = nil
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            ZStack {
                let lineColor = resolveLineColor(line.lineId, type: line.type)
                ShaderAnimationView(isLoading: false, customColors: [lineColor])
                (colorScheme == .dark ? Color.black.opacity(0.05) : Color.white.opacity(0.05))
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
            
            if isLoading {
                VStack {
                    ProgressView()
                        .scaleEffect(1.5)
                    Text("Chargement du plan...")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
            } else if let data = lineData {
                let sections = data.schematicSections
                let lineColor = resolveLineColor(line.lineId, type: line.type)
                
                let maxBranches = max(sections.topBranches.count, sections.branches.count)
                let hasBranches = maxBranches > 0
                let branchWidth: CGFloat = 160
                let contentWidth = hasBranches ? CGFloat(maxBranches) * branchWidth + 40 : 350
                
                Group {
                    if hasBranches {
                        ScrollView([.vertical, .horizontal], showsIndicators: true) {
                            VStack(alignment: .leading, spacing: 0) {
                                // === Top Branches (Merge) ===
                                if !sections.topBranches.isEmpty {
                                    SchematicMergeView(
                                        branches: sections.topBranches,
                                        lineColor: lineColor,
                                        branchWidth: branchWidth,
                                        contentWidth: contentWidth
                                    )
                                }
                                
                                // === Lead-in stations ===
                                if !sections.leadIn.isEmpty {
                                    SchematicTrackSegment(
                                        stations: sections.leadIn,
                                        lineColor: lineColor,
                                        capTop: sections.topBranches.isEmpty,
                                        capBottom: false
                                    )
                                }
                                
                                // === Trunk stations ===
                                if !sections.trunk.isEmpty {
                                    SchematicTrackSegment(
                                        stations: sections.trunk,
                                        lineColor: lineColor,
                                        capTop: sections.leadIn.isEmpty && sections.topBranches.isEmpty,
                                        capBottom: sections.branches.isEmpty && sections.leadOut.isEmpty
                                    )
                                }
                                
                                // === Fork & Branches ===
                                if !sections.branches.isEmpty {
                                    SchematicForkView(
                                        branches: sections.branches,
                                        lineColor: lineColor,
                                        branchWidth: branchWidth,
                                        contentWidth: contentWidth
                                    )
                                }
                                
                                // === Lead-out ===
                                if !sections.leadOut.isEmpty {
                                    SchematicTrackSegment(
                                        stations: sections.leadOut,
                                        lineColor: lineColor,
                                        capTop: false,
                                        capBottom: true
                                    )
                                }
                            }
                            .frame(width: contentWidth, alignment: .leading)
                            .padding(.top, 110)
                            .padding(.bottom, 160)
                        }
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 0) {
                                // === Lead-in stations ===
                                if !sections.leadIn.isEmpty {
                                    SchematicTrackSegment(
                                        stations: sections.leadIn,
                                        lineColor: lineColor,
                                        capTop: true,
                                        capBottom: false
                                    )
                                }
                                
                                // === Trunk stations ===
                                if !sections.trunk.isEmpty {
                                    SchematicTrackSegment(
                                        stations: sections.trunk,
                                        lineColor: lineColor,
                                        capTop: sections.leadIn.isEmpty,
                                        capBottom: sections.leadOut.isEmpty
                                    )
                                }
                                
                                // === Lead-out ===
                                if !sections.leadOut.isEmpty {
                                    SchematicTrackSegment(
                                        stations: sections.leadOut,
                                        lineColor: lineColor,
                                        capTop: false,
                                        capBottom: true
                                    )
                                }
                            }
                            .padding(.top, 110)
                            .padding(.bottom, 160)
                        }
                    }
                }
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 50))
                        .foregroundColor(.orange)
                    Text(errorMessage ?? "Données de ligne introuvables.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    LineIcon(line: line, size: 30)
                    Text("Plan de ligne")
                        .font(.headline)
                }
            }
        }
        .onAppear {
            loadLocalData()
        }
    }
    
    private func loadLocalData() {
        isLoading = true
        if let data = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId) {
            self.lineData = data
            self.isLoading = false
        } else {
            self.errorMessage = "Plan non disponible pour la ligne \(line.type.rawValue) \(line.lineId) dans la base locale."
            self.isLoading = false
        }
    }
}

// MARK: - Track Segment (the thick colored rail with stations)

private let trackWidth: CGFloat = 8
private let dotSize: CGFloat = 18
private let terminusDotSize: CGFloat = 22
private let stationSpacing: CGFloat = 44

struct SchematicTrackSegment: View {
    let stations: [LocalStation]
    let lineColor: Color
    let capTop: Bool
    let capBottom: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(stations.enumerated()), id: \.element.nom) { index, station in
                let isFirst = capTop && index == 0
                let isLast = capBottom && index == stations.count - 1
                let isTerminus = isFirst || isLast
                
                HStack(alignment: .center, spacing: 0) {
                    // === Track column ===
                    ZStack {
                        // Thick track line
                        VStack(spacing: 0) {
                            if isFirst {
                                // Rounded cap at top
                                RoundedRectangle(cornerRadius: trackWidth / 2)
                                    .fill(lineColor)
                                    .frame(width: trackWidth, height: stationSpacing / 2)
                            } else {
                                Rectangle()
                                    .fill(lineColor)
                                    .frame(width: trackWidth, height: stationSpacing / 2)
                            }
                            
                            if isLast {
                                // Rounded cap at bottom
                                RoundedRectangle(cornerRadius: trackWidth / 2)
                                    .fill(lineColor)
                                    .frame(width: trackWidth, height: stationSpacing / 2)
                            } else {
                                Rectangle()
                                    .fill(lineColor)
                                    .frame(width: trackWidth, height: stationSpacing / 2)
                            }
                        }
                        
                        // Station dot
                        SchematicDot(lineColor: lineColor, isTerminus: isTerminus)
                    }
                    .frame(width: 50, height: stationSpacing)
                    
                    // === Station info ===
                    HStack(spacing: 6) {
                        Text(station.nom)
                            .font(.system(size: 14, weight: isTerminus ? .bold : .medium))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        
                        // Transfer icons
                        ForEach(station.correspondances.prefix(6), id: \.self) { corr in
                            TransferIcon(label: corr)
                        }
                    }
                    .padding(.leading, 4)
                    
                    Spacer()
                }
            }
        }
        .padding(.leading, 16)
    }
}

// MARK: - Station Dot (SNCF style)

struct SchematicDot: View {
    let lineColor: Color
    let isTerminus: Bool
    
    var body: some View {
        let size = isTerminus ? terminusDotSize : dotSize
        
        ZStack {
            // White circle background
            Circle()
                .fill(.white)
                .frame(width: size, height: size)
            
            // Colored ring
            Circle()
                .stroke(lineColor, lineWidth: isTerminus ? 4 : 3)
                .frame(width: size - 2, height: size - 2)
            
            // Inner white dot for terminus
            if isTerminus {
                Circle()
                    .fill(.white)
                    .frame(width: size - 8, height: size - 8)
            }
        }
    }
}

// MARK: - Merge View (SNCF-style diagonal merge at the top)

struct SchematicMergeView: View {
    let branches: [LocalLineData.SchematicBranch]
    let lineColor: Color
    let branchWidth: CGFloat
    let contentWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            // === Branch columns side by side ===
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(Array(branches.enumerated()), id: \.element.name) { index, branch in
                    VStack(alignment: .leading, spacing: 0) {
                        // Branch stations
                        ForEach(Array(branch.stations.enumerated()), id: \.element.nom) { sIndex, station in
                            let isFirst = sIndex == 0
                            
                            HStack(alignment: .top, spacing: 6) {
                                // Track & Dot
                                ZStack(alignment: .top) {
                                    // Track line (continuous)
                                    VStack(spacing: 0) {
                                        if isFirst {
                                            Color.clear.frame(height: 12)
                                        } else {
                                            Rectangle()
                                                .fill(lineColor)
                                                .frame(height: 12)
                                        }
                                        Rectangle()
                                            .fill(lineColor)
                                            .frame(height: 52)
                                    }
                                    .frame(width: trackWidth)
                                    
                                    SchematicDot(lineColor: lineColor, isTerminus: isFirst)
                                        .frame(height: 24)
                                }
                                .frame(width: 24, height: 64)
                                
                                // Angled Text & Transfers
                                ZStack(alignment: .topLeading) {
                                    Color.clear.frame(width: 2, height: 24)
                                    
                                    HStack(spacing: 6) {
                                        Text(station.nom)
                                            .font(.system(size: 12, weight: isFirst ? .bold : .medium))
                                            .foregroundColor(.primary)
                                            .fixedSize()
                                        
                                        ForEach(station.correspondances.prefix(4), id: \.self) { corr in
                                            TransferIcon(label: corr)
                                        }
                                    }
                                    .rotationEffect(.degrees(-35), anchor: .leading)
                                    .offset(x: 0, y: 6)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(width: branchWidth, alignment: .leading)
                }
            }
            .frame(width: contentWidth, alignment: .leading)
            .padding(.leading, 16)
            
            // === Merge connector (beautiful Bézier curves) ===
            GeometryReader { geo in
                Canvas { context, size in
                    let centerX: CGFloat = 25
                    
                    for i in 0..<branches.count {
                        let sourceX = CGFloat(i) * branchWidth + 12
                        
                        var path = Path()
                        path.move(to: CGPoint(x: sourceX, y: 0))
                        path.addCurve(
                            to: CGPoint(x: centerX, y: size.height),
                            control1: CGPoint(x: sourceX, y: size.height * 0.5),
                            control2: CGPoint(x: centerX, y: size.height * 0.5)
                        )
                        
                        context.stroke(path, with: .color(lineColor), style: StrokeStyle(lineWidth: trackWidth, lineCap: .round, lineJoin: .round))
                    }
                }
            }
            .frame(width: contentWidth, height: 60, alignment: .leading)
            .padding(.leading, 16)
        }
    }
}

// MARK: - Fork View (SNCF-style diagonal split)

struct SchematicForkView: View {
    let branches: [LocalLineData.SchematicBranch]
    let lineColor: Color
    let branchWidth: CGFloat
    let contentWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            // === Fork connector (beautiful Bézier curves) ===
            GeometryReader { geo in
                Canvas { context, size in
                    let centerX: CGFloat = 25
                    
                    for i in 0..<branches.count {
                        let targetX = CGFloat(i) * branchWidth + 12
                        
                        var path = Path()
                        path.move(to: CGPoint(x: centerX, y: 0))
                        path.addCurve(
                            to: CGPoint(x: targetX, y: size.height),
                            control1: CGPoint(x: centerX, y: size.height * 0.5),
                            control2: CGPoint(x: targetX, y: size.height * 0.5)
                        )
                        
                        context.stroke(path, with: .color(lineColor), style: StrokeStyle(lineWidth: trackWidth, lineCap: .round, lineJoin: .round))
                    }
                }
            }
            .frame(width: contentWidth, height: 60, alignment: .leading)
            .padding(.leading, 16)
            
            // === Branch columns side by side ===
            HStack(alignment: .top, spacing: 0) {
                ForEach(Array(branches.enumerated()), id: \.element.name) { index, branch in
                    VStack(alignment: .leading, spacing: 0) {
                        // Branch stations
                        ForEach(Array(branch.stations.enumerated()), id: \.element.nom) { sIndex, station in
                            let isLast = sIndex == branch.stations.count - 1
                            
                            HStack(alignment: .top, spacing: 6) {
                                // Track & Dot
                                ZStack(alignment: .top) {
                                    // Track line (continuous)
                                    VStack(spacing: 0) {
                                        Rectangle()
                                            .fill(lineColor)
                                            .frame(height: 12)
                                        if isLast {
                                            Color.clear.frame(height: 52)
                                        } else {
                                            Rectangle()
                                                .fill(lineColor)
                                                .frame(height: 52)
                                        }
                                    }
                                    .frame(width: trackWidth)
                                    
                                    SchematicDot(lineColor: lineColor, isTerminus: isLast)
                                        .frame(height: 24)
                                }
                                .frame(width: 24, height: 64)
                                
                                // Angled Text & Transfers
                                ZStack(alignment: .topLeading) {
                                    Color.clear.frame(width: 2, height: 24)
                                    
                                    HStack(spacing: 6) {
                                        Text(station.nom)
                                            .font(.system(size: 12, weight: isLast ? .bold : .medium))
                                            .foregroundColor(.primary)
                                            .fixedSize()
                                        
                                        ForEach(station.correspondances.prefix(4), id: \.self) { corr in
                                            TransferIcon(label: corr)
                                        }
                                    }
                                    .rotationEffect(.degrees(-35), anchor: .leading)
                                    .offset(x: 0, y: 6)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(width: branchWidth, alignment: .leading)
                }
            }
            .frame(width: contentWidth, alignment: .leading)
            .padding(.leading, 16)
            .padding(.bottom, 40) // Add some extra space for the last rotated text
        }
    }
}

// MARK: - Transfer Icon

struct TransferIcon: View {
    let label: String
    
    var body: some View {
        if let line = parseLabel(label) {
            LineIcon(line: line, size: 18)
        } else if let type = parseType(label) {
            TransportTypeIcon(type: type)
                .frame(width: 18, height: 18)
        } else {
            Text(label)
                .font(.system(size: 7, weight: .heavy))
                .padding(.horizontal, 3)
                .padding(.vertical, 1)
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(3)
        }
    }
    
    private func parseLabel(_ label: String) -> TransportLine? {
        let clean = label.uppercased().trimmingCharacters(in: .whitespaces)
        
        if clean.starts(with: "M") && clean.count <= 4 {
            let id = clean.replacingOccurrences(of: "M", with: "")
            if !id.isEmpty { return TransportLine(type: .metro, lineId: id, status: .normal) }
        }
        if clean.starts(with: "RER") {
            let id = clean.replacingOccurrences(of: "RER", with: "").trimmingCharacters(in: .whitespaces)
            return TransportLine(type: .rer, lineId: id, status: .normal)
        }
        if clean.starts(with: "T") && !clean.contains("RAIN") {
            let id = clean.replacingOccurrences(of: "T", with: "").trimmingCharacters(in: .whitespaces)
            if !id.isEmpty { return TransportLine(type: .tram, lineId: id, status: .normal) }
        }
        if clean.count == 1 && "HJKLNPRU".contains(clean) {
            return TransportLine(type: .transilien, lineId: clean, status: .normal)
        }
        
        return nil
    }
    
    private func parseType(_ label: String) -> TransportType? {
        let l = label.lowercased()
        if l.contains("train") { return .train }
        if l.contains("bus") { return .bus }
        return nil
    }
}

#Preview {
    NavigationStack {
        LineSchematicPlanView(line: TransportLine(type: .metro, lineId: "13", status: .normal))
    }
}
