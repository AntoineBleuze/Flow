# 001_CLLocationPushServiceExtension.pdf

## Page 1

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


## Page 2

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


## Page 3

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


