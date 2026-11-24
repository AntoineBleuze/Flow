import Combine
import CoreLocation
import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// Mode d'apparence choisi par l'utilisateur.
enum AppAppearanceMode: String, CaseIterable, Identifiable, Codable {
    case system
    case light
    case dark

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .system: return "Système"
        case .light: return "Clair"
        case .dark: return "Sombre"
        }
    }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

/// Préférence de latéralité déterminant le placement des boutons retour/fermer des sheets.
enum HandednessMode: String, CaseIterable, Identifiable, Codable {
    case left
    case right

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .left: return "Gaucher"
        case .right: return "Droitier"
        }
    }

    var detail: String {
        switch self {
        case .left: return "Boutons retour à gauche"
        case .right: return "Boutons retour à droite"
        }
    }

    var isBackButtonTrailing: Bool {
        self == .right
    }
}

/// Vitesse de marche préférée pour les correspondances et accès aux stations.
enum WalkingSpeed: String, CaseIterable, Identifiable, Codable {
    case slow
    case normal
    case fast

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .slow: return "Lente"
        case .normal: return "Normale"
        case .fast: return "Rapide"
        }
    }

    var detail: String {
        switch self {
        case .slow: return "~3,5 km/h • Correspondances confortables"
        case .normal: return "~4,8 km/h • Allure standard"
        case .fast: return "~6,0 km/h • Correspondances serrées"
        }
    }
}

/// Modes de transport évitables par défaut (mappés sur les identifiants Navitia).
enum AvoidableTransportMode: String, CaseIterable, Identifiable, Codable {
    case metro = "physical_mode:Metro"
    case rer = "physical_mode:RapidTransit"
    case tram = "physical_mode:Tramway"
    case train = "physical_mode:LocalTrain"
    case bus = "physical_mode:Bus"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .metro: return "Métro"
        case .rer: return "RER"
        case .tram: return "Tram"
        case .train: return "Train"
        case .bus: return "Bus"
        }
    }

    var systemIcon: String {
        switch self {
        case .metro: return "tram.fill.tunnel"
        case .rer: return "tram.fill"
        case .tram: return "lightrail"
        case .train: return "train.side.front.car"
        case .bus: return "bus.fill"
        }
    }
}

/// Lieu enregistré par l'utilisateur (Domicile ou Travail).
struct SavedPlace: Codable, Equatable, Identifiable {
    let id: String
    let name: String
    let subtitle: String?
    let latitude: Double
    let longitude: Double
    let stationId: String?

    init(
        id: String = UUID().uuidString,
        name: String,
        subtitle: String? = nil,
        latitude: Double,
        longitude: Double,
        stationId: String? = nil
    ) {
        self.id = id
        self.name = name
        self.subtitle = subtitle
        self.latitude = latitude
        self.longitude = longitude
        self.stationId = stationId
    }

    init(from station: MapStation) {
        self.id = station.id
        self.name = station.name
        self.subtitle = station.city
        self.latitude = station.latitude
        self.longitude = station.longitude
        self.stationId = station.isAddress ? nil : station.id
    }

    @MainActor
    func toMapStation() -> MapStation {
        if let stationId = stationId {
            if let existing = MapDataService.shared.allStations.first(where: { $0.id == stationId }) {
                return existing
            }
            return MapStation(
                id: stationId,
                name: name,
                coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                platforms: [],
                isHub: false,
                mainType: .metro,
                lines: [],
                city: subtitle
            )
        }
        return MapStation(
            id: "address:\(latitude),\(longitude)",
            name: name,
            coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            platforms: [],
            isHub: false,
            mainType: .bus,
            lines: [],
            city: subtitle
        )
    }
}

/// Gestionnaire centralisé des préférences utilisateur persistées sur l'App Group.
@MainActor
final class UserPreferencesManager: ObservableObject {
    static let shared = UserPreferencesManager()

    static let appGroupSuite = "group.AntoineBleuze.Flow"
    static let avatarPalette: [String] = [
        "007AFF",
        "34C759",
        "FF9500",
        "AF52DE",
        "FF2D55",
        "5AC8FA"
    ]

    private enum Keys {
        static let userName = "pref_userName"
        static let avatarColorHex = "pref_avatarColorHex"
        static let homePlace = "pref_homePlace"
        static let workPlace = "pref_workPlace"
        static let appearanceMode = "pref_appearanceMode"
        static let defaultAccessibleRouting = "pref_defaultAccessibleRouting"
        static let avoidedTransportModes = "pref_avoidedTransportModes"
        static let walkingSpeed = "pref_walkingSpeed"
        static let simulateGPE = "simulateGPE"
        static let hapticsEnabled = "pref_hapticsEnabled"
        static let skipLoadingAnimation = "pref_skipLoadingAnimation"
        static let useFlowServer = "pref_useFlowServer"
        static let handedness = "pref_handedness"

        static var allPrefixedKeys: [String] {
            [
                userName,
                avatarColorHex,
                homePlace,
                workPlace,
                appearanceMode,
                defaultAccessibleRouting,
                avoidedTransportModes,
                walkingSpeed,
                simulateGPE,
                hapticsEnabled,
                skipLoadingAnimation,
                useFlowServer,
                handedness
            ]
        }
    }

    private let defaults: UserDefaults
    private var isBatchUpdating = false

    @Published var userName: String {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(userName, forKey: Keys.userName)
        }
    }

    @Published var avatarColorHex: String {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(avatarColorHex, forKey: Keys.avatarColorHex)
        }
    }

    @Published var homePlace: SavedPlace? {
        didSet {
            guard !isBatchUpdating else { return }
            saveCodable(homePlace, forKey: Keys.homePlace)
        }
    }

    @Published var workPlace: SavedPlace? {
        didSet {
            guard !isBatchUpdating else { return }
            saveCodable(workPlace, forKey: Keys.workPlace)
        }
    }

    @Published var appearanceMode: AppAppearanceMode {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(appearanceMode.rawValue, forKey: Keys.appearanceMode)
        }
    }

    @Published var defaultAccessibleRouting: Bool {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(defaultAccessibleRouting, forKey: Keys.defaultAccessibleRouting)
        }
    }

    @Published var avoidedTransportModes: Set<String> {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(Array(avoidedTransportModes).sorted(), forKey: Keys.avoidedTransportModes)
        }
    }

    @Published var walkingSpeed: WalkingSpeed {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(walkingSpeed.rawValue, forKey: Keys.walkingSpeed)
        }
    }

    @Published var simulateGPE: Bool {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(simulateGPE, forKey: Keys.simulateGPE)
            UserDefaults.standard.set(simulateGPE, forKey: Keys.simulateGPE)
        }
    }

    @Published var hapticsEnabled: Bool {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(hapticsEnabled, forKey: Keys.hapticsEnabled)
        }
    }

    @Published var skipLoadingAnimation: Bool {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(skipLoadingAnimation, forKey: Keys.skipLoadingAnimation)
        }
    }

    @Published var useFlowServer: Bool {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(useFlowServer, forKey: Keys.useFlowServer)
            FlowServerService.shared.isEnabled = useFlowServer
            if useFlowServer {
                FlowServerService.shared.connectWebSocket()
            } else {
                FlowServerService.shared.disconnectWebSocket()
            }
        }
    }

    @Published var handedness: HandednessMode {
        didSet {
            guard !isBatchUpdating else { return }
            defaults.set(handedness.rawValue, forKey: Keys.handedness)
        }
    }

    private init() {
        let sharedDefaults = UserDefaults(suiteName: Self.appGroupSuite) ?? .standard
        self.defaults = sharedDefaults

        self.userName = sharedDefaults.string(forKey: Keys.userName) ?? ""
        self.avatarColorHex = sharedDefaults.string(forKey: Keys.avatarColorHex) ?? "007AFF"
        self.homePlace = Self.loadCodable(SavedPlace.self, from: sharedDefaults, key: Keys.homePlace)
        self.workPlace = Self.loadCodable(SavedPlace.self, from: sharedDefaults, key: Keys.workPlace)

        let rawAppearance = sharedDefaults.string(forKey: Keys.appearanceMode) ?? AppAppearanceMode.system.rawValue
        self.appearanceMode = AppAppearanceMode(rawValue: rawAppearance) ?? .system

        self.defaultAccessibleRouting = sharedDefaults.bool(forKey: Keys.defaultAccessibleRouting)
        let savedModes = sharedDefaults.stringArray(forKey: Keys.avoidedTransportModes) ?? []
        self.avoidedTransportModes = Set(savedModes)

        let rawSpeed = sharedDefaults.string(forKey: Keys.walkingSpeed) ?? WalkingSpeed.normal.rawValue
        self.walkingSpeed = WalkingSpeed(rawValue: rawSpeed) ?? .normal

        if sharedDefaults.object(forKey: Keys.simulateGPE) != nil {
            self.simulateGPE = sharedDefaults.bool(forKey: Keys.simulateGPE)
        } else {
            self.simulateGPE = UserDefaults.standard.bool(forKey: Keys.simulateGPE)
        }

        if sharedDefaults.object(forKey: Keys.hapticsEnabled) != nil {
            self.hapticsEnabled = sharedDefaults.bool(forKey: Keys.hapticsEnabled)
        } else {
            self.hapticsEnabled = true
        }

        self.skipLoadingAnimation = sharedDefaults.bool(forKey: Keys.skipLoadingAnimation)

        if sharedDefaults.object(forKey: Keys.useFlowServer) != nil {
            self.useFlowServer = sharedDefaults.bool(forKey: Keys.useFlowServer)
        } else {
            self.useFlowServer = true
        }

        let rawHandedness = sharedDefaults.string(forKey: Keys.handedness) ?? HandednessMode.right.rawValue
        self.handedness = HandednessMode(rawValue: rawHandedness) ?? .right
    }

    /// Initiales affichées dans l'avatar utilisateur (vide si aucun nom renseigné).
    var userInitials: String {
        let words = userName
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
        guard !words.isEmpty else { return "" }
        if words.count == 1 {
            return String(words[0].prefix(2)).uppercased()
        }
        let first = words.first?.first.map { String($0) } ?? ""
        let last = words.last?.first.map { String($0) } ?? ""
        return (first + last).uppercased()
    }

    var avatarColor: Color {
        Color(hex: avatarColorHex)
    }

    func toggleAvoidedMode(_ mode: AvoidableTransportMode) {
        if avoidedTransportModes.contains(mode.rawValue) {
            avoidedTransportModes.remove(mode.rawValue)
        } else {
            avoidedTransportModes.insert(mode.rawValue)
        }
    }

    func triggerHapticImpact(_ style: Int = 0) {
        guard hapticsEnabled else { return }
        #if canImport(UIKit)
        let feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle = switch style {
        case 1: .medium
        case 2: .heavy
        default: .light
        }
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
        #endif
    }

    /// Synchronise la valeur de `simulateGPE` si elle a été modifiée ailleurs via `@AppStorage`.
    func syncSimulateGPEFromStandardDefaults() {
        let standardValue = UserDefaults.standard.bool(forKey: Keys.simulateGPE)
        if simulateGPE != standardValue {
            simulateGPE = standardValue
        }
    }

    /// Remet toutes les préférences aux valeurs par défaut et nettoie les clés persistées.
    func resetAllPreferences() {
        isBatchUpdating = true
        for key in Keys.allPrefixedKeys {
            defaults.removeObject(forKey: key)
        }
        UserDefaults.standard.removeObject(forKey: Keys.simulateGPE)

        userName = ""
        avatarColorHex = "007AFF"
        homePlace = nil
        workPlace = nil
        appearanceMode = .system
        defaultAccessibleRouting = false
        avoidedTransportModes = []
        walkingSpeed = .normal
        simulateGPE = false
        hapticsEnabled = true
        skipLoadingAnimation = false
        useFlowServer = true
        handedness = .right
        isBatchUpdating = false

        FlowServerService.shared.isEnabled = true
        FlowServerService.shared.connectWebSocket()
    }

    private func saveCodable<T: Encodable>(_ value: T?, forKey key: String) {
        if let value = value, let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key)
        } else {
            defaults.removeObject(forKey: key)
        }
    }

    private static func loadCodable<T: Decodable>(_ type: T.Type, from defaults: UserDefaults, key: String) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
