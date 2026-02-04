import Combine
import Foundation

public class IDFMService {
    public static let shared = IDFMService()

    // Clé API à définir par l'utilisateur
    // Pour tester, l'utilisateur devra mettre sa clé ici ou via une méthode de config
    var apiKey: String = "YOUR_IDFM_API_KEY"

    private let baseURL = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia"

    public func fetchDepartures(for stationId: String) -> AnyPublisher<[Departure], Error> {
        guard !apiKey.isEmpty else {
            print("⚠️ API Key manquante pour IDFMService")
            return Fail(error: URLError(.userAuthenticationRequired)).eraseToAnyPublisher()
        }

        // Formatage de l'ID pour Navitia
        var endpoint = "stop_points"
        var finalId = stationId

        if stationId.contains("stop_area") {
            endpoint = "stop_areas"
            // Si l'ID a déjà le prefixe, on le garde, sinon on l'ajoute
            finalId = stationId.hasPrefix("stop_area:") ? stationId : "stop_area:\(stationId)"
        } else {
            // Par défaut on considère que c'est un stop_point
            finalId = stationId.hasPrefix("stop_point:") ? stationId : "stop_point:\(stationId)"
        }

        guard
            let encodedId = finalId.addingPercentEncoding(
                withAllowedCharacters: CharacterSet.urlPathAllowed),
            let url = URL(string: "\(baseURL)/\(endpoint)/\(encodedId)/departures")
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apiKey")

        print("📡 Requesting: \(url.absoluteString)")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .handleEvents(receiveOutput: { data in
                // Debug: print json string if needed
                if let str = String(data: data, encoding: .utf8) {
                    print("📥 Received Data: \(str)")
                }
            })
            .decode(type: DepartureResponse.self, decoder: JSONDecoder())
            .map { $0.departures }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
