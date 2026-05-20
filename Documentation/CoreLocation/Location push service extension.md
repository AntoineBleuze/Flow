# Location push service extension.pdf

## Page 1

Key
com.apple.developer.location.push
Type
Boolean
Default: true
This entitlement enables your app to monitor for Apple Push Notification service (APNs) pushes
with the location push type, and receive pushes in your Location Push Service Extension. For
more information about the location push type, see Sending notification requests to APNs.
Note
Without this entitlement, your code receives an error when it calls startMonitoring
LocationPushes(completion:).
Add the entitlement to your app by following these steps:
1. Open your app’s Xcode project and select your app from the target list.
Details
Attributes
Discussion
Bundle Resources / Entitlements / Location Push Service Extension
Property List Key
Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in
response to a push notification.
iOS 7.0+
iPadOS 7.0+
macOS 10.9+


## Page 2

2. Select the Signing & Capabilities panel.
3. Click “+ Capabilities” and enter “push” in the search field; then double-click Location Push
Service Extension to add the entitlement to your app’s entitlements file.
For more information about implementing your Location Push Service Extension, see Creating a
location push service extension.


## Page 3

Creating a location push service extension
A type that adopts the CLLocationPushServiceExtension protocol acts as the entry point t
a Location Push Service Extension. You use this type to respond to incoming location push
notifications and perform app-specific tasks. For example, you use it to get someone’s current
location and send it to your server.
Don’t adopt this protocol in your own custom types. Instead, add a Location Push Service
Extension target to your project and modify the type that Xcode provides. To start the delivery of
location push notifications, call the startMonitoringLocationPushes(completion:)
method to request a unique token from the device. Send that token to your server and use it to
generate HTTP requests for APNs to deliver to the device.
When the device receives a location push notification that your server generated, the system load
your app extension and calls its didReceiveLocationPushPayload(_:completion:)
method. Use that method to configure a CLLocationManager object and request the person’s
current location. Collect the location, encrypt it, and send it back to your server using a custom
connection.
Mentioned in
Overview
Core Location / CLLocationPushServiceExtension
Protocol
CLLocationPushServiceExtension
The interface you adopt in the type that acts as the main entry point for a Location
Push Service Extension.
iOS 15.0+
iPadOS 15.0+


## Page 4

Important
In order for your app extension to receive push notifications, the app that contains the app
extension must have Always authorization for location services. For information about how to
request this access, see Requesting authorization to use location services.
Location Push Service Extensions aren’t supported in visionOS. If a compatible iPad or iPhone app
contains an app extension of this type, the system doesn’t load it.
For more information about adding the extension to your app, see Creating a location push servic
extension. For information about how to generate push notifications from your server, see Setting
up a remote notification server.
func didReceiveLocationPushPayload([String : Any], completion: () ->
Void)
Delivers a location push notification for your app extension to process.
Required
func serviceExtensionWillTerminate()
Notifies your app extension that the system is about to terminate the extension because it’s
taking too long to complete its task.
NSObjectProtocol
Topics
Getting the push notification payload
Handling the extension termination
Relationships
Inherits From
See Also


## Page 5

Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in response to 
push notification.
struct CLLocationPushServiceError
Error codes the location manager returns if starting to monitor for location push notifications
fails.
let CLLocationPushServiceErrorDomain: String
The domain for Location Push Service Extension errors.
enum Code
Error codes the location manager returns if starting to monitor for location push notifications
fails.
Location push service extension


## Page 6

static var unknown: CLLocationPushServiceError.Code
An error code that indicates the app was unable to start the location push service for an
unknown reason.
static var missingPushExtension: CLLocationPushServiceError.Code
An error code that indicates the app is missing a Location Push Service Extension.
static var missingPushServerEnvironment: CLLocationPushServiceError.Cod
An error code that indicates the app is missing an Apple Push Notification service (APNs)
environment entitlement.
static var missingEntitlement: CLLocationPushServiceError.Code
An error code that indicates the app is missing the entitlement it needs to use the location
push service.
static var unsupportedPlatform: CLLocationPushServiceError.Code
An error code that indicates the location push service isn’t available on this platform.
enum Code
Topics
Getting the error code
Core Location / CLLocationPushServiceError
Structure
CLLocationPushServiceError
Error codes the location manager returns if starting to monitor for location push
notifications fails.
iOS 15.0+
iPadOS 15.0+


## Page 7

Error codes the location manager returns if starting to monitor for location push notifications
fails.
static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in response to 
push notification.
protocol CLLocationPushServiceExtension
The interface you adopt in the type that acts as the main entry point for a Location Push
Service Extension.
let CLLocationPushServiceErrorDomain: String
The domain for Location Push Service Extension errors.
enum Code
Error codes the location manager returns if starting to monitor for location push notifications
fails.
Type Properties
Relationships
Conforms To
See Also
Location push service extension


## Page 8



## Page 9

Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in response to 
push notification.
protocol CLLocationPushServiceExtension
The interface you adopt in the type that acts as the main entry point for a Location Push
Service Extension.
struct CLLocationPushServiceError
Error codes the location manager returns if starting to monitor for location push notifications
fails.
enum Code
Error codes the location manager returns if starting to monitor for location push notifications
fails.
See Also
Location push service extension
Core Location / CLLocationPushServiceErrorDomain
Global Variable
CLLocationPushServiceErrorDomain
The domain for Location Push Service Extension errors.
iOS 15.0+
iPadOS 15.0+


## Page 10

These error codes are returned from startMonitoringLocationPushes(completion:)
case unknown
An error code that indicates the app was unable to start the location push service for an
unknown reason.
case missingPushExtension
An error code that indicates the app is missing a Location Push Service Extension.
case missingPushServerEnvironment
An error code that indicates the app is missing an Apple Push Notification service (APNs)
environment entitlement.
case missingEntitlement
Overview
Topics
Getting the error code
Core Location / CLLocationPushServiceError / CLLocationPushServiceError.Code
Enumeration
CLLocationPushServiceError.Code
Error codes the location manager returns if starting to monitor for location push
notifications fails.
iOS 15.0+
iPadOS 15.0+


## Page 11

An error code that indicates the app is missing the entitlement it needs to use the location
push service.
case unsupportedPlatform
An error code that indicates the location push service isn’t available on this platform.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in response to 
push notification.
protocol CLLocationPushServiceExtension
The interface you adopt in the type that acts as the main entry point for a Location Push
Service Extension.
struct CLLocationPushServiceError
Error codes the location manager returns if starting to monitor for location push notifications
fails.
Initializers
Relationships
Conforms To
See Also
Location push service extension


## Page 12

let CLLocationPushServiceErrorDomain: String
The domain for Location Push Service Extension errors.


