import Foundation

// MARK: - Système de scoring en Temps Perçu & Dominance de Pareto (Phase 4)

/// Détail des composantes du coût généralisé d'un itinéraire CSA.
struct CSAScoreBreakdown: Sendable, Equatable {
    let totalDurationSeconds: Int32
    let transferCount: Int
    let walkingSeconds: Int32
    let waitingSeconds: Int32
    let comfortPenaltySeconds: Int32

    let transferCost: Double
    let walkingCost: Double
    let waitingCost: Double
    let comfortCost: Double
    let totalScore: Double
}

/// Itinéraire CSA enrichi de son score multi-critères (temps perçu en secondes équivalentes).
struct ScoredJourney: Sendable, Equatable {
    let journey: CSAJourney
    let score: Double
    let breakdown: CSAScoreBreakdown
}

/// Évaluateur multi-critères de coût généralisé (Temps perçu) :
/// `Score = T_total + (P_changement × N_corr) + (α × T_marche) + (β × T_attente) + M_confort`
struct GeneralizedCostScorer: Sendable, Equatable {
    /// Pénalité fixe par correspondance ($P_{\text{changement}}$, défaut : 360 s = 6 min).
    var transferPenaltySeconds: Double
    /// Coefficient de pénibilité de la marche ($\alpha$, défaut : 1.6).
    var walkingWeight: Double
    /// Coefficient de pénibilité de l'attente à quai ($\beta$, défaut : 1.3).
    var waitingWeight: Double
    /// Prise en compte des malus d'inconfort spécifiques aux grands pôles (`TransferMatrix`).
    var includeComfortPenalties: Bool

    init(
        transferPenaltySeconds: Double = 360.0,
        walkingWeight: Double = 1.6,
        waitingWeight: Double = 1.3,
        includeComfortPenalties: Bool = true
    ) {
        self.transferPenaltySeconds = transferPenaltySeconds
        self.walkingWeight = walkingWeight
        self.waitingWeight = waitingWeight
        self.includeComfortPenalties = includeComfortPenalties
    }

    /// Calcule le score en temps perçu d'un itinéraire `CSAJourney`.
    func evaluate(_ journey: CSAJourney) -> ScoredJourney {
        let totalDuration = journey.totalDurationSeconds
        let transfers = journey.transferCount
        let walking = journey.totalWalkingSeconds
        let waiting = journey.totalWaitingSeconds
        let comfort = includeComfortPenalties ? journey.totalComfortPenaltySeconds : 0

        let transferCost = transferPenaltySeconds * Double(transfers)
        let walkingCost = walkingWeight * Double(walking)
        let waitingCost = waitingWeight * Double(waiting)
        let comfortCost = Double(comfort)

        let totalScore = Double(totalDuration)
            + transferCost
            + walkingCost
            + waitingCost
            + comfortCost

        let breakdown = CSAScoreBreakdown(
            totalDurationSeconds: totalDuration,
            transferCount: transfers,
            walkingSeconds: walking,
            waitingSeconds: waiting,
            comfortPenaltySeconds: comfort,
            transferCost: transferCost,
            walkingCost: walkingCost,
            waitingCost: waitingCost,
            comfortCost: comfortCost,
            totalScore: totalScore
        )

        return ScoredJourney(journey: journey, score: totalScore, breakdown: breakdown)
    }

    /// Déduplique, filtre les options dominées au sens de Pareto et trie par score croissant.
    func rankAndFilter(_ journeys: [CSAJourney]) -> [ScoredJourney] {
        guard !journeys.isEmpty else { return [] }

        // 1. Déduplication structurelle (en conservant la meilleure variante si même séquence de lignes/arrêts)
        var bestBySignature: [String: ScoredJourney] = [:]
        for journey in journeys {
            let scored = evaluate(journey)
            let sig = Self.routeSignature(for: journey)
            if let existing = bestBySignature[sig] {
                if Self.isPreferred(scored, over: existing) {
                    bestBySignature[sig] = scored
                }
            } else {
                bestBySignature[sig] = scored
            }
        }

        let uniqueCandidates = Array(bestBySignature.values)

        // 2. Filtrage de dominance de Pareto
        let nonDominated = filterParetoDominated(uniqueCandidates)

        // 3. Tri par score croissant (puis heure d'arrivée, puis moins de correspondances)
        return nonDominated.sorted(by: Self.isPreferred)
    }

    /// Élimine les itinéraires dominés au sens de Pareto :
    /// - Règle stricte : plus long (`totalDurationSeconds` supérieur) ET plus de correspondances (`transferCount` supérieur).
    /// - Règle complète : au moins aussi long, autant ou plus de correspondances, arrivée égale ou plus tardive, ET score perçu strictement pire.
    func filterParetoDominated(_ candidates: [ScoredJourney]) -> [ScoredJourney] {
        guard candidates.count > 1 else { return candidates }

        return candidates.filter { candidate in
            !candidates.contains { other in
                guard other != candidate else { return false }
                return Self.dominates(other, candidate)
            }
        }
    }

    /// Retourne `true` si `a` domine `b` au sens de Pareto (rendant `b` non pertinent).
    static func dominates(_ a: ScoredJourney, _ b: ScoredJourney) -> Bool {
        let durA = a.journey.totalDurationSeconds
        let durB = b.journey.totalDurationSeconds
        let trA = a.journey.transferCount
        let trB = b.journey.transferCount

        // 1. Dominance stricte Durée × Correspondances : `b` est à la fois plus long ET comporte plus de changements
        if durA < durB && trA < trB {
            return true
        }

        // 2. Dominance multi-critères complète : `a` est meilleur ou égal partout et strictement meilleur en score perçu
        if durA <= durB &&
            trA <= trB &&
            a.journey.arrivalTime <= b.journey.arrivalTime &&
            a.score < b.score &&
            (durA < durB || trA < trB || a.journey.arrivalTime < b.journey.arrivalTime || a.journey.totalWalkingSeconds < b.journey.totalWalkingSeconds) {
            return true
        }

        return false
    }

    private static func isPreferred(_ lhs: ScoredJourney, over rhs: ScoredJourney) -> Bool {
        if abs(lhs.score - rhs.score) > 1e-6 {
            return lhs.score < rhs.score
        }
        if lhs.journey.arrivalTime != rhs.journey.arrivalTime {
            return lhs.journey.arrivalTime < rhs.journey.arrivalTime
        }
        if lhs.journey.transferCount != rhs.journey.transferCount {
            return lhs.journey.transferCount < rhs.journey.transferCount
        }
        return lhs.journey.totalDurationSeconds < rhs.journey.totalDurationSeconds
    }

    /// Signature canonique d'une variante d'itinéraire (séquence des lignes et stations d'échange).
    static func routeSignature(for journey: CSAJourney) -> String {
        let legs = journey.rideLegs
        guard !legs.isEmpty else {
            return "walk:\(journey.originStop)->\(journey.destinationStop)@\(journey.departureTime)"
        }
        return legs
            .map { "\($0.lineId):\($0.departureStop)->\($0.arrivalStop)" }
            .joined(separator: "|")
    }
}
