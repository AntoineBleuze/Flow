//
//  FlowShortcutsProvider.swift
//  Flow
//
//  Created for Siri & Apple Intelligence (SiriAI) support.
//

import AppIntents

public struct FlowShortcutsProvider: AppShortcutsProvider {
    public static var shortcutTileColor: ShortcutTileColor = .blue

    public static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: CheckLineTrafficIntent(),
            phrases: [
                "Quel est le trafic sur la ligne \(\.$line) dans \(.applicationName)",
                "Trafic de la \(\.$line) dans \(.applicationName)",
                "Info trafic \(\.$line) avec \(.applicationName)",
                "Trafic sur la ligne \(\.$line) avec \(.applicationName)"
            ],
            shortTitle: "Trafic d'une ligne",
            systemImageName: "exclamationmark.triangle.fill"
        )

        AppShortcut(
            intent: CheckNetworkTrafficIntent(),
            phrases: [
                "Trafic global sur \(.applicationName)",
                "État du réseau dans \(.applicationName)",
                "Info trafic global avec \(.applicationName)",
                "Perturbations sur le réseau dans \(.applicationName)"
            ],
            shortTitle: "Trafic global",
            systemImageName: "point.3.filled.connected.trianglepath.dotted"
        )

        AppShortcut(
            intent: GetNextDeparturesIntent(),
            phrases: [
                "Prochains départs à \(\.$station) dans \(.applicationName)",
                "Prochains métros à \(\.$station) avec \(.applicationName)",
                "Quand passe le prochain train à \(\.$station) dans \(.applicationName)",
                "Départs à \(\.$station) avec \(.applicationName)"
            ],
            shortTitle: "Prochains départs",
            systemImageName: "clock.arrow.circlepath"
        )

        AppShortcut(
            intent: SearchItineraryIntent(),
            phrases: [
                "Itinéraire vers \(\.$destination) dans \(.applicationName)",
                "Comment aller à \(\.$destination) avec \(.applicationName)",
                "Trajet pour aller à \(\.$destination) dans \(.applicationName)",
                "Recherche un itinéraire vers \(\.$destination) avec \(.applicationName)"
            ],
            shortTitle: "Rechercher un itinéraire",
            systemImageName: "arrow.triangle.turn.up.right.diamond.fill"
        )

        AppShortcut(
            intent: StartNavigationIntent(),
            phrases: [
                "Naviguer vers \(\.$destination) avec \(.applicationName)",
                "Démarrer le guidage vers \(\.$destination) dans \(.applicationName)",
                "Guide-moi vers \(\.$destination) avec \(.applicationName)"
            ],
            shortTitle: "Démarrer la navigation",
            systemImageName: "location.fill"
        )

        AppShortcut(
            intent: StopNavigationIntent(),
            phrases: [
                "Arrêter la navigation dans \(.applicationName)",
                "Quitter le trajet avec \(.applicationName)",
                "Terminer le guidage dans \(.applicationName)"
            ],
            shortTitle: "Arrêter la navigation",
            systemImageName: "xmark.circle.fill"
        )

        AppShortcut(
            intent: FindNearbyStationsIntent(),
            phrases: [
                "Stations proches dans \(.applicationName)",
                "Où est le métro le plus proche avec \(.applicationName)",
                "Trouver les stations autour de moi dans \(.applicationName)"
            ],
            shortTitle: "Stations proches",
            systemImageName: "location.north.circle.fill"
        )

        AppShortcut(
            intent: CheckStationElevatorsIntent(),
            phrases: [
                "Ascenseurs à \(\.$station) dans \(.applicationName)",
                "État des ascenseurs à \(\.$station) avec \(.applicationName)",
                "Accessibilité à \(\.$station) dans \(.applicationName)"
            ],
            shortTitle: "Ascenseurs et accessibilité",
            systemImageName: "figure.roll"
        )

        AppShortcut(
            intent: GetFavoriteStationsIntent(),
            phrases: [
                "Mes favoris dans \(.applicationName)",
                "Mes stations favorites avec \(.applicationName)",
                "Afficher mes favoris dans \(.applicationName)"
            ],
            shortTitle: "Mes favoris",
            systemImageName: "star.fill"
        )

        AppShortcut(
            intent: ConfirmBoardingIntent(),
            phrases: [
                "Je suis monté à bord dans \(.applicationName)",
                "Confirmer la montée dans \(.applicationName)"
            ],
            shortTitle: "Confirmer montée à bord",
            systemImageName: "checkmark.circle.badge.questionmark.fill"
        )
    }
}
