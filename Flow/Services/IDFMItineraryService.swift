import Foundation
import Combine
import CoreLocation

class IDFMItineraryService: ObservableObject {
    private let baseURL = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia"
    
    func searchItinerary(from: CLLocationCoordinate2D, to: Station) -> AnyPublisher<[Journey], Error> {
        // Format coordinates: "lon;lat"
        let fromCoord = "\(from.longitude);\(from.latitude)"
        // For destination, we need to know if Station has coordinates. 
        // Assuming Station model has coordinates or we use its ID if supported by API.
        // The API /journeys takes 'from' and 'to' as ids or coords.
        // Let's assume we use coordinates for now if available, or name/id.
        // Based on previous context, Station likely has coordinates.
        
        // We need to check the Station model to be sure. 
        // For now, I'll assume it has lat/lon.
        
        // Construct URL
        // Endpoint: /journeys?from=...&to=...
        
        // Note: The swagger showed /journeys in swagger-2.json
        
        var components = URLComponents(string: "\(baseURL)/journeys")!
        
        let toCoord = "\(to.coordinate.longitude);\(to.coordinate.latitude)"
        
        components.queryItems = [
            URLQueryItem(name: "from", value: fromCoord),
            URLQueryItem(name: "to", value: toCoord),
            URLQueryItem(name: "count", value: "5")
        ]
        
        var request = URLRequest(url: components.url!)
        request.addValue(IDFMService.shared.apiKey, forHTTPHeaderField: "apikey")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ItineraryResponse.self, decoder: JSONDecoder())
            .map(\.journeys)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
