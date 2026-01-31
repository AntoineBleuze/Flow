import Foundation

/// Représente la structure d'un objet GeoJSON de type `MultiLineString` pour le décodage.
public struct GeoJSONShape: Codable {
    /// Type de la géométrie (ex: "MultiLineString")
    let type: String

    /// Les coordonnées d'un `MultiLineString` sont un tableau de `LineString`.
    /// Chaque `LineString` est un tableau de points `[longitude, latitude]`.
    let coordinates: [[[Double]]]
}
