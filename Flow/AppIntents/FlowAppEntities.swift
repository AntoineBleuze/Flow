//
//  FlowAppEntities.swift
//  Flow
//
//  Created for Siri & Apple Intelligence (SiriAI) support.
//

import AppIntents
import SwiftUI
import CoreLocation

// MARK: - Station Entity

public struct StationEntity: AppEntity, Identifiable, Sendable {
    public static var defaultQuery = StationEntityQuery()
    public static var typeDisplayRepresentation: TypeDisplayRepresentation = "Station"

    public var id: String

    @Property(title: "Nom de la station")
    public var name: String

    @Property(title: "Lignes")
    public var linesDescription: String

    @Property(title: "Ville")
    public var city: String?

    @Property(title: "Pôle majeur")
    public var isHub: Bool

    @Property(title: "Latitude")
    public var latitude: Double

    @Property(title: "Longitude")
    public var longitude: Double

    public init(
        id: String,
        name: String,
        linesDescription: String,
        city: String? = nil,
        isHub: Bool = false,
        latitude: Double = 0,
        longitude: Double = 0
    ) {
        self.id = id
        self.name = name
        self.linesDescription = linesDescription
        self.city = city
        self.isHub = isHub
        self.latitude = latitude
        self.longitude = longitude
    }

    public var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(name)",
            subtitle: "\(linesDescription.isEmpty ? (city ?? "Station de transport") : linesDescription)",
            image: .init(systemName: isHub ? "tram.fill.tunnel" : "tram.fill")
        )
    }
}

// MARK: - Station Entity Query

public struct StationEntityQuery: EntityQuery, EntityStringQuery, Sendable {
    public init() {}

    public func entities(for identifiers: [StationEntity.ID]) async throws -> [StationEntity] {
        let allStations = await FlowAppIntentsHelper.getAllStations()
        let idSet = Set(identifiers.map { $0.lowercased() })
        return allStations
            .filter { idSet.contains($0.id.lowercased()) || idSet.contains($0.name.lowercased()) }
            .map { FlowAppIntentsHelper.toStationEntity($0) }
    }

    public func entities(matching string: String) async throws -> [StationEntity] {
        let allStations = await FlowAppIntentsHelper.getAllStations()
        let userLocation = await MainActor.run { LocationManager.shared.userLocation }
        let ranked = StationSuggestionEngine.rank(
            stations: allStations,
            query: string,
            userLocation: userLocation,
            favoriteIds: [],
            recentIds: []
        )
        return ranked.prefix(15).map { FlowAppIntentsHelper.toStationEntity($0) }
    }

    public func suggestedEntities() async throws -> [StationEntity] {
        let allStations = await FlowAppIntentsHelper.getAllStations()
        // Favorise les grands hubs de transport parisiens
        let hubs = allStations.filter { $0.isHub }
        let list = hubs.isEmpty ? Array(allStations.prefix(10)) : Array(hubs.prefix(10))
        return list.map { FlowAppIntentsHelper.toStationEntity($0) }
    }
}

// MARK: - Transit Line Entity

public struct TransitLineEntity: AppEntity, Identifiable, Sendable {
    public static var defaultQuery = TransitLineEntityQuery()
    public static var typeDisplayRepresentation: TypeDisplayRepresentation = "Ligne de transport"

    public var id: String

    @Property(title: "Code de la ligne")
    public var lineCode: String

    @Property(title: "Nom complet")
    public var name: String

    @Property(title: "Type de transport")
    public var typeName: String

    @Property(title: "Couleur Hex")
    public var colorHex: String?

    public init(
        id: String,
        lineCode: String,
        name: String,
        typeName: String,
        colorHex: String? = nil
    ) {
        self.id = id
        self.lineCode = lineCode
        self.name = name
        self.typeName = typeName
        self.colorHex = colorHex
    }

    public var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(name)",
            subtitle: "\(typeName)",
            image: .init(systemName: "tram.circle.fill")
        )
    }
}

// MARK: - Transit Line Entity Query

public struct TransitLineEntityQuery: EntityQuery, EntityStringQuery, Sendable {
    public init() {}

    public func entities(for identifiers: [TransitLineEntity.ID]) async throws -> [TransitLineEntity] {
        let allLines = await FlowAppIntentsHelper.getAllTransitLines()
        let idSet = Set(identifiers.map { $0.lowercased() })
        return allLines.filter {
            idSet.contains($0.id.lowercased()) ||
            idSet.contains($0.lineCode.lowercased()) ||
            idSet.contains($0.name.lowercased())
        }
    }

    public func entities(matching string: String) async throws -> [TransitLineEntity] {
        let allLines = await FlowAppIntentsHelper.getAllTransitLines()
        let clean = string.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !clean.isEmpty else { return Array(allLines.prefix(10)) }

        return allLines.filter {
            $0.lineCode.lowercased() == clean ||
            $0.lineCode.lowercased().contains(clean) ||
            $0.name.lowercased().contains(clean) ||
            $0.typeName.lowercased().contains(clean)
        }
    }

    public func suggestedEntities() async throws -> [TransitLineEntity] {
        let allLines = await FlowAppIntentsHelper.getAllTransitLines()
        let popularCodes = ["1", "4", "14", "A", "B", "T2", "T3a", "C", "D", "E"]
        let popular = allLines.filter { popularCodes.contains($0.lineCode) }
        return popular.isEmpty ? Array(allLines.prefix(10)) : popular
    }
}

// MARK: - Transport Mode Enum

public enum TransportModeAppEnum: String, AppEnum, Sendable {
    case metro = "metro"
    case rer = "rer"
    case tram = "tram"
    case train = "train"
    case bus = "bus"
    case cable = "cable"

    public static var typeDisplayRepresentation: TypeDisplayRepresentation = "Mode de transport"

    public static var caseDisplayRepresentations: [TransportModeAppEnum: DisplayRepresentation] = [
        .metro: DisplayRepresentation(title: "Métro", image: .init(systemName: "m.circle.fill")),
        .rer: DisplayRepresentation(title: "RER", image: .init(systemName: "r.circle.fill")),
        .tram: DisplayRepresentation(title: "Tramway", image: .init(systemName: "tram.fill")),
        .train: DisplayRepresentation(title: "Transilien / Train", image: .init(systemName: "train.side.front.car")),
        .bus: DisplayRepresentation(title: "Bus", image: .init(systemName: "bus.fill")),
        .cable: DisplayRepresentation(title: "Câble", image: .init(systemName: "cablecar.fill"))
    ]
}
