# 004_CLLocationPushServiceError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3

let CLLocationPushServiceErrorDomain: String
The domain for Location Push Service Extension errors.


