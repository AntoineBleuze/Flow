# Error response.pdf

## Page 1

case guidanceUnavailable
An error that indicates the framework fails to provide guidance for a location.
case inProgress
An error that indicates a request is already in progress.
case invalidLoadEvent
An error that indicates an invalid load event.
case permissionDenied
An error that indicates the client doesn’t have permission to access a requested API.
case serviceUnavailable
An error that indicates when a requested service fails to start.
case venueUnavailable
An error that indicates a referenced venue is invalid, nonexistent, or restricted by the person
case locationServicesDenied
Topics
Viewing error reasons
EnergyKit / EnergyKitError
Enumeration
EnergyKitError
A specialized error that provides localized messages describing the error and why
it occurred.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

An error that indicates that Location Services is off in the home’s settings.
case rateLimitExceeded
An error that indicates the app exceeds the rate limit for using the framework.
case unsupportedRegion
An error that indicates the device resides in an unsupported region.
var errorDescription: String?
A localized message describing what error occurred.
var failureReason: String?
A localized message providing text if the person requests help.
var helpAnchor: String?
A localized message providing text if the user requests help
var recoverySuggestion: String?
A localized message describing how to recover from the failure.
Copyable
Equatable
Error
Hashable
LocalizedError
Sendable
SendableMetatype
Reading error messages
Relationships
Conforms To


