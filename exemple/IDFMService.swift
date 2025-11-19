import Foundation
import CoreLocation
import SwiftUI

// Extension pour rendre un Array [Stop] unique
extension Array where Element: Hashable {
    func unique() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}

// Service principal pour charger les données
@MainActor // Assure que les modifications @Published sont sur le Main Thread
class IDFMService: ObservableObject {
    @Published var stops: [Stop] = [] // Arrêts pour la ligne sélectionnée
    @Published var allStops: [Stop] = [] // Tous les arrêts (pour la recherche)
    @Published var lignes: [Ligne] = [] // Toutes les lignes
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // Cache pour les arrêts déjà "calculés" par ligne
    private var stopsForLines: [String: [Stop]] = [:]
    private let csvParser = CSVParser()

    init() {
        // Charger les lignes dès l'initialisation
        loadLignes()
        
        // Lancer le chargement de tous les arrêts en arrière-plan
        Task {
            await fetchAllStops()
        }
    }

    // Charge les lignes depuis le CSV
    func loadLignes() {
        self.lignes = CSVParser.parseCSV()
        // Trier les lignes par 'order'
        self.lignes.sort { $0.order < $1.order }
    }

    // Récupère les arrêts pour UNE ligne spécifique
    func fetchStops(ligne: Ligne) async {
        self.isLoading = true
        self.errorMessage = nil
        self.stops = [] // Vider les arrêts de la ligne précédente

        // Vérifier si les arrêts pour cette ligne sont déjà en cache
        if let cachedStops = stopsForLines[ligne.id] {
            self.stops = cachedStops
            self.isLoading = false
            return
        }

        // Sinon, "calculer" les arrêts à partir des StopPoints de la Ligne
        // (Les StopPoints sont déjà chargés depuis le CSV via Ligne.swift)
        let calculatedStops = ligne.stopPoints.compactMap { stopPoint -> Stop? in
            let location = CLLocationCoordinate2D(latitude: stopPoint.latitude, longitude: stopPoint.longitude)
            // Utilise l'initialiseur corrigé de Stop.swift
            return Stop(id: stopPoint.id, name: stopPoint.name, city: stopPoint.city, location: location)
        }
        
        // Mettre en cache et publier
        self.stopsForLines[ligne.id] = calculatedStops
        self.stops = calculatedStops
        self.isLoading = false
    }
    
    // Récupère TOUS les arrêts de toutes les lignes (pour la recherche)
    func fetchAllStops() async {
        guard allStops.isEmpty else { return } // Ne charger qu'une fois

        self.isLoading = true
        self.errorMessage = nil
        
        var allStopsList: [Stop] = []
        
        for ligne in lignes {
            // "Calculer" les arrêts pour chaque ligne
            let calculatedStops = ligne.stopPoints.compactMap { stopPoint -> Stop? in
                let location = CLLocationCoordinate2D(latitude: stopPoint.latitude, longitude: stopPoint.longitude)
                return Stop(id: stopPoint.id, name: stopPoint.name, city: stopPoint.city, location: location)
            }
            
            // Mettre en cache si ce n'est pas déjà fait
            if stopsForLines[ligne.id] == nil {
                stopsForLines[ligne.id] = calculatedStops
            }
            
            allStopsList.append(contentsOf: calculatedStops)
        }
        
        // Rendre unique et publier
        self.allStops = allStopsList.unique()
        self.isLoading = false
    }
}
