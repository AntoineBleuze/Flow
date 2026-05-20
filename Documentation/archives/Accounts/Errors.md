# Errors.pdf

## Page 1

var ACErrorUnknown: ACErrorCode
Error code that indicates an unknown error occurred.
var ACErrorAccountMissingRequiredProperty: ACErrorCode
Error code that indicates an account wasn’t saved because a required property is missing.
var ACErrorAccountAuthenticationFailed: ACErrorCode
Error code that indicates an account wasn’t saved because authentication of its credential
failed.
var ACErrorAccountTypeInvalid: ACErrorCode
Error code that indicates an account wasn’t saved because its account type is invalid.
var ACErrorAccountAlreadyExists: ACErrorCode
Error code that indicates an account wasn’t added because it already exists.
var ACErrorAccountNotFound: ACErrorCode
Error code that indicates an account wasn’t deleted because it couldn’t be found.
var ACErrorPermissionDenied: ACErrorCode
Topics
Errors
Accounts / ACErrorCode
Structure
ACErrorCode
Codes for errors that may occur.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.8+


## Page 2

Error code that indicates the operation failed because the application doesn’t have permissio
to perform the operation.
var ACErrorAccessInfoInvalid: ACErrorCode
Error code that indicates the client’s access info dictionary has incorrect or missing values.
var ACErrorClientPermissionDenied: ACErrorCode
Error code that indicates the client doesn’t have access to the requested data.
var ACErrorAccessDeniedByProtectionPolicy: ACErrorCode
Error code that indicates due to the current protection policy, the credentials couldn’t be
fetched.
var ACErrorCredentialNotFound: ACErrorCode
Error code that indicates no credentials were found.
var ACErrorFetchCredentialFailed: ACErrorCode
Error code that indicates the credentials couldn’t be fetched from Keychain.
var ACErrorStoreCredentialFailed: ACErrorCode
Error code that indicates the credentials couldn’t be stored in Keychain.
var ACErrorRemoveCredentialFailed: ACErrorCode
Error code that indicates the credentials couldn’t be removed from Keychain.
var ACErrorUpdatingNonexistentAccount: ACErrorCode
Error code that indicates an account save failed because the account being updated has bee
removed.
var ACErrorInvalidClientBundleID: ACErrorCode
Error code that indicates the client making the request doesn’t have a valid bundle ID.
var ACErrorDeniedByPlugin: ACErrorCode
Error code that indicates a plugin prevented the expected action from occurring.
var ACErrorCoreDataSaveFailed: ACErrorCode
Error code that indicates an error occurred while trying to save to a Core Data store.
var ACErrorFailedSerializingAccountInfo: ACErrorCode
Error code that indicates an account’s information couldn’t be serialized.
var ACErrorInvalidCommand: ACErrorCode
Error code that indicates an invalid command was attempted.


## Page 3

var ACErrorMissingTransportMessageID: ACErrorCode
Error code that indicates an expected message identifier wasn’t found while performing a
command.
var ACErrorCredentialItemNotFound: ACErrorCode
Error code that indicates a credential item wasn’t saved because it couldn’t be found.
var ACErrorCredentialItemNotExpired: ACErrorCode
Error code that indicates a credential item wasn’t removed because it hasn’t yet expired.
init(UInt32)
Initializes a new error code structure.
init(rawValue: UInt32)
Initializes a new error code structure.
var rawValue: UInt32
The raw integer value of the error code.
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
Initializers
Instance Properties
Relationships
Conforms To
See Also
Errors


## Page 4

let ACErrorDomain: String
The error domain for the Accounts framework.


## Page 5

struct ACErrorCode
Codes for errors that may occur.
See Also
Errors
Accounts / ACErrorDomain
Global Variable
ACErrorDomain
The error domain for the Accounts framework.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+


