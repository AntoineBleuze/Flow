//
//  NetworkMonitorService.swift
//  Flow
//
//  Surveillance de la connectivité réseau et de la joignabilité du serveur en direct.
//  Permet de maintenir un état résilient en cas de perte temporaire de réseau (tunnels, métro).
//

import Combine
import Foundation
import Network

@MainActor
final class NetworkMonitorService: ObservableObject {
    static let shared = NetworkMonitorService()

    /// Indique si une interface réseau active est disponible
    @Published private(set) var isNetworkAvailable: Bool = true

    /// Indique si la connexion passe par le réseau cellulaire
    @Published private(set) var isCellular: Bool = false

    /// Indique si la connexion passe par le Wi-Fi
    @Published private(set) var isWiFi: Bool = false

    /// Indique si le serveur backend / API répond avec succès
    @Published private(set) var isServerResponding: Bool = true

    /// Horodatage de la dernière réponse confirmée du serveur
    @Published private(set) var lastSuccessfulServerResponse: Date?

    /// Mode hors-ligne actif (réseau coupé ou serveur injoignable)
    @Published private(set) var isOfflineMode: Bool = false

    private let monitor = NWPathMonitor()
    private let monitorQueue = DispatchQueue(label: "com.flow.networkMonitor", qos: .utility)
    private var healthCheckTask: Task<Void, Never>?
    private var isCheckingHealth = false

    private init() {
        startMonitoring()
    }

    deinit {
        monitor.cancel()
        healthCheckTask?.cancel()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                let available = (path.status == .satisfied)
                let wasAvailable = self.isNetworkAvailable

                self.isNetworkAvailable = available
                self.isCellular = path.usesInterfaceType(.cellular)
                self.isWiFi = path.usesInterfaceType(.wifi)

                if !available {
                    // Perte réseau immédiate (ex: entrée dans tunnel de métro)
                    self.isServerResponding = false
                    self.isOfflineMode = true
                    print("📡 [NetworkMonitor] Connexion réseau PERDUE. Passage en mode hors-ligne.")
                } else if !wasAvailable && available {
                    // Rétablissement du réseau : vérifier le serveur avant de basculer
                    print("📡 [NetworkMonitor] Réseau rétabli. Vérification de la joignabilité du serveur...")
                    self.verifyServerReachability()
                }
            }
        }
        monitor.start(queue: monitorQueue)
    }

    /// Appelé lors d'un succès de requête API (ex: départs reçus)
    func recordServerSuccess() {
        self.isServerResponding = true
        self.isOfflineMode = !self.isNetworkAvailable
        self.lastSuccessfulServerResponse = Date()
    }

    /// Appelé lors d'un échec de requête API (ex: timeout, erreur réseau, 5xx)
    func recordServerFailure(error: Error? = nil) {
        if let err = error as? URLError {
            switch err.code {
            case .notConnectedToInternet, .networkConnectionLost, .timedOut, .cannotConnectToHost, .dnsLookupFailed:
                self.isServerResponding = false
                self.isOfflineMode = true
            default:
                break
            }
        } else {
            self.isServerResponding = false
            self.isOfflineMode = true
        }
        print("⚠️ [NetworkMonitor] Échec de communication avec le serveur (hors-ligne). Données existantes préservées.")
    }

    /// Vérification asynchrone de la santé du serveur
    func verifyServerReachability() {
        guard isNetworkAvailable, !isCheckingHealth else { return }
        isCheckingHealth = true

        healthCheckTask?.cancel()
        healthCheckTask = Task { [weak self] in
            guard let self = self else { return }
            defer { self.isCheckingHealth = false }

            let isHealthy = await FlowServerService.shared.checkHealthAsync()
            if !Task.isCancelled {
                if isHealthy {
                    print("✅ [NetworkMonitor] Serveur joignable et opérationnel.")
                    self.recordServerSuccess()
                } else {
                    print("⚠️ [NetworkMonitor] Réseau présent mais serveur injoignable.")
                    self.recordServerFailure()
                }
            }
        }
    }
}
