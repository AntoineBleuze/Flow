//
//  FlowApp.swift
//  Flow
//
//  Created by Antoine BLEUZE on 18/11/2025.
//

import SwiftUI
import SwiftData

@main
struct FlowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(SwiftDataStack.shared.container)
        }
    }
}
