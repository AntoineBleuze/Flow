import SwiftData
import Foundation
import CoreLocation

@ModelActor
actor TransportDataImporter {
    
    /// Importe les arrêts de bus depuis le fichier CSV arrets-lignes-2.csv par lots (batching)
    func importBusStops(csvUrl: URL) throws {
        // Suppression sécurisée des anciens arrêts de bus pour éviter les doublons obsolètes
        let busPredicate = #Predicate<StopPointModel> { $0.type == "Bus" }
        try modelContext.delete(model: StopPointModel.self, where: busPredicate)
        try modelContext.save()
        
        let data = try String(contentsOf: csvUrl, encoding: .utf8)
        let rows = data.components(separatedBy: .newlines)
        
        let batchSize = 1000
        var currentBatch: [StopPointModel] = []
        
        for (index, row) in rows.enumerated() {
            if index == 0 || row.isEmpty { continue }
            
            // Séparateur point-virgule comme utilisé dans le format d'arrets-lignes
            let columns = row.split(separator: ";", omittingEmptySubsequences: false).map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            guard columns.count > 10 else { continue }
            
            let modeStr = columns[8]
            if modeStr.caseInsensitiveCompare("bus") == .orderedSame {
                let id = columns[2]
                let stopAreaId = columns[0]
                let rawName = columns[3]
                let name = cleanStationName(rawName)
                let lonStr = columns[4]
                let latStr = columns[5]
                let lineName = columns[7]
                let city = columns[10]
                
                if let lat = Double(latStr), let lon = Double(lonStr) {
                    let model = StopPointModel(
                        id: id,
                        stopAreaId: stopAreaId,
                        city: city,
                        name: name,
                        latitude: lat,
                        longitude: lon,
                        type: "Bus",
                        lineName: lineName
                    )
                    currentBatch.append(model)
                    
                    if currentBatch.count >= batchSize {
                        for item in currentBatch {
                            modelContext.insert(item)
                        }
                        try modelContext.save()
                        currentBatch.removeAll(keepingCapacity: true)
                    }
                }
            }
        }
        
        // Enregistrement du lot restant
        if !currentBatch.isEmpty {
            for item in currentBatch {
                modelContext.insert(item)
            }
            try modelContext.save()
        }
    }
    
    /// Effectue un fetch ciblé géographique pour les bus afin d'éviter le chargement sur le MainActor
    func fetchBusStops(minLat: Double, maxLat: Double, minLon: Double, maxLon: Double) throws -> [StopPointModel] {
        let fetchDescriptor = FetchDescriptor<StopPointModel>(
            predicate: #Predicate<StopPointModel> {
                $0.type == "Bus" &&
                $0.latitude >= minLat && $0.latitude <= maxLat &&
                $0.longitude >= minLon && $0.longitude <= maxLon
            }
        )
        return try modelContext.fetch(fetchDescriptor)
    }
    
    private func cleanStationName(_ name: String) -> String {
        var clean = name
        if clean.hasPrefix("(") && clean.hasSuffix(")") {
            clean = String(clean.dropFirst().dropLast())
        }
        return clean.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
