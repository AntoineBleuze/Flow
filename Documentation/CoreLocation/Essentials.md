# Essentials.pdf

## Page 1

The location data available on most Apple devices gives you additional context and information to
incorporate into your app’s content. You might use that data to show someone’s physical location
on a map and help them navigate their environment. Or you might apply location data to a list of
restaurants and shops to eliminate choices that aren’t nearby. You might also use location data to
alert someone when they’re near a particular device or geographic region. For all of these use
cases and more, the Core Location framework provides access to the location data you need.
When you add code to support Core Location, plan for situations where location data isn’t
available. The system also requires apps to gain permission to use location data, and prevents ap
from acquiring locations without permission. If location data is unavailable for any reason, make th
best app experience you can without it. Disable features that rely on location data or provide
alternatives to get the behavior you need.
Important
Location data is sensitive information, and it’s important for you to secure any location data
you collect. Encrypt any location data you store on disk or send over the network. In addition,
provide a clear privacy policy that explains how you use someone’s location data.
Always verify that location services are available before you attempt to use them. Services might 
unavailable for many different reasons, including:
The device is in Airplane mode.
Overview
Check the availability of services your app uses
Core Location / Configuring your app to use location services
Article
Configuring your app to use location
services
Prepare your app to start collecting location data.


## Page 2

The device doesn’t have the required hardware.
The device doesn’t support a specific service.
Your app doesn’t have authorization to use the service.
If a service isn’t available, disable any app-specific features that rely on that service. Disabling
features in advance is a more reliable approach than using a service and responding to errors.
The CLLocationManager class provides methods to determine the availability of each service.
Call the appropriate method for a given service immediately before you try to use that service. Fo
example, an app that offers compass heading information might call the headingAvailable()
method before starting the service. If your app uses multiple services, call the appropriate metho
for each service.
If your app can’t function without specific location services, declare those requirements in advanc
using your app’s Information Property list. For more information, see Declare the device capabiliti
your app requires below.
You can request location updates in your code immediately. If the system hasn’t requested
authorization for your app, it does so when your code starts iterating over the asynchronous strea
of updates. Because location data is sensitive personal information, the owner of a device control
which apps give access. They can grant or deny access to apps separately, and can change an
app’s access at any time in system settings.
Tip
Begin requesting location updates where your app uses location data, such as from the view
that displays location-related data. Don’t make requests at launch time or from a part of your
app that isn’t connected to location, unless absolutely necessary. Someone might not fully
understand why your app is asking for authorization and deny the request.
Start receiving location updates and authorization status
changes


## Page 3

Location updates and authorization status changes arrive in an asynchronous fashion. Check for
both the presence of a location update and authorization status changes within the loop. The loop
doesn’t terminate unless you explicitly use return, break, or throw an exception.
If your app always needs authorization, it needs to create and hold a privileged session offered by
CLServiceSession. This class provides a single opportunity to upgrade from “While using” to
“Always.”
Core Location generates location updates using a combination of Wi-Fi, cellular, and GPS
hardware, and it generates compass updates using magnetometer hardware. For location update
Core Location doesn’t use every piece of hardware every time. You specify the level of precision
you want in your CLLocationManager object, and Core Location turns on the hardware it needs
to deliver that data in the most power-efficient way.
If your app can’t function without a particular piece of hardware, add the UIRequiredDevice
Capabilities key to your app’s Information Property List. The presence of this key tells the Ap
Store to prevent the installation of your app on devices without the specified hardware or
capabilities. The value of the key is an array of strings, and you can include one of the following
strings for location-related requirements: location-services, gps, or magnetometer.
Include the gps key only if you require the highest level of precision for location data. Typically,
only navigation apps require that kind of precision, but other apps might also need it to ensure
precise location is available when needed. If your app requires heading information, include the
magnetometer key.
Don’t include the UIRequiredDeviceCapabilities key if people can still use your app witho
location data. For example, don’t include the key if your app uses location data to filter search
results for nearby restaurants. When location data isn’t available, you can find alternatives to get
Declare the device capabilities your app requires


## Page 4

you what you need or work without that data. For example, if you want to filter search results by
location, you might prompt someone to enter a postal code or other geographic information
explicitly.
After you perform the initial checks and verify the authorization status of your app, start the
location services you need. Core Location offers several different ways to access location-related
information:
Get the current location. Offer navigation instructions, filter data sets based on location, share
someone’s location with friends, or perform other tasks that use someone’s current location. S
Getting the current location of a device.
Detect when the device enters or exits a geographical region. Alert someone to points-of-
interest, deliver location-sensitive reminders, and more. See Monitoring the user’s proximity to
geographic regions.
Determine the current compass heading. Offer course-based navigation or display an
onscreen compass. See Getting heading and course information.
Detect nearby iBeacon hardware. Determine someone’s proximity to Bluetooth devices. See
Determining the proximity to an iBeacon device.
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
Start the location services
See Also
Essentials


## Page 5

Monitoring location changes with Core Location
Define boundaries and act on user location updates.


## Page 6

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


## Page 7



## Page 8

Next, create an instance of a UIKit AppDelegate class that conforms to SwiftUI’s Observable
Object protocol; this enables the AppDelegate to participate in the SwiftUI’s app-level shared
state and manages the resumption of Core Location activities when needed.
Finally, include the AppDelegate functionality in your app’s @main structure using a
UIApplicationDelegateAdaptor:


## Page 9

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


## Page 10

Determining the proximity to an iBeacon device
Configuring your app to use location services
Converting between coordinates and user-friendly place names
Getting heading and course information
Getting the current location of a device
A CLLocationManager object is the central place to manage your app’s location-related
behaviors. Use a location-manager object to configure, start, and stop location services. You mig
use these services to:
Track large or small changes in the user’s current location with a configurable degree of
accuracy.
Report heading changes from the onboard compass.
Monitor geographical regions of interest and generate events when someone enters or leaves
those regions.
Report the range to nearby Bluetooth beacons.
Mentioned in
Overview
Core Location / CLLocationManager
Class
CLLocationManager
The object you use to start and stop the delivery of location-related events to you
app.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 11

Create one or more location-manager objects in your app and use them where you need location
data. After you create a location-manager object, configure it so that Core Location knows how
often to report location changes. In particular, configure the distanceFilter and desired
Accuracy properties with values that reflect your app’s needs.
A CLLocationManager object reports all location-related updates to its delegate object, whic
is an object that conforms to the CLLocationManagerDelegate protocol. Assign the delegate
immediately when you configure your location manager, because the system reports the app’s
authorization status to the delegate’s locationManagerDidChangeAuthorization(_:)
method after the location manager finishes initializing itself. Core Location calls the methods of
your delegate object using the RunLoop of the thread on which you initialized the CLLocation
Manager object. That thread must itself have an active RunLoop, like the one found in your app’s
main thread.
For more information, see Configuring your app to use location services.
class func significantLocationChangeMonitoringAvailable() -> Bool
Returns a Boolean value indicating whether the significant-change location service is availab
on the device.
class func headingAvailable() -> Bool
Returns a Boolean value indicating whether the location manager is able to generate heading
related events.
var isAuthorizedForWidgetUpdates: Bool
A Boolean value that indicates whether a widget is eligible to receive location updates.
var accuracyAuthorization: CLAccuracyAuthorization
A value that indicates the level of location accuracy the app has permission to use.
class func isMonitoringAvailable(for: AnyClass) -> Bool
Returns a Boolean value indicating whether the device supports region monitoring using the
specified class.
class func isRangingAvailable() -> Bool
Returns a Boolean value indicating whether the device supports ranging of beacons that use
the iBeacon protocol.
class func locationServicesEnabled() -> Bool
Topics
Determining the availability of services


## Page 12

Returns a Boolean value indicating whether location services are enabled on the device.
var delegate: (any CLLocationManagerDelegate)?
The delegate object to receive update events.
protocol CLLocationManagerDelegate
The methods you use to receive events from an associated location-manager object.
func requestWhenInUseAuthorization()
Requests the user’s permission to use location services while the app is in use.
func requestAlwaysAuthorization()
Requests the user’s permission to use location services regardless of whether the app is in
use.
func requestTemporaryFullAccuracyAuthorization(withPurposeKey: String,
completion: (((any Error)?) -> Void)?)
Requests permission to temporarily use location services with full accuracy and reports the
results to the provided completion handler.
func requestTemporaryFullAccuracyAuthorization(withPurposeKey: String)
Requests permission to temporarily use location services with full accuracy.
var authorizationStatus: CLAuthorizationStatus
The current authorization status for the app.
enum CLAuthorizationStatus
Constants that indicate the app’s authorization to use location services.
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
Receiving data from location services
Requesting authorization for location services
Specifying distance and accuracy


## Page 13

var distanceFilter: CLLocationDistance
The minimum distance in meters the device must move horizontally before an update event 
generated.
let CLLocationDistanceMax: CLLocationDistance
A constant indicating the maximum distance.
let kCLDistanceFilterNone: CLLocationDistance
A constant indicating that all movement should be reported.
typealias CLLocationDistance
A distance in meters from an existing location.
var desiredAccuracy: CLLocationAccuracy
The accuracy of the location data that your app wants to receive.
typealias CLLocationAccuracy
The accuracy of a geographical coordinate.
func startUpdatingLocation()
Starts the generation of updates that report the user’s current location.
func stopUpdatingLocation()
Stops the generation of location updates.
func requestLocation()
Requests the one-time delivery of the user’s current location.
var pausesLocationUpdatesAutomatically: Bool
A Boolean value that indicates whether the location-manager object may pause location
updates.
var allowsBackgroundLocationUpdates: Bool
A Boolean value that indicates whether the app receives location updates when running in th
background.
var showsBackgroundLocationIndicator: Bool
A Boolean value that indicates whether the status bar changes its appearance when an app
uses location services in the background.
var activityType: CLActivityType
Running the standard location service


## Page 14

The type of activity the app expects the user to typically perform while in the app’s location
session.
enum CLActivityType
Constants that indicate the type of activity associated with location updates.
func startMonitoringSignificantLocationChanges()
Starts the generation of updates based on significant location changes.
func stopMonitoringSignificantLocationChanges()
Stops the delivery of location events based on significant location changes.
func startMonitoringVisits()
Starts the delivery of visit-related events.
func stopMonitoringVisits()
Stops the delivery of visit-related events.
func startUpdatingHeading()
Starts the generation of updates that report the user’s current heading.
func stopUpdatingHeading()
Stops the generation of heading updates.
func dismissHeadingCalibrationDisplay()
Dismisses the heading calibration view from the screen immediately.
var headingFilter: CLLocationDegrees
The minimum angular change in degrees required to generate new heading events.
let kCLHeadingFilterNone: CLLocationDegrees
A constant indicating that all header values should be reported.
typealias CLLocationDegrees
A latitude or longitude value specified in degrees.
Running the significant change location service
Running the visits location service
Running the heading service


## Page 15

var headingOrientation: CLDeviceOrientation
The device orientation to use when computing heading values.
enum CLDeviceOrientation
Constants indicating the physical orientation of the device.
var monitoredRegions: Set<CLRegion>
The set of shared regions monitored by all location-manager objects.
var maximumRegionMonitoringDistance: CLLocationDistance
The largest boundary distance that can be assigned to a region.
func startRangingBeacons(satisfying: CLBeaconIdentityConstraint)
Starts the delivery of notifications for the specified beacon constraints.
func stopRangingBeacons(satisfying: CLBeaconIdentityConstraint)
Stops the delivery of notifications for the specified beacon constraints.
var rangedBeaconConstraints: Set<CLBeaconIdentityConstraint>
The set of beacon constraints currently being tracked using ranging.
func startMonitoringLocationPushes(completion: ((Data?, (any Error)?) -
Void)?)
Starts monitoring for the delivery of Apple Push Notification service (APNs) location pushes,
and provides a device-specific token for sending pushes.
func stopMonitoringLocationPushes()
Stops monitoring for Apple Push Notification service (APNs) location pushes.
var location: CLLocation?
The most recently retrieved user location.
var heading: CLHeading?
Running the region-monitoring service
Performing beacon ranging
Monitoring location push notifications
Getting recent location and heading data


## Page 16

The most recently reported heading.
let CLTimeIntervalMax: TimeInterval
A value representing an unlimited amount of time.
Deprecated symbols
Review unsupported symbols and their replacements.
func requestHistoricalLocations(purposeKey: String, sampleCount: Int,
completionHandler: ([CLLocation], (any Error)?) -> Void)
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Deferring location updates
Deprecated
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Essentials


## Page 17

Configuring your app to use location services
Prepare your app to start collecting location data.
Supporting live updates in SwiftUI and Mac Catalyst apps
Enable background events by adding lifecycle event support.
class CLBackgroundActivitySession
An object that manages a visual indicator that keeps your app in use in the background,
allowing it to receive updates or events.
struct CLLocationUpdate
A structure that contains the location information the framework delivers with each update.
Adopting live updates in Core Location
Simplify location delivery using asynchronous events in Swift.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.


## Page 18

Handling location updates in the background
Supporting live updates in SwiftUI and Mac Catalyst apps
Use CLBackgroundActivitySession to start a background activity session that allows a
when-in-use authorized app to receive location updates or monitoring events.
init()
Creates a new background activity session.
Mentioned in
Overview
Topics
Creating a background activity session
Ending the session
Core Location / CLBackgroundActivitySession
Class
CLBackgroundActivitySession
An object that manages a visual indicator that keeps your app in use in the
background, allowing it to receive updates or events.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 19

func invalidate()
Invalidates the background activity session.
class Diagnostics
struct Diagnostic
var diagnostics: CLBackgroundActivitySession.Diagnostics
Sendable, SendableMetatype
Configuring your app to use location services
Prepare your app to start collecting location data.
Supporting live updates in SwiftUI and Mac Catalyst apps
Enable background events by adding lifecycle event support.
class CLLocationManager
The object you use to start and stop the delivery of location-related events to your app.
struct CLLocationUpdate
A structure that contains the location information the framework delivers with each update.
Classes
Structures
Instance Properties
Relationships
Conforms To
See Also
Essentials


## Page 20

Adopting live updates in Core Location
Simplify location delivery using asynchronous events in Swift.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.


## Page 21

Handling location updates in the background
You use CLLocationUpate events to observe changes in the device’s location, and to determin
the activity type.
var isStationary: Bool
A Boolean value that indicates whether the user is stationary.
Deprecated
var location: CLLocation?
The user’s location, if available.
Mentioned in
Overview
Topics
Determining movement and location
Core Location / CLLocationUpdate
Structure
CLLocationUpdate
A structure that contains the location information the framework delivers with eac
update.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 22

static func liveUpdates(CLLocationUpdate.LiveConfiguration) ->
CLLocationUpdate.Updates
Tells Core Location to start delivering the location updates it produces for the configuration
you specify.
enum LiveConfiguration
Values for indicating the kind of updates the framework delivers.
struct Updates
A structure that represents an asynchronous sequence of location updates.
var accuracyLimited: Bool
var authorizationDenied: Bool
var authorizationDeniedGlobally: Bool
var authorizationRequestInProgress: Bool
var authorizationRestricted: Bool
var insufficientlyInUse: Bool
var locationUnavailable: Bool
var serviceSessionRequired: Bool
var stationary: Bool
Sendable, SendableMetatype
Receiving location updates
Instance Properties
Relationships
Conforms To


## Page 23

Configuring your app to use location services
Prepare your app to start collecting location data.
Supporting live updates in SwiftUI and Mac Catalyst apps
Enable background events by adding lifecycle event support.
class CLLocationManager
The object you use to start and stop the delivery of location-related events to your app.
class CLBackgroundActivitySession
An object that manages a visual indicator that keeps your app in use in the background,
allowing it to receive updates or events.
Adopting live updates in Core Location
Simplify location delivery using asynchronous events in Swift.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
See Also
Essentials


## Page 24

Note
This sample code project is associated with WWDC24 session 10212: What’s new in location
authorization and WWDC23 session 10180: Discover streamlined location updates.
The live updates sample requires Xcode 16 or later and iOS 18 or later.
Configuring your app to use location services
Prepare your app to start collecting location data.
Supporting live updates in SwiftUI and Mac Catalyst apps
Enable background events by adding lifecycle event support.
Overview
Configure the sample code project
See Also
Essentials
Core Location / Adopting live updates in Core Location
Sample Code
Adopting live updates in Core Location
Simplify location delivery using asynchronous events in Swift.
Download
iOS 18.0+
iPadOS 18.0+
Xcode 15.3+


## Page 25

class CLLocationManager
The object you use to start and stop the delivery of location-related events to your app.
class CLBackgroundActivitySession
An object that manages a visual indicator that keeps your app in use in the background,
allowing it to receive updates or events.
struct CLLocationUpdate
A structure that contains the location information the framework delivers with each update.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.


## Page 26

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


## Page 27

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


