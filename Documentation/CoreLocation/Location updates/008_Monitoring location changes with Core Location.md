# 008_Monitoring location changes with Core Location.pdf

## Page 1

Note
This sample code project is associated with WWDC24 session 10212: What’s new in location
authorization and WWDC23 session 10147: Meet Core Location Monitor.
Before you run the sample code project in Xcode, ensure that you’re using Xcode 16 or later and
iOS 18 or later.
Configuring your app to use location services
Prepare your app to start collecting location data.
Overview
Configure the sample code project
See Also
Essentials
Core Location / Monitoring location changes with Core Location
Sample Code
Monitoring location changes with Core
Location
Define boundaries and act on user location updates.
Download
iOS 18.0+
iPadOS 18.0+
Xcode 15.3+


## Page 2

Supporting live updates in SwiftUI and Mac Catalyst apps
Enable background events by adding lifecycle event support.
class CLLocationManager
The object you use to start and stop the delivery of location-related events to your app.
class CLBackgroundActivitySession
An object that manages a visual indicator that keeps your app in use in the background,
allowing it to receive updates or events.
struct CLLocationUpdate
A structure that contains the location information the framework delivers with each update.
Adopting live updates in Core Location
Simplify location delivery using asynchronous events in Swift.


