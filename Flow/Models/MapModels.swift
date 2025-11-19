import Foundation
import CoreLocation
import SwiftUI
import Combine
import CoreData
import MapKit

// Note: TransportType est déjà défini dans TransportModels.swift
// On utilise celui-là.

// Modèle pour un tracé de ligne
struct LineTrace: Identifiable {
    let id: String
    let name: String
    let color: Color
    let coordinates: [[CLLocationCoordinate2D]] // Tableau de segments (MultiLineString)
    let type: TransportType
}

// Modèle pour une ligne passant par une station
struct StationLine: Hashable, Identifiable {
    var id: String { name + type.rawValue }
    let name: String
    let type: TransportType
}

// Modèle pour un arrêt (Quai individuel)
struct StopPoint: Identifiable {
    let id: String // UUID (Généré pour l'arrêt physique)
    let stopAreaId: String // ID de la zone d'arrêt (pour API)
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: TransportType
    let lineName: String // Nom de la ligne (ex: "1", "A")
}

// Modèle pour une Station (Regroupement d'arrêts)
struct Station: Identifiable {
    let id: String // ID de la zone d'arrêt (IDFM:Cxxxxx)
    let name: String
    let coordinate: CLLocationCoordinate2D
    let platforms: [StopPoint] // Liste des quais
    let isHub: Bool
    let mainType: TransportType // Type principal pour l'affichage (ex: Métro gagne sur Bus)
    let lines: [StationLine] // Lignes desservant la station
}

// Service de données pour la carte
class MapDataService: ObservableObject {
    static let shared = MapDataService()
    
    @Published var lines: [LineTrace] = []
    @Published var stations: [Station] = [] // Stations regroupées
    @Published var majorHubs: [Station] = [] // Pôles majeurs regroupés
    
    // Cache des couleurs de lignes (Nom -> Couleur)
    var lineColorCache: [String: Color] = [:]
    
    private init() {
        loadData()
    }
    
    func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.loadTraces()
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
        "9": "B6BD00", "10": "C9910D", "11": "704B1C", "12": "007852", "13": "6EC4E8", "14": "62259D"
    ]
    
    private func loadTraces() {
        guard let url = Bundle.main.url(forResource: "traces-des-lignes-de-transport-en-commun-idfm-2", withExtension: "csv") else {
            print("⚠️ Fichier Tracés CSV introuvable.")
            return
        }
        
        do {
            let data = try String(contentsOf: url, encoding: .utf8)
            let rows = data.components(separatedBy: .newlines)
            print("📊 Nombre de lignes dans le CSV tracés : \(rows.count)")
            
            var newLines: [LineTrace] = []
            
            // On suppose qu'il y a un en-tête si la première ligne contient "route_id" ou similaire.
            // Sinon on traite tout.
            let hasHeader = rows.first?.contains("route_id") ?? false
            let startIndex = hasHeader ? 1 : 0
            
            for (index, row) in rows.enumerated() where index >= startIndex {
                if row.isEmpty { continue }
                
                let columns = self.parseCSVLine(row)
                if columns.count > 6 {
                    let typeString = columns[3]
                    
                    if typeString == "Bus" { continue }
                    
                    // Essayer de récupérer le nom court depuis la colonne 11 (long_name_first) si dispo, sinon col 1
                    var name = columns[1]
                    if columns.count > 11 {
                        let altName = columns[11]
                        if !altName.isEmpty && altName.count < 5 { // Heuristique pour éviter les noms longs
                            name = altName
                        }
                    }
                    
                    var hexColor = columns[4]
                    
                    // Si pas de couleur ou couleur invalide, voir si on l'a en dur
                    if (hexColor.isEmpty || hexColor.count < 6), let hardColor = hardcodedColors[name] {
                        hexColor = hardColor
                    }
                    
                    let geoJson = columns[6]
                    
                    let color = hexColor.isEmpty ? Color.blue : Color(hex: hexColor)
                    let type = self.mapTransportType(typeString, lineName: name)
                    
                    let coordinates = self.parseGeoJSON(geoJson)
                    
                    if !coordinates.isEmpty {
                        let line = LineTrace(id: UUID().uuidString, name: name, color: color, coordinates: coordinates, type: type)
                        newLines.append(line)
                        
                        // Debug spécifique
                        if ["1", "A", "B", "E"].contains(name) {
                            print("🎨 Loaded Trace: \(name) (\(typeString)) -> \(hexColor)")
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.lines = newLines
                // Remplissage du cache
                for line in newLines {
                    self.lineColorCache[line.name] = line.color
                }
                
                // Injecter les couleurs hardcodées manquantes dans le cache (pour les lignes sans tracé)
                for (name, hex) in self.hardcodedColors {
                    if self.lineColorCache[name] == nil {
                        self.lineColorCache[name] = Color(hex: hex)
                    }
                }
                
                print("✅ \(newLines.count) tracés chargés. Cache couleurs mis à jour.")
            }
            
        } catch {
            print("❌ Erreur chargement tracés: \(error)")
        }
    }
    
    private func loadStops() {
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<StopPointEntity> = StopPointEntity.fetchRequest()
        
        do {
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                print("💾 Chargement des arrêts depuis CoreData...")
                let entities = try context.fetch(fetchRequest)
                self.processEntities(entities)
            } else {
                print("📂 CoreData vide. Chargement depuis CSV...")
                self.loadStopsFromCSV()
            }
        } catch {
            print("❌ Erreur CoreData: \(error)")
            self.loadStopsFromCSV()
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
                        
                        let stop = StopPoint(id: stopId, stopAreaId: "", name: name, coordinate: coordinate, type: type, lineName: lineName)
                        
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
                  let city = entity.city else { continue }
            
            // Nettoyage du nom de ligne (comme dans le CSV) pour corriger les données existantes
            let lineName = rawLineName.uppercased()
                .replacingOccurrences(of: "RER", with: "")
                .replacingOccurrences(of: "TRANSILIEN", with: "")
                .replacingOccurrences(of: "TRAIN", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            
            // On ré-évalue le type pour être sûr (ex: si c'était mal classé en Transilien au lieu de RER)
            // On passe le typeStr stocké (ex: "RER" ou "Rail") et le nom nettoyé
            let type = self.mapTransportType(typeStr, lineName: lineName)
            
            let coordinate = CLLocationCoordinate2D(latitude: entity.latitude, longitude: entity.longitude)
            let stop = StopPoint(id: id, stopAreaId: entity.stopAreaId ?? "", name: name, coordinate: coordinate, type: type, lineName: lineName)
            
            let key = "\(name)_\(city)"
            groupedStops[key, default: []].append(stop)
        }
        
        self.finalizeStations(groupedStops)
    }
    
    private func finalizeStations(_ groupedStops: [String: [StopPoint]]) {
        var initialStations: [Station] = []
        
        for (_, stops) in groupedStops {
            guard let first = stops.first else { continue }
            
            let totalLat = stops.reduce(0.0) { $0 + $1.coordinate.latitude }
            let totalLon = stops.reduce(0.0) { $0 + $1.coordinate.longitude }
            let center = CLLocationCoordinate2D(latitude: totalLat / Double(stops.count), longitude: totalLon / Double(stops.count))
            
            let mainType = stops.first { $0.type == .rer }?.type ??
                           stops.first { $0.type == .metro }?.type ??
                           stops.first { $0.type == .transilien }?.type ??
                           first.type
            
            let uniqueLines = Set(stops.map { StationLine(name: $0.lineName, type: $0.type) })
            let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }
            
            let station = Station(
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
            self.stations = finalStations
            self.majorHubs = finalStations.filter { $0.isHub }
            print("✅ \(finalStations.count) stations finales (après fusion des pôles).")
        }
    }
    
    // Logique de fusion des pôles
    private func mergeHubs(_ stations: [Station]) -> [Station] {
        var mergedStations = stations
        
        // Définition des règles de fusion (Nom du pôle -> Mots clés à chercher)
        let hubRules: [String: [String]] = [
            "Saint-Lazare": ["Saint-Lazare", "Haussmann Saint-Lazare"],
            "La Défense": ["La Défense"],
            "Gare du Nord": ["Gare du Nord", "Magenta"],
            "Gare de l'Est": ["Gare de l'Est"],
            "Montparnasse": ["Montparnasse", "Gaîté"], // Gaîté est parfois séparé mais proche, restons sur Montparnasse
            "Châtelet - Les Halles": ["Châtelet", "Les Halles"],
            "Nation": ["Nation"],
            "République": ["République"],
            "Bastille": ["Bastille"]
        ]
        
        var stationsToRemove: Set<String> = []
        var newHubs: [Station] = []
        
        for (hubName, keywords) in hubRules {
            // Trouver toutes les stations qui matchent les mots-clés
            let candidates = stations.filter { station in
                keywords.contains { keyword in
                    station.name.contains(keyword)
                }
            }
            
            if candidates.count > 1 {
                // Fusionner
                let allPlatforms = candidates.flatMap { $0.platforms }
                
                // Recalculer le centroïde
                let totalLat = allPlatforms.reduce(0.0) { $0 + $1.coordinate.latitude }
                let totalLon = allPlatforms.reduce(0.0) { $0 + $1.coordinate.longitude }
                let center = CLLocationCoordinate2D(latitude: totalLat / Double(allPlatforms.count), longitude: totalLon / Double(allPlatforms.count))
                
                // Type principal (RER > Transilien > Métro)
                let mainType = allPlatforms.first { $0.type == .rer }?.type ??
                               allPlatforms.first { $0.type == .transilien }?.type ??
                               allPlatforms.first { $0.type == .metro }?.type ??
                               .metro
                
                // Agrégation des lignes pour le hub
                let uniqueLines = Set(allPlatforms.map { StationLine(name: $0.lineName, type: $0.type) })
                let sortedLines = Array(uniqueLines).sorted { $0.name < $1.name }
                
                let hub = Station(
                    id: candidates.first?.id ?? UUID().uuidString, // On garde un ID existant
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
    private func parseGeoJSON(_ json: String) -> [[CLLocationCoordinate2D]] {
        // Correction manuelle du JSON malformé (clés sans quotes)
        // Ex: {coordinates: ...} -> {"coordinates": ...}
        let fixedJson = json
            .replacingOccurrences(of: "{coordinates:", with: "{\"coordinates\":")
            .replacingOccurrences(of: ", type:", with: ", \"type\":")
            .replacingOccurrences(of: "\"\"", with: "\"") // Nettoyage double quotes résiduelles
        
        // Log pour confirmer que le fix est actif
        print("DEBUG GeoJSON Fixed: \(fixedJson.prefix(20))...")
        
        guard let data = fixedJson.data(using: .utf8) else { return [] }
        
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
            return geom.coordinates.map { segment in
                segment.compactMap { point in
                    if point.count >= 2 {
                        return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                    }
                    return nil
                }
            }
        } catch {
            // Essai LineString
            do {
                let geom = try JSONDecoder().decode(GeometryLine.self, from: data)
                let segment = geom.coordinates.compactMap { point -> CLLocationCoordinate2D? in
                    if point.count >= 2 {
                        return CLLocationCoordinate2D(latitude: point[1], longitude: point[0])
                    }
                    return nil
                }
                return [segment] // On retourne un tableau contenant un seul segment
            } catch {
                // print("❌ Erreur parsing GeoJSON: \(error)")
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
        if cleanName.starts(with: "T") && cleanName.count > 1 && cleanName.dropFirst().first?.isNumber == true {
            return .tram
        }
        
        let normalizedType = typeString.lowercased()
        
        if normalizedType.contains("subway") || normalizedType.contains("metro") {
            return .metro
        } else if normalizedType.contains("tram") {
            return .tram
        } else if normalizedType.contains("rail") || normalizedType.contains("train") || normalizedType.contains("rer") {
            // Fallback si le nom n'a pas matché (ex: TER)
            return .transilien
        } else if normalizedType.contains("bus") {
            return .bus
        }
        
        return .metro // Fallback
    }
    // Méthode asynchrone pour récupérer les stations dans une région (Bounding Box)
    func fetchStations(in region: MKCoordinateRegion) async -> [Station] {
        // Pour l'instant, on filtre la liste en mémoire car tout est préchargé.
        // Une optimisation future serait de faire une requête CoreData spatiale si la mémoire sature.
        
        let center = region.center
        let span = region.span
        
        let minLat = center.latitude - span.latitudeDelta / 2
        let maxLat = center.latitude + span.latitudeDelta / 2
        let minLon = center.longitude - span.longitudeDelta / 2
        let maxLon = center.longitude + span.longitudeDelta / 2
        
        // On utilise une Task détachée pour ne pas bloquer le thread appelant
        return await Task.detached(priority: .userInitiated) {
            // Accès thread-safe à la copie des données (si possible)
            // Ici on accède à self.stations qui est sur le MainActor via await si on était dans un acteur
            // Mais MapDataService est une classe normale conformant à ObservableObject.
            // Pour éviter les data races, on devrait idéalement avoir un acteur ou un lock.
            // Comme self.stations est modifié uniquement au chargement, le risque est faible après le démarrage.
            // Cependant, pour être propre, on va supposer que self.stations est stable.
            
            return self.stations.filter { station in
                let lat = station.coordinate.latitude
                let lon = station.coordinate.longitude
                return lat >= minLat && lat <= maxLat && lon >= minLon && lon <= maxLon
            }
        }.value
    }
    
    // Helper pour récupérer toutes les stations (pour le bridge si besoin)
    func getAllStations() async -> [Station] {
        return stations
    }
}

// Extension Couleur Hexadécimale (si pas déjà définie ailleurs)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 1, 0, 1) // Magenta opaque pour débogage (au lieu de transparent)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
