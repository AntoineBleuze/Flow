import Foundation
import SwiftUI
import Combine

class TrafficService: ObservableObject {
    @Published var lines: [TransportLine] = []
    @Published var isRefreshing: Bool = false
    @Published var lastUpdateTime: Date?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Initialiser avec les lignes par défaut (statut normal)
        self.lines = self.getAllLines()
        // Charger les infos trafic
        self.fetchTrafficInfo()
    }
    
    /// Rafraîchir manuellement les informations de trafic
    func refresh() {
        guard !isRefreshing else { return }
        isRefreshing = true
        
        // Réinitialiser toutes les lignes à normal
        self.lines = self.getAllLines()
        
        // Recharger les données
        self.fetchTrafficInfo()
    }
    
    func fetchTrafficInfo() {
        let apiKey = IDFMService.shared.apiKey
        print("🔑 API Key présente: \(!apiKey.isEmpty)")
        guard !apiKey.isEmpty else { 
            print("❌ Pas de clé API!")
            isRefreshing = false
            return 
        }
        
        // Filtrer les perturbations depuis 24h et jusqu'à 7 jours dans le futur
        let since = Calendar.current.date(byAdding: .hour, value: -24, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        let sinceString = dateFormatter.string(from: since)
        
        let urlString = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia/line_reports/line_reports?count=100&since=\(sinceString)"
        print("🌐 URL API: \(urlString)")
        guard let url = URL(string: urlString) else { 
            print("❌ URL invalide!")
            isRefreshing = false
            return 
        }
        
        print("📡 Démarrage de la requête API...")
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
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    print("❌ Error fetching traffic info: \(error)")
                    if let decodingError = error as? DecodingError {
                        switch decodingError {
                        case .keyNotFound(let key, let context):
                            print("❌ Key '\(key.stringValue)' not found: \(context.debugDescription)")
                        case .dataCorrupted(let context):
                            print("❌ Data corrupted: \(context.debugDescription)")
                        case .typeMismatch(let type, let context):
                            print("❌ Type mismatch for type \(type): \(context.debugDescription)")
                        case .valueNotFound(let type, let context):
                            print("❌ Value not found for type \(type): \(context.debugDescription)")
                        @unknown default:
                            print("❌ Unknown decoding error")
                        }
                    }
                    self?.isRefreshing = false
                }
            }, receiveValue: { [weak self] response in
                print("📦 Reçu \(response.disruptions.count) perturbations dans cette page")
                var allDisruptions = accumulatedDisruptions
                allDisruptions.append(contentsOf: response.disruptions)
                
                // Check for next page
                if let nextLink = response.links?.first(where: { $0.rel == "next" }),
                   let nextUrl = URL(string: nextLink.href) {
                    print("➡️ Page suivante trouvée, chargement...")
                    self?.fetchPage(url: nextUrl, accumulatedDisruptions: allDisruptions)
                } else {
                    // No more pages, update lines
                    print("✅ Finished fetching traffic info. Total disruptions: \(allDisruptions.count)")
                    self?.updateLines(with: allDisruptions)
                    self?.isRefreshing = false
                    self?.lastUpdateTime = Date()
                }
            })
            .store(in: &cancellables)
    }
    
    private func updateLines(with disruptions: [Disruption]) {
        print("\n🔄 === DÉBUT DE LA MISE À JOUR DES LIGNES ===")
        print("📊 Total de perturbations reçues: \(disruptions.count)")
        
        // Remettre tout le monde à normal d'abord
        var updatedLines = self.getAllLines()
        let now = Date()
        
        print("⏰ Date actuelle: \(now)")
        
        var processedCount = 0
        var activeCount = 0
        var futureCount = 0
        var matchedCount = 0
        
        for (index, disruption) in disruptions.enumerated() {
            processedCount += 1
            print("\n📌 Perturbation #\(index + 1) - ID: \(disruption.id)")
            print("   Status: \(disruption.status)")
            print("   Cause: \(disruption.cause ?? "N/A")")
            
            // Vérifier si la perturbation est vraiment active maintenant en vérifiant les application_periods
            guard let impactedObjects = disruption.impactedObjects else { 
                print("   ⚠️ Pas d'objets impactés, skip")
                continue 
            }
            
            print("   🎯 \(impactedObjects.count) objet(s) impacté(s)")
            
            // Vérifier si la perturbation est dans une période d'application active
            let isCurrentlyActive = self.isDisruptionActive(disruption, at: now)
            if isCurrentlyActive {
                activeCount += 1
                print("   ✅ PERTURBATION ACTIVE MAINTENANT")
            } else {
                futureCount += 1
                print("   ⏭️ Perturbation future")
            }
            
            for object in impactedObjects {
                guard let lineCode = object.ptObject?.line?.code,
                      let commercialModeId = object.ptObject?.line?.commercialMode?.id
                else { 
                    print("      ⚠️ Pas de code ligne ou mode commercial")
                    continue 
                }
                
                print("      🚇 Recherche ligne: \(lineCode) (mode: \(commercialModeId))")
                
                // Trouver la ligne correspondante dans notre liste avec un matching strict sur le mode
                if let lineIndex = updatedLines.firstIndex(where: { line in
                    let match = self.matchLine(line: line, code: lineCode, modeId: commercialModeId)
                    return match
                }) {
                    matchedCount += 1
                    print("      ✅ Match trouvé: Ligne \(updatedLines[lineIndex].lineId) (\(updatedLines[lineIndex].type.rawValue))")
                    
                    // Mapping de la sévérité
                    let severityEffect = disruption.severity?.effect ?? "UNKNOWN"
                    print("      📈 Sévérité: \(severityEffect)")
                    
                    var newStatus: LineStatus = .normal
                    if severityEffect == "NO_SERVICE" || severityEffect == "REDUCED_SERVICE" || severityEffect == "SIGNIFICANT_DELAYS" {
                        newStatus = .critical
                    } else if severityEffect == "OTHER" || severityEffect == "UNKNOWN" {
                         newStatus = .warning
                    } else {
                        newStatus = .warning
                    }
                    
                    print("      🏷️ Nouveau statut calculé: \(newStatus)")
                    
                    // Si la ligne est déjà en critique, on ne la repasse pas en warning
                    if updatedLines[lineIndex].status == .critical && newStatus == .warning {
                        newStatus = .critical
                    }
                    
                    // Mise à jour du statut global seulement si c'est vraiment actif maintenant
                    if isCurrentlyActive {
                        if updatedLines[lineIndex].status == .normal {
                             updatedLines[lineIndex].status = newStatus
                             print("      ✏️ Statut mis à jour: .normal -> \(newStatus)")
                        } else {
                            print("      ℹ️ Statut déjà: \(updatedLines[lineIndex].status)")
                        }
                    } else {
                        print("      ⏭️ Pas actif maintenant, statut non modifié")
                    }
                    
                    // Création de l'info trafic
                    let rawMessage = disruption.messages?.first?.text ?? "Incident signalé"
                    let cleanMessage = self.cleanHTML(rawMessage)
                    
                    // Déterminer la période basée sur les application_periods
                    let period: TrafficPeriod = isCurrentlyActive ? .active : .future
                    
                    let info = TrafficInfo(
                        id: disruption.id,
                        title: disruption.cause ?? "Information",
                        message: cleanMessage,
                        period: period,
                        severity: newStatus,
                        startTime: nil, // À parser si besoin
                        endTime: nil
                    )
                    
                    updatedLines[lineIndex].trafficInfos.append(info)
                    print("      ➕ Info trafic ajoutée (\(period))")
                } else {
                    print("      ❌ Aucun match trouvé pour \(lineCode) (\(commercialModeId))")
                }
            }
        }
        
        self.lines = updatedLines
        let linesWithIncidents = updatedLines.filter { $0.status != .normal }.count
        
        print("\n📊 === RÉSUMÉ ===")
        print("   Perturbations traitées: \(processedCount)")
        print("   Perturbations actives: \(activeCount)")
        print("   Perturbations futures: \(futureCount)")
        print("   Matches trouvés: \(matchedCount)")
        print("   Lignes avec incidents: \(linesWithIncidents)")
        print("=== FIN DE LA MISE À JOUR ===\n")
    }
    
    /// Vérifie si une perturbation est active à un moment donné
    private func isDisruptionActive(_ disruption: Disruption, at date: Date) -> Bool {
        // Si pas de périodes d'application, on se fie au status
        guard let applicationPeriods = disruption.applicationPeriods, !applicationPeriods.isEmpty else {
            let result = disruption.status == "active"
            print("      📅 Pas de périodes d'application, basé sur status: \(result)")
            return result
        }
        
        print("      📅 Vérification de \(applicationPeriods.count) période(s) d'application")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        
        // Vérifier si la date actuelle est dans une des périodes d'application
        for (index, period) in applicationPeriods.enumerated() {
            guard let beginDate = dateFormatter.date(from: period.begin),
                  let endDate = dateFormatter.date(from: period.end) else {
                print("         ❌ Période #\(index + 1): Impossible de parser les dates")
                continue
            }
            
            let isInPeriod = date >= beginDate && date <= endDate
            print("         📆 Période #\(index + 1): \(period.begin) -> \(period.end) = \(isInPeriod ? "✅ ACTIF" : "❌ Pas actif")")
            
            if isInPeriod {
                return true
            }
        }
        
        print("      ❌ Aucune période active trouvée")
        return false
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
