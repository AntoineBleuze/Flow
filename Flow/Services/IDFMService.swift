import Combine
import Foundation

class IDFMService {
    static let shared = IDFMService()

    // Clé API à définir par l'utilisateur
    // Pour tester, l'utilisateur devra mettre sa clé ici ou via une méthode de config
    var apiKey: String = "YOUR_IDFM_API_KEY"

    private let baseURL = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia"

    func fetchDepartures(for stationId: String) -> AnyPublisher<[Departure], Error> {
        // Mode serveur : passer par FlowServer si activé, avec fallback en cas d'erreur
        if FlowServerService.shared.isEnabled {
            print("📡 [Server Mode] Departures via FlowServer for \(stationId)")
            return FlowServerService.shared.fetchDepartures(for: stationId)
                .catch { [weak self] error -> AnyPublisher<[Departure], Error> in
                    print("⚠️ [Server Mode Failed] falling back to direct departures for \(stationId): \(error.localizedDescription)")
                    guard let self = self else {
                        return Fail(error: error).eraseToAnyPublisher()
                    }
                    return self.fetchDirectDepartures(for: stationId)
                }
                .eraseToAnyPublisher()
        }

        print("📡 [Direct Mode] Departures direct from IDFM for \(stationId)")
        return fetchDirectDepartures(for: stationId)
    }

    private func fetchDirectDepartures(for stationId: String) -> AnyPublisher<[Departure], Error> {
        guard !apiKey.isEmpty else {
            return Fail(error: URLError(.userAuthenticationRequired)).eraseToAnyPublisher()
        }

        let endpoint = stationId.contains("stop_area") ? "stop_areas" : "stop_points"
        
        guard let encodedId = stationId.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
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
