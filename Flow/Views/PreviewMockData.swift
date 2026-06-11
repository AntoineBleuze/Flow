import SwiftUI
import CoreLocation
import MapKit

struct PreviewMockData {
    static let mockJourney: Journey = {
        let displayInfo = DisplayInformation(
            network: "RATP",
            code: "1",
            label: "1",
            color: "FFCD00",
            text_color: "000000",
            commercial_mode: "Metro",
            direction: "La Défense",
            physical_mode: "Métro"
        )
        
        let startPlace = ItineraryPlace(
            name: "Mairie d'Issy",
            id: "stop_area:IDFM:63901",
            coord: ItineraryCoord(lat: "48.8239", lon: "2.2743"),
            stop_point: nil
        )
        
        let endPlace = ItineraryPlace(
            name: "Châtelet",
            id: "stop_area:IDFM:474151",
            coord: ItineraryCoord(lat: "48.8584", lon: "2.3475"),
            stop_point: nil
        )
        
        let section1 = ItinerarySection(
            id: "section_1",
            type: "public_transport",
            mode: "metro",
            duration: 900,
            from: startPlace,
            to: endPlace,
            departure_date_time: "20260608T180000",
            arrival_date_time: "20260608T181500",
            display_informations: displayInfo,
            geojson: GeoJSON(type: "LineString", coordinates: [
                [2.2743, 48.8239],
                [2.3475, 48.8584]
            ]),
            stop_date_times: [
                ItineraryStopDateTime(
                    stop_point: ItineraryPlace.StopPoint(name: "Mairie d'Issy", id: "stop:IDFM:23242", coord: ItineraryCoord(lat: "48.8239", lon: "2.2743")),
                    arrival_date_time: "20260608T180000",
                    departure_date_time: "20260608T180000"
                ),
                ItineraryStopDateTime(
                    stop_point: ItineraryPlace.StopPoint(name: "Châtelet", id: "stop:IDFM:23243", coord: ItineraryCoord(lat: "48.8584", lon: "2.3475")),
                    arrival_date_time: "20260608T181500",
                    departure_date_time: "20260608T181500"
                )
            ]
        )
        
        return Journey(
            departure_date_time: "20260608T180000",
            arrival_date_time: "20260608T181500",
            duration: 900,
            nb_transfers: 0,
            sections: [section1]
        )
    }()
    
    static let mockStation: MapStation = {
        let stop = StopPoint(
            id: "stop_1",
            stopAreaId: "stop_area:IDFM:63901",
            name: "Mairie d'Issy",
            coordinate: CLLocationCoordinate2D(latitude: 48.8239, longitude: 2.2743),
            type: .metro,
            lineName: "12"
        )
        
        let line = StationLine(
            name: "12",
            type: .metro
        )
        
        return MapStation(
            id: "stop_area:IDFM:63901",
            name: "Mairie d'Issy",
            coordinate: CLLocationCoordinate2D(latitude: 48.8239, longitude: 2.2743),
            platforms: [stop],
            isHub: false,
            mainType: .metro,
            lines: [line],
            city: "Issy-les-Moulineaux"
        )
    }()
    
    static let mockTransportLine: TransportLine = {
        TransportLine(
            type: .metro,
            lineId: "12",
            navitiaId: "line:IDFM:C01382",
            status: .normal,
            trafficInfos: [
                TrafficInfo(
                    id: "disruption_1",
                    title: "Trafic normal",
                    message: "Le trafic est régulier sur l'ensemble de la ligne.",
                    period: .active,
                    severity: .normal,
                    startTime: Date(),
                    endTime: nil,
                    impactedStops: nil,
                    impactedSection: nil,
                    summary: nil
                )
            ]
        )
    }()
}
