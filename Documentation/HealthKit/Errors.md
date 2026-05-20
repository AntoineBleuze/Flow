# Errors.pdf

## Page 1

enum Code
Error codes returned by HealthKit.
static var noError: HKError.Code
No error occurred.
static var errorHealthDataUnavailable: HKError.Code
The user accessed HealthKit on an unsupported device.
static var errorHealthDataRestricted: HKError.Code
A Mobile Device Management (MDM) profile restricts the use of HealthKit on this device.
static var errorInvalidArgument: HKError.Code
The app passed an invalid argument to the HealthKit API.
static var errorAuthorizationDenied: HKError.Code
The user hasn’t given the app permission to save data.
static var errorAuthorizationNotDetermined: HKError.Code
The app hasn’t yet asked the user for the authorization required to complete the task.
Topics
Accessing errors
HealthKit / HKError
Structure
HKError
An error returned from a HealthKit method.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.0+
macOS 13.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

static var errorRequiredAuthorizationDenied: HKError.Code
The user hasn’t granted the application authorization to access all the required clinical recor
types.
static var errorDatabaseInaccessible: HKError.Code
The HealthKit data is unavailable because it’s protected and the device is locked.
static var errorUserCanceled: HKError.Code
The user canceled the operation.
static var errorAnotherWorkoutSessionStarted: HKError.Code
Another app started a workout session.
static var errorUserExitedWorkoutSession: HKError.Code
The user exited your application while a workout session was running.
static var errorNoData: HKError.Code
Data is unavailable for the requested query and predicate.
static var errorBackgroundWorkoutSessionNotAllowed: HKError.Code
static var errorDataSizeExceeded: HKError.Code
static var errorDomain: String
static var errorNotPermissibleForGuestUserMode: HKError.Code
The app attempted to write HealthKit data while in a Guest User session in visionOS.
static var errorWorkoutActivityNotAllowed: HKError.Code
static var unknownError: HKError.Code
CustomNSError
Equatable
Error
Hashable
Type Properties
Relationships
Conforms To


## Page 3

Sendable
SendableMetatype
let HKErrorDomain: String
The domain for all HealthKit errors.
enum Code
Error codes returned by HealthKit.
See Also
Errors


## Page 4

struct HKError
An error returned from a HealthKit method.
enum Code
Error codes returned by HealthKit.
See Also
Errors
HealthKit / HKErrorDomain
Global Variable
HKErrorDomain
The domain for all HealthKit errors.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.0+
macOS 13.0+
visionOS 1.0+
watchOS 2.0+


## Page 5

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


## Page 6

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


## Page 7

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


