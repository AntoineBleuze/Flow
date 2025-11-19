import Foundation
import CoreLocation

// Cette structure représente un arrêt unifié pour l'application.
// Elle est créée à partir des StopPoint du CSV.
// Elle est Codable pour être sauvegardée dans les favoris (UserDefaults).
struct Stop: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let city: String
    let location: CLLocationCoordinate2D

    // Implémentation de Codable pour gérer CLLocationCoordinate2D
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case city
        case latitude
        case longitude
    }
    
    // Init pour la création manuelle (ex: depuis StopPoint dans IDFMService)
    init(id: String, name: String, city: String, location: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.city = city
        self.location = location
    }

    // Décodage (utilisé par FavoritesManager)
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        city = try container.decode(String.self, forKey: .city)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    // Encodage (utilisé par FavoritesManager)
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(city, forKey: .city)
        try container.encode(location.latitude, forKey: .latitude)
        try container.encode(location.longitude, forKey: .longitude)
    }
    
    // Implémentation de Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Stop, rhs: Stop) -> Bool {
        lhs.id == rhs.id
    }
}
