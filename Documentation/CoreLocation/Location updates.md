# Location updates.pdf

## Page 1

Core Location offers many different services for getting location-related data, but the most
common services return the device’s current location. You might use this information to:
Facilitate navigation, either by foot, car, or other modes of transportation.
Identify nearby points of interest.
Filter search results based on proximity to the person.
Display the person’s location on a map.
Share the person’s location with a friend.
Tag the location of a photo.
Check in with social media.
Track the path someone takes during a workout or hike.
Core Location can determine the current location using many different types of hardware, includin
Wi-Fi, cellular, and GPS radios. Core Location doesn’t need every one of these radios to determin
the location. Instead, it selectively enables radios to get the required location data in the most
power-efficient way possible. The configuration of your CLLocationManager object affects
which radios the system uses and your app’s power consumption.
Always choose the most power-efficient location service that meets the needs of your app. Core
Location provides the following services for getting location data:
Overview
Start the service that delivers the location data you need
Core Location / Getting the current location of a device
Article
Getting the current location of a device
Start location services and provide information the system needs to optimize
power usage for those services.


## Page 2

The Visits location service provides the most power-efficient way to get location data. The
system monitors the places someone visits and the time they spend there, and delivers that da
at a later time. Call startMonitoringVisits() to start the service.
The Significant-change location service offers a low-power way to get location updates. This
service uses the cellular and Wi-Fi radios (not GPS) to report only location changes that excee
a significantly large distance. Call startMonitoringSignificantLocationChanges() t
start the service.
The Standard location service provides the most precise and regular location data, but uses
more power than the other services. Use it primarily if your app provides turn-by-turn navigatio
or needs a greater precision or frequency of events. This location service is the only one
available to apps running in visionOS. Call startUpdatingLocation() to start the service, 
call requestLocation() to get a single location event.
Few apps need to start location services right away, and fewer still need to keep those services
running for extended periods of time. Delay the start of location services until someone interacts
with your app in a way that requires that information. Then, as soon as you have the location data
you need, stop services to preserve battery life. For example, stop services if you only need the
current location to filter search results once.
When adding support for a location service, make sure to implement all of the service’s relevant
methods in your delegate object. The Standard and Significant-change location services use the
same set of delegate methods, but the Visits service has a separate method to receive visit-
specific data.
For information about the behavior of individual services and how to start and stop them, see
CLLocationManager.
Core Location optimizes power usage as much as possible, but you can still help. The best
optimization is to turn off location services when your app doesn’t need new location data. Other
optimizations require you to adjust the configuration of your location manager object:
Set the distanceFilter property to the largest possible value that gives you the information
you need. Higher values let the system turn off radio hardware more frequently.
Set the desiredAccuracy property to the lowest possible value that gives you the informatio
you need. Lower accuracy values let the system use more power-efficient hardware. Lower
values also let the system turn off hardware sooner.
Configure the activityType property to an appropriate value, and set the pausesLocatio
UpdatesAutomatically property to true. Core Location uses your activity type to turn off
hardware automatically when conditions allow it. For example, if the activity type is CLActivi
Type.automotiveNavigation and someone’s location isn’t changing, the system might tu
off radio hardware until it detects new movement.
Enable power-saving features


## Page 3

Set the allowsBackgroundLocationUpdates property to false when you don’t actually
need background location updates.
Another way to improve power usage is to add the NSLocationDefaultAccuracyReduced ke
with the value true to your app’s Info.plist file. Include this key if lower-accuracy location dat
is sufficient for your needs. For example, an app that returns a list of restaurants within driving
distance doesn’t need someone’s precise location. As needed, you can always use your location
manager to request more accurate data later. However, the system displays a prompt to the devic
owner to grant each request you make.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession
See Also
Location updates


## Page 4



## Page 5

On some Apple devices, the operating system preserves battery life by suspending the execution
of background apps. For example, on iOS, iPadOS, and watchOS, the system suspends the
execution of most apps shortly after they move to the background. In this suspended state, apps
don’t run and don’t receive location updates from the system. Instead, the system enqueues
location updates and delivers them when the app runs again, either in the foreground or
background. If your app needs updates in a more timely manner, you can ask the system to not
suspend your app while location services are active.
Consider carefully whether your app really needs background location updates. Most apps need
location data only while someone actively uses the app. Consider background updates only when
your app needs to receive those updates in real time, perhaps to:
Track the precise path taken during a hike or fitness workout.
Provide navigation instructions in real time.
Generate time-sensitive notifications or updates.
Take immediate action when someone enters or exits a particular geographic region.
If you need background location updates for an iOS, iPadOS, or watchOS app, update your projec
to support those updates. On macOS, you don’t need to add support for background updates
because the system doesn’t suspend apps when they move to the background. Apps running in
visionOS don’t receive background updates.
Overview
Add the background mode capability
Core Location / Handling location updates in the background
Article
Handling location updates in the
background
Configure your app to receive location updates when it isn’t running in the
foreground.


## Page 6

The background mode capability lets the system know whether your app uses background
updates. To add this capability, navigate to the Signing & Capabilities tab of your app target and
enable the Location updates option. When you enable this capability, Xcode updates your app’s
Info.plist file with the keys needed to indicate your app supports background updates.
Create an instance of CLBackgroundActivitySession to start a background activity session
so that you can receive location updates. It’s your responsibility to communicate that location
updates will arrive before going to the background, and handle updates as they arrive.
Create a CLServiceSession requiring the relevant form of authorization (CLServiceSession
.AuthorizationRequirement.whenInUse or CLServiceSession.Authorization
Requirement.always). Create the session while your app is in the foreground. If your app
terminates, you must recreate the CLServiceSession immediately upon launch in the
background.
Core Location sets When in Use authorization implicitly when you process events from
CLMonitor, CLLocationUpdate, or use a CLBackgroundActivitySession. The exception
is if you set the NSLocationRequireExplicitServiceSession in your app’s Info.plist
Important
For Always authorization, inform the user that location updates arrive in the background. This
provides transparency and lets the user know what’s happening.
Receive location updates in the background
Process location updates after an app launch


## Page 7

The system can terminate apps at any time to free up memory or other system resources. If your
app actively receives and processes location updates and terminates, it should restart those APIs
upon launch in order to continue receiving updates. When you start those services, the system
resumes the delivery of queued location updates. Don’t start these services at launch time if your
app’s authorization status is undetermined.
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession
See Also
Location updates


## Page 8

The Location Push Service Extension, available starting in iOS 15, is a power efficient way to query
locations on iOS or iPadOS devices, even when your app isn’t running.
When your app includes a Location Push Service Extension, the system activates the extension
when it receives an Apple Push Notification service (APNs) location push from your server. You
app must ask for and receive Always authorization (CLAuthorizationStatus.authorized
Always) from the user before the extension can function. For more information about requesting
Always authorization, see Requesting authorization to use location services and requestAlways
Authorization().
With the user’s authorization, the extension can query the user’s location and process it accordin
to your app’s purpose. Your server sends requests with the location push type to APNs. For
more information about sending requests to APNs, see Sending notification requests to APNs.
Important
To use the Location Push Service Extension, your app must have the Location Push
Service Extension entitlement. Request this entitlement before implementing this service
extension. To apply for the entitlement, log in to your developer account with an Account
Holder role and fill out the request form.
To include Location Push Service Extension in your app, use Xcode 13 or later. Configure the
following entitlements, capabilities, and keys for your Xcode project:
Overview
Configure Your Xcode Project
Core Location / Creating a location push service extension
Article
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a
user’s location in response to a request from another user.


## Page 9

1. Set the Location Push Server Extension entitlement key (Location Push Service
Extension).
2. Enable your app to receive Apple Push Notification service (APNs) pushes by adding the Push
Notifications capability. For more information, see Registering your app with APNs.
3. Configure the purpose strings your app provides for the location service authorization prompts
For more information, see Requesting authorization to use location services.
Add a new target using the Location Push Service Extension template.
1. Open your iOS app project in Xcode.
2. Choose File > New > Target.
3. Select Location Push Service Extension from the iOS Application Extension group.
4. Click Next.
5. Specify the name of your extension and configure the language and other options.
6. Click Finish.
Xcode creates a subclass of CLLocationPushServiceExtension to get you started.
To support location push functionality, implement the following code in your extension, app, and
server:
1. In your service extension, implement the CLLocationPushServiceExtension protocol.
2. In your service extension, implement the locationManager(_:didUpdateLocations:)
method to handle the result of the location request, and process the location data received.
3. In your app, call startMonitoringLocationPushes(completion:) to receive an APNs
token as Data, and send it to your server. Your server uses this token when it creates APNs
pushes.
4. From your server, request location information by sending a location push request to APNs.
If the user authorized your app with Always authorization (CLAuthorizationStatus
.authorizedAlways), the system activates the service extension when it receives a location
push, and calls didReceiveLocationPushPayload(_:completion:). Your app should ask
the user for Always authorization at an appropriate time.
Add a Location Push Service Extension Target
Implement Location Push Functionality


## Page 10

Important
Protecting user privacy is important when handling location data. End-to-end encryption
provides enhanced security if your app moves location data off the user’s device, including
transmitting it to a server or to another user. For more information, see Protecting the User’s
Privacy.
When a user requests the location of another user, your app sends the request to your server,
which sends a location push request to APNs. Ensure that your APNs POST request contains the
following fields for a location push type:
method
(Required) The value is POST.
path
(Required) The path to the device token. The value of this header is /3/device/<device
_token>, where <device_token> is the hexadecimal identifier of the user’s device. Your
app receives the token when it calls startMonitoringLocationPushes(completion:
to start monitoring location pushes.
authorization
(Required for token-based authentication) The value of this header is bearer <provider
_token>, where <provider_token> is the encrypted token that authorizes you to send
notifications for the specified topic. For more information, see Establishing a token-based
connection to APNs.
apns-topic
The topic is your app’s bundle ID with the suffix ".location-query".
apns-push-type
(Recommended) The value of this header is location.
apns-priority
The priority of the notification. If you omit this header, APNs sets the notification priority to 1
If a user initiates the location query, set this header to 10. If your app’s server initiates the
location query (for example, on a periodic interval) set this header to 5 to send the notificatio
based on power considerations on the user’s device.
For more information about sending APNs requests and using command-line tools to do so, see
Sending notification requests to APNs and Sending push notifications using command-line tools.
Send Location Push Requests From Your Server
See Also


## Page 11

Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession
Location updates


## Page 12

Converting between coordinates and user-friendly place names
Getting heading and course information
A CLLocation object contains the geographical location and altitude of a device, along with
values indicating the accuracy of those measurements and when they were collected. In iOS, a
location object also contains course information — that is, the speed and heading in which the
device was moving.
Typically, you don’t create location objects yourself. After you request location updates from your
CLLocationManager object, the system uses onboard sensors to gather location data and repo
that data to your app. Some services also return previously collected location data, which you can
use as context to improve your services. You can always retrieve the most recently collected
location from the location property of your CLLocationManager object. You may create
location objects yourself when you want to cache custom location data or calculate the distance
between two geographical coordinates.
Use CLLocation objects as-is, and don’t subclass them.
Mentioned in
Overview
Topics
Core Location / CLLocation
Class
CLLocation
The latitude, longitude, and course information reported by the system.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 13

init(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
Creates a location object with the specified latitude and longitude.
init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance,
horizontalAccuracy: CLLocationAccuracy, verticalAccuracy: CLLocation
Accuracy, timestamp: Date)
Creates a location object with the specified coordinate and altitude information.
init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance,
horizontalAccuracy: CLLocationAccuracy, verticalAccuracy: CLLocation
Accuracy, course: CLLocationDirection, speed: CLLocationSpeed, timestam
: Date)
Creates a location object with the specified coordinate, altitude, and course information.
init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance,
horizontalAccuracy: CLLocationAccuracy, verticalAccuracy: CLLocation
Accuracy, course: CLLocationDirection, courseAccuracy: CLLocation
DirectionAccuracy, speed: CLLocationSpeed, speedAccuracy: CLLocation
SpeedAccuracy, timestamp: Date)
Creates a location object with the specified coordinate, altitude, course, and accuracy
information.
init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance,
horizontalAccuracy: CLLocationAccuracy, verticalAccuracy: CLLocation
Accuracy, course: CLLocationDirection, courseAccuracy: CLLocation
DirectionAccuracy, speed: CLLocationSpeed, speedAccuracy: CLLocation
SpeedAccuracy, timestamp: Date, sourceInfo: CLLocationSourceInformation
var coordinate: CLLocationCoordinate2D
The geographical coordinate information.
var altitude: CLLocationDistance
The altitude above mean sea level associated with a location, measured in meters.
var ellipsoidalAltitude: CLLocationDistance
The altitude as a height above the World Geodetic System 1984 (WGS84) ellipsoid, measure
in meters.
Creating a location object
Getting the location attributes


## Page 14

typealias CLLocationDistance
A distance in meters from an existing location.
var floor: CLFloor?
The logical floor of the building in which the user is located.
var timestamp: Date
The time at which this location was determined.
var sourceInformation: CLLocationSourceInformation?
Information about the source that provides the location.
var horizontalAccuracy: CLLocationAccuracy
The radius of uncertainty for the location, measured in meters.
var verticalAccuracy: CLLocationAccuracy
The validity of the altitude values, and their estimated uncertainty, measured in meters.
typealias CLLocationAccuracy
The accuracy of a geographical coordinate.
func distance(from: CLLocation) -> CLLocationDistance
Returns the distance (measured in meters) from the current object’s location to the specified
location.
func getDistanceFrom(CLLocation) -> CLLocationDistance
Returns the distance (measured in meters) from the current object’s location to the specified
location.
Deprecated
var speed: CLLocationSpeed
The instantaneous speed of the device, measured in meters per second.
var speedAccuracy: CLLocationSpeedAccuracy
The accuracy of the speed value, measured in meters per second.
Getting the location accuracy
Measuring the distance between coordinates
Getting speed and course information


## Page 15

var course: CLLocationDirection
The direction in which the device is traveling, measured in degrees and relative to due north
var courseAccuracy: CLLocationDirectionAccuracy
The accuracy of the course value, measured in degrees.
typealias CLLocationSpeed
The velocity (measured in meters per second) at which the device is moving.
typealias CLLocationDirection
An azimuth that is measured in degrees relative to true north.
typealias CLLocationSpeedAccuracy
The accuracy of a speed.
typealias CLLocationDirectionAccuracy
The accuracy of a compass heading.
NSObject
CKRecordValue
CKRecordValueProtocol
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
Relationships
Inherits From
Conforms To


## Page 16

SendableMetatype
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession
See Also
Location updates


## Page 17

init()
Creates a location coordinate object.
init(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
Creates a location coordination object with the specified latitude and longitude values.
func CLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees) -
CLLocationCoordinate2D
Formats a latitude and longitude value into a coordinate data structure format.
var latitude: CLLocationDegrees
The latitude in degrees.
var longitude: CLLocationDegrees
The longitude in degrees.
Topics
Creating a location coordinate
Getting the geographic coordinates
Core Location / CLLocationCoordinate2D
Structure
CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84
reference frame.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 18

func CLLocationCoordinate2DIsValid(CLLocationCoordinate2D) -> Bool
Returns a Boolean value indicating whether the specified coordinate is valid.
let kCLLocationCoordinate2DInvalid: CLLocationCoordinate2D
An invalid coordinate value.
Animatable
BitwiseCopyable
Copyable
Sendable
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
class CLLocation
The latitude, longitude, and course information reported by the system.
class CLFloor
Validating a coordinate
Relationships
Conforms To
See Also
Location updates


## Page 19

The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession


## Page 20

A CLFloor object specifies the floor of the building on which the device is located. In places
where floor information can be determined, a CLLocation object may include a floor object alon
with the regular location data.
You do not create instances of this class directly, nor should you subclass it.
var level: Int
The logical floor of the building.
Overview
Topics
Getting the floor level
Relationships
Inherits From
Core Location / CLFloor
Class
CLFloor
The floor of a building on which the user’s device is located.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 21

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Conforms To
See Also
Location updates


## Page 22

Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession


## Page 23

A CLVisit object encapsulates information about places that the user has been. Visit objects ar
created by the system and delivered by the CLLocationManager object to its delegate after yo
start the delivery of events. The visit includes the location where the visit occurred and informatio
about the arrival and departure times as relevant. You do not create visit objects directly, nor
should you subclass CLVisit.
Visit objects contain as much information about the visit as possible but may not always include
both the arrival and departure times. For example, when the user arrives at a location, the system
may send an event with only an arrival time. When the user departs a location, the event can
contain both the arrival time (if your app was monitoring visits prior to the user’s arrival) and the
departure time.
var coordinate: CLLocationCoordinate2D
The geographical coordinate information.
var horizontalAccuracy: CLLocationAccuracy
Overview
Topics
Getting the location
Core Location / CLVisit
Class
CLVisit
Information about the user’s location during a specific period of time.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.15+


## Page 24

The horizontal accuracy (in meters) of the specified coordinate.
var arrivalDate: Date
The approximate time at which the user arrived at the specified location.
var departureDate: Date
The approximate time at which the user left the specified location.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Getting the visit duration
Relationships
Inherits From
Conforms To
See Also
Location updates


## Page 25

Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession


## Page 26

CLLocationSourceInformation contains information about the source that provides a
CLLocation instance, such as instances that locationManager(_:didUpdateLocations
delivers. For example, an app may choose to check the source information and reject locations if
the isSimulatedBySoftware property is true when the developer isn’t debugging or testing
the app.
init(softwareSimulationState: Bool, andExternalAccessoryState: Bool)
Creates an instance of location source information.
var isProducedByAccessory: Bool
A Boolean value that indicates whether the system receives the location from an external
accessory.
Overview
Topics
Creating a location source information object
Identifying the source of location data
Core Location / CLLocationSourceInformation
Class
CLLocationSourceInformation
Information about the source that provides a location.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 27

var isSimulatedBySoftware: Bool
A Boolean value that indicates whether the system generates the location using on-device
software simulation.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
Relationships
Inherits From
Conforms To
See Also
Location updates


## Page 28

class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession


## Page 29

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


## Page 30

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


## Page 31

Handling location updates in the background
Configuring your app to use location services
Suspending authorization requests
class Diagnostics
struct Diagnostic
init(authorization: CLServiceSession.AuthorizationRequirement)
init(authorization: CLServiceSession.AuthorizationRequirement, full
AccuracyPurposeKey: String)
Mentioned in
Topics
Classes
Structures
Initializers
Core Location / CLServiceSession
Class
CLServiceSession
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
tvOS 18.0+
visionOS 1.0+
watchOS 11.0+


## Page 32

var diagnostics: CLServiceSession.Diagnostics
func invalidate()
enum AuthorizationRequirement
Sendable, SendableMetatype
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
class CLLocation
The latitude, longitude, and course information reported by the system.
Instance Properties
Instance Methods
Enumerations
Relationships
Conforms To
See Also
Location updates


## Page 33

struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
class CLLocationSourceInformation
Information about the source that provides a location.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.


