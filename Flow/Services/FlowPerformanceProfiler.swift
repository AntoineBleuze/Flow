import Foundation
import os

/// Utilitaire de profilage Instruments (`OSSignposter` / Points of Interest) et métriques OSLog.
nonisolated enum FlowPerformanceProfiler {
    static let signposter = OSSignposter(subsystem: "com.flow.app", category: .pointsOfInterest)
    static let logger = Logger(subsystem: "com.flow.app", category: "Performance")

    struct IntervalToken: Sendable {
        let name: StaticString
        let state: OSSignpostIntervalState
        let start: ContinuousClock.Instant
    }

    static func beginInterval(_ name: StaticString) -> IntervalToken {
        let id = signposter.makeSignpostID()
        let state = signposter.beginInterval(name, id: id)
        return IntervalToken(name: name, state: state, start: ContinuousClock.now)
    }

    static func endInterval(_ token: IntervalToken, detail: String? = nil) {
        let elapsed = token.start.duration(to: .now)
        let ms = Double(elapsed.components.seconds) * 1000.0 + Double(elapsed.components.attoseconds) / 1_000_000_000_000_000.0
        if let detail, !detail.isEmpty {
            signposter.endInterval(token.name, token.state, "\(detail, privacy: .public)")
            logger.info("⏱️ [Perf] \(String(describing: token.name), privacy: .public) — \(ms, format: .fixed(precision: 2)) ms (\(detail, privacy: .public))")
        } else {
            signposter.endInterval(token.name, token.state)
            logger.info("⏱️ [Perf] \(String(describing: token.name), privacy: .public) — \(ms, format: .fixed(precision: 2)) ms")
        }
    }

    static func emitEvent(_ name: StaticString, detail: String? = nil) {
        let id = signposter.makeSignpostID()
        if let detail, !detail.isEmpty {
            signposter.emitEvent(name, id: id, "\(detail, privacy: .public)")
            logger.info("📍 [Perf] \(String(describing: name), privacy: .public): \(detail, privacy: .public)")
        } else {
            signposter.emitEvent(name, id: id)
            logger.info("📍 [Perf] \(String(describing: name), privacy: .public)")
        }
    }

    static func measure<T>(_ name: StaticString, detail: String? = nil, block: () throws -> T) rethrows -> T {
        let token = beginInterval(name)
        defer { endInterval(token, detail: detail) }
        return try block()
    }

    static func measureAsync<T>(_ name: StaticString, detail: String? = nil, block: () async throws -> T) async rethrows -> T {
        let token = beginInterval(name)
        defer { endInterval(token, detail: detail) }
        return try await block()
    }
}
