# 001_Supporting live updates in SwiftUI and Mac Catalyst apps.pdf

## Page 1

In iOS 17 and later, Core Location supports live updates using Swift concurrency’s async/await
capability. In order to adopt live updates, SwiftUI and Mac Catalyst apps need to implement
lifecycle event support that enables an app’s @main app to have explicit support for the creation
and resumption of background run-loops. This enables the system to deliver Core Location event
to the app and allows the delivery of events to resume in the event of return from background,
launch of the app, or relaunch after a crash.
To add support for life cycle events, you need to add three components to your app:
1. A shared state using an ObservableObject that maintains instances of CLLocation
Manager and CLBackgroundActivitySession
2. An AppDelegate object that provides the application(_:didFinishLaunchingWith
Options:) method that handles resuming background activities on return from background o
an app relaunch
3. An AppDelegate object in the SwiftUI or Mac Catalyst app’s @main structure
In your SwiftUI or Mac Catalyst App, add support for the AppDelegate by adding a shared state
through an ObservableObject, and a UIApplicationDelegateAdaptor as an object the
app’s @main structure maintains, as shown in the following example:
Overview
Adding lifecycle events to SwiftUI
Core Location / Supporting live updates in SwiftUI and Mac Catalyst apps
Article
Supporting live updates in SwiftUI and
Mac Catalyst apps
Enable background events by adding lifecycle event support.


## Page 2



## Page 3

Next, create an instance of a UIKit AppDelegate class that conforms to SwiftUI’s Observable
Object protocol; this enables the AppDelegate to participate in the SwiftUI’s app-level shared
state and manages the resumption of Core Location activities when needed.
Finally, include the AppDelegate functionality in your app’s @main structure using a
UIApplicationDelegateAdaptor:


## Page 4

Configuring your app to use location services
Prepare your app to start collecting location data.
class CLLocationManager
The object you use to start and stop the delivery of location-related events to your app.
class CLBackgroundActivitySession
An object that manages a visual indicator that keeps your app in use in the background,
allowing it to receive updates or events.
struct CLLocationUpdate
A structure that contains the location information the framework delivers with each update.
Adopting live updates in Core Location
Simplify location delivery using asynchronous events in Swift.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
See Also
Essentials


