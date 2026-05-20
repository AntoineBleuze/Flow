import Combine
import CoreLocation
import Foundation

class IDFMItineraryService: ObservableObject {
    static let shared = IDFMItineraryService()
    private let baseURL = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia"

    func searchItinerary(
        from: CLLocationCoordinate2D, to: MapStation, date: Date = Date(), isArrival: Bool = false
    ) -> AnyPublisher<[Journey], Error> {
        // Mode serveur : passer par FlowServer si activé
        if FlowServerService.shared.isEnabled {
            print("📡 [Server Mode] Itinerary via FlowServer")
            return FlowServerService.shared.searchItinerary(
                from: from,
                to: to.coordinate,
                date: date,
                isArrival: isArrival
            )
        }

        // Mode direct : appel API IDFM
        // Format coordinates: "lon;lat"
        let fromCoord = "\(from.longitude);\(from.latitude)"
        // Use station coordinates as destination
        let toCoord = "\(to.coordinate.longitude);\(to.coordinate.latitude)"

        var components = URLComponents(string: "\(baseURL)/journeys")!

        // Format date to ISO8601 for Navitia (YYYYMMDDTHHMMSS)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        let dateStr = formatter.string(from: date)

        components.queryItems = [
            URLQueryItem(name: "from", value: fromCoord),
            URLQueryItem(name: "to", value: toCoord),
            URLQueryItem(name: "datetime", value: dateStr),
            URLQueryItem(name: "datetime_represents", value: isArrival ? "arrival" : "departure"),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "depth", value: "3"),  // Get detailed sections
        ]

        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.addValue(IDFMService.shared.apiKey, forHTTPHeaderField: "apikey")

        print("🚀 Searching Itinerary: \(url.absoluteString)")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .handleEvents(receiveOutput: { data in
                // Debug: print json string if needed
                if let str = String(data: data, encoding: .utf8) {
                    print("📥 Itinerary Data: \(str)")
                }
            })
            .decode(type: ItineraryResponse.self, decoder: JSONDecoder())
            .map(\.journeys)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
