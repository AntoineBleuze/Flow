//
//  FlowWidgetsLiveActivity.swift
//  FlowWidgets
//
//  Created by Antoine BLEUZE on 22/11/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FlowWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct FlowWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FlowWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension FlowWidgetsAttributes {
    fileprivate static var preview: FlowWidgetsAttributes {
        FlowWidgetsAttributes(name: "World")
    }
}

extension FlowWidgetsAttributes.ContentState {
    fileprivate static var smiley: FlowWidgetsAttributes.ContentState {
        FlowWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: FlowWidgetsAttributes.ContentState {
         FlowWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: FlowWidgetsAttributes.preview) {
   FlowWidgetsLiveActivity()
} contentStates: {
    FlowWidgetsAttributes.ContentState.smiley
    FlowWidgetsAttributes.ContentState.starEyes
}
