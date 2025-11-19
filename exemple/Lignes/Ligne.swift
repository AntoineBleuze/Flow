import Foundation
import MapKit

// Ajout de la conformité à Hashable (nécessaire pour la navigation)
struct Ligne: Identifiable, Decodable, Hashable {
    let id: String
    let name: String
    let shortName: String
    let type: String
    let transportMode: String
    let color: String
    let textColor: String
    let order: Int
    let icon: String // Nom de l'image dans les Assets
    let shape: [CLLocationCoordinate2D] // Tracé de la ligne
    let stopPoints: [StopPoint] // Points d'arrêt de la ligne

    enum CodingKeys: String, CodingKey {
        case id = "id_line"
        case name = "name_line"
        case shortName = "shortname_line"
        case type
        case transportMode = "transportmode"
        case color
        case textColor = "text_color"
        case order = "order_line"
        case icon = "picto_line"
        case shape = "shape"
        case stopPoints = "stop_points"
    }

    // Implémentation de Decodable pour gérer les types complexes (JSON dans CSV)
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        shortName = try container.decode(String.self, forKey: .shortName)
        type = try container.decode(String.self, forKey: .type)
        transportMode = try container.decode(String.self, forKey: .transportMode)
        color = try container.decode(String.self, forKey: .color)
        textColor = try container.decode(String.self, forKey: .textColor)
        icon = try container.decode(String.self, forKey: .icon)
        
        // Gérer la conversion de String vers Int pour 'order'
        let orderString = try container.decode(String.self, forKey: .order)
        guard let orderInt = Int(orderString) else {
            throw DecodingError.dataCorruptedError(forKey: .order, in: container, debugDescription: "Order n'est pas un entier valide")
        }
        order = orderInt

        // Gérer le décodage de 'shape' (JSON stringifié)
        let shapeString = try container.decode(String.self, forKey: .shape)
        if let shapeData = shapeString.data(using: .utf8), !shapeString.isEmpty {
            do {
                let coordinates = try JSONDecoder().decode([[Double]].self, from: shapeData)
                // Inverser latitude et longitude (format [lon, lat] dans le CSV)
                shape = coordinates.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
            } catch {
                shape = []
            }
        } else {
            shape = []
        }

        // Gérer le décodage de 'stopPoints' (JSON stringifié)
        let stopPointsString = try container.decode(String.self, forKey: .stopPoints)
        if let stopPointsData = stopPointsString.data(using: .utf8), !stopPointsString.isEmpty {
            do {
                stopPoints = try JSONDecoder().decode([StopPoint].self, from: stopPointsData)
            } catch {
                stopPoints = []
            }
        } else {
            stopPoints = []
        }
    }
    
    // Implémentation de Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Ligne, rhs: Ligne) -> Bool {
        lhs.id == rhs.id
    }
}

// Structure pour les points d'arrêt (telle que définie dans le CSV)
struct StopPoint: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let city: String

    enum CodingKeys: String, CodingKey {
        case id = "stop_point_id"
        case name = "stop_point_name"
        case latitude = "stop_point_lat"
        case longitude = "stop_point_lon"
        case city = "stop_point_city"
    }
    
    // Implémentation de Decodable pour gérer les conversions de type
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        city = try container.decode(String.self, forKey: .city)
        
        // Gérer la conversion de String vers Double pour latitude
        let latString = try container.decode(String.self, forKey: .latitude)
        guard let latDouble = Double(latString) else {
            throw DecodingError.dataCorruptedError(forKey: .latitude, in: container, debugDescription: "Latitude n'est pas un double valide")
        }
        latitude = latDouble
        
        // Gérer la conversion de String vers Double pour longitude
        let lonString = try container.decode(String.self, forKey: .longitude)
        guard let lonDouble = Double(lonString) else {
            throw DecodingError.dataCorruptedError(forKey: .longitude, in: container, debugDescription: "Longitude n'est pas un double valide")
        }
        longitude = lonDouble
    }
}
