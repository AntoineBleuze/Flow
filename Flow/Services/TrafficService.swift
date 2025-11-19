import Foundation
import SwiftUI
import Combine

class TrafficService: ObservableObject {
    @Published var lines: [TransportLine] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Initialiser avec les lignes par défaut (statut normal)
        self.lines = self.getAllLines()
        // Charger les infos trafic
        self.fetchTrafficInfo()
    }
    
    func fetchTrafficInfo() {
        let apiKey = IDFMService.shared.apiKey
        guard !apiKey.isEmpty else { return }
        
        let urlString = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia/line_reports/line_reports?count=100"
        guard let url = URL(string: urlString) else { return }
        
        fetchPage(url: url, accumulatedDisruptions: [])
    }
    
    private func fetchPage(url: URL, accumulatedDisruptions: [Disruption]) {
        let apiKey = IDFMService.shared.apiKey
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apiKey")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: LineReportResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("❌ Error fetching traffic info: \(error)")
                }
            }, receiveValue: { [weak self] response in
                var allDisruptions = accumulatedDisruptions
                allDisruptions.append(contentsOf: response.disruptions)
                
                // Check for next page
                if let nextLink = response.links?.first(where: { $0.rel == "next" }),
                   let nextUrl = URL(string: nextLink.href) {
                    self?.fetchPage(url: nextUrl, accumulatedDisruptions: allDisruptions)
                } else {
                    // No more pages, update lines
                    print("✅ Finished fetching traffic info. Total disruptions: \(allDisruptions.count)")
                    self?.updateLines(with: allDisruptions)
                }
            })
            .store(in: &cancellables)
    }
    
    private func updateLines(with disruptions: [Disruption]) {
        // Remettre tout le monde à normal d'abord
        var updatedLines = self.getAllLines()
        
        for disruption in disruptions {
            // On prend les perturbations actives ou futures
            guard disruption.status == "active" || disruption.status == "future",
                  let impactedObjects = disruption.impactedObjects else { continue }
            
            for object in impactedObjects {
                guard let lineCode = object.ptObject?.line?.code,
                      let commercialModeId = object.ptObject?.line?.commercialMode?.id
                else { continue }
                
                // Trouver la ligne correspondante dans notre liste avec un matching strict sur le mode
                if let index = updatedLines.firstIndex(where: { line in
                    let match = self.matchLine(line: line, code: lineCode, modeId: commercialModeId)
                    if match {
                        print("✅ Match found for \(line.lineId) with disruption: \(disruption.cause ?? "No cause")")
                    }
                    return match
                }) {
                    // Mapping de la sévérité
                    let severityEffect = disruption.severity?.effect ?? "UNKNOWN"
                    
                    var newStatus: LineStatus = .normal
                    if severityEffect == "NO_SERVICE" || severityEffect == "REDUCED_SERVICE" || severityEffect == "SIGNIFICANT_DELAYS" {
                        newStatus = .critical
                    } else if severityEffect == "OTHER" || severityEffect == "UNKNOWN" {
                         newStatus = .warning
                    } else {
                        newStatus = .warning
                    }
                    
                    // Si la ligne est déjà en critique, on ne la repasse pas en warning
                    if updatedLines[index].status == .critical && newStatus == .warning {
                        newStatus = .critical
                    }
                    
                    // Mise à jour du statut global seulement si c'est actif
                    if disruption.status == "active" {
                        if updatedLines[index].status == .normal {
                             updatedLines[index].status = newStatus
                        }
                    }
                    
                    // Création de l'info trafic
                    let rawMessage = disruption.messages?.first?.text ?? "Incident signalé"
                    let cleanMessage = self.cleanHTML(rawMessage)
                    
                    let period: TrafficPeriod = disruption.status == "future" ? .future : .active
                    
                    let info = TrafficInfo(
                        id: disruption.id,
                        title: disruption.cause ?? "Information",
                        message: cleanMessage,
                        period: period,
                        severity: newStatus,
                        startTime: nil, // À parser si besoin
                        endTime: nil
                    )
                    
                    updatedLines[index].trafficInfos.append(info)
                }
            }
        }
        
        self.lines = updatedLines
    }
    
    private func matchLine(line: TransportLine, code: String, modeId: String) -> Bool {
        // Normalisation du mode ID (ex: "commercial_mode:Metro" -> "metro")
        let normalizedModeId = modeId.lowercased()
        
        switch line.type {
        case .metro:
            return normalizedModeId.contains("metro") && line.lineId == code
        case .rer:
            // API can return "rapidtransit" or "rer"
            return (normalizedModeId.contains("rer") || normalizedModeId.contains("rapidtransit")) && line.lineId == code
        case .tram:
            return normalizedModeId.contains("tram") && (line.lineId == code || line.lineId == "T\(code)")
        case .transilien, .train:
            return (normalizedModeId.contains("train") || normalizedModeId.contains("rapidtransit")) && line.lineId == code
        default:
            return false
        }
    }
    
    private func cleanHTML(_ html: String) -> String {
        guard let data = html.data(using: .utf8) else { return html }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            return attributedString.string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        return html
    }
    
    private func getAllLines() -> [TransportLine] {
        return [
            // MÉTROS
            TransportLine(type: .metro, lineId: "1", status: .normal),
            TransportLine(type: .metro, lineId: "2", status: .normal),
            TransportLine(type: .metro, lineId: "3", status: .normal),
            TransportLine(type: .metro, lineId: "3bis", status: .normal),
            TransportLine(type: .metro, lineId: "4", status: .normal),
            TransportLine(type: .metro, lineId: "5", status: .normal),
            TransportLine(type: .metro, lineId: "6", status: .normal),
            TransportLine(type: .metro, lineId: "7", status: .normal),
            TransportLine(type: .metro, lineId: "7bis", status: .normal),
            TransportLine(type: .metro, lineId: "8", status: .normal),
            TransportLine(type: .metro, lineId: "9", status: .normal),
            TransportLine(type: .metro, lineId: "10", status: .normal),
            TransportLine(type: .metro, lineId: "11", status: .normal),
            TransportLine(type: .metro, lineId: "12", status: .normal),
            TransportLine(type: .metro, lineId: "13", status: .normal),
            TransportLine(type: .metro, lineId: "14", status: .normal),
            
            // RER
            TransportLine(type: .rer, lineId: "A", status: .normal),
            TransportLine(type: .rer, lineId: "B", status: .normal),
            TransportLine(type: .rer, lineId: "C", status: .normal),
            TransportLine(type: .rer, lineId: "D", status: .normal),
            TransportLine(type: .rer, lineId: "E", status: .normal),
            
            // TRAMS
            TransportLine(type: .tram, lineId: "T1", status: .normal),
            TransportLine(type: .tram, lineId: "T2", status: .normal),
            TransportLine(type: .tram, lineId: "T3a", status: .normal),
            TransportLine(type: .tram, lineId: "T3b", status: .normal),
            TransportLine(type: .tram, lineId: "T4", status: .normal),
            TransportLine(type: .tram, lineId: "T5", status: .normal),
            TransportLine(type: .tram, lineId: "T6", status: .normal),
            TransportLine(type: .tram, lineId: "T7", status: .normal),
            TransportLine(type: .tram, lineId: "T8", status: .normal),
            TransportLine(type: .tram, lineId: "T9", status: .normal),
            TransportLine(type: .tram, lineId: "T10", status: .normal),
            TransportLine(type: .tram, lineId: "T11", status: .normal),
            TransportLine(type: .tram, lineId: "T12", status: .normal),
            TransportLine(type: .tram, lineId: "T13", status: .normal),
            TransportLine(type: .tram, lineId: "T14", status: .normal),
            
            // TRANSILIENS
            TransportLine(type: .transilien, lineId: "H", status: .normal),
            TransportLine(type: .transilien, lineId: "J", status: .normal),
            TransportLine(type: .transilien, lineId: "K", status: .normal),
            TransportLine(type: .transilien, lineId: "L", status: .normal),
            TransportLine(type: .transilien, lineId: "N", status: .normal),
            TransportLine(type: .transilien, lineId: "P", status: .normal),
            TransportLine(type: .transilien, lineId: "R", status: .normal),
            TransportLine(type: .transilien, lineId: "U", status: .normal),
            TransportLine(type: .transilien, lineId: "V", status: .normal)
        ]
    }
}
