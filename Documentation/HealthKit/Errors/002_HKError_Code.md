# 002_HKError_Code.pdf

## Page 1

Executing Statistics Collection Queries
case errorHealthDataUnavailable
HealthKit accessed on an unsupported device, such as an iPad.
case errorHealthDataRestricted
A Mobile Device Management (MDM) profile restricts the use of HealthKit on this device.
case errorInvalidArgument
The app passed an invalid argument to the HealthKit API.
case errorAuthorizationDenied
The user hasn’t given the app permission to save data.
case errorAuthorizationNotDetermined
The app hasn’t yet asked the user for the authorization required to complete the task.
Mentioned in
Topics
Errors
HealthKit / HKError / HKError.Code
Enumeration
HKError.Code
Error codes returned by HealthKit.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.0+
macOS 13.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

case errorRequiredAuthorizationDenied
The user hasn’t granted the application authorization to access all the required clinical recor
types.
case errorDatabaseInaccessible
The HealthKit data is unavailable because it’s protected and the device is locked.
case errorUserCanceled
The user canceled the operation.
case errorAnotherWorkoutSessionStarted
Another app started a workout session.
case errorUserExitedWorkoutSession
The user exited your application while a workout session was running.
case errorNoData
Data is unavailable for the requested query and predicate.
case errorBackgroundWorkoutSessionNotAllowed
case errorDataSizeExceeded
case errorNotPermissibleForGuestUserMode
The app attempted to write HealthKit data while in a Guest User session in visionOS.
case errorWorkoutActivityNotAllowed
case unknownError
init?(rawValue: Int)
static var noError: HKError.Code
Enumeration Cases
Initializers
Type Properties
Relationships


## Page 3

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct HKError
An error returned from a HealthKit method.
let HKErrorDomain: String
The domain for all HealthKit errors.
Conforms To
See Also
Errors


