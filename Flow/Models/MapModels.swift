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
struct LineTrace: Identifiable {
    let id: String
    let name: String
    let color: Color
    let polylines: [MKPolyline]  // Utilisation directe de MKPolyline
    let type: TransportType
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
struct StationLine: Hashable, Identifiable {
    var id: String { name + type.rawValue }
    let name: String
    let type: TransportType
}

// Modèle pour un arrêt (Quai individuel)
struct StopPoint: Identifiable {
    let id: String  // UUID (Généré pour l'arrêt physique)
    let stopAreaId: String  // ID de la zone d'arrêt (pour API)
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: TransportType
    let lineName: String  // Nom de la ligne (ex: "1", "A")
}

// Modèle pour une Station (Regroupement d'arrêts)
struct MapStation: Identifiable, Equatable {
    let id: String  // ID de la zone d'arrêt (IDFM:Cxxxxx)
    let name: String
    let coordinate: CLLocationCoordinate2D
    let platforms: [StopPoint]  // Liste des quais
    let isHub: Bool
    let mainType: TransportType  // Type principal pour l'affichage (ex: Métro gagne sur Bus)
    let lines: [StationLine]  // Lignes desservant la station

    static func == (lhs: MapStation, rhs: MapStation) -> Bool {
        return lhs.id == rhs.id
    }
}

// Service de données pour la carte
@MainActor
class MapDataService: ObservableObject {
    static let shared = MapDataService()

    @Published var lines: [LineTrace] = []
    @Published var visibleStations: [MapStation] = []  // Stations visibles sur la carte
    @Published var majorHubs: [MapStation] = []  // Pôles majeurs regroupés
    @Published var hasCenteredOnUser: Bool = false
    @Published var externalSelection: MapStation?  // Pour déclencher une sélection depuis l'extérieur (Recherche)

    func selectStation(_ station: MapStation) {
        DispatchQueue.main.async {
            self.externalSelection = station
        }
    }

    // Stockage de toutes les stations pour le filtrage
    @Published var allStations: [MapStation] = []

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
            self.loadTraces()
            self.loadAdditionalTraces()  // Chargement du Câble 1 depuis le CSV
            self.loadStops()
        }
    }

    // Couleurs en dur pour RER/Transilien (Fallback car CSV souvent incomplet pour ces modes)
    private let hardcodedColors: [String: String] = [
        "A": "E3051C", "B": "5291CE", "C": "FFCE00", "D": "00643C", "E": "B2559C",
        "H": "8D5E2A", "J": "B58800", "K": "B58800", "L": "CECECE", "N": "00B092",
        "P": "F28E42", "R": "E4B4D1", "U": "DE4086",
        "1": "FFCD00", "2": "003CA6", "3": "837902", "3bis": "6EC4E8", "4": "CF009E",
        "5": "FF7E2E", "6": "6ECA97", "7": "FA9ABA", "7bis": "6ECA97", "8": "E19BDF",
        "9": "B6BD00", "10": "C9910D", "11": "704B1C", "12": "007852", "13": "6EC4E8",
        "14": "62259D",
    ]

    private func loadTraces() {
        // Try cache first
        if let cached = loadTracesFromCache() {
            DispatchQueue.main.async {
                self.lines = cached
                for line in cached {
                    self.lineColorCache[line.name] = line.color
                }
                // Inject hardcoded fallback colors
                for (name, hex) in self.hardcodedColors {
                    if self.lineColorCache[name] == nil {
                        self.lineColorCache[name] = Color(hex: hex)
                    }
                }
                // Déclencher le calcul des overlays
                Task {
                    await self.precalculateOverlays()
                }
            }
            print("✅ Traces chargées depuis le cache (\(cached.count) lignes)")
            return
        }


        // Cache miss - parse from GeoJSON
        struct Feature: Codable {
            let geometry: Geometry
            let properties: Properties
        }

        struct Geometry: Codable {
            let coordinates: [[Double]]  // LineString: array de points [lon, lat]
            let type: String
        }

        struct Properties: Codable {
            let res_com: String  // Nom de la ligne (ex: "METRO 1", "RER A", "TRAM 3a")
            let colourweb_hexa: String?  // Couleur hex
            let mode: String?  // Type de transport
        }

        struct FeatureCollection: Codable {
            let features: [Feature]
        }

        // Charger le fichier réseau unifié
        guard
            let url = Bundle.main.url(
                forResource: "traces-du-reseau-ferre-idf", withExtension: "geojson")
        else {
            print("⚠️ Fichier traces-du-reseau-ferre-idf.geojson non trouvé")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let collection = try JSONDecoder().decode(FeatureCollection.self, from: data)

            print(
                "📊 Parsing traces-du-reseau-ferre-idf.geojson: \(collection.features.count) features"
            )

            // Dictionnaire pour regrouper par nom de ligne ET type
            // Clé: "TYPE_NOM" (ex: "METRO_7", "TRAM_7") pour éviter les conflits de couleur
            var lineGroups:
                [String: (color: String, type: String, lineName: String, polylines: [MKPolyline])] =
                    [:]

            for feature in collection.features {
                let fullName = feature.properties.res_com

                // Extraire le nom court de la ligne (ex: "METRO 1" -> "1", "RER A" -> "A")
                let components = fullName.components(separatedBy: " ")
                guard components.count >= 2 else { continue }

                let lineType = components[0]  // "METRO", "RER", "TRAM", "TRAIN"
                let lineName = components[1...].joined(separator: " ")  // "1", "A", "3a", etc.

                // Filtrer les lignes non IDF
                if fullName.contains("CDGVAL") || fullName.contains("ORLYVAL") {
                    continue
                }

                // Filtrer pour ne garder QUE Métro, RER, Tram et Transilien (H, J, K, L, N, P, R, U, V)
                // Tout ce qui est "TRAIN" ou "TER" générique non-Transilien dégage.
                let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]

                if lineType == "TRAIN" || lineType == "TER" {
                    if !allowedTransiliens.contains(lineName) {
                        continue
                    }
                }

                // Récupérer la couleur (PRIORITÉ au GeoJSON)
                var hexColor = feature.properties.colourweb_hexa ?? ""

                // Nettoyer la couleur (enlever # si présent)
                hexColor = hexColor.replacingOccurrences(of: "#", with: "")

                // Si pas de couleur dans le GeoJSON, utiliser le hardcodé (mais seulement pour métros/RER)
                if (hexColor.isEmpty || hexColor.count < 6) && lineType != "TRAM" {
                    if let hardColor = hardcodedColors[lineName] {
                        hexColor = hardColor
                    }
                }

                // Convertir le LineString en MKPolyline
                let coords = feature.geometry.coordinates.compactMap {
                    point -> CLLocationCoordinate2D? in
                    guard point.count >= 2 else { return nil }
                    return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                }

                guard !coords.isEmpty else { continue }
                let polyline = MKPolyline(coordinates: coords, count: coords.count)

                // Clé unique par type ET nom pour éviter les conflits (TRAM 7 vs METRO 7)
                let groupKey = "\(lineType)_\(lineName)"

                // Regrouper par clé unique
                if var existing = lineGroups[groupKey] {
                    existing.polylines.append(polyline)
                    lineGroups[groupKey] = existing
                } else {
                    lineGroups[groupKey] = (
                        color: hexColor, type: lineType, lineName: lineName, polylines: [polyline]
                    )
                }
            }

            // Créer les LineTrace à partir des groupes
            var newLines: [LineTrace] = []

            for (_, group) in lineGroups {
                guard !group.polylines.isEmpty else { continue }

                let color = group.color.isEmpty ? Color.blue : Color(hex: group.color)
                let type = self.mapTransportType(group.type, lineName: group.lineName)

                let line = LineTrace(
                    id: UUID().uuidString, name: group.lineName, color: color,
                    polylines: group.polylines, type: type)
                newLines.append(line)

                // Debug spécifique
                if ["1", "A", "B", "E", "N", "3a", "7"].contains(group.lineName) {
                    print(
                        "🎨 Loaded \(group.type) \(group.lineName): #\(group.color) avec \(group.polylines.count) segments"
                    )
                }
            }

            DispatchQueue.main.async {
                self.lines = newLines
                // Remplissage du cache
                for line in newLines {
                    self.lineColorCache[line.name] = line.color
                }

                // Injecter les couleurs hardcodées manquantes
                for (name, hex) in self.hardcodedColors {
                    if self.lineColorCache[name] == nil {
                        self.lineColorCache[name] = Color(hex: hex)
                    }
                }

                // Save to cache for next launch
                self.saveTracesToCache(newLines)

                print(
                    "✅ \(newLines.count) lignes chargées avec tracés réels détaillés (courbes du réseau ferré)"
                )

                // Déclencher le calcul des overlays (offsets) en background
                Task {
                    await self.precalculateOverlays()
                }
            }

        } catch {
            print("❌ Erreur parsing réseau ferré: \(error)")
        }
    }

    private func loadStops() {
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<StopPointEntity> = StopPointEntity.fetchRequest()

        do {
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                // Tenter le chargement CoreData, avec fallback CSV si les données sont corrompues
                print("💾 Chargement des arrêts depuis CoreData (\(count) entités)...")
                let entities = try context.fetch(fetchRequest)
                // Vérifier que les données sont valides (id et name requis)
                if let first = entities.first, first.id != nil, first.name != nil {
                    self.processEntities(entities)
                } else {
                    // Données corrompues/anciennes — recharger depuis CSV
                    print("⚠️ Données CoreData invalides, rechargement CSV...")
                    self.clearStopPoints(in: context)
                    self.loadStopsFromCSV()
                }
            } else {
                print("📂 CoreData vide. Chargement depuis CSV...")
                self.loadStopsFromCSV()
            }
        } catch {
            print("❌ Erreur CoreData: \(error)")
            self.loadStopsFromCSV()
        }
    }

    private func clearStopPoints(in context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = StopPointEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        deleteRequest.resultType = .resultTypeObjectIDs

        do {
            let result = try context.execute(deleteRequest) as? NSBatchDeleteResult
            if let objectIDs = result?.result as? [NSManagedObjectID] {
                NSManagedObjectContext.mergeChanges(
                    fromRemoteContextSave: [NSDeletedObjectsKey: objectIDs], into: [context])
            }
            try context.save()
            print("✅ StopPointEntity cleared.")
        } catch {
            print("❌ Error clearing StopPointEntity: \(error)")
        }
    }

    private func loadStopsFromCSV() {
        guard let url = Bundle.main.url(forResource: "arrets-lignes", withExtension: "csv") else {
            print("⚠️ Fichier Arrêts CSV introuvable.")
            return
        }

        do {
            let data = try String(contentsOf: url, encoding: .utf8)
            let rows = data.components(separatedBy: .newlines)

            var groupedStops: [String: [StopPoint]] = [:]
            let context = PersistenceController.shared.container.viewContext

            // En-tête: id;...;stop_name;stop_lon;stop_lat;...;mode;...;nom_commune
            // Indices: 3=name, 4=lon, 5=lat, 8=mode, 10=commune

            for (index, row) in rows.enumerated() where index > 0 {
                let columns = self.parseCSVLine(row)
                if columns.count > 10 {
                    let name = columns[3]
                    let lonStr = columns[4]
                    let latStr = columns[5]
                    let modeStr = columns[8]
                    let city = columns[10]

                    if modeStr == "Bus" { continue }

                    if let lat = Double(latStr), let lon = Double(lonStr) {
                        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)

                        let stopId = columns[2]
                        let rawLineName = columns[7]
                        // Nettoyage préventif du nom de ligne (ex: "RER A" -> "A")
                        let lineName = rawLineName.uppercased()
                            .replacingOccurrences(of: "RER", with: "")
                            .replacingOccurrences(of: "TRANSILIEN", with: "")
                            .trimmingCharacters(in: .whitespacesAndNewlines)

                        let type = self.mapTransportType(modeStr, lineName: lineName)

                        // Filtrage des lignes TER/Train non-Transilien
                        let allowedTransiliens = ["H", "J", "K", "L", "N", "P", "R", "U", "V"]
                        if type == .transilien || type == .train {
                            if !allowedTransiliens.contains(lineName) {
                                continue
                            }
                        }

                        let stop = StopPoint(
                            id: stopId, stopAreaId: "", name: name, coordinate: coordinate,
                            type: type, lineName: lineName)

                        let key = "\(name)_\(city)"
                        groupedStops[key, default: []].append(stop)

                        // Save to CoreData
                        let entity = StopPointEntity(context: context)
                        entity.id = stopId
                        entity.stopAreaId = ""
                        entity.name = name
                        entity.latitude = lat
                        entity.longitude = lon
                        entity.type = type.rawValue
                        entity.lineName = lineName
                        entity.city = city
                    }
                }
            }

            if context.hasChanges {
                do {
                    try context.save()
                    print("✅ Sauvegarde CoreData terminée.")
                } catch {
                    print("❌ Erreur sauvegarde CoreData: \(error)")
                }
            }

            self.finalizeStations(groupedStops)

            // Une fois que tout est chargé, on lance le calcul des overlays en tache de fond
            // On attend un peu que self.lines soit peuplé si ce n'est pas synchrone (mais ici c'est appelé après processEntities)
            // En fait, loadTraces est appelé en parallèle. On va déclencher le calcul dans loadTraces.

        } catch {

        } catch {
            print("❌ Erreur chargement arrêts CSV: \(error)")
        }
    }

    private func processEntities(_ entities: [StopPointEntity]) {
        var groupedStops: [String: [StopPoint]] = [:]

        for entity in entities {
            guard let id = entity.id,
                let name = entity.name,
                let typeStr = entity.type,
                let rawLineName = entity.lineName,
                let city = entity.city
            else { continue }

            // Nettoyage du nom de ligne (comme dans le CSV) pour corriger les données existantes
            let lineName = rawLineName.uppercased()
                .replacingOccurrences(of: "RER", with: "")
                .replacingOccurrences(of: "TRANSILIEN", with: "")
                .replacingOccurrences(of: "TRAIN", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)

            // On ré-évalue le type pour être sûr (ex: si c'était mal classé en Transilien au lieu de RER)
            // On passe le typeStr stocké (ex: "RER" ou "Rail") et le nom nettoyé
            let type = self.mapTransportType(typeStr, lineName: lineName)

            let coordinate = CLLocationCoordinate2D(
                latitude: entity.latitude, longitude: entity.longitude)
            let stop = StopPoint(
                id: id, stopAreaId: entity.stopAreaId ?? "", name: name, coordinate: coordinate,
                type: type, lineName: lineName)

            let key = "\(name)_\(city)"
            groupedStops[key, default: []].append(stop)
        }

        self.finalizeStations(groupedStops)
    }

    private func finalizeStations(_ groupedStops: [String: [StopPoint]]) {
        var initialStations: [MapStation] = []

        for (_, stops) in groupedStops {
            guard let first = stops.first else { continue }

            let totalLat = stops.reduce(0.0) { $0 + $1.coordinate.latitude }
            let totalLon = stops.reduce(0.0) { $0 + $1.coordinate.longitude }
            let center = CLLocationCoordinate2D(
                latitude: totalLat / Double(stops.count), longitude: totalLon / Double(stops.count))

            let mainType =
                stops.first { $0.type == .rer }?.type ?? stops.first { $0.type == .metro }?.type
                ?? stops.first { $0.type == .transilien }?.type ?? first.type

            let uniqueLines = Set(stops.map { StationLine(name: $0.lineName, type: $0.type) })
            let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }

            let station = MapStation(
                id: first.id,
                name: first.name,
                coordinate: center,
                platforms: stops,
                isHub: false,
                mainType: mainType,
                lines: sortedLines
            )

            initialStations.append(station)
        }

        let finalStations = self.mergeHubs(initialStations)

        DispatchQueue.main.async {
            self.allStations = finalStations
            self.visibleStations = finalStations  // Initialement tout
            self.majorHubs = finalStations.filter { $0.isHub }
            print("✅ \(finalStations.count) stations finales (après fusion des pôles).")
        }
    }

    // Logique de fusion des pôles
    private func mergeHubs(_ stations: [MapStation]) -> [MapStation] {
        var mergedStations = stations

        // Définition des règles de fusion (Nom du pôle -> Mots clés à chercher)
        let hubRules: [String: [String]] = [
            "Saint-Lazare": ["Saint-Lazare", "Haussmann Saint-Lazare"],
            "La Défense": ["La Défense"],
            "Gare du Nord": ["Gare du Nord", "Magenta"],
            "Gare de l'Est": ["Gare de l'Est"],
            "Montparnasse": ["Montparnasse", "Gaîté"],  // Gaîté est parfois séparé mais proche, restons sur Montparnasse
            "Châtelet - Les Halles": ["Châtelet", "Les Halles"],
            "Nation": ["Nation"],
            "République": ["République"],
            "Bastille": ["Bastille"],
            "Issy - Val de Seine": ["Issy - Val de Seine", "Issy-Val de Seine"],
        ]

        var stationsToRemove: Set<String> = []
        var newHubs: [MapStation] = []

        for (hubName, keywords) in hubRules {
            // Trouver toutes les stations qui matchent les mots-clés
            let candidates = stations.filter { station in
                // Correctif: "Assemblée Nationale" contient "Nation" mais ne doit pas être fusionné
                if hubName == "Nation" && station.name.contains("Assemblée") {
                    return false
                }

                return keywords.contains { keyword in
                    station.name.contains(keyword)
                }
            }

            if candidates.count > 1 {
                // Fusionner
                let allPlatforms = candidates.flatMap { $0.platforms }

                // Recalculer le centroïde
                let totalLat = allPlatforms.reduce(0.0) { $0 + $1.coordinate.latitude }
                let totalLon = allPlatforms.reduce(0.0) { $0 + $1.coordinate.longitude }
                let center = CLLocationCoordinate2D(
                    latitude: totalLat / Double(allPlatforms.count),
                    longitude: totalLon / Double(allPlatforms.count))

                // Type principal (RER > Transilien > Métro)
                let mainType =
                    allPlatforms.first { $0.type == .rer }?.type ?? allPlatforms.first {
                        $0.type == .transilien
                    }?.type ?? allPlatforms.first { $0.type == .metro }?.type ?? .metro

                // Agrégation des lignes pour le hub
                let uniqueLines = Set(
                    allPlatforms.map { StationLine(name: $0.lineName, type: $0.type) })
                let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }

                let hub = MapStation(
                    id: candidates.first?.id ?? UUID().uuidString,  // On garde un ID existant
                    name: hubName,
                    coordinate: center,
                    platforms: allPlatforms,
                    isHub: true,
                    mainType: mainType,
                    lines: sortedLines
                )

                newHubs.append(hub)
                candidates.forEach { stationsToRemove.insert($0.id) }
            }
        }

        // Retirer les stations fusionnées et ajouter les hubs
        mergedStations.removeAll { stationsToRemove.contains($0.id) }
        mergedStations.append(contentsOf: newHubs)

        return mergedStations
    }

    // Helper pour parser le CSV proprement
    private func parseCSVLine(_ line: String) -> [String] {
        var result: [String] = []
        var current = ""
        var insideQuotes = false

        for char in line {
            if char == "\"" {
                insideQuotes.toggle()
            } else if char == ";" && !insideQuotes {
                result.append(current)
                current = ""
            } else {
                current.append(char)
            }
        }
        result.append(current)

        // Nettoyage des guillemets
        return result.map { field in
            var clean = field.trimmingCharacters(in: .whitespaces)
            if clean.hasPrefix("\"") && clean.hasSuffix("\"") && clean.count >= 2 {
                clean.removeFirst()
                clean.removeLast()
            }
            return clean.replacingOccurrences(of: "\"\"", with: "\"")
        }
    }

    // Parseur GeoJSON (MultiLineString ou LineString)
    private func parseGeoJSON(_ json: String) -> [MKPolyline] {
        // Le JSON semble valide d'après les tests, mais on garde un nettoyage minimal au cas où
        let cleanJson = json.replacingOccurrences(of: "\"\"", with: "\"")

        guard let data = cleanJson.data(using: .utf8) else { return [] }

        // Structure pour décoder soit MultiLineString soit LineString
        struct GeometryMulti: Decodable {
            let coordinates: [[[Double]]]
        }
        struct GeometryLine: Decodable {
            let coordinates: [[Double]]
        }

        do {
            // Essai MultiLineString
            let geom = try JSONDecoder().decode(GeometryMulti.self, from: data)
            return geom.coordinates.compactMap { segment in
                let coords = segment.compactMap { point -> CLLocationCoordinate2D? in
                    if point.count >= 2 {
                        return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                    }
                    return nil
                }
                if !coords.isEmpty {
                    return MKPolyline(coordinates: coords, count: coords.count)
                }
                return nil
            }
        } catch {
            // Essai LineString
            do {
                let geom = try JSONDecoder().decode(GeometryLine.self, from: data)
                let coords = geom.coordinates.compactMap { point -> CLLocationCoordinate2D? in
                    if point.count >= 2 {
                        return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                    }
                    return nil
                }
                if !coords.isEmpty {
                    return [MKPolyline(coordinates: coords, count: coords.count)]
                }
                return []
            } catch {
                print("❌ Erreur parsing GeoJSON: \(error)")
                return []
            }
        }
    }

    // Mapping des strings CSV vers l'enum TransportType existant
    private func mapTransportType(_ typeString: String, lineName: String) -> TransportType {
        // Nettoyage du nom pour la détection
        let cleanName = lineName.uppercased()
            .replacingOccurrences(of: "RER", with: "")
            .replacingOccurrences(of: "TRANSILIEN", with: "")
            .replacingOccurrences(of: "TRAIN", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        // Priorité au nom de ligne pour RER et Transilien (car le CSV indique parfois "Bus" ou "Metro")
        if ["A", "B", "C", "D", "E"].contains(cleanName) {
            return .rer
        } else if ["H", "J", "K", "L", "N", "P", "R", "U", "V"].contains(cleanName) {
            return .transilien
        }

        // Priorité au nom pour les Tramways (ex: T1, T3a)
        // On vérifie si ça commence par T suivi d'un chiffre
        if cleanName.starts(with: "T") && cleanName.count > 1
            && cleanName.dropFirst().first?.isNumber == true
        {
            return .tram
        }

        let normalizedType = typeString.lowercased()

        if normalizedType.contains("subway") || normalizedType.contains("metro") {
            return .metro
        } else if normalizedType.contains("tram") {
            return .tram
        } else if normalizedType.contains("rail") || normalizedType.contains("train")
            || normalizedType.contains("rer")
        {
            // Fallback si le nom n'a pas matché (ex: TER)
            return .transilien
        } else if normalizedType.contains("bus") {
            return .bus
        } else if normalizedType.contains("cable") || normalizedType.contains("funiculaire")
            || normalizedType.contains("suspendu")
        {
            return .cable
        }

        return .metro  // Fallback

    }

    // Chargement des tracés supplémentaires (ex: Câble 1) depuis le CSV
    private func loadAdditionalTraces() {
        guard
            let url = Bundle.main.url(
                forResource: "traces-des-lignes-de-transport-en-commun-idfm-2", withExtension: "csv"
            )
        else {
            print("⚠️ Fichier traces-des-lignes-de-transport-en-commun-idfm-2.csv non trouvé")
            return
        }

        do {
            let data = try String(contentsOf: url, encoding: .utf8)
            let rows = data.components(separatedBy: .newlines)

            var newLines: [LineTrace] = []

            // Colonnes supposées :
            // IDFM:C02666;C1;C1;Suspended cable car;...;GeoJSON
            // On va chercher la colonne qui ressemble à du GeoJSON (commence par "{")

            for (index, row) in rows.enumerated() where index > 0 {
                let columns = self.parseCSVLine(row)
                // On cherche une colonne qui contient "coordinates"
                guard
                    let geoJsonIndex = columns.firstIndex(where: {
                        $0.contains("\"coordinates\"") || $0.contains("\"type\"")
                    })
                else {
                    continue
                }

                let lineName = columns.count > 1 ? columns[1] : "Inconnu"
                let mode = columns.count > 3 ? columns[3] : ""

                // Filtrer pour ne garder que le Câble (ou autres lignes manquantes)
                // "Suspended cable car" est le mode pour C1
                if mode == "Suspended cable car" || lineName == "C1" {
                    let geoJson = columns[geoJsonIndex]
                    let polylines = self.parseGeoJSON(geoJson)

                    if !polylines.isEmpty {
                        let type: TransportType = .cable
                        let color = Color.gray  // Couleur par défaut ou à extraire si possible

                        let lineTrace = LineTrace(
                            id: UUID().uuidString,
                            name: lineName,
                            color: color,
                            polylines: polylines,
                            type: type
                        )
                        newLines.append(lineTrace)
                        print("✅ Câble 1 chargé: \(polylines.count) segments")
                    }
                }
            }

            DispatchQueue.main.async {
                self.lines.append(contentsOf: newLines)
                // update cache
                for line in newLines {
                    self.lineColorCache[line.name] = line.color
                }
            }

        } catch {
            print("❌ Erreur chargement traces CSV supplémentaires: \(error)")
        }
    }

    // Méthode asynchrone pour récupérer les stations dans une région (pour le bridge)
    func fetchStations(in region: MKCoordinateRegion) async -> [MapStation] {
        let center = region.center
        let span = region.span

        // Seuil de zoom pour afficher tous les arrêts vs seulement les pôles
        let zoomThreshold = 0.05
        let showAll = span.latitudeDelta < zoomThreshold

        let minLat = center.latitude - span.latitudeDelta / 2
        let maxLat = center.latitude + span.latitudeDelta / 2
        let minLon = center.longitude - span.longitudeDelta / 2
        let maxLon = center.longitude + span.longitudeDelta / 2

        // On ne cherche que dans les pôles majeurs pour optimiser si dézoomé
        let source = showAll ? self.allStations : self.majorHubs

        let filtered = source.filter { station in
            let lat = station.coordinate.latitude
            let lon = station.coordinate.longitude
            return lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon
        }

        return filtered
    }

    // Méthode asynchrone pour mettre à jour les stations visibles
    func updateVisibleStations(in region: MKCoordinateRegion) {
        let center = region.center
        let span = region.span

        // Seuil de zoom pour afficher tous les arrêts vs seulement les pôles
        // Plus le delta est grand, plus on est dézoomé.
        // 0.08 est le défaut (Paris). Si on dézoome un peu (0.1), on passe en mode "Pôles uniquement".
        let zoomThreshold = 0.05
        let showAll = span.latitudeDelta < zoomThreshold

        let minLat = center.latitude - span.latitudeDelta / 2
        let maxLat = center.latitude + span.latitudeDelta / 2
        let minLon = center.longitude - span.longitudeDelta / 2
        let maxLon = center.longitude + span.longitudeDelta / 2

        // On utilise une Task détachée pour ne pas bloquer le thread appelant
        Task.detached(priority: .userInitiated) {
            // Capture thread-safe de la liste complète (copie)
            // Si on est dézoomé, on ne cherche que dans les pôles majeurs pour optimiser
            let source = await showAll ? self.allStations : self.majorHubs

            let filtered = source.filter { station in
                let lat = station.coordinate.latitude
                let lon = station.coordinate.longitude
                return lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon
            }

            await MainActor.run {
                self.visibleStations = filtered
            }
        }
    }

    // Helper pour récupérer toutes les stations (pour le bridge si besoin)
    func getAllStations() async -> [MapStation] {
        return allStations
    }

    func getAllStationsSync() -> [MapStation] {
        return allStations
    }

    // MARK: - Overlay Precalculation (Anti-Freeze)

    func precalculateOverlays() async {
        print("⚙️ Initialisation du calcul des overlays (offsets)...")
        let linesToProcess = self.lines

        // Ce calcul est lourd, on le fait hors du MainActor
        let calculatedOverlays: [ColoredPolyline] = await Task.detached(priority: .userInitiated) {
            var allPolylines: [(line: LineTrace, polyline: MKPolyline, index: Int)] = []
            for line in linesToProcess {
                for (index, polyline) in line.polylines.enumerated() {
                    allPolylines.append((line: line, polyline: polyline, index: index))
                }
            }

            var results: [ColoredPolyline] = []

            for (lineIndex, item) in allPolylines.enumerated() {

                let overlappingPolylines = allPolylines.enumerated().filter {
                    otherIndex, otherItem in
                    guard otherIndex != lineIndex else { return false }
                    return MapDataService.polylinesOverlap(item.polyline, otherItem.polyline)
                }

                let totalOverlapping = overlappingPolylines.count + 1
                var offsetIndex = 0

                let allInGroup = ([item] + overlappingPolylines.map { $0.element }).sorted {
                    $0.line.name < $1.line.name
                }

                if let myPosition = allInGroup.firstIndex(where: {
                    $0.line.name == item.line.name && $0.index == item.index
                }) {
                    offsetIndex = myPosition
                }

                let offsetDistance: CLLocationDistance
                if totalOverlapping > 1 {
                    let baseOffset: CLLocationDistance = 15.0
                    let centerOffset = Double(totalOverlapping - 1) / 2.0
                    offsetDistance = (Double(offsetIndex) - centerOffset) * baseOffset
                } else {
                    offsetDistance = 0
                }

                let finalPolyline: MKPolyline
                if offsetDistance != 0 {
                    finalPolyline = MapDataService.offsetPolyline(item.polyline, by: offsetDistance)
                } else {
                    finalPolyline = item.polyline
                }

                let colored = ColoredPolyline(
                    points: finalPolyline.points(), count: finalPolyline.pointCount)
                colored.color = MapPlatformColor(item.line.color)
                colored.lineName = item.line.name
                results.append(colored)
            }
            return results
        }.value

        print("✅ Calcul des overlays terminé: \(calculatedOverlays.count) segments prêts.")

        await MainActor.run {
            self.cachedOverlays = calculatedOverlays
        }
    }

    // MARK: - Geometry Helpers

    /// Check if two polylines overlap (share similar paths)
    nonisolated static func polylinesOverlap(_ polyline1: MKPolyline, _ polyline2: MKPolyline)
        -> Bool
    {
        // Sample a few points and check if they're close
        let sampleCount = min(5, polyline1.pointCount, polyline2.pointCount)
        var matchingPoints = 0
        let threshold: CLLocationDistance = 50  // 50 meters threshold

        for i in 0..<sampleCount {
            let idx1 = (i * polyline1.pointCount) / sampleCount
            let idx2 = (i * polyline2.pointCount) / sampleCount

            guard idx1 < polyline1.pointCount, idx2 < polyline2.pointCount else { continue }

            let p1 = polyline1.points()[idx1]
            let p2 = polyline2.points()[idx2]

            let coord1 = p1.coordinate
            let coord2 = p2.coordinate

            let location1 = CLLocation(latitude: coord1.latitude, longitude: coord1.longitude)
            let location2 = CLLocation(latitude: coord2.latitude, longitude: coord2.longitude)

            if location1.distance(from: location2) < threshold {
                matchingPoints += 1
            }
        }

        return Double(matchingPoints) / Double(sampleCount) > 0.6
    }

    /// Offset a polyline by a given distance perpendicular to its path
    nonisolated static func offsetPolyline(_ polyline: MKPolyline, by distance: CLLocationDistance)
        -> MKPolyline
    {
        let pointsPtr = polyline.points()
        let count = polyline.pointCount
        var offsetCoordinates: [CLLocationCoordinate2D] = []

        for i in 0..<count {
            let currentPoint = pointsPtr[i].coordinate

            // Calculate perpendicular direction based on neighboring points
            var bearing: Double = 0

            if i == 0 && count > 1 {
                bearing = calculateBearing(from: currentPoint, to: pointsPtr[1].coordinate)
            } else if i == count - 1 {
                bearing = calculateBearing(from: pointsPtr[i - 1].coordinate, to: currentPoint)
            } else {
                let bearingIn = calculateBearing(
                    from: pointsPtr[i - 1].coordinate, to: currentPoint)
                let bearingOut = calculateBearing(
                    from: currentPoint, to: pointsPtr[i + 1].coordinate)
                bearing = (bearingIn + bearingOut) / 2
            }

            let perpendicularBearing = bearing + 90
            let offsetCoord = coordinate(
                from: currentPoint, distance: distance, bearing: perpendicularBearing)
            offsetCoordinates.append(offsetCoord)
        }

        return MKPolyline(coordinates: offsetCoordinates, count: offsetCoordinates.count)
    }

    nonisolated static func calculateBearing(
        from coord1: CLLocationCoordinate2D, to coord2: CLLocationCoordinate2D
    ) -> Double {
        let lat1 = coord1.latitude * .pi / 180
        let lon1 = coord1.longitude * .pi / 180
        let lat2 = coord2.latitude * .pi / 180
        let lon2 = coord2.longitude * .pi / 180

        let dLon = lon2 - lon1
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let bearing = atan2(y, x)

        return bearing * 180 / .pi
    }

    nonisolated static func coordinate(
        from coord: CLLocationCoordinate2D, distance: CLLocationDistance, bearing: Double
    ) -> CLLocationCoordinate2D {
        let earthRadius: Double = 6_371_000
        let lat1 = coord.latitude * .pi / 180
        let lon1 = coord.longitude * .pi / 180
        let bearingRad = bearing * .pi / 180

        let lat2 = asin(
            sin(lat1) * cos(distance / earthRadius) + cos(lat1) * sin(distance / earthRadius)
                * cos(bearingRad))
        let lon2 =
            lon1
            + atan2(
                sin(bearingRad) * sin(distance / earthRadius) * cos(lat1),
                cos(distance / earthRadius) - sin(lat1) * sin(lat2))

        return CLLocationCoordinate2D(latitude: lat2 * 180 / .pi, longitude: lon2 * 180 / .pi)
    }

}

// Extension Couleur Hexadécimale (si pas déjà définie ailleurs)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a: UInt64
        let r: UInt64
        let g: UInt64
        let b: UInt64
        switch hex.count {
        case 3:  // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:  // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:  // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 1, 0, 1)  // Magenta opaque pour débogage (au lieu de transparent)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    /// Convert Color to hex string for caching
    func toHex() -> String? {
        guard let components = MapPlatformColor(self).cgColor.components else { return nil }
        let r = components.count > 0 ? components[0] : 0
        let g = components.count > 1 ? components[1] : 0
        let b = components.count > 2 ? components[2] : 0
        return String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}
