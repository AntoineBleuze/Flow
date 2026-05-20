# 002_HMError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


