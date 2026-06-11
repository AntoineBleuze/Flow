import AppIntents
import SwiftUI
import WidgetKit

@available(iOS 18.0, *)
public struct FlowLaunchItineraryControl: ControlWidget {
    public static let kind: String = "AntoineBleuze.Flow.LaunchItinerary"

    public init() {}

    public var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton(action: LaunchItineraryIntent()) {
                Label("Itinéraires", systemImage: "arrow.triangle.turn.up.right.circle.fill")
            }
        }
        .displayName("Itinéraire")
        .description("Ouvre Flow directement sur l'onglet Itinéraires.")
    }
}

@available(iOS 18.0, *)
public struct FlowLaunchTrafficControl: ControlWidget {
    public static let kind: String = "AntoineBleuze.Flow.LaunchTraffic"

    public init() {}

    public var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton(action: LaunchTrafficIntent()) {
                Label("Trafic", systemImage: "tram.fill")
            }
        }
        .displayName("Trafic")
        .description("Ouvre Flow directement sur l'onglet Trafic.")
    }
}

@available(iOS 18.0, *)
public struct LaunchItineraryIntent: AppIntent {
    public static var title: LocalizedStringResource = "Ouvrir Itinéraires"
    public static var openAppWhenRun: Bool = true

    public init() {}

    public func perform() async throws -> some IntentResult & OpensIntent {
        let url = URL(string: "flow://itinerary")!
        return .result(opensIntent: OpenURLIntent(url))
    }
}

@available(iOS 18.0, *)
public struct LaunchTrafficIntent: AppIntent {
    public static var title: LocalizedStringResource = "Ouvrir Trafic"
    public static var openAppWhenRun: Bool = true

    public init() {}

    public func perform() async throws -> some IntentResult & OpensIntent {
        let url = URL(string: "flow://traffic")!
        return .result(opensIntent: OpenURLIntent(url))
    }
}
