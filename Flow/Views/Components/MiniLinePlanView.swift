import SwiftUI

struct TimelineItem: Identifiable {
    let id: String
    let name: String
    let isAffected: Bool
    let isGap: Bool
}

struct TimelineCell: View {
    let item: TimelineItem
    let isAffected: Bool
    let lineColor: Color
    let severityColor: Color
    let severityIcon: String
    let hasLineAbove: Bool
    let hasLineBelow: Bool
    let isLineAboveAffected: Bool
    let isLineBelowAffected: Bool
    let normalOpacity: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            // Left timeline graphic
            ZStack {
                // Vertical line segments
                VStack(spacing: 0) {
                    if hasLineAbove {
                        Rectangle()
                            .fill(isLineAboveAffected ? severityColor : lineColor)
                            .opacity(isLineAboveAffected ? 1.0 : normalOpacity)
                            .frame(width: 4, height: 18)
                    } else {
                        Spacer().frame(height: 18)
                    }
                    
                    if hasLineBelow {
                        Rectangle()
                            .fill(isLineBelowAffected ? severityColor : lineColor)
                            .opacity(isLineBelowAffected ? 1.0 : normalOpacity)
                            .frame(width: 4, height: 18)
                    } else {
                        Spacer().frame(height: 18)
                    }
                }
                
                // Dot or Gap dots
                if item.isGap {
                    VStack(spacing: 3) {
                        ForEach(0..<3) { _ in
                            Circle()
                                .fill(lineColor.opacity(normalOpacity))
                                .frame(width: 3, height: 3)
                        }
                    }
                    .background(Circle().fill(.white).frame(width: 12, height: 12))
                } else {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 12, height: 12)
                        if isAffected {
                            Circle()
                                .fill(severityColor)
                                .frame(width: 10, height: 10)
                        } else {
                            Circle()
                                .stroke(lineColor, lineWidth: 2)
                                .opacity(normalOpacity)
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
            .frame(width: 30)
            
            // Station details / gap text
            HStack(spacing: 6) {
                if item.isGap {
                    Text("...")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.secondary)
                } else {
                    Text(item.name)
                        .font(.system(size: 12, weight: isAffected ? .bold : .medium))
                        .foregroundColor(isAffected ? severityColor : .primary)
                        .lineLimit(1)
                    
                    if isAffected {
                        Image(systemName: severityIcon)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(severityColor)
                    }
                }
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .frame(height: 36)
    }
}

struct MiniLinePlanView: View {
    let line: TransportLine
    let info: TrafficInfo
    
    @State private var lineData: LocalLineData?
    @State private var affectedStations: Set<String> = []
    @State private var isLoading = true
    
    var body: some View {
        Group {
            if isLoading {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                .frame(height: 100)
            } else if let data = lineData {
                let timelineItems = buildTimeline(data: data)
                if timelineItems.isEmpty {
                    MiniFallbackPlanView(line: line, info: info)
                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Impact sur le plan de la ligne :")
                            .font(.caption).bold()
                            .foregroundColor(.secondary)
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(spacing: 0) {
                                ForEach(Array(timelineItems.enumerated()), id: \.element.id) { index, item in
                                    let isFirst = index == 0
                                    let isLast = index == timelineItems.count - 1
                                    
                                    let hasLineAbove = !isFirst
                                    let hasLineBelow = !isLast
                                    
                                    let isLineAboveAffected = hasLineAbove && item.isAffected && timelineItems[index - 1].isAffected
                                    let isLineBelowAffected = hasLineBelow && item.isAffected && timelineItems[index + 1].isAffected
                                    
                                    TimelineCell(
                                        item: item,
                                        isAffected: item.isAffected,
                                        lineColor: resolveLineColor(line.lineId, type: line.type),
                                        severityColor: info.severity.color,
                                        severityIcon: info.severity.icon,
                                        hasLineAbove: hasLineAbove,
                                        hasLineBelow: hasLineBelow,
                                        isLineAboveAffected: isLineAboveAffected,
                                        isLineBelowAffected: isLineBelowAffected,
                                        normalOpacity: 0.35
                                    )
                                }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                        }
                        .frame(maxHeight: 250)
                        .background(Color.primary.opacity(0.04))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                    }
                }
            } else {
                MiniFallbackPlanView(line: line, info: info)
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() {
        isLoading = true
        
        if let data = LocalDataService.shared.getLineData(type: line.type, lineId: line.lineId) {
            self.lineData = data
            
            var affected = Set<String>()
            
            if let stops = info.impactedStops {
                for stopName in stops {
                    if let matched = data.allStations.first(where: { matchesStation($0.nom, apiName: stopName) }) {
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
        var items: [TimelineItem] = []
        
        if let impactedSection = info.impactedSection {
            let fromAndTo = parseSection(impactedSection)
            if let fromName = fromAndTo.from, let toName = fromAndTo.to {
                let graph = LineGraph(lineData: data)
                if let path = graph.findOrderedPath(from: fromName, to: toName) {
                    if let first = path.first {
                        let neighbors = graph.adjList[first] ?? []
                        if let contextBefore = neighbors.first(where: { !path.contains($0) }) {
                            items.append(TimelineItem(id: "context-start-\(contextBefore)", name: contextBefore, isAffected: false, isGap: false))
                        }
                    }
                    
                    for stationName in path {
                        items.append(TimelineItem(id: "station-\(stationName)", name: stationName, isAffected: true, isGap: false))
                    }
                    
                    if let last = path.last {
                        let neighbors = graph.adjList[last] ?? []
                        if let contextAfter = neighbors.first(where: { !path.contains($0) }) {
                            items.append(TimelineItem(id: "context-end-\(contextAfter)", name: contextAfter, isAffected: false, isGap: false))
                        }
                    }
                    
                    return items
                }
            }
        }
        
        let allStations = data.allStations
        if allStations.isEmpty { return [] }
        
        var indicesToInclude = Set<Int>()
        for i in 0..<allStations.count {
            let stationName = allStations[i].nom
            let isAffected = affectedStations.contains(stationName)
            if isAffected {
                indicesToInclude.insert(i)
                if i > 0 { indicesToInclude.insert(i - 1) }
                if i < allStations.count - 1 { indicesToInclude.insert(i + 1) }
            }
        }
        
        let sortedIndices = indicesToInclude.sorted()
        if sortedIndices.isEmpty {
            let count = min(allStations.count, 5)
            for i in 0..<count {
                items.append(TimelineItem(id: "station-\(allStations[i].nom)", name: allStations[i].nom, isAffected: false, isGap: false))
            }
            if allStations.count > 5 {
                items.append(TimelineItem(id: "gap-end", name: "...", isAffected: false, isGap: true))
            }
            return items
        }
        
        for idx in 0..<sortedIndices.count {
            let currentIndex = sortedIndices[idx]
            
            if idx > 0 {
                let prevIndex = sortedIndices[idx - 1]
                if currentIndex - prevIndex > 1 {
                    items.append(TimelineItem(id: "gap-\(prevIndex)-\(currentIndex)", name: "...", isAffected: false, isGap: true))
                }
            }
            
            let stationName = allStations[currentIndex].nom
            let isAffected = affectedStations.contains(stationName)
            items.append(TimelineItem(id: "station-\(stationName)", name: stationName, isAffected: isAffected, isGap: false))
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
            if currentX + size.width > width {
                maxRowWidth = max(maxRowWidth, currentX - spacing)
                currentX = 0
                currentY += rowHeight + spacing
                rowHeight = 0
            }
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
        maxRowWidth = max(maxRowWidth, currentX - spacing)
        
        return CGSize(width: maxRowWidth, height: currentY + rowHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let width = bounds.width
        
        var currentX: CGFloat = bounds.minX
        var currentY: CGFloat = bounds.minY
        var rowHeight: CGFloat = 0
        
        for index in subviews.indices {
            let size = sizes[index]
            if currentX + size.width > bounds.minX + width {
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

struct LineGraph {
    var adjList: [String: Set<String>] = [:]
    
    init(lineData: LocalLineData) {
        let sections = lineData.schematicSections
        
        func addEdge(_ u: String, _ v: String) {
            adjList[u, default: []].insert(v)
            adjList[v, default: []].insert(u)
        }
        
        if !sections.leadIn.isEmpty {
            for i in 0..<(sections.leadIn.count - 1) {
                addEdge(sections.leadIn[i].nom, sections.leadIn[i+1].nom)
            }
        }
        
        if !sections.trunk.isEmpty {
            for i in 0..<(sections.trunk.count - 1) {
                addEdge(sections.trunk[i].nom, sections.trunk[i+1].nom)
            }
        }
        
        if !sections.leadOut.isEmpty {
            for i in 0..<(sections.leadOut.count - 1) {
                addEdge(sections.leadOut[i].nom, sections.leadOut[i+1].nom)
            }
        }
        
        if let lastLeadIn = sections.leadIn.last?.nom, let firstTrunk = sections.trunk.first?.nom {
            addEdge(lastLeadIn, firstTrunk)
        }
        
        if let lastTrunk = sections.trunk.last?.nom, let firstLeadOut = sections.leadOut.first?.nom {
            addEdge(lastTrunk, firstLeadOut)
        }
        
        if !sections.topBranches.isEmpty {
            let mergeTarget = sections.leadIn.first?.nom ?? sections.trunk.first?.nom
            for branch in sections.topBranches {
                if !branch.stations.isEmpty {
                    for i in 0..<(branch.stations.count - 1) {
                        addEdge(branch.stations[i].nom, branch.stations[i+1].nom)
                    }
                    if let lastBranchStation = branch.stations.last?.nom, let target = mergeTarget {
                        addEdge(lastBranchStation, target)
                    }
                }
            }
        }
        
        if !sections.branches.isEmpty {
            let forkSource = sections.trunk.last?.nom ?? sections.leadIn.last?.nom
            for branch in sections.branches {
                if !branch.stations.isEmpty {
                    for i in 0..<(branch.stations.count - 1) {
                        addEdge(branch.stations[i].nom, branch.stations[i+1].nom)
                    }
                    if let firstBranchStation = branch.stations.first?.nom, let source = forkSource {
                        addEdge(source, firstBranchStation)
                    }
                }
            }
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
