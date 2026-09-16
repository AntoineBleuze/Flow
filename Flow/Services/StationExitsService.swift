import Foundation
import MapKit

struct StationExit: Codable, Identifiable, Sendable {
    var id: String { exit_id }
    let exit_id: String
    let exit_number: Int?
    let exit_name: String?
    let is_entry: Bool
    let is_exit: Bool
    let operatorName: String?
    let coordinates: ExitCoordinates?
    let stations: [ExitStation]?
    
    struct ExitCoordinates: Codable, Sendable {
        let lat: Double
        let lon: Double
    }
    
    struct ExitStation: Codable, Sendable {
        let id: String
        let name: String
        let town: String?
        let postal_code: String?
        let type: String?
    }
    
    enum CodingKeys: String, CodingKey {
        case exit_id
        case exit_number
        case exit_name
        case is_entry
        case is_exit
        case operatorName = "operator"
        case coordinates
        case stations
    }
}

class ExitMarkerAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let isEntry: Bool
    let exitId: String?
    let exitNumber: Int?
    let exitName: String?
    let isJourneyExit: Bool
    
    init(
        coordinate: CLLocationCoordinate2D,
        title: String?,
        subtitle: String?,
        isEntry: Bool,
        exitId: String? = nil,
        exitNumber: Int? = nil,
        exitName: String? = nil,
        isJourneyExit: Bool = false
    ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.isEntry = isEntry
        self.exitId = exitId
        self.exitNumber = exitNumber
        self.exitName = exitName
        self.isJourneyExit = isJourneyExit
    }
}

class StationExitsService {
    static let shared = StationExitsService()
    
    private(set) var allExits: [StationExit] = []
    private var exitsByStationId: [String: [StationExit]] = [:]
    
    private init() {
        loadExits()
    }
    
    private func loadExits() {
        // 1. Try Bundle main
        if let bundleUrl = Bundle.main.url(forResource: "station_exits_registry", withExtension: "json") {
            print("📂 Found station_exits_registry.json in Bundle")
            do {
                let data = try Data(contentsOf: bundleUrl)
                decodeExits(data)
                return
            } catch {
                print("❌ Error reading station_exits_registry.json from bundle: \(error)")
            }
        }
        
        // 2. Fallback path for Simulator / Previews
        let fallbackPaths = [
            "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/station_exits_registry.json",
            "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/station_exits_registry.json",
            "/Users/antoinebleuze/Documents/projet xcode/Flow/station_exits_registry.json"
        ]
        
        for path in fallbackPaths {
            if FileManager.default.fileExists(atPath: path) {
                print("📂 Found station_exits_registry.json at fallback path: \(path)")
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    decodeExits(data)
                    return
                } catch {
                    print("❌ Error reading station_exits_registry.json from \(path): \(error)")
                }
            }
        }
        
        print("❌ station_exits_registry.json NOT found anywhere!")
    }
    
    private func decodeExits(_ data: Data) {
        do {
            let decoder = JSONDecoder()
            let exits = try decoder.decode([StationExit].self, from: data)
            
            var map: [String: [StationExit]] = [:]
            for exit in exits {
                if let stations = exit.stations {
                    for station in stations {
                        map[station.id, default: []].append(exit)
                    }
                }
            }
            self.allExits = exits
            self.exitsByStationId = map
            print("✅ Loaded \(exits.count) exits, mapped to \(map.count) station IDs.")
        } catch {
            print("❌ Error decoding station_exits_registry.json: \(error)")
        }
    }
    
    func exitsForStation(id: String) -> [StationExit] {
        let cleanId = id.replacingOccurrences(of: "stop_area:IDFM:", with: "")
                        .replacingOccurrences(of: "stop_area:", with: "")
                        .replacingOccurrences(of: "stop_point:IDFM:", with: "")
                        .replacingOccurrences(of: "stop_point:", with: "")
                        .replacingOccurrences(of: "stop:IDFM:", with: "")
                        .replacingOccurrences(of: "stop:", with: "")
                        .trimmingCharacters(in: .whitespacesAndNewlines)
        return exitsByStationId[cleanId] ?? []
    }
    
    func exits(in region: MKCoordinateRegion) -> [StationExit] {
        let minLat = region.center.latitude - region.span.latitudeDelta / 2
        let maxLat = region.center.latitude + region.span.latitudeDelta / 2
        let minLon = region.center.longitude - region.span.longitudeDelta / 2
        let maxLon = region.center.longitude + region.span.longitudeDelta / 2
        
        return allExits.filter { exit in
            guard let coords = exit.coordinates else { return false }
            return coords.lat >= minLat && coords.lat <= maxLat &&
                   coords.lon >= minLon && coords.lon <= maxLon
        }
    }
    
    func closestExit(to coordinate: CLLocationCoordinate2D, stationId: String? = nil) -> StationExit? {
        let target = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let candidates: [StationExit]
        if let stationId = stationId {
            candidates = exitsForStation(id: stationId)
        } else {
            candidates = allExits
        }
        return candidates.filter { $0.is_exit }.min { a, b in
            guard let cA = a.coordinates, let cB = b.coordinates else { return false }
            let distA = target.distance(from: CLLocation(latitude: cA.lat, longitude: cA.lon))
            let distB = target.distance(from: CLLocation(latitude: cB.lat, longitude: cB.lon))
            return distA < distB
        }
    }
}
