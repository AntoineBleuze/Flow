//
//  FlowServerService.swift
//  Flow
//
//  Service pour communiquer avec le serveur backend FlowServer.
//  Supporte les appels REST et la réception push via WebSocket.
//

import Combine
import CoreLocation
import Foundation
#if os(iOS)
import UIKit
#endif

class FlowServerService: ObservableObject {
    static let shared = FlowServerService()

    // MARK: - Configuration

    private let primaryHost = "apiflow.hd.free.fr"
    private let fallbackIP = "192.168.1.190"
    private let fallbackPort = "3001"

    /// URL de base du serveur FlowServer (REST)
    @Published var baseURL: String = "https://apiflow.hd.free.fr"

    /// URL WebSocket du serveur
    var wsURL: String { baseURL.replacingOccurrences(of: "https://", with: "wss://").replacingOccurrences(of: "http://", with: "ws://") }

    /// Active ou désactive l'utilisation du serveur.
    /// Si `false`, les services existants utiliseront l'appel direct à l'API IDFM.
    var isEnabled: Bool = true

    /// Timeout pour les requêtes réseau (en secondes)
    var requestTimeout: TimeInterval = 5.0

    // MARK: - État publié

    /// Dernières perturbations reçues via WebSocket push
    @Published var latestDisruptions: [Disruption] = []

    /// Indique si le WebSocket est connecté
    @Published var isConnected: Bool = false

    /// Horodatage de la dernière mise à jour push
    @Published var lastPushUpdate: Date?

    // MARK: - WebSocket

    private var webSocketTask: URLSessionWebSocketTask?
    private var reconnectTimer: Timer?
    private var cancellables = Set<AnyCancellable>()

    private init() {
        determineBestURL()
        
        #if os(iOS)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
        #endif
    }

    private func determineBestURL() {
        let primaryURLString = "https://\(primaryHost)/api/health"
        guard let primaryURL = URL(string: primaryURLString) else { return }
        var request = URLRequest(url: primaryURL)
        request.timeoutInterval = 3.0

        print("📡 [FlowServer] Vérification de la santé du serveur principal (\(primaryURLString))...")
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil {
                print("⚠️ [FlowServer] URL principale injoignable. Vérification du fallback...")
                let fallback = self.fallbackIP
                let port = self.fallbackPort
                let fallbackURLString = "http://\(fallback):\(port)/api/health"
                guard let fallbackURL = URL(string: fallbackURLString) else { return }
                var fallbackRequest = URLRequest(url: fallbackURL)
                fallbackRequest.timeoutInterval = 3.0
                
                URLSession.shared.dataTask(with: fallbackRequest) { [weak self] fallbackData, fallbackResponse, fallbackError in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        if fallbackError != nil {
                            print("❌ [FlowServer] Les deux serveurs sont injoignables. Conservation de l'URL principale pour tentatives ultérieures.")
                            self.baseURL = "https://\(self.primaryHost)"
                        } else {
                            print("✅ [FlowServer] URL de fallback joignable. Basculement sur \(fallback).")
                            self.baseURL = "http://\(fallback):\(port)"
                        }
                        if self.isEnabled {
                            self.connectWebSocket()
                        }
                    }
                }.resume()
            } else {
                DispatchQueue.main.async {
                    print("✅ [FlowServer] URL principale joignable (HTTPS).")
                    self.baseURL = "https://\(self.primaryHost)"
                    if self.isEnabled {
                        self.connectWebSocket()
                    }
                }
            }
        }.resume()
    }

    #if os(iOS)
    @objc private func appWillEnterForeground() {
        print("🔄 [FlowServer] App de retour au premier plan. Vérification de la santé du serveur...")
        determineBestURL()
    }
    #endif

    // MARK: - Session configurée

    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = requestTimeout
        config.timeoutIntervalForResource = 60
        return URLSession(configuration: config)
    }()

    // MARK: - Connexion WebSocket

    /// Démarre la connexion WebSocket pour recevoir les mises à jour push
    func connectWebSocket() {
        guard isEnabled else { return }
        guard let url = URL(string: wsURL) else {
            print("❌ [WS] URL WebSocket invalide: \(wsURL)")
            return
        }

        // Fermer la connexion existante si besoin
        disconnectWebSocket()

        print("🔌 [WS] Connexion à \(wsURL)...")
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.maximumMessageSize = 16 * 1024 * 1024  // 16 MB (défaut Apple = 1 MB)
        webSocketTask?.resume()

        DispatchQueue.main.async {
            self.isConnected = true
        }

        // Commencer à écouter les messages
        receiveMessage()

        // Configurer le ping/pong pour maintenir la connexion
        schedulePing()
    }

    /// Ferme la connexion WebSocket
    func disconnectWebSocket() {
        reconnectTimer?.invalidate()
        reconnectTimer = nil
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
        DispatchQueue.main.async {
            self.isConnected = false
        }
    }

    /// Demande un refresh manuel au serveur via WebSocket
    func requestRefresh() {
        guard let task = webSocketTask else { return }
        let message = URLSessionWebSocketTask.Message.string("{\"type\":\"request_refresh\"}")
        task.send(message) { error in
            if let error = error {
                print("❌ [WS] Erreur envoi refresh: \(error.localizedDescription)")
            } else {
                print("📤 [WS] Refresh demandé au serveur")
            }
        }
    }

    /// Abonnement aux mises à jour de départs pour une Live Activity
    func sendSubscribeDepartures(stopIds: [String], line: String, direction: String) {
        guard let task = webSocketTask else { return }
        let payload: [String: Any] = [
            "type": "subscribe_departures",
            "data": [
                "stopIds": stopIds,
                "line": line,
                "direction": direction
            ]
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: payload),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            let message = URLSessionWebSocketTask.Message.string(jsonString)
            task.send(message) { error in
                if let error = error {
                    print("❌ [WS] Erreur sub départs: \(error.localizedDescription)")
                } else {
                    print("📤 [WS] Abonnement départs envoyé (\(stopIds.count) arrets)")
                }
            }
        }
    }

    /// Désabonnement des départs
    func sendUnsubscribeDepartures() {
        guard let task = webSocketTask else { return }
        let message = URLSessionWebSocketTask.Message.string("{\"type\":\"unsubscribe_departures\"}")
        task.send(message) { error in
            if let error = error {
                print("❌ [WS] Erreur unsub départs: \(error.localizedDescription)")
            } else {
                print("📤 [WS] Désabonnement départs envoyé")
            }
        }
    }

    /// Abonnement complet à une station
    func sendSubscribeStation(stopIds: [String]) {
        guard let task = webSocketTask else { return }
        let payload: [String: Any] = [
            "type": "subscribe_station",
            "data": [
                "stopIds": stopIds
            ]
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: payload),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            let message = URLSessionWebSocketTask.Message.string(jsonString)
            task.send(message) { error in
                if let error = error {
                    print("❌ [WS] Erreur sub station: \(error.localizedDescription)")
                } else {
                    print("📤 [WS] Abonnement station envoyé (\(stopIds.count) arrets)")
                }
            }
        }
    }

    /// Désabonnement de la station complète
    func sendUnsubscribeStation() {
        guard let task = webSocketTask else { return }
        let message = URLSessionWebSocketTask.Message.string("{\"type\":\"unsubscribe_station\"}")
        task.send(message) { error in
            if let error = error {
                print("❌ [WS] Erreur unsub station: \(error.localizedDescription)")
            } else {
                print("📤 [WS] Désabonnement station envoyé")
            }
        }
    }

    // MARK: - Réception WebSocket

    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    self?.handleWebSocketMessage(text)
                case .data(let data):
                    if let text = String(data: data, encoding: .utf8) {
                        self?.handleWebSocketMessage(text)
                    }
                @unknown default:
                    break
                }
                // Continuer à écouter
                self?.receiveMessage()

            case .failure(let error):
                print("❌ [WS] Erreur réception: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.isConnected = false
                }
                // Tenter une reconnexion après 5 secondes
                self?.scheduleReconnect()
            }
        }
    }

    private func handleWebSocketMessage(_ text: String) {
        guard let data = text.data(using: .utf8) else { return }

        do {
            let message = try JSONDecoder().decode(WebSocketMessage.self, from: data)

            switch message.type {
            case "traffic_update":
                if let trafficData = message.data {
                    let disruptions = trafficData.disruptions ?? []
                    print("📥 [WS] Push reçu: \(disruptions.count) perturbations")

                    DispatchQueue.main.async {
                        self.latestDisruptions = disruptions
                        self.lastPushUpdate = Date()

                        // Mettre en cache les couleurs des lignes perturbées
                        MapDataService.shared.cacheColorsFromDisruptions(disruptions)

                        // Notifier le TrafficService pour mettre à jour l'UI
                        NotificationCenter.default.post(
                            name: .flowServerTrafficUpdate,
                            object: nil,
                            userInfo: ["disruptions": disruptions]
                        )
                    }
                }
            case "departure_update":
                if let departures = message.data?.departures {
                    print("📥 [WS] Push départs: \(departures.count) départs")
                    DispatchQueue.main.async {
                        // Mettre en cache les couleurs des lignes des départs
                        MapDataService.shared.cacheColors(from: departures)

                        NotificationCenter.default.post(
                            name: .flowServerDepartureUpdate,
                            object: nil,
                            userInfo: ["departures": departures]
                        )
                    }
                }
            case "station_update":
                if let departures = message.data?.departures {
                    print("📥 [WS] Push station globale: \(departures.count) départs")
                    DispatchQueue.main.async {
                        MapDataService.shared.cacheColors(from: departures)

                        NotificationCenter.default.post(
                            name: .flowServerStationUpdate,
                            object: nil,
                            userInfo: ["departures": departures]
                        )
                    }
                }
            default:
                print("📩 [WS] Message inconnu: \(message.type)")
            }
        } catch {
            print("❌ [WS] Erreur parsing message: \(error.localizedDescription)")
        }
    }

    // MARK: - Reconnexion automatique

    private func scheduleReconnect() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.reconnectTimer?.invalidate()
            self.reconnectTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) {
                [weak self] _ in
                print("🔄 [WS] Tentative de reconnexion...")
                self?.connectWebSocket()
            }
        }
    }

    private func schedulePing() {
        DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + 30) { [weak self] in
            self?.webSocketTask?.sendPing { error in
                if let error = error {
                    print("❌ [WS] Ping échoué: \(error.localizedDescription)")
                    self?.scheduleReconnect()
                } else {
                    self?.schedulePing()
                }
            }
        }
    }

    // MARK: - Vérification de la santé du serveur (REST)

    func checkHealth() -> AnyPublisher<Bool, Never> {
        guard let url = URL(string: "\(baseURL)/api/health") else {
            return Just(false).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: url)
            .map { _ in true }
            .replaceError(with: false)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    // MARK: - Departures (REST — toujours à la demande)

    func fetchDepartures(for stationId: String, force: Bool = false) -> AnyPublisher<[Departure], Error> {
        guard let encodedId = stationId.addingPercentEncoding(
            withAllowedCharacters: .urlPathAllowed)
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var urlString = "\(baseURL)/api/departures/\(encodedId)"
        if force {
            urlString += "?force=true"
        }
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        print("📡 [Server] Departures: \(url.absoluteString) (force: \(force))")

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: DepartureResponse.self, decoder: JSONDecoder())
            .map { $0.departures }
            .handleEvents(receiveOutput: { departures in
                Task { @MainActor in
                    MapDataService.shared.cacheColors(from: departures)
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    // MARK: - Traffic (REST fallback)

    func fetchTrafficInfo() -> AnyPublisher<[Disruption], Error> {
        // Si on a des données push récentes (moins de 2 min), les utiliser
        if let lastUpdate = lastPushUpdate,
            Date().timeIntervalSince(lastUpdate) < 120,
            !latestDisruptions.isEmpty
        {
            print("📡 [Server] Traffic depuis le cache push WebSocket")
            return Just(latestDisruptions)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        // Sinon, appel REST
        guard let url = URL(string: "\(baseURL)/api/traffic") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        print("📡 [Server] Traffic REST: \(url.absoluteString)")

        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ServerResponse.self, decoder: JSONDecoder())
            .map { (response: ServerResponse) -> [Disruption] in
                return response.disruptions ?? []
            }
            .handleEvents(receiveOutput: { disruptions in
                Task { @MainActor in
                    MapDataService.shared.cacheColorsFromDisruptions(disruptions)
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    // MARK: - Itinerary (REST)

    func searchItinerary(
        from: CLLocationCoordinate2D,
        to: CLLocationCoordinate2D,
        date: Date = Date(),
        isArrival: Bool = false
    ) -> AnyPublisher<[Journey], Error> {
        let fromCoord = "\(from.longitude);\(from.latitude)"
        let toCoord = "\(to.longitude);\(to.latitude)"

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        let dateStr = formatter.string(from: date)

        var components = URLComponents(string: "\(baseURL)/api/itinerary")!
        components.queryItems = [
            URLQueryItem(name: "from", value: fromCoord),
            URLQueryItem(name: "to", value: toCoord),
            URLQueryItem(name: "datetime", value: dateStr),
            URLQueryItem(name: "datetime_represents", value: isArrival ? "arrival" : "departure"),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "depth", value: "3"),
        ]

        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        print("📡 [Server] Itinerary: \(url.absoluteString)")

        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ItineraryResponse.self, decoder: JSONDecoder())
            .map(\.journeys)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// MARK: - Modèles WebSocket

struct WebSocketMessage: Decodable {
    let type: String
    let timestamp: String?
    let data: ServerResponse?
}

/// Réponse serveur pour les infos trafic ou départs
struct ServerResponse: Decodable {
    let disruptions: [Disruption]?
    let departures: [Departure]?
}

// MARK: - Notification pour le push trafic

extension Notification.Name {
    static let flowServerTrafficUpdate = Notification.Name("flowServerTrafficUpdate")
    static let flowServerDepartureUpdate = Notification.Name("flowServerDepartureUpdate")
    static let flowServerStationUpdate = Notification.Name("flowServerStationUpdate")
}
