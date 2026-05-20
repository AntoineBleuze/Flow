//
//  FlowApp.swift
//  Flow
//
//  Created by Antoine BLEUZE on 18/11/2025.
//

import SwiftUI

@main
struct FlowApp: App {
    init() {
        // Connexion WebSocket au serveur pour les mises à jour push
        if FlowServerService.shared.isEnabled {
            FlowServerService.shared.connectWebSocket()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
