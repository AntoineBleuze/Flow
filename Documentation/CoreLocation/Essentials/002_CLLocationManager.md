# 002_CLLocationManager.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


