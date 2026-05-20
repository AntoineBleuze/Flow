# 002_CLLocationPushServiceError.pdf

## Page 1

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


## Page 2

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


## Page 3



