import Combine
import Foundation
import SwiftUI

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

        // Écouter les mises à jour push depuis le WebSocket
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handlePushTrafficUpdate(_:)),
            name: .flowServerTrafficUpdate,
            object: nil
        )
    }

    /// Gérer une mise à jour push reçue via WebSocket
    @objc private func handlePushTrafficUpdate(_ notification: Notification) {
        guard let disruptions = notification.userInfo?["disruptions"] as? [Disruption] else {
            return
        }
        print("📥 [Push] Mise à jour trafic reçue: \(disruptions.count) perturbations")

        // updateLines() réinitialise déjà depuis getAllLines(), pas besoin de le faire ici
        self.updateLines(with: disruptions)
        self.lastUpdateTime = Date()
    }

    /// Rafraîchir manuellement les informations de trafic
    func refresh() {
        guard !isRefreshing else { return }
        isRefreshing = true

        // Recharger les données (updateLines() réinitialisera les lignes)
        self.fetchTrafficInfo()
    }

    func fetchTrafficInfo() {
        // Mode serveur : passer par FlowServer si activé
        if FlowServerService.shared.isEnabled {
            print("📡 [Server Mode] Traffic via FlowServer")
            FlowServerService.shared.fetchTrafficInfo()
                .sink(
                    receiveCompletion: { [weak self] completion in
                        if case .failure(let error) = completion {
                            print("❌ [Server] Erreur trafic: \(error.localizedDescription)")
                            print("🔄 Fallback sur appel direct API...")
                            // Fallback : utiliser l'appel direct
                            self?.fetchTrafficInfoDirect()
                        }
                    },
                    receiveValue: { [weak self] disruptions in
                        print("📦 [Server] \(disruptions.count) perturbations reçues")
                        self?.updateLines(with: disruptions)
                        self?.isRefreshing = false
                        self?.lastUpdateTime = Date()
                    }
                )
                .store(in: &cancellables)
            return
        }

        // Mode direct
        fetchTrafficInfoDirect()
    }

    /// Appel direct à l'API IDFM (sans passer par le serveur)
    private func fetchTrafficInfoDirect() {
        let apiKey = IDFMService.shared.apiKey
        print("🔑 API Key présente: \(!apiKey.isEmpty)")
        guard !apiKey.isEmpty else {
            print("❌ Pas de clé API!")
            isRefreshing = false
            return
        }

        // Modes à récupérer (Metro, RER, Tram, Transilien)
        let modes = [
            "physical_mode:Metro",
            "physical_mode:RapidTransit",
            "physical_mode:Tramway",
            "physical_mode:LocalTrain",
        ]

        let group = DispatchGroup()
        var allDisruptions: [Disruption] = []
        let lock = NSLock()

        // Filtrer les perturbations depuis 24h
        let since = Calendar.current.date(byAdding: .hour, value: -24, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        let sinceString = dateFormatter.string(from: since)

        print("📡 Démarrage de la récupération trafic pour \(modes.count) modes...")

        for mode in modes {
            group.enter()

            // Construction URL initiale pour ce mode
            let urlString =
                "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia/line_reports/physical_modes/\(mode)/line_reports?count=100&since=\(sinceString)"

            guard let url = URL(string: urlString) else {
                print("❌ URL invalide pour mode \(mode)")
                group.leave()
                continue
            }

            print("   ➡️ Fetching \(mode)...")

            // Appel récursif pour ce mode
            self.fetchModePages(url: url) { disruptions in
                lock.lock()
                allDisruptions.append(contentsOf: disruptions)
                lock.unlock()
                print("   ✅ Fin fetch \(mode): \(disruptions.count) perturbations")
                group.leave()
            }
        }

        group.notify(queue: .main) { [weak self] in
            print("📦 Tous les fetchs sont terminés. Total perturbations: \(allDisruptions.count)")
            self?.updateLines(with: allDisruptions)
            self?.isRefreshing = false
            self?.lastUpdateTime = Date()
        }
    }

    private func fetchModePages(
        url: URL, accumulated: [Disruption] = [], completion: @escaping ([Disruption]) -> Void
    ) {
        let apiKey = IDFMService.shared.apiKey
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apiKey")

        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: LineReportResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completionStatus in
                    if case .failure(let error) = completionStatus {
                        print(
                            "❌ Erreur fetch sur \(url.absoluteString): \(error.localizedDescription)"
                        )
                        // En cas d'erreur, on renvoie ce qu'on a déjà accumulé pour ne pas bloquer le groupe
                        completion(accumulated)
                    }
                },
                receiveValue: { [weak self] response in
                    var currentDisruptions = accumulated
                    if let newDisruptions = response.disruptions {
                        currentDisruptions.append(contentsOf: newDisruptions)
                    }

                    // Pagination
                    if let nextLink = response.links?.first(where: { $0.rel == "next" }),
                        let nextUrl = URL(string: nextLink.href)
                    {
                        // Page suivante
                        self?.fetchModePages(
                            url: nextUrl, accumulated: currentDisruptions, completion: completion)
                    } else {
                        // Fin de pagination
                        completion(currentDisruptions)
                    }
                }
            )
            .store(in: &cancellables)
    }

    private func updateLines(with disruptions: [Disruption]) {
        // Remettre tout le monde à normal d'abord
        var updatedLines = self.getAllLines()
        let now = Date()


        var processedCount = 0
        var activeCount = 0
        var futureCount = 0
        var matchedCount = 0

        for disruption in disruptions {
            processedCount += 1

            // Vérifier si la perturbation est vraiment active maintenant
            guard let impactedObjects = disruption.impactedObjects else { continue }

            let isCurrentlyActive = self.isDisruptionActive(disruption, at: now)
            if isCurrentlyActive { activeCount += 1 } else { futureCount += 1 }

            for object in impactedObjects {
                var lineCode: String?
                var commercialModeName: String?

                if let line = object.ptObject?.line {
                    lineCode = line.code
                    commercialModeName = line.commercialMode?.name
                }

                guard let finalLineCode = lineCode,
                    let finalCommercialModeName = commercialModeName
                else { continue }

                // Trouver la ligne correspondante
                if let lineIndex = updatedLines.firstIndex(where: { line in
                    self.matchLine(
                        line: line, code: finalLineCode, modeName: finalCommercialModeName)
                }) {
                    matchedCount += 1
                    
                    // Capturer le navitiaId s'il n'est pas encore présent
                    if updatedLines[lineIndex].navitiaId == nil {
                        updatedLines[lineIndex].navitiaId = object.ptObject?.line?.id
                    }

                    // --- NOUVELLE LOGIQUE DE CATÉGORISATION ---
                    let effect = disruption.severity?.effect ?? "UNKNOWN"
                    let cause = (disruption.cause ?? "").lowercased()
                    let category = (disruption.category ?? "").lowercased()

                    var newStatus: LineStatus = .information  // Default

                    // 1. Détection des Travaux
                    if cause.contains("travaux") || category.contains("travaux") {
                        newStatus = .works
                    }
                    // 2. Détection des Interruptions (Prioritaire sur travaux si c'est un incident grave, mais souvent travaux = travaux)
                    // Si c'est explicitement marqué "NO_SERVICE" et que ce n'est PAS des travaux, c'est une interruption
                    else if effect == "NO_SERVICE" {
                        newStatus = .interrupted
                    }
                    // 3. Détection des Perturbations
                    else if effect == "REDUCED_SERVICE" || effect == "SIGNIFICANT_DELAYS"
                        || effect == "DETOUR"
                    {
                        newStatus = .disrupted
                    }
                    // 4. Informations (Trafic normal ou info diverse)
                    else {
                        newStatus = .information
                    }

                    // Si on a déjà un statut plus grave (valeur raw plus petite), on le garde
                    // Rappel: interrupted(0) < disrupted(1) < works(2) < information(3) < normal(4)

                    // Mise à jour du statut global seulement si c'est actif maintenant
                    if isCurrentlyActive {
                        if newStatus < updatedLines[lineIndex].status {
                            updatedLines[lineIndex].status = newStatus
                        }
                    }

                    // Création de l'info trafic avec formatage intelligent
                    let rawMessage = disruption.messages?.first?.text ?? "Information disponible"
                    let cleanMessage = self.smartFormatMessage(rawMessage)

                    let period: TrafficPeriod = isCurrentlyActive ? .active : .future

                    // Extraction des arrêts ou sections impactés
                    var impactedStops: [String]? = nil
                    var impactedSection: String? = nil

                    // Cas 1: Liste d'arrêts impactés
                    if let stops = object.impactedStops, !stops.isEmpty {
                        impactedStops = stops.compactMap { $0.stopPoint?.name }
                    }

                    // Cas 2: Section impactée (de Gare A à Gare B)
                    if let section = object.impactedSection,
                        let fromName = section.from?.name,
                        let toName = section.to?.name
                    {
                        impactedSection = "De \(fromName) à \(toName)"
                    }

                    let info = TrafficInfo(
                        id: disruption.id,
                        title: disruption.cause ?? "Info Trafic",
                        message: cleanMessage,
                        period: period,
                        severity: newStatus,
                        startTime: nil,
                        endTime: nil,
                        impactedStops: impactedStops,
                        impactedSection: impactedSection
                    )

                    updatedLines[lineIndex].trafficInfos.append(info)
                }
            }
        }

        self.lines = updatedLines
    }

    /// Vérifie si une perturbation est active à un moment donné
    private func isDisruptionActive(_ disruption: Disruption, at date: Date) -> Bool {
        // 1. Vérifier le statut déclaré
        let isActiveStatus = disruption.status == "active"

        // 2. Identifier si c'est un événement planifié (Travaux, Grève, Manif...)
        let cause = (disruption.cause ?? "").lowercased()
        let category = (disruption.category ?? "").lowercased()

        let isPlanned =
            cause.contains("travaux") || category.contains("travaux") || cause.contains("grève")
            || category.contains("grève") || cause.contains("social") || category.contains("social")
            || cause.contains("manifestation")

        // 3. Si c'est un incident imprévu (pas planifié) ET que le statut est actif
        // On considère que c'est actif immédiatement, peu importe les périodes (qui peuvent être mal calées)
        if !isPlanned && isActiveStatus {
            return true
        }

        // 4. Sinon (Travaux ou Incident inactif), on vérifie strictement les périodes
        guard let applicationPeriods = disruption.applicationPeriods, !applicationPeriods.isEmpty
        else {
            return isActiveStatus
        }

        let dateFormatter = DateFormat.navitiaParisTimezone

        for period in applicationPeriods {
            if let beginDate = dateFormatter.date(from: period.begin),
                let endDate = dateFormatter.date(from: period.end)
            {
                if date >= beginDate && date <= endDate {
                    return true
                }
            }
        }
        return false
    }

    private func matchLine(line: TransportLine, code: String, modeName: String) -> Bool {
        let normalizedModeName = modeName.lowercased().folding(
            options: .diacriticInsensitive, locale: .current)

        switch line.type {
        case .metro:
            return normalizedModeName.contains("metro") && line.lineId == code
        case .rer:
            return
                (normalizedModeName.contains("rer")
                || normalizedModeName.contains("regional express")) && line.lineId == code
        case .tram:
            return normalizedModeName.contains("tram")
                && (line.lineId == code || line.lineId == "T\(code)")
        case .transilien, .train:
            return normalizedModeName.contains("train") && line.lineId == code
        case .cable:
            // Match "cable", "funiculaire" or "suspended"
            return
                (normalizedModeName.contains("cable") || normalizedModeName.contains("funiculaire"))
        default:
            return false
        }
    }

    /// Nettoie le HTML et formate intelligemment le message
    private func smartFormatMessage(_ html: String) -> String {
        // 1. Nettoyage HTML de base
        // 1. Nettoyage HTML de base (Regex simple pour éviter les crashs NSAttributedString)
        // NSAttributedString peut crasher sur certains threads ou avec des données malformées
        var text = html.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        // Décoder les entités HTML courantes manuellement si besoin (ou juste ignorer pour l'instant pour la stabilité)
        text = text.replacingOccurrences(of: "&nbsp;", with: " ")
        text = text.replacingOccurrences(of: "&amp;", with: "&")
        text = text.replacingOccurrences(of: "&quot;", with: "\"")
        text = text.replacingOccurrences(of: "&lt;", with: "<")
        text = text.replacingOccurrences(of: "&gt;", with: ">")
        text = text.replacingOccurrences(of: "&#233;", with: "é")
        text = text.replacingOccurrences(of: "&#224;", with: "à")
        text = text.replacingOccurrences(of: "&#232;", with: "è")
        text = text.replacingOccurrences(of: "&#234;", with: "ê")
        text = text.replacingOccurrences(of: "&#244;", with: "ô")
        text = text.replacingOccurrences(of: "&#238;", with: "î")
        text = text.replacingOccurrences(of: "&#251;", with: "û")
        text = text.replacingOccurrences(of: "&#231;", with: "ç")
        text = text.replacingOccurrences(of: "&rsquo;", with: "'")
        text = text.replacingOccurrences(of: "&laquo;", with: "«")
        text = text.replacingOccurrences(of: "&raquo;", with: "»")

        text = text.trimmingCharacters(in: .whitespacesAndNewlines)

        // 2. Formatage intelligent (Markdown pour SwiftUI)
        // Mettre en gras les clés communes et ajouter des retours à la ligne pour la lisibilité
        let keysToBold = ["Période :", "Dates :", "Motif :", "Sauf :", "Pour :", "Impact :"]
        
        for key in keysToBold {
            // Ajouter un double retour à la ligne avant la clé si elle n'est pas au début, pour aérer
            // Et s'assurer qu'il y a un espace après la clé
            text = text.replacingOccurrences(of: " \(key)", with: "\n\n\(key)")
            text = text.replacingOccurrences(of: key, with: "**\(key)** ")
        }
        
        // Nettoyer les espaces en trop créés par le formatage ci-dessus
        text = text.replacingOccurrences(of: "** ", with: "**")
        text = text.replacingOccurrences(of: "  ", with: " ")
        
        // S'assurer que les listes à puces (souvent avec - ou •) commencent sur une nouvelle ligne
        text = text.replacingOccurrences(of: ":-", with: ":\n-")
        text = text.replacingOccurrences(of: ":•", with: ":\n•")

        return text.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func getAllLines() -> [TransportLine] {
        return [
            // MÉTROS
            TransportLine(type: .metro, lineId: "1", navitiaId: "line:IDFM:C01371", status: .normal),
            TransportLine(type: .metro, lineId: "2", navitiaId: "line:IDFM:C01372", status: .normal),
            TransportLine(type: .metro, lineId: "3", navitiaId: "line:IDFM:C01373", status: .normal),
            TransportLine(type: .metro, lineId: "3bis", navitiaId: "line:IDFM:C01384", status: .normal),
            TransportLine(type: .metro, lineId: "4", navitiaId: "line:IDFM:C01374", status: .normal),
            TransportLine(type: .metro, lineId: "5", navitiaId: "line:IDFM:C01375", status: .normal),
            TransportLine(type: .metro, lineId: "6", navitiaId: "line:IDFM:C01376", status: .normal),
            TransportLine(type: .metro, lineId: "7", navitiaId: "line:IDFM:C01377", status: .normal),
            TransportLine(type: .metro, lineId: "7bis", navitiaId: "line:IDFM:C01385", status: .normal),
            TransportLine(type: .metro, lineId: "8", navitiaId: "line:IDFM:C01378", status: .normal),
            TransportLine(type: .metro, lineId: "9", navitiaId: "line:IDFM:C01379", status: .normal),
            TransportLine(type: .metro, lineId: "10", navitiaId: "line:IDFM:C01380", status: .normal),
            TransportLine(type: .metro, lineId: "11", navitiaId: "line:IDFM:C01381", status: .normal),
            TransportLine(type: .metro, lineId: "12", navitiaId: "line:IDFM:C01382", status: .normal),
            TransportLine(type: .metro, lineId: "13", navitiaId: "line:IDFM:C01383", status: .normal),
            TransportLine(type: .metro, lineId: "14", navitiaId: "line:IDFM:C01386", status: .normal),

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
            TransportLine(type: .transilien, lineId: "V", status: .normal),

            // CABLES
            TransportLine(type: .cable, lineId: "1", status: .normal),
        ]
    }
}
