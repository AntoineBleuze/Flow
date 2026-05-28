import Foundation
import SwiftUI

// MARK: - Models for linesstops.json

/// Represents either a list of stations or a list of branches in directional fields.
/// Some lines (RER C, D, E) use branch objects {id, stations} in fields like `sud` or `est`.
enum StationsOrBranches: Codable {
    case stations([LocalStation])
    case branches([LocalBranch])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        // Try branches first (more specific type)
        if let branches = try? container.decode([LocalBranch].self) {
            // Check if this is actually branches (has `id` + `stations` keys)
            // vs stations. If decoding as branches succeeded but they might
            // actually be stations, check if they have station-like fields.
            if branches.isEmpty {
                self = .branches(branches)
                return
            }
            self = .branches(branches)
            return
        }
        // Fall back to stations
        if let stations = try? container.decode([LocalStation].self) {
            self = .stations(stations)
            return
        }
        self = .stations([])
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .stations(let s): try container.encode(s)
        case .branches(let b): try container.encode(b)
        }
    }
    
    var allStations: [LocalStation] {
        switch self {
        case .stations(let s): return s
        case .branches(let b): return b.flatMap { $0.stations }
        }
    }
}

struct LocalLineData: Codable {
    let id: String
    let type: String
    let couleur: String
    let structure: String
    let stations: [LocalStation]?
    
    // For branched/complex lines
    let tronc_commun: [LocalStation]?
    let tronc_central: [LocalStation]?
    let stations_tronc: [LocalStation]?
    let branches: [LocalBranch]?
    
    // Directional fields — can be stations OR branches
    let ouest: StationsOrBranches?
    let est: StationsOrBranches?
    let nord: StationsOrBranches?
    let sud: StationsOrBranches?
    let nord_ouest: StationsOrBranches?
    let sud_ouest: StationsOrBranches?
    let nord_est: StationsOrBranches?
    let sud_est: StationsOrBranches?
    
    // Named branch groups (RER A, B)
    let branches_ouest: [LocalBranch]?
    let branches_est: [LocalBranch]?
    let branches_nord: [LocalBranch]?
    let branches_sud: [LocalBranch]?
    
    /// Flat list of all stations for simple uses
    var allStations: [LocalStation] {
        let sections = schematicSections
        var result = sections.leadIn
        for branch in sections.topBranches {
            result.append(contentsOf: branch.stations)
        }
        result.append(contentsOf: sections.trunk)
        for branch in sections.branches {
            result.append(contentsOf: branch.stations)
        }
        result.append(contentsOf: sections.leadOut)
        return result
    }
    
    /// Structured data for the schematic view
    struct SchematicSections {
        var topBranches: [SchematicBranch] = [] // Branches that merge into the trunk (e.g. CDG/Mitry on RER B)
        var leadIn: [LocalStation] = []   // Stations before the trunk (e.g. nord/ouest)
        var trunk: [LocalStation] = []     // Main trunk (tronc_commun / tronc_central)
        var branches: [SchematicBranch] = [] // Branches after the trunk
        var leadOut: [LocalStation] = []   // Stations after branches (rarely used)
    }
    
    struct SchematicBranch {
        let name: String
        let stations: [LocalStation]
    }
    
    var schematicSections: SchematicSections {
        // Linear: simple list
        if let s = stations {
            return SchematicSections(trunk: s)
        }
        
        var sections = SchematicSections()
        
        // Complex lines (RER): directional sections + tronc_central
        if structure == "complex" {
            // Trunk
            if let tc = tronc_central { sections.trunk = tc }
            
            // Lead-in: nord_ouest / ouest / nord (if not using top branches)
            if branches_nord == nil && branches_ouest == nil {
                if let no = nord_ouest { sections.leadIn.append(contentsOf: no.allStations) }
                if let o = ouest { sections.leadIn.append(contentsOf: o.allStations) }
                if let n = nord { sections.leadIn.append(contentsOf: n.allStations) }
            }
            
            // Branches at the end: sud / est can be branches
            if let s = sud {
                switch s {
                case .stations(let st): sections.leadOut = st
                case .branches(let br): sections.branches = br.map { SchematicBranch(name: $0.id, stations: $0.stations) }
                }
            }
            if let e = est {
                switch e {
                case .stations(let st): sections.leadOut.append(contentsOf: st)
                case .branches(let br): sections.branches.append(contentsOf: br.map { SchematicBranch(name: $0.id, stations: $0.stations) })
                }
            }
            if let se = sud_est { sections.leadOut.append(contentsOf: se.allStations) }
            
            // Handle branches_ouest / branches_est / branches_nord / branches_sud
            if let bOuest = branches_ouest {
                sections.topBranches = bOuest.map { SchematicBranch(name: $0.id, stations: $0.stations) }
            }
            if let bNord = branches_nord {
                sections.topBranches = bNord.map { SchematicBranch(name: $0.id, stations: $0.stations) }
            }
            if let bEst = branches_est {
                sections.branches.append(contentsOf: bEst.map { SchematicBranch(name: $0.id, stations: $0.stations) })
            }
            if let bSud = branches_sud {
                sections.branches.append(contentsOf: bSud.map { SchematicBranch(name: $0.id, stations: $0.stations) })
            }
            
            return sections
        }
        
        // Branched lines: tronc_commun + branches
        if let tc = tronc_commun {
            sections.trunk = tc
        }
        if let br = branches {
            sections.branches = br.map { SchematicBranch(name: $0.id, stations: $0.stations) }
        }
        
        return sections
    }
}

struct LocalBranch: Codable {
    let id: String
    let stations: [LocalStation]
}

struct LocalStation: Codable, Identifiable {
    var id: String { nom }
    let nom: String
    let correspondances: [String]
}

struct LocalNetworkData: Codable {
    let reseau: String
    let version: String
    let description: String?
    let lignes: [LocalLineData]
}

// MARK: - Service

class LocalDataService {
    static let shared = LocalDataService()
    
    private var networkData: LocalNetworkData?
    
    private init() {
        loadData()
    }
    
    private func loadData() {
        // Try Bundle first
        if let bundleUrl = Bundle.main.url(forResource: "linesstops", withExtension: "json") {
            print("📂 Found linesstops.json in Bundle")
            do {
                let data = try Data(contentsOf: bundleUrl)
                decode(data)
                return
            } catch {
                print("❌ Error reading linesstops.json from bundle: \(error)")
            }
        } else {
            print("⚠️ linesstops.json NOT found in Bundle.main")
        }
        
        // Fallback: try source directories (for simulator / preview)
        let projectPaths = [
            "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/linesstops.json",
            "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/linesstops.json",
            "/Users/antoinebleuze/Documents/projet xcode/Flow/linesstops.json"
        ]
        
        for path in projectPaths {
            if FileManager.default.fileExists(atPath: path) {
                print("📂 Found linesstops.json at: \(path)")
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    decode(data)
                    return
                } catch {
                    print("❌ Error reading linesstops.json from \(path): \(error)")
                }
            }
        }
        
        print("❌ linesstops.json NOT found anywhere!")
    }
    
    private func decode(_ data: Data) {
        do {
            let decoder = JSONDecoder()
            self.networkData = try decoder.decode(LocalNetworkData.self, from: data)
            print("✅ Loaded linesstops.json: \(networkData?.lignes.count ?? 0) lines")
        } catch {
            print("❌ Error decoding linesstops.json: \(error)")
        }
    }
    
    func getLineData(type: TransportType, lineId: String) -> LocalLineData? {
        guard let lines = networkData?.lignes else {
            print("⚠️ getLineData: networkData is nil")
            return nil
        }
        
        // Normalize search ID to match JSON format
        let searchId: String
        switch type {
        case .metro:
            searchId = "M\(lineId)"
        case .rer:
            searchId = "RER \(lineId)"
        case .tram:
            searchId = lineId.starts(with: "T") ? lineId : "T\(lineId)"
        case .transilien:
            searchId = lineId
        case .cable:
            searchId = "C\(lineId)"
        default:
            searchId = lineId
        }
        
        let result = lines.first { $0.id.uppercased() == searchId.uppercased() }
        
        if result == nil {
            print("⚠️ getLineData: '\(searchId)' not found. Available: \(lines.map { $0.id }.joined(separator: ", "))")
        }
        
        return result
    }
}
