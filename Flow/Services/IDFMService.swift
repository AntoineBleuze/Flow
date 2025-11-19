import Foundation
import Combine

class IDFMService {
    static let shared = IDFMService()
    
    // Clé API à définir par l'utilisateur
    // Pour tester, l'utilisateur devra mettre sa clé ici ou via une méthode de config
    var apiKey: String = "YOUR_IDFM_API_KEY"
    
    private let baseURL = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia"
    
    func fetchDepartures(for stationId: String) -> AnyPublisher<[Departure], Error> {
        guard !apiKey.isEmpty else {
            print("⚠️ API Key manquante pour IDFMService")
            return Fail(error: URLError(.userAuthenticationRequired)).eraseToAnyPublisher()
        }
        
        // Formatage de l'ID pour Navitia (stop_point:IDFM:xxxxx)
        // Les IDs du CSV (colonne 2) sont des StopPoints
        let formattedId = stationId.hasPrefix("stop_point:") ? stationId : "stop_point:\(stationId)"
        
        // On utilise l'endpoint /stop_points au lieu de /stop_areas
        guard let encodedId = formattedId.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: "\(baseURL)/stop_points/\(encodedId)/departures") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apiKey")
        
        print("📡 Requesting: \(url.absoluteString)")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .handleEvents(receiveOutput: { data in
                // Debug: print json string if needed
                if let str = String(data: data, encoding: .utf8) { print("📥 Received Data: \(str)") }
            })
            .decode(type: DepartureResponse.self, decoder: JSONDecoder())
            .map { $0.departures }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
