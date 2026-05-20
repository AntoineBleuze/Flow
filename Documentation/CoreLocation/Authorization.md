# Authorization.pdf

## Page 1

Location data is sensitive information, and the use of location data has privacy implications for the
people who use your app. To ensure that people maintain control over their own information, the
system prevents apps from using location data until they obtain authorization to do so. This
authorization process involves a one-time interruption, during which the system prompts the
device owner to grant or deny your app’s request for location data. After the initial interruption, th
system stores your app’s authorization status and doesn’t prompt again.
To help people understand why you need location data, make authorization requests only when
someone engages a part of your app that requires that data. Making the request immediately
before it’s needed increases the likelihood of the person granting the request. If you make a
request immediately at app launch, or in a part of your app that doesn’t clearly use location data,
the person might misinterpret your intent and deny the request.
Before you place an authorization request, choose the level of access your app needs. Core
Location supports two authorization levels:
When in Use authorization makes location updates available only when someone uses your ap
This authorization is the preferred choice, because it has better privacy and battery life
implications.
Always authorization makes location updates available at any time, and lets the system launch
your app quietly to handle some updates. Request this access level only when necessary on
other platforms. For example, request it if your app delivers time-sensitive responses to locatio
Overview
Choose the access level you need
Core Location / Requesting authorization to use location services
Article
Requesting authorization to use location
services
Obtain authorization to use location services and manage changes to your app’s
authorization status.


## Page 2

changes automatically, or implements a location push service app extension. This access level
isn’t available when running in visionOS.
The definition of when an app is in use depends on the platform:
On iOS, an app is in use when it’s in the foreground and for a short time when it transitions from
the foreground to the background. If you enable background location updates, an app with Wh
in Use authorization continues to run in the background when location services are active; if
location services aren’t running, the normal suspension rules apply. If the system terminates th
app or the app isn’t running, the system doesn’t launch an app with When in Use authorization 
deliver new updates; it does launch an app with Always authorization for some types of locatio
updates.
On macOS, When in Use and Always authorizations are functionally equivalent. Because macO
apps continue to run in the background after their initial launch, they are always in use. If you
create your Mac app using Mac Catalyst, request authorization based on the needs of your iOS
app.
On watchOS, complications can receive location updates, but the watchOS app must run at lea
once so it can request authorization to access location data. If an app’s complication is on the
current watch face, the system treats that complication as if it’s in use and delivers location
updates to it. The system doesn’t launch watchOS apps, even if they have Always access.
On visionOS, an app is in use when someone is looking at it, and for a short time after the perso
stops looking at it.
Note
If your app already has When in Use authorization, you can make a separate request for Always
authorization later. However, you can make the request only once.
Regardless of which access level you choose, you can start any location services available on the
current device and achieve the same results. Access levels primarily determine how your app
receives updates when it isn’t running. The following table summarizes the differences between
access levels.
Capability
When in Use
Always
Supported platforms
All
All platforms except tvOS and visionOS
Supported location
services
All
All
Launches a terminated
app automatically
No. The user must
launch the app.
Yes for significant location change, visits, and
region monitoring services; no for others


## Page 3

For information about how to handle location updates in the background, see Handling location
updates in the background.
The first time you make an authorization request, the system displays an alert asking the person t
grant or deny the request. The alert includes a usage description string that explains why you wan
access to location data. You provide this string in your app’s Information Property List and use it t
inform people about how your app uses location data.
Core Location supports different usage strings for each access level. You must include a usage
description string for When in Use access. If your app supports Always access, provide an
additional string explaining why you want the elevated privileges. The following table lists the keys
to include in your app’s Information Property List and when to include them.
Usage key
Required when:
NSLocationWhenInUseUsageDescription
The app requests When in Use or Always
authorization.
NSLocationAlwaysAndWhenInUseUsage
Description
The app requests Always authorization.
NSLocationUsageDescription
(macOS only) Your macOS app uses locatio
services.
Add all usage description keys to your app’s Information Property List before you make any
authorization requests. Authorization requests fail immediately if the required keys aren’t present
Before you start any location services, check your app’s current authorization status and place an
authorization request if needed. You can get your app’s current authorization from the
authorizationStatus property of your location-manager object. However, a newly configure
CLLocationManager object also reports your app’s current authorization status to its delegate
locationManagerDidChangeAuthorization(_:) method automatically. You might use tha
method to place an authorization request when the current status is CLAuthorizationStatus
.notDetermined. In the following example, the delegate method enables or disables location
features when the status is known and requests authorization when the status is undetermined.
Provide descriptions of how you use location services
Make authorization requests and respond to status
changes


## Page 4

The locationManagerDidChangeAuthorization(_:) method offers a central place to
process any authorization-related changes. People can change your app’s authorization status at
any time in system settings. If your app is running when the change happens, each of your app’s
CLLocationManager objects reports the change to that delegate method. The location manage
also reports your app’s current authorization at other times. For example, the location manager al
calls the method when a suspended iOS app starts running again.
Suspending authorization requests
Defer the system’s authorization request dialog until your app is ready.
enum CLAuthorizationStatus
Constants that indicate the app’s authorization to use location services.
enum CLAccuracyAuthorization
Constants that indicate the level of location accuracy the app has authorization to use.
NSLocationAlwaysAndWhenInUseUsageDescription
See Also
Authorization


## Page 5

A message that tells people why the app is requesting access to their location information at
all times.
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.


## Page 6

If your app has an onboarding flow that includes obtaining location updates, you may want to defe
the Core Location’s request for authorization from the user. You can inhibit the auto-prompting in
your app by creating a CLServiceSession at a convenient time in your app, then iterating over
its diagnostics property to determine the level of authorization the person using your app selects.
The following code snippet demonstrates how to defer the prompting.
Add the CLRequireExplicitServiceSession property to your app’s Info.plist file to opt into
this control behavior.
Overview
Core Location / Suspending authorization requests
Article
Suspending authorization requests
Defer the system’s authorization request dialog until your app is ready.


## Page 7

Requesting authorization to use location services
Obtain authorization to use location services and manage changes to your app’s authorizatio
status.
enum CLAuthorizationStatus
Constants that indicate the app’s authorization to use location services.
enum CLAccuracyAuthorization
Constants that indicate the level of location accuracy the app has authorization to use.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
See Also
Authorization


## Page 8

Handle changes to authorization status in your location manager’s delegate method, location
Manager(_:didChangeAuthorization:).
case notDetermined
The user has not chosen whether the app can use location services.
case restricted
The app is not authorized to use location services.
case denied
The user denied the use of location services for the app or they are disabled globally in
Settings.
static var authorized: CLAuthorizationStatus
The user authorized the app to use location services.
Deprecated
Overview
Topics
Getting the authorization status
Core Location / CLAuthorizationStatus
Enumeration
CLAuthorizationStatus
Constants that indicate the app’s authorization to use location services.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 9

case authorizedAlways
The user authorized the app to start location services at any time.
case authorizedWhenInUse
The user authorized the app to start location services while it is in use.
init?(rawValue: Int32)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Requesting authorization to use location services
Obtain authorization to use location services and manage changes to your app’s authorizatio
status.
Suspending authorization requests
Defer the system’s authorization request dialog until your app is ready.
enum CLAccuracyAuthorization
Constants that indicate the level of location accuracy the app has authorization to use.
NSLocationAlwaysAndWhenInUseUsageDescription
Initializers
Relationships
Conforms To
See Also
Authorization


## Page 10

A message that tells people why the app is requesting access to their location information at
all times.
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.


## Page 11

case fullAccuracy
The user authorized the app to access location data with full accuracy.
case reducedAccuracy
The user authorized the app to access location data with reduced accuracy.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Topics
Getting the location accuracy
Initializers
Relationships
Conforms To
Core Location / CLAccuracyAuthorization
Enumeration
CLAccuracyAuthorization
Constants that indicate the level of location accuracy the app has authorization to
use.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 12

Hashable
RawRepresentable
Sendable
SendableMetatype
Requesting authorization to use location services
Obtain authorization to use location services and manage changes to your app’s authorizatio
status.
Suspending authorization requests
Defer the system’s authorization request dialog until your app is ready.
enum CLAuthorizationStatus
Constants that indicate the app’s authorization to use location services.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
See Also
Authorization


## Page 13

Name
Privacy - Location Always and When In Use Usage Description
Type
String
Use this key if your iOS app accesses location information while running in the background. If you
app only needs location information when in the foreground, use NSLocationWhenInUseUsage
Description instead. For more information, see Choosing the Location Services Authorization t
Request.
If you need location information in a macOS app, use NSLocationUsageDescription instead
your iOS app deploys to versions earlier than iOS 11, see NSLocationAlwaysUsage
Description.
Important
This key is required if your iOS app uses APIs that access the user’s location information at all
times.
Details
Discussion
Bundle Resources / Information Property List / NSLocationAlwaysAndWhenInUseUsageDescription
Property List Key
NSLocationAlwaysAndWhenInUseUsage
Description
A message that tells people why the app is requesting access to their location
information at all times.
iOS 11.0+
iPadOS 11.0+
visionOS 1.0+


## Page 14

Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
Name: Privacy - Location Usage Description
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
Name: Privacy - Location When In Use Usage Description
NSLocationTemporaryUsageDescriptionDictionary
A collection of messages that explain why the app is requesting temporary access to their
location.
Name: Privacy - Location Temporary Usage Description Dictionary
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
Name: Privacy - Location Always Usage Description
Deprecated
NSWidgetWantsLocation
A Boolean value that indicates a widget uses the user’s location information.
Name: Widget wants location
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
Name: Privacy - Location Default Accuracy Reduced
See Also
Location


## Page 15

Name
Privacy - Location When In Use Usage Description
Type
String
Use this key if your iOS app accesses location information only when running in the foreground. If
your app needs location information when in the background, use NSLocationAlwaysAndWhen
InUseUsageDescription instead. For more information, see Choosing the Location Services
Authorization to Request.
If you need location information in a macOS app, use NSLocationUsageDescription instead
Important
This key is required if your iOS app uses APIs that access the user’s location information while
the app is in use.
Details
Discussion
See Also
Bundle Resources / Information Property List / NSLocationWhenInUseUsageDescription
Property List Key
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location
information while the app is running in the foreground.
iOS 11.0+
iPadOS 11.0+
visionOS 1.0+


## Page 16

Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
Name: Privacy - Location Always and When In Use Usage Description
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
Name: Privacy - Location Usage Description
NSLocationTemporaryUsageDescriptionDictionary
A collection of messages that explain why the app is requesting temporary access to their
location.
Name: Privacy - Location Temporary Usage Description Dictionary
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
Name: Privacy - Location Always Usage Description
Deprecated
NSWidgetWantsLocation
A Boolean value that indicates a widget uses the user’s location information.
Name: Widget wants location
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
Name: Privacy - Location Default Accuracy Reduced
Location


## Page 17

Name
Privacy - Location Usage Description
Type
String
Use this key in a macOS app that accesses the user’s location information. In an iOS app, use
NSLocationWhenInUseUsageDescription or NSLocationAlwaysAndWhenInUseUsage
Description instead.
Important
This key is required if your macOS app uses APIs that access the user’s location information.
Details
Discussion
See Also
Location
Bundle Resources / Information Property List / NSLocationUsageDescription
Property List Key
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location
information.
iOS 6.0–8.0 Deprecated
iPadOS 6.0–8.0 Deprecated
macOS 10.14+


## Page 18

Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
Name: Privacy - Location Always and When In Use Usage Description
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
Name: Privacy - Location When In Use Usage Description
NSLocationTemporaryUsageDescriptionDictionary
A collection of messages that explain why the app is requesting temporary access to their
location.
Name: Privacy - Location Temporary Usage Description Dictionary
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
Name: Privacy - Location Always Usage Description
Deprecated
NSWidgetWantsLocation
A Boolean value that indicates a widget uses the user’s location information.
Name: Widget wants location
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
Name: Privacy - Location Default Accuracy Reduced


## Page 19

Name
Privacy - Location Default Accuracy Reduced
Type
Boolean
Default: NO
Include this key in your information property list to set your app’s default behavior for location
accuracy when it calls the Core Location framework. Set the key value to true to prompt the use
for reduced accuracy by default; set it to false to prompt for full location accuracy. If you don’t
include that key in your Info.plist, that’s equivalent to setting it to false.
Include the key pair in your Info.plist file as shown:
Details
Attributes
Discussion
Bundle Resources / Information Property List / NSLocationDefaultAccuracyReduced
Property List Key
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location
accuracy by default.
iOS 14.0+
iPadOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 20

When this key is set to true, all Core Location services (location updates, visit monitoring,
significant location change, fence monitoring) receive service at the reduced-accuracy service
level. Users will see that your app is asking for reduced accuracy because the location
authorization prompt will show a map with an approximate location, and your app will have the
Precise Location toggled off in Settings > Privacy > Location Services . These indicators of an app
improved privacy are ones that users may value.
If you want to leverage the reduced-accuracy feature to improve privacy in a particular operation
without setting this key, use the desiredAccuracy constant kCLLocationAccuracyReduce
This constant causes startUpdatingLocation() to deliver results as if the app were
authorized for approximate location until you change the desiredAccuracy constant again.
Setting NSLocationDefaultAccuracyReduced determines the default type of authorization
your app gets, but users can override it any time in Settings. Users always control the level of
location accuracy they want to share, and can change precision settings in Settings > Privacy >
Location Services by selecting Precise Location for your app.
Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
Name: Privacy - Location Always and When In Use Usage Description
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
Name: Privacy - Location Usage Description
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
Name: Privacy - Location When In Use Usage Description
NSLocationTemporaryUsageDescriptionDictionary
A collection of messages that explain why the app is requesting temporary access to their
location.
Name: Privacy - Location Temporary Usage Description Dictionary
See Also
Location


## Page 21

NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
Name: Privacy - Location Always Usage Description
Deprecated
NSWidgetWantsLocation
A Boolean value that indicates a widget uses the user’s location information.
Name: Widget wants location


## Page 22

Deprecated
For apps deployed to targets in iOS 11 and later, use NSLocationAlwaysAndWhenInUse
UsageDescription instead.
Name
Privacy - Location Always Usage Description
Type
String
Use this key if your iOS app accesses location information in the background, and you deploy to a
target earlier than iOS 11. In that case, add both this key and NSLocationAlwaysAndWhenInUs
UsageDescription to your app’s Info.plist file with the same message. Apps running on
older versions of the OS use the message associated with NSLocationAlwaysUsage
Description, while apps running on later versions use the one associated with NSLocation
AlwaysAndWhenInUseUsageDescription.
If your app only needs location information when in the foreground, use NSLocationWhenInUse
UsageDescription instead. For more information, see Choosing the Location Services
Details
Discussion
Bundle Resources
/ NSLocationAlwaysUsageDescription Deprecated
Property List Key
NSLocationAlwaysUsage
Description Deprecated
A message that tells people why the app is requesting access to their location at
all times.
iOS 8.0–10.0 Deprecated
iPadOS 8.0–10.0 Deprecated
/


## Page 23

Authorization to Request.
If you need location information in a macOS app, use NSLocationUsageDescription instead
Important
This key is required if your iOS app uses APIs that access the user’s location at all times and
deploys to targets earlier than iOS 11.
Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
Name: Privacy - Location Always and When In Use Usage Description
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
Name: Privacy - Location Usage Description
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
Name: Privacy - Location When In Use Usage Description
NSLocationTemporaryUsageDescriptionDictionary
A collection of messages that explain why the app is requesting temporary access to their
location.
Name: Privacy - Location Temporary Usage Description Dictionary
NSWidgetWantsLocation
A Boolean value that indicates a widget uses the user’s location information.
Name: Widget wants location
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
See Also
Location


## Page 24

Name: Privacy - Location Default Accuracy Reduced


