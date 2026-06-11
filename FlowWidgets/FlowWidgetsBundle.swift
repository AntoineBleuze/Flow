//
//  FlowWidgetsBundle.swift
//  FlowWidgets
//
//  Created by Antoine BLEUZE on 22/11/2025.
//

import WidgetKit
import SwiftUI

@main
struct FlowWidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        FlowWidgets()
        FlowWidgetsLiveActivity()
        StationActivityWidget()
        NavigationActivityWidget()
        
        if #available(iOS 18.0, *) {
            FlowLaunchItineraryControl()
            FlowLaunchTrafficControl()
        }
    }
}
