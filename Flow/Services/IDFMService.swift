import Combine
import Foundation

class IDFMService {
    static let shared = IDFMService()

    // Clé API sécurisée (chargée depuis les variables d'environnement Xcode,
    // un fichier local non-versionné Secrets.plist, ou UserDefaults).
    var apiKey: String = {
        // 1. Variable d'environnement (ex: Scheme Xcode)
        if let envKey = ProcessInfo.processInfo.environment["IDFM_API_KEY"], !envKey.isEmpty {
            return envKey
        }
        // 2. Fichier Secrets.plist local (ignoré par Git)
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
           let secretKey = dict["IDFM_API_KEY"] as? String, !secretKey.isEmpty {
            return secretKey
        }
        // 3. UserDefaults (App Group ou standard)
        if let groupDefaults = UserDefaults(suiteName: "group.AntoineBleuze.Flow"),
           let storedKey = groupDefaults.string(forKey: "idfm_api_key"), !storedKey.isEmpty {
            return storedKey
        }
        return UserDefaults.standard.string(forKey: "idfm_api_key") ?? ""
    }()

    private let baseURL = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia"

    func fetchDepartures(for stationId: String, force: Bool = false) -> AnyPublisher<[Departure], Error> {
        // Mode serveur : passer par FlowServer si activé
        if FlowServerService.shared.isEnabled {
            print("📡 [Server Mode] Departures via FlowServer for \(stationId) (force: \(force))")
            return FlowServerService.shared.fetchDepartures(for: stationId, force: force)
        }

        print("📡 [Direct Mode] Departures direct from IDFM for \(stationId)")
        return fetchDirectDepartures(for: stationId)
    }

    private func fetchDirectDepartures(for stationId: String) -> AnyPublisher<[Departure], Error> {
        guard !apiKey.isEmpty else {
            return Fail(error: URLError(.userAuthenticationRequired)).eraseToAnyPublisher()
        }

        let endpoint = stationId.contains("stop_area") ? "stop_areas" : "stop_points"
        
        // Ensure the ID has the proper prefix in the path for the IDFM Marketplace API
        let cleanId: String
        if stationId.contains("stop_area:") || stationId.contains("stop_point:") {
            cleanId = stationId
        } else {
            let prefix = endpoint == "stop_areas" ? "stop_area:" : "stop_point:"
            cleanId = "\(prefix)\(stationId)"
        }

        guard let encodedId = cleanId.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: "\(baseURL)/\(endpoint)/\(encodedId)/departures") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apiKey")

        print("📡 Requesting Direct Departures: \(url.absoluteString)")

        return URLSession.shared.dataTaskPublisher(for: request)
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

    func fetchLineRoute(for navitiaId: String) -> AnyPublisher<[LineStation], Error> {
        // Mode serveur : interdire les requêtes directes à IDFM
        if FlowServerService.shared.isEnabled {
            print("⚠️ [Server Mode] Direct line route fetch blocked")
            return Fail(error: URLError(.cannotConnectToHost)).eraseToAnyPublisher()
        }

        guard !apiKey.isEmpty else {
            return Fail(error: URLError(.userAuthenticationRequired)).eraseToAnyPublisher()
        }

        // Utilisation de route_schedules pour avoir les arrêts en ordre
        // On prend le premier calendrier/route disponible pour simplifier
        guard let encodedId = navitiaId.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: "\(baseURL)/lines/\(encodedId)/route_schedules?count=1") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apiKey")

        print("📡 Requesting Route: \(url.absoluteString)")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: RouteScheduleResponse.self, decoder: JSONDecoder())
            .map { response in
                guard let schedule = response.route_schedules?.first,
                      let rows = schedule.table?.rows else {
                    return []
                }
                
                return rows.enumerated().map { index, row in
                    LineStation(
                        id: row.stop_point?.id ?? UUID().uuidString,
                        name: row.stop_point?.name ?? "Station inconnue",
                        order: index,
                        commercialModes: row.stop_point?.commercial_modes?.map { $0.name } ?? []
                    )
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
