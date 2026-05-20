# Errors.pdf

## Page 1

let HMErrorDomain: String
A string that identifies the HomeKit error domain.
static var accessoryIsBlocked: HMError.Code
An error indicating a blocked accessory.
static var accessoryIsBusy: HMError.Code
An error indicating the accessory is busy.
static var accessoryIsSuspended: HMError.Code
The accessory is suspended.
static var accessoryNotReachable: HMError.Code
An error indicating the accessory is not reachable over the network.
static var accessoryOutOfCompliance: HMError.Code
An error indicating the accessory is out of compliance.
Topics
Obtaining error information
Detecting accessory errors
HomeKit / HMError
Structure
HMError
An error HomeKit returns.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

static var accessoryOutOfResources: HMError.Code
An error indicating the accessory is out of resources.
static var accessoryPoweredOff: HMError.Code
An error indicating the accessory is off.
static var accessoryResponseError: HMError.Code
An error with the accessory’s response.
static var addAccessoryFailed: HMError.Code
A failed attempt to add an accessory.
static var incompatibleAccessory: HMError.Code
The accessory is incompatible.
static var actionInAnotherActionSet: HMError.Code
An attempt to add an action that exists in one action set to another action set.
static var actionSetExecutionFailed: HMError.Code
An attempt to execute the action set failed.
static var actionSetExecutionInProgress: HMError.Code
An error indicating the execution of the action set is in progress.
static var actionSetExecutionPartialSuccess: HMError.Code
An attempt to execute the action set was only partially successful.
static var cannotRemoveBuiltinActionSet: HMError.Code
An error indicating the built-in action set cannot be removed.
static var noActionsInActionSet: HMError.Code
An attempt to execute an action set with no actions.
static var noRegisteredActionSets: HMError.Code
An attempt to activate a trigger with no action sets.
static var invalidAssociatedServiceType: HMError.Code
An error indicating an invalid service type.
Detecting action set errors
Detecting association errors


## Page 3

static var objectAlreadyAssociatedToHome: HMError.Code
An attempt to associate an object with a home when it’s already associated with that home.
static var objectAssociatedToAnotherHome: HMError.Code
An attempt to associate an object with a home when it’s already associated with another
home.
static var objectNotAssociatedToAnyHome: HMError.Code
An attempt to perform an operation on an object that is not associated to any home.
static var invalidOrMissingAuthorizationData: HMError.Code
An error indicating the authorization data is invalid or missing.
static var locationForHomeDisabled: HMError.Code
An error indicating the home’s location is disabled.
static var homeAccessNotAuthorized: HMError.Code
An error indicating access to the home is not authorized.
static var insufficientPrivileges: HMError.Code
An error indicating insufficient privileges for the operation.
static var messageAuthenticationFailed: HMError.Code
A message authentication failure.
static var notAuthorizedForLocationServices: HMError.Code
An error indicating location services are not authorized.
static var notAuthorizedForMicrophoneAccess: HMError.Code
An error indicating microphone access is not authorized.
static var notSignedIntoiCloud: HMError.Code
An error indicating the user is not signed into iCloud.
static var ownershipFailure: HMError.Code
The ownership code did not match.
static var securityFailure: HMError.Code
A security failure.
Detecting authorization errors


## Page 4

static var bridgedAccessoryNotReachable: HMError.Code
An error indicating the bridged accessory cannot be reached.
static var cannotRemoveNonBridgeAccessory: HMError.Code
An attempt to remove a bridged accessory.
static var cannotUnblockNonBridgeAccessory: HMError.Code
An error indicating a non-bridge accessory cannot be unblocked.
static var readOnlyCharacteristic: HMError.Code
An attempt to modify a read-only value.
static var writeOnlyCharacteristic: HMError.Code
An attempt to read from a write-only characteristic.
static var homeWithSimilarNameExists: HMError.Code
An attempt to assign a home the same name as an existing home.
static var objectWithSimilarNameExists: HMError.Code
An object with a similar name already exists.
static var objectWithSimilarNameExistsInHome: HMError.Code
An attempt to give the name of one object to another object in the home.
static var renameWithSimilarName: HMError.Code
An attempt to rename an object with its current name.
static var accessDenied: HMError.Code
An error indicating the current user doesn’t have privileges to perform the operation.
static var accessoryCommunicationFailure: HMError.Code
The accessory failed to communicate.
Detecting bridge errors
Detecting characteristic errors
Detecting collision errors
Detecting communication errors


## Page 5

static var accessoryPairingFailed: HMError.Code
An attempt to pair with the accessory has failed.
static var accessorySentInvalidResponse: HMError.Code
An error indicating the accessory sent an invalid response.
static var clientRequestError: HMError.Code
An error with the client request.
static var communicationFailure: HMError.Code
A communication failure.
static var dataResetFailure: HMError.Code
An attempt to reset the data failed.
static var timedOutWaitingForAccessory: HMError.Code
An accessory did not respond timely.
static var partialCommunicationFailure: HMError.Code
static var deviceLocked: HMError.Code
An error indicating the device is locked.
static var accessoryDiscoveryFailed: HMError.Code
An error indicating that accessory discovery failed.
static var alreadyExists: HMError.Code
An error indicating the container already contains the object you are trying to add.
static var genericError: HMError.Code
An error that does not have a more specific error code.
static var incompatibleHomeHub: HMError.Code
No compatible home hub found.
Deprecated
static var invalidClass: HMError.Code
An attempt to use an abstract base class in an operation instead of a concrete subclass.
Detecting device and discovery errors
Detecting general errors


## Page 6

static var notFound: HMError.Code
An error indicating the object was not found in the container.
static var notificationAlreadyEnabled: HMError.Code
An error indicating the notification is already enabled.
static var notificationNotSupported: HMError.Code
An attempt to register for notifications from an accessory that does not support notifications
static var operationNotSupported: HMError.Code
An attempt to use an unsupported operation.
static var unexpectedError: HMError.Code
An unexpected error.
static var missingEntitlement: HMError.Code
An error indicating a required entitlement is not available.
static var referToUserManual: HMError.Code
An error described in the device’s user manual.
static var maximumAccessoriesOfTypeInHome: HMError.Code
The home already has the maximum number of accessories of the given type.
static var roomForHomeCannotBeInZone: HMError.Code
An attempt to add the room that represents the entire home to a zone.
static var roomForHomeCannotBeUpdated: HMError.Code
An attempt to change the room that represents the entire home.
static var noHomeHub: HMError.Code
An error indicating no home hub found.
static var noCompatibleHomeHub: HMError.Code
An error indicating no compatible home hub found.
static var incompatibleHomeHub: HMError.Code
An error indicating an incompatible home hub.
Detecting home and room errors
Detecting hub errors


## Page 7

Deprecated
static var cannotActivateTriggerTooFarInFuture: HMError.Code
An error indicating the trigger cannot be activated because it is set too far in the future.
static var dateMustBeOnSpecifiedBoundaries: HMError.Code
An error indicating the date is not on the specified boundaries.
static var fireDateInPast: HMError.Code
An attempt to activate a timer trigger with a date in the past.
static var invalidMessageSize: HMError.Code
An error indicating an invalid message size.
static var maximumObjectLimitReached: HMError.Code
An error indicating the maximum object count has been reached.
static var recurrenceTooLarge: HMError.Code
An attempt to use a recurrence period that is too large.
static var recurrenceTooSmall: HMError.Code
An error indicating the recurrence interval is too short.
static var recurrenceMustBeOnSpecifiedBoundaries: HMError.Code
An error indicating the recurrence rule is not on the specified boundaries.
static var enterpriseNetworkNotSupported: HMError.Code
An enterprise network doesn’t support this accessory.
static var failedToJoinNetwork: HMError.Code
The accessory failed to join the network.
static var incompatibleNetwork: HMError.Code
An error indicating an incompatible network.
static var networkUnavailable: HMError.Code
An error indicating the network is unavailable.
Detecting limit errors
Detecting network errors


## Page 8

static var wiFiCredentialGenerationFailed: HMError.Code
WiFi credential generation failed.
static var operationCancelled: HMError.Code
An error indicating the user canceled the operation.
static var operationInProgress: HMError.Code
An error indicating the operation is already in progress.
static var operationTimedOut: HMError.Code
An error indicating the operation timed out.
static var invalidParameter: HMError.Code
An error indicating the object is invalid for the given operation.
static var missingParameter: HMError.Code
An error indicating a missing parameter.
static var nilParameter: HMError.Code
An error indicating that nil was passed for an operation that does not accept nil.
static var unconfiguredParameter: HMError.Code
An error indicating an unconfigured parameter.
static var readWriteFailure: HMError.Code
An error indicating a failed read/write operation.
static var readWritePartialSuccess: HMError.Code
An error indicating a partially successful read/write operation.
static var cloudDataSyncInProgress: HMError.Code
An error indicating a data synchronization operation is in progress.
Detecting operation errors
Detecting parameter errors
Detecting read and write errors
Detecting synchronization errors


## Page 9

static var keychainSyncNotEnabled: HMError.Code
An error indicating Keychain syncing is not enabled for the user.
static var userDeclinedAddingUser: HMError.Code
An error indicating the user canceled the add user operation.
static var userDeclinedRemovingUser: HMError.Code
An error indicating the user canceled the remove user operation.
static var userDeclinedInvite: HMError.Code
An error indicating the user declined the invitation.
static var userIDNotEmailAddress: HMError.Code
An error indicating the user’s ID is not a valid email address.
static var userManagementFailed: HMError.Code
A user management error not covered by the other errors.
static var invalidDataFormatSpecified: HMError.Code
An error indicating an invalid data format was specified.
static var invalidValueType: HMError.Code
An attempt to use an invalid value type.
static var nameContainsProhibitedCharacters: HMError.Code
An attempt to name an object with prohibited characters.
static var nameDoesNotEndWithValidCharacters: HMError.Code
An error indicating the provided name has invalid characters at the end.
static var nameDoesNotStartWithValidCharacters: HMError.Code
An attempt to start the name of an object with invalid characters.
static var stringLongerThanMaximum: HMError.Code
An attempt to use a string longer than the maximum allowed.
static var stringShorterThanMinimum: HMError.Code
An attempt to use a string shorter than the required minimum.
Detecting user errors
Detecting value errors


## Page 10

static var valueHigherThanMaximum: HMError.Code
An attempt to use a numeric value higher than the specified maximum value.
static var valueLowerThanMinimum: HMError.Code
An attempt to use a numeric value lower than the specified minimum value.
enum Code
Possible error values that can be returned from HomeKit APIs.
static var errorDomain: String
static var homeUpgradeRequired: HMError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
let HMErrorDomain: String
A string that identifies the HomeKit error domain.
enum Code
Enumerating errors
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 11

Possible error values that can be returned from HomeKit APIs.
typealias HMErrorBlock
A completion block that provides an error.


## Page 12

struct HMError
An error HomeKit returns.
enum Code
Possible error values that can be returned from HomeKit APIs.
typealias HMErrorBlock
A completion block that provides an error.
See Also
Errors
HomeKit / HMErrorDomain
Global Variable
HMErrorDomain
A string that identifies the HomeKit error domain.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 13

case accessoryIsBlocked
An error indicating a blocked accessory.
case accessoryIsBusy
An error indicating the accessory is busy.
case accessoryIsSuspended
The accessory is suspended.
case accessoryNotReachable
An error indicating the accessory is not reachable over the network.
case accessoryOutOfCompliance
An error indicating the accessory is out of compliance.
case accessoryOutOfResources
An error indicating the accessory is out of resources.
case accessoryPoweredOff
An error indicating the accessory is off.
Topics
Accessory errors
HomeKit / HMError / HMError.Code
Enumeration
HMError.Code
Possible error values that can be returned from HomeKit APIs.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 14

case accessoryResponseError
An error with the accessory’s response.
case addAccessoryFailed
A failed attempt to add an accessory.
case incompatibleAccessory
The accessory is incompatible.
case actionInAnotherActionSet
An attempt to add an action that exists in one action set to another action set.
case actionSetExecutionFailed
An attempt to execute the action set failed.
case actionSetExecutionInProgress
An error indicating the execution of the action set is in progress.
case actionSetExecutionPartialSuccess
An attempt to execute the action set was only partially successful.
case cannotRemoveBuiltinActionSet
An error indicating the built-in action set cannot be removed.
case noActionsInActionSet
An attempt to execute an action set with no actions.
case noRegisteredActionSets
An attempt to activate a trigger with no action sets.
case invalidAssociatedServiceType
An error indicating an invalid service type.
case objectAlreadyAssociatedToHome
An attempt to associate an object with a home when it’s already associated with that home.
case objectAssociatedToAnotherHome
Action set errors
Association errors


## Page 15

An attempt to associate an object with a home when it’s already associated with another
home.
case objectNotAssociatedToAnyHome
An attempt to perform an operation on an object that is not associated to any home.
case invalidOrMissingAuthorizationData
An error indicating the authorization data is invalid or missing.
case locationForHomeDisabled
An error indicating the home’s location is disabled.
case homeAccessNotAuthorized
An error indicating access to the home was not authorized.
case insufficientPrivileges
An error indicating insufficient privileges for the operation.
case messageAuthenticationFailed
A message authentication failure.
case notAuthorizedForLocationServices
An error indicating location services are not authorized.
case notAuthorizedForMicrophoneAccess
An error indicating microphone access is not authorized.
case notSignedIntoiCloud
An error indicating the user is not signed into iCloud.
case ownershipFailure
The ownership code did not match.
case securityFailure
A security failure.
case bridgedAccessoryNotReachable
An error indicating the bridged accessory cannot be reached.
Authorization errors
Bridge errors


## Page 16

case cannotRemoveNonBridgeAccessory
An attempt to remove a bridged accessory.
case cannotUnblockNonBridgeAccessory
An error indicating a non-bridge accessory cannot be unblocked.
case readOnlyCharacteristic
An attempt to modify a read-only value.
case writeOnlyCharacteristic
An attempt to read from a write-only characteristic.
case homeWithSimilarNameExists
An attempt to assign a home the same name as an existing home.
case objectWithSimilarNameExists
An object with a similar name already exists.
case objectWithSimilarNameExistsInHome
An attempt to give the name of one object to another object in the home.
case renameWithSimilarName
An attempt to rename an object with its current name.
case accessDenied
An error indicating the current user doesn’t have privileges to perform the operation.
case accessoryCommunicationFailure
The accessory failed to communicate.
case accessoryPairingFailed
An attempt to pair with the accessory has failed.
case accessorySentInvalidResponse
An error indicating the accessory sent an invalid response.
Characteristic errors
Collision errors
Communication errors


## Page 17

case clientRequestError
An error with the client request.
case communicationFailure
A communication failure.
case dataResetFailure
An attempt to reset the data failed.
case timedOutWaitingForAccessory
An accessory did not respond timely.
case deviceLocked
An error indicating the device is locked.
case accessoryDiscoveryFailed
An error indicating accessory discovery failed.
case alreadyExists
An error indicating the container already contains the object you are trying to add.
case genericError
An error that does not have a more specific error code.
static var incompatibleHomeHub: HMError.Code
An error indicating an incompatible home hub.
Deprecated
case invalidClass
An attempt to use an abstract base class in an operation instead of a concrete subclass.
case notFound
An error indicating the object was not found in the container.
case notificationAlreadyEnabled
An error indicating the notification is already enabled.
case notificationNotSupported
Device and discovery errors
General errors


## Page 18

An attempt to register for notifications from an accessory that does not support notifications
case operationNotSupported
An attempt to use an unsupported operation.
case unexpectedError
An unexpected error.
case missingEntitlement
An error indicating a required entitlement is not available.
case referToUserManual
An error described in the device’s user manual.
case maximumAccessoriesOfTypeInHome
The home already has the maximum number of accessories of the given type.
case roomForHomeCannotBeInZone
An attempt to add the room that represents the entire home to a zone.
case roomForHomeCannotBeUpdated
An attempt to change the room that represents the entire home.
case noHomeHub
An error indicating no home hub found.
case noCompatibleHomeHub
An error indicating no compatible home hub found.
case cannotActivateTriggerTooFarInFuture
An error indicating the trigger cannot be activated because it is set too far in the future.
case dateMustBeOnSpecifiedBoundaries
An error indicating the date is not on the specified boundaries.
case fireDateInPast
Home and room errors
Hub errors
Limit errors


## Page 19

An attempt to activate a timer trigger with a date in the past.
case invalidMessageSize
An error indicating an invalid message size.
case maximumObjectLimitReached
An error indicating the maximum object count has been reached.
case recurrenceTooLarge
An attempt to use a recurrence period that is too large.
case recurrenceTooSmall
An error indicating the recurrence interval is too short.
case recurrenceMustBeOnSpecifiedBoundaries
An error indicating the recurrence rule is not on the specified boundaries.
case enterpriseNetworkNotSupported
An enterprise network doesn’t support this accessory.
case failedToJoinNetwork
The accessory failed to join the network.
case incompatibleNetwork
An error indicating an incompatible network.
case networkUnavailable
An error indicating the network is unavailable.
case wiFiCredentialGenerationFailed
WiFi credential generation failed.
case operationCancelled
An error indicating the user canceled the operation.
case operationInProgress
An error indicating the operation is already in progress.
Network errors
Operation errors


## Page 20

case operationTimedOut
An error indicating the operation timed out.
case invalidParameter
An error indicating the object is invalid for the given operation.
case missingParameter
An error indicating a missing parameter.
case nilParameter
An error indicating that nil was passed for an operation that does not accept nil.
case unconfiguredParameter
An error indicating an unconfigured parameter.
case readWriteFailure
An error indicating a failed read/write operation.
case readWritePartialSuccess
An error indicating a partially successful read/write operation.
case cloudDataSyncInProgress
An error indicating a data synchronization operation is in progress.
case keychainSyncNotEnabled
An error indicating Keychain syncing is not enabled for the user.
case userDeclinedAddingUser
An error indicating the user canceled the add user operation.
case userDeclinedRemovingUser
An error indicating the user canceled the remove user operation.
Parameter errors
Read and write errors
Synchronization errors
User errors


## Page 21

case userDeclinedInvite
An error indicating the user declined the invitation.
case userIDNotEmailAddress
An error indicating the user’s ID is not a valid email address.
case userManagementFailed
A user management error not covered by the other errors.
case invalidDataFormatSpecified
An error indicating an invalid data format was specified.
case invalidValueType
An attempt to use an invalid value type.
case nameContainsProhibitedCharacters
An attempt to name an object with prohibited characters.
case nameDoesNotEndWithValidCharacters
An error indicating the provided name has invalid characters at the end.
case nameDoesNotStartWithValidCharacters
An attempt to start the name of an object with invalid characters.
case stringLongerThanMaximum
An attempt to use a string longer than the maximum allowed.
case stringShorterThanMinimum
An attempt to use a string shorter than the required minimum.
case valueHigherThanMaximum
An attempt to use a numeric value higher than the specified maximum value.
case valueLowerThanMinimum
An attempt to use a numeric value lower than the specified minimum value.
case partialCommunicationFailure
case homeUpgradeRequired
Value errors
Enumeration Cases


## Page 22

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct HMError
An error HomeKit returns.
let HMErrorDomain: String
A string that identifies the HomeKit error domain.
typealias HMErrorBlock
A completion block that provides an error.
Initializers
Relationships
Conforms To
See Also
Errors


## Page 23

error
The error the block returns.
struct HMError
An error HomeKit returns.
let HMErrorDomain: String
A string that identifies the HomeKit error domain.
enum Code
Possible error values that can be returned from HomeKit APIs.
Parameters
See Also
Errors
HomeKit / HMErrorBlock
Type Alias
HMErrorBlock
A completion block that provides an error.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


