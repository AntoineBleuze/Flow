# Errors.pdf

## Page 1

case invalidAccountType
The device isn’t signed into a valid iCloud account.
case authorizationConflict
Another authorized app already provides parental controls.
case authorizationCanceled
The parent or guardian canceled a request for authorization.
case invalidArgument
The method’s arguments are invalid.
case unavailable
The system failed to set up the Family Control framework.
case restricted
A restriction prevents your app from using Family Controls on this device.
case networkError
The device must be connected to the network in order to enroll with parental controls.
Topics
Error values
Family Controls / FamilyControlsError
Enumeration
FamilyControlsError
Errors the Family Controls framework reports.
iOS 15.0+
iPadOS 15.0+
macOS 13.0+


## Page 2

case authenticationMethodUnavailable
The device must have a passcode set in order for an individual to enroll with parental contro
var errorDescription: String?
A nonlocalized description of the error, suitable for debugging.
var errorDescription: String?
A nonlocalized description of the error, suitable for debugging.
Copyable
CustomNSError
Equatable
Error
Hashable
LocalizedError
RawRepresentable
Sendable
SendableMetatype
Error data
Relationships
Conforms To


