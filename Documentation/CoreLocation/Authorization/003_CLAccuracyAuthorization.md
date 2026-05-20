# 003_CLAccuracyAuthorization.pdf

## Page 1

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


## Page 2

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


