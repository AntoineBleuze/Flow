# 002_CLAuthorizationStatus.pdf

## Page 1

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


## Page 2

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


## Page 3

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


