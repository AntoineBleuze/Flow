//
//  FlowApp.swift
//  Flow
//
//  Created by Antoine BLEUZE on 18/11/2025.
//

import SwiftUI
import SwiftData
import AppIntents

@main
struct FlowApp: App {
    @StateObject private var preferences = UserPreferencesManager.shared

    init() {
        FlowShortcutsProvider.updateAppShortcutParameters()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(SwiftDataStack.shared.container)
                .preferredColorScheme(preferences.appearanceMode.colorScheme)
        }
    }
}
