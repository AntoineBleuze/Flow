import Foundation

// MARK: - Matrice des correspondances & Spécificités intra-station (Phase 3)

/// Clé d'identification unique d'une correspondance intra-station orientée entre deux lignes.
struct TransferKey: Hashable, Sendable, Codable {
    let stationId: Int32
    let fromLine: Int32
    let toLine: Int32

    init(stationId: Int32, fromLine: Int32, toLine: Int32) {
        self.stationId = stationId
        self.fromLine = fromLine
        self.toLine = toLine
    }
}

/// Caractéristiques physiques et de confort d'une correspondance intra-station.
struct TransferSpec: Sendable, Equatable, Codable {
    /// Temps physique de marche quai-à-quai (secondes) utilisé pour la faisabilité horaire CSA.
    let walkTimeSeconds: Int32
    /// Malus additionnel d'inconfort (secondes équivalentes : longs tapis roulants, escaliers, foule).
    let comfortPenaltySeconds: Int32

    init(walkTimeSeconds: Int32, comfortPenaltySeconds: Int32 = 0) {
        self.walkTimeSeconds = walkTimeSeconds
        self.comfortPenaltySeconds = comfortPenaltySeconds
    }
}

/// Pôle d'échange multi-gares connecté par couloirs souterrains (ex: Châtelet <-> Châtelet - Les Halles).
struct InterStationPoleLink: Sendable, Equatable {
    let fromStationId: Int32
    let fromLine: Int32
    let toStationId: Int32
    let toLine: Int32
    let spec: TransferSpec
}

/// Matrice des temps de correspondance intra-station et inter-pôles pour le moteur CSA.
struct TransferMatrix: Sendable, Equatable {
    /// Durée par défaut appliquée lorsqu'aucune règle spécifique n'est définie (3 minutes = 180s).
    let defaultTransferSeconds: Int32
    private(set) var rules: [TransferKey: TransferSpec]
    private(set) var interPoleLinks: [InterStationPoleLink]

    init(
        defaultTransferSeconds: Int32 = 180,
        rules: [TransferKey: TransferSpec] = [:],
        interPoleLinks: [InterStationPoleLink] = []
    ) {
        self.defaultTransferSeconds = defaultTransferSeconds
        self.rules = rules
        self.interPoleLinks = interPoleLinks
    }

    // MARK: - Enregistrement & Consultation

    mutating func register(
        stationId: Int32,
        fromLine: Int32,
        toLine: Int32,
        walkTimeSeconds: Int32,
        comfortPenaltySeconds: Int32 = 0,
        bidirectional: Bool = true
    ) {
        let spec = TransferSpec(
            walkTimeSeconds: walkTimeSeconds,
            comfortPenaltySeconds: comfortPenaltySeconds
        )
        rules[TransferKey(stationId: stationId, fromLine: fromLine, toLine: toLine)] = spec
        if bidirectional && fromLine != toLine {
            rules[TransferKey(stationId: stationId, fromLine: toLine, toLine: fromLine)] = spec
        }
    }

    mutating func registerInterPole(
        fromStationId: Int32,
        fromLine: Int32,
        toStationId: Int32,
        toLine: Int32,
        walkTimeSeconds: Int32,
        comfortPenaltySeconds: Int32 = 0,
        bidirectional: Bool = true
    ) {
        let spec = TransferSpec(
            walkTimeSeconds: walkTimeSeconds,
            comfortPenaltySeconds: comfortPenaltySeconds
        )
        interPoleLinks.append(
            InterStationPoleLink(
                fromStationId: fromStationId,
                fromLine: fromLine,
                toStationId: toStationId,
                toLine: toLine,
                spec: spec
            )
        )
        if bidirectional {
            interPoleLinks.append(
                InterStationPoleLink(
                    fromStationId: toStationId,
                    fromLine: toLine,
                    toStationId: fromStationId,
                    toLine: fromLine,
                    spec: spec
                )
            )
        }
    }

    /// Retourne la règle applicable pour `(stationId, fromLine, toLine)` ou la valeur par défaut (`180s`).
    func spec(for key: TransferKey) -> TransferSpec {
        if key.fromLine == key.toLine {
            return TransferSpec(walkTimeSeconds: 0, comfortPenaltySeconds: 0)
        }
        return rules[key] ?? TransferSpec(walkTimeSeconds: defaultTransferSeconds, comfortPenaltySeconds: 0)
    }

    func spec(stationId: Int32, fromLine: Int32, toLine: Int32) -> TransferSpec {
        spec(for: TransferKey(stationId: stationId, fromLine: fromLine, toLine: toLine))
    }

    func walkTime(stationId: Int32, fromLine: Int32, toLine: Int32) -> Int32 {
        spec(stationId: stationId, fromLine: fromLine, toLine: toLine).walkTimeSeconds
    }

    // MARK: - Pré-compilation O(1) des correspondances pour le scan CSA

    /// Génère la table d'adjacence `[[CSAFootpath]]` enrichie par la matrice de correspondances.
    /// Évite toute recherche de dictionnaire dans la boucle critique du scan linéaire CSA.
    func buildEffectiveFootpaths(for network: CSANetworkData) -> [[CSAFootpath]] {
        let stopCount = network.stops.count
        var result = Array(repeating: [CSAFootpath](), count: stopCount)
        var edgeIndexByPair: [Int64: (stopIdx: Int, pos: Int)] = [:]

        func edgeKey(_ a: Int32, _ b: Int32) -> Int64 {
            (Int64(a) << 32) | Int64(UInt32(bitPattern: b))
        }

        func upsertFootpath(_ fp: CSAFootpath) {
            let fromIdx = Int(fp.fromStop)
            let toIdx = Int(fp.toStop)
            guard fromIdx >= 0, fromIdx < stopCount,
                  toIdx >= 0, toIdx < stopCount,
                  fp.fromStop != fp.toStop else { return }

            let key = edgeKey(fp.fromStop, fp.toStop)
            if let loc = edgeIndexByPair[key] {
                result[loc.stopIdx][loc.pos] = fp
            } else {
                let pos = result[fromIdx].count
                result[fromIdx].append(fp)
                edgeIndexByPair[key] = (fromIdx, pos)
            }
        }

        // 1. Reprendre les correspondances existantes en les raffinant via TransferMatrix lorsque les lignes sont connues
        for fromIdx in 0..<stopCount {
            for baseFp in network.outgoingFootpaths[fromIdx] {
                let fromLine = network.primaryLineByStop[Int(baseFp.fromStop)]
                let toLine = network.primaryLineByStop[Int(baseFp.toStop)]
                let parentA = network.stops[Int(baseFp.fromStop)].parentStationId
                let parentB = network.stops[Int(baseFp.toStop)].parentStationId

                if let stationId = parentA, stationId == parentB, fromLine >= 0, toLine >= 0 {
                    let rule = spec(stationId: stationId, fromLine: fromLine, toLine: toLine)
                    upsertFootpath(
                        CSAFootpath(
                            fromStop: baseFp.fromStop,
                            toStop: baseFp.toStop,
                            durationSeconds: rule.walkTimeSeconds,
                            comfortPenaltySeconds: rule.comfortPenaltySeconds
                        )
                    )
                } else {
                    upsertFootpath(baseFp)
                }
            }
        }

        // 2. S'assurer que tous les quais frères d'une même station parente sont reliés selon la matrice
        for parentIdx in 0..<stopCount {
            let children = network.childStopsByParent[parentIdx]
            guard children.count >= 2 else { continue }
            let stationId = Int32(parentIdx)

            for a in children {
                let lineA = network.primaryLineByStop[Int(a)]
                guard lineA >= 0 else { continue }
                for b in children where a != b {
                    let lineB = network.primaryLineByStop[Int(b)]
                    guard lineB >= 0 else { continue }
                    let rule = spec(stationId: stationId, fromLine: lineA, toLine: lineB)
                    upsertFootpath(
                        CSAFootpath(
                            fromStop: a,
                            toStop: b,
                            durationSeconds: rule.walkTimeSeconds,
                            comfortPenaltySeconds: rule.comfortPenaltySeconds
                        )
                    )
                }
            }
        }

        // 3. Ajouter les correspondances souterraines inter-pôles (ex: Châtelet <-> Châtelet - Les Halles)
        for link in interPoleLinks {
            let fromPlatform = findStopForStationAndLine(
                stationId: link.fromStationId,
                lineId: link.fromLine,
                in: network
            )
            let toPlatform = findStopForStationAndLine(
                stationId: link.toStationId,
                lineId: link.toLine,
                in: network
            )
            if let a = fromPlatform, let b = toPlatform, a != b {
                upsertFootpath(
                    CSAFootpath(
                        fromStop: a,
                        toStop: b,
                        durationSeconds: link.spec.walkTimeSeconds,
                        comfortPenaltySeconds: link.spec.comfortPenaltySeconds
                    )
                )
            }
        }

        return result
    }

    private func findStopForStationAndLine(
        stationId: Int32,
        lineId: Int32,
        in network: CSANetworkData
    ) -> Int32? {
        guard stationId >= 0, Int(stationId) < network.stops.count else { return nil }
        for childId in network.childStopsByParent[Int(stationId)] {
            if network.primaryLineByStop[Int(childId)] == lineId {
                return childId
            }
        }
        if network.primaryLineByStop[Int(stationId)] == lineId || network.primaryLineByStop[Int(stationId)] == -2 {
            return stationId
        }
        return nil
    }

    // MARK: - Référentiel calibré des grands pôles Île-de-France

    /// Construit la matrice calibrée des temps réels et pénalités de confort sur le réseau Île-de-France.
    static func makeIleDeFrance(
        for network: CSANetworkData,
        defaultTransferSeconds: Int32 = 180
    ) -> TransferMatrix {
        var matrix = TransferMatrix(defaultTransferSeconds: defaultTransferSeconds)

        func addRule(_ stationName: String, _ lineA: String, _ lineB: String, walk: Int32, comfortPenalty: Int32 = 0) {
            guard let stId = network.findStationId(named: stationName),
                  let lA = network.findLineId(coded: lineA),
                  let lB = network.findLineId(coded: lineB) else { return }
            matrix.register(
                stationId: stId,
                fromLine: lA,
                toLine: lB,
                walkTimeSeconds: walk,
                comfortPenaltySeconds: comfortPenalty
            )
        }

        func addPoleBridge(
            _ stationA: String,
            _ lineA: String,
            _ stationB: String,
            _ lineB: String,
            walk: Int32,
            comfortPenalty: Int32 = 0
        ) {
            guard let stA = network.findStationId(named: stationA),
                  let stB = network.findStationId(named: stationB),
                  let lA = network.findLineId(coded: lineA),
                  let lB = network.findLineId(coded: lineB) else { return }
            if stA == stB {
                matrix.register(
                    stationId: stA,
                    fromLine: lA,
                    toLine: lB,
                    walkTimeSeconds: walk,
                    comfortPenaltySeconds: comfortPenalty
                )
            } else {
                matrix.registerInterPole(
                    fromStationId: stA,
                    fromLine: lA,
                    toStationId: stB,
                    toLine: lB,
                    walkTimeSeconds: walk,
                    comfortPenaltySeconds: comfortPenalty
                )
            }
        }

        // --- Montparnasse - Bienvenüe (asymétrie nord M4/M12 vs sud M6/M13 séparés par le grand tapis roulant) ---
        addRule("Montparnasse - Bienvenüe", "M12", "M4", walk: 120, comfortPenalty: 0)
        addRule("Montparnasse - Bienvenüe", "M6", "M13", walk: 120, comfortPenalty: 0)
        addRule("Montparnasse - Bienvenüe", "M12", "M13", walk: 260, comfortPenalty: 90)
        addRule("Montparnasse - Bienvenüe", "M4", "M13", walk: 360, comfortPenalty: 180)
        addRule("Montparnasse - Bienvenüe", "M12", "M6", walk: 400, comfortPenalty: 240)
        addRule("Montparnasse - Bienvenüe", "M4", "M6", walk: 380, comfortPenalty: 210)
        for mLine in ["M4", "M6", "M12", "M13"] {
            addPoleBridge("Montparnasse - Bienvenüe", mLine, "Gare Montparnasse", "N", walk: 300, comfortPenalty: 60)
        }

        // --- Pasteur (alternative rapide et fluide M12 <-> M6 : 100s sans couloir pénible) ---
        addRule("Pasteur", "M12", "M6", walk: 100, comfortPenalty: 0)

        // --- Concorde ---
        addRule("Concorde", "M12", "M1", walk: 140, comfortPenalty: 0)
        addRule("Concorde", "M12", "M8", walk: 130, comfortPenalty: 0)
        addRule("Concorde", "M1", "M8", walk: 120, comfortPenalty: 0)

        // --- Saint-Lazare / Auber / Opéra ---
        addRule("Saint-Lazare", "M12", "M14", walk: 140, comfortPenalty: 0)
        addRule("Saint-Lazare", "M13", "M14", walk: 125, comfortPenalty: 0)
        addRule("Saint-Lazare", "M3", "M14", walk: 150, comfortPenalty: 0)
        addRule("Saint-Lazare", "M12", "M13", walk: 170, comfortPenalty: 20)
        addRule("Saint-Lazare", "M3", "M12", walk: 190, comfortPenalty: 30)
        for mLine in ["M3", "M12", "M13", "M14"] {
            addPoleBridge("Saint-Lazare", mLine, "Haussmann - Saint-Lazare", "RER E", walk: 240, comfortPenalty: 40)
            addPoleBridge("Saint-Lazare", mLine, "Saint-Lazare", "L", walk: 210, comfortPenalty: 30)
            addPoleBridge("Saint-Lazare", mLine, "Saint-Lazare", "J", walk: 210, comfortPenalty: 30)
        }

        // --- Châtelet / Châtelet - Les Halles / Les Halles ---
        addRule("Châtelet", "M1", "M14", walk: 110, comfortPenalty: 0)
        addRule("Châtelet", "M4", "M14", walk: 160, comfortPenalty: 20)
        addRule("Châtelet", "M4", "M1", walk: 175, comfortPenalty: 25)
        addRule("Châtelet", "M7", "M11", walk: 135, comfortPenalty: 0)
        addRule("Châtelet", "M4", "M7", walk: 320, comfortPenalty: 150)
        addRule("Châtelet", "M1", "M7", walk: 300, comfortPenalty: 130)
        addRule("Châtelet - Les Halles", "RER A", "RER B", walk: 90, comfortPenalty: 0)
        addRule("Châtelet - Les Halles", "RER B", "RER D", walk: 90, comfortPenalty: 0)
        addRule("Châtelet - Les Halles", "RER A", "RER D", walk: 120, comfortPenalty: 0)
        for rerLine in ["RER A", "RER B", "RER D"] {
            addPoleBridge("Châtelet", "M14", "Châtelet - Les Halles", rerLine, walk: 180, comfortPenalty: 30)
            addPoleBridge("Châtelet", "M1", "Châtelet - Les Halles", rerLine, walk: 220, comfortPenalty: 45)
            addPoleBridge("Châtelet", "M4", "Châtelet - Les Halles", rerLine, walk: 230, comfortPenalty: 50)
            addPoleBridge("Les Halles", "M4", "Châtelet - Les Halles", rerLine, walk: 130, comfortPenalty: 0)
        }

        // --- Gare de Lyon ---
        addRule("Gare de Lyon", "M1", "M14", walk: 125, comfortPenalty: 0)
        addPoleBridge("Gare de Lyon", "M14", "Gare de Lyon", "RER A", walk: 120, comfortPenalty: 0)
        addPoleBridge("Gare de Lyon", "M1", "Gare de Lyon", "RER A", walk: 180, comfortPenalty: 20)
        addPoleBridge("Gare de Lyon", "RER A", "Gare de Lyon", "RER D", walk: 150, comfortPenalty: 20)

        // --- Gare du Nord / Magenta ---
        addRule("Gare du Nord", "M4", "M5", walk: 130, comfortPenalty: 0)
        addRule("Gare du Nord", "RER B", "RER D", walk: 60, comfortPenalty: 0)
        for rerLine in ["RER B", "RER D"] {
            addPoleBridge("Gare du Nord", "M4", "Gare du Nord", rerLine, walk: 200, comfortPenalty: 35)
            addPoleBridge("Gare du Nord", "M5", "Gare du Nord", rerLine, walk: 210, comfortPenalty: 35)
        }
        addPoleBridge("Gare du Nord", "M4", "Magenta", "RER E", walk: 260, comfortPenalty: 60)

        // --- La Motte-Picquet - Grenelle (quai à quai M8 <-> M10) ---
        addRule("La Motte-Picquet - Grenelle", "M8", "M10", walk: 60, comfortPenalty: 0)
        addRule("La Motte-Picquet - Grenelle", "M6", "M8", walk: 150, comfortPenalty: 20)
        addRule("La Motte-Picquet - Grenelle", "M6", "M10", walk: 150, comfortPenalty: 20)

        // --- Denfert-Rochereau & Nation ---
        addRule("Denfert-Rochereau", "M4", "M6", walk: 120, comfortPenalty: 0)
        addPoleBridge("Denfert-Rochereau", "M6", "Denfert-Rochereau", "RER B", walk: 160, comfortPenalty: 20)
        addPoleBridge("Denfert-Rochereau", "M4", "Denfert-Rochereau", "RER B", walk: 165, comfortPenalty: 20)
        addRule("Nation", "M1", "M6", walk: 140, comfortPenalty: 0)
        addPoleBridge("Nation", "M1", "Nation", "RER A", walk: 160, comfortPenalty: 20)

        return matrix
    }
}
