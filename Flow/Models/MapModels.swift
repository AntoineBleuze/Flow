import Combine
import CoreData
import CoreLocation
import Foundation
import MapKit
import SwiftUI

#if canImport(UIKit)
    import UIKit
    public typealias MapPlatformColor = UIColor
#elseif canImport(AppKit)
    import AppKit
    public typealias MapPlatformColor = NSColor
#endif

// Classe personnalisée pour les polylines avec couleur et nom
public class ColoredPolyline: MKPolyline {
    var color: MapPlatformColor = .blue
    var lineName: String = ""
}

// Note: TransportType est déjà défini dans TransportModels.swift
// On utilise celui-là.

// Modèle pour un tracé de ligne
public struct LineTrace: Identifiable {
    public let id: String
    public let name: String
    public let color: Color
    public let polylines: [MKPolyline]  // Utilisation directe de MKPolyline
    public let type: TransportType
}

// Cache-friendly version of LineTrace (Codable)
struct CacheableLineTrace: Codable {
    let id: String
    let name: String
    let colorHex: String
    let typeRawValue: String
    let coordinates: [[[Double]]]  // Array of polylines, each polyline is array of [lon, lat]

    init(from lineTrace: LineTrace) {
        self.id = lineTrace.id
        self.name = lineTrace.name
        self.colorHex = lineTrace.color.toHex() ?? "0000FF"
        self.typeRawValue = lineTrace.type.rawValue
        self.coordinates = lineTrace.polylines.map { polyline in
            (0..<polyline.pointCount).map { i in
                let coord = polyline.points()[i].coordinate
                return [coord.longitude, coord.latitude]
            }
        }
    }

    func toLineTrace() -> LineTrace {
        let polylines = coordinates.map { coords -> MKPolyline in
            let clCoords = coords.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
            return MKPolyline(coordinates: clCoords, count: clCoords.count)
        }
        return LineTrace(
            id: id,
            name: name,
            color: Color(hex: colorHex),
            polylines: polylines,
            type: TransportType(rawValue: typeRawValue) ?? .metro
        )
    }
}

// Modèle pour une ligne passant par une station
public struct StationLine: Hashable, Identifiable {
    public var id: String { name + type.rawValue }
    public let name: String
    public let type: TransportType
}

// Modèle pour un arrêt (Quai individuel)
public struct StopPoint: Identifiable {
    public let id: String  // UUID (Généré pour l'arrêt physique)
    public let stopAreaId: String  // ID de la zone d'arrêt (pour API)
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    public let type: TransportType
    public let lineName: String  // Nom de la ligne (ex: "1", "A")
}

// Modèle pour une Station (Regroupement d'arrêts)
public struct MapStation: Identifiable, Equatable {
    public let id: String  // ID de la zone d'arrêt (IDFM:Cxxxxx)
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    public let platforms: [StopPoint]  // Liste des quais
    public let isHub: Bool
    public let mainType: TransportType  // Type principal pour l'affichage (ex: Métro gagne sur Bus)
    public let lines: [StationLine]  // Lignes desservant la station

    public static func == (lhs: MapStation, rhs: MapStation) -> Bool {
        return lhs.id == rhs.id
    }
}

// Service de données pour la carte
@MainActor
public class MapDataService: ObservableObject {
    public static let shared = MapDataService()

    @Published public var lines: [LineTrace] = []
    @Published public var visibleStations: [MapStation] = []  // Stations visibles sur la carte
    @Published public var majorHubs: [MapStation] = []  // Pôles majeurs regroupés
    @Published public var hasCenteredOnUser: Bool = false
    @Published public var externalSelection: MapStation?  // Pour déclencher une sélection depuis l'extérieur (Recherche)

    public func selectStation(_ station: MapStation) {
        DispatchQueue.main.async {
            self.externalSelection = station
        }
    }

    // Stockage de toutes les stations pour le filtrage
    @Published public var allStations: [MapStation] = []

    // Cache des couleurs de lignes (Nom -> Couleur)
    var lineColorCache: [String: Color] = [:]

    // Cache des overlays complets (Calculés une seule fois pour éviter le freeze au chargement)
    @Published var cachedOverlays: [ColoredPolyline] = []

    private init() {
        loadData()
    }

    // MARK: - Cache

    private var cacheURL: URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent("lineTraces.json")
    }

    private func loadTracesFromCache() -> [LineTrace]? {
        guard FileManager.default.fileExists(atPath: cacheURL.path) else { return nil }
        do {
            let data = try Data(contentsOf: cacheURL)
            let cached = try JSONDecoder().decode([CacheableLineTrace].self, from: data)
            print("✅ Loaded \(cached.count) lines from cache")
            return cached.map { $0.toLineTrace() }
        } catch {
            print("⚠️ Cache read error: \(error)")
            return nil
        }
    }

    private func saveTracesToCache(_ traces: [LineTrace]) {
        let cacheable = traces.map { CacheableLineTrace(from: $0) }
        do {
            let data = try JSONEncoder().encode(cacheable)
            try data.write(to: cacheURL)
            print("✅ Saved \(traces.count) lines to cache")
        } catch {
            print("⚠️ Cache write error: \(error)")
        }
    }

    func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            // Run all actor‑isolated work on MainActor
            Task { @MainActor in
                self.loadTraces()
                self.loadAdditionalTraces()  // Chargement du Câble 1 depuis le CSV
                self.loadStops()
            }
        }
    }

    // ... rest of the file unchanged ...

