# Errors.pdf

## Page 1

struct CKError
A type that describes a CloudKit error.
enum Code
The error codes that CloudKit returns.
let CKErrorRetryAfterKey: String
The key to retrieve the number of seconds to wait before you retry a request.
let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.
Record Changed Error Keys
Constants that represent conflicting records in a save operation.
See Also
Errors
CloudKit / CKErrorDomain
Global Variable
CKErrorDomain
The error domain for CloudKit errors.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 2

Designing and Creating a CloudKit Database
CloudKit provides operations that faciliate moving data between your app and iCloud. There are
also convenience methods in CKContainer and CKDatabase that provide similar functionality. 
an operation or method fails to complete its task, CloudKit provides detailed error information tha
you can use to recover. A failure might be due to network or server conditions, or because of
conflicts between local and remote data. For a list of possible reasons, see CKError.Code.
If you receive an error, cast it to an instance of CKError to access additional information that
CloudKit provides. For example, if the error code is requestRateLimited, you can use the
retryAfterSeconds property to determine how long you must wait before you retry the
operation or method.
Batch operations, such as CKModifyRecordsOperation, can complete with a partial
Failure error. This means only a subset of the operation’s changes succeed. Use the partial
ErrorsByItemID property to access a dictionary that maps items that CloudKit can’t process to
errors that describe those failures. You can then handle each error independently.
If you attempt to save a record and the server’s version of that record is newer, CloudKit returns a
serverRecordChanged error. Use the ancestorRecord, clientRecord, and server
Record properties to resolve the conflict. Make sure you merge any changes into serverRecor
because that version contains the most recent change tag.
Mentioned in
Overview
CloudKit / CKError
Structure
CKError
A type that describes a CloudKit error.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 3

static var accountTemporarilyUnavailable: CKError.Code
An error that occurs when the user’s iCloud account is temporarily unavailable.
static var alreadyShared: CKError.Code
An error that occurs when CloudKit attempts to share a record with an existing share.
static var assetFileModified: CKError.Code
An error that occurs when the system modifies an asset while saving it.
static var assetFileNotFound: CKError.Code
An error that occurs when the system can’t find the specified asset.
static var assetNotAvailable: CKError.Code
An error that occurs when the system can’t access the specified asset.
static var badContainer: CKError.Code
An error that occurs when you use an unknown or unauthorized container.
static var badDatabase: CKError.Code
An error that occurs when the operation can’t complete for the specified database.
static var batchRequestFailed: CKError.Code
An error that occurs when the system rejects the entire batch of changes.
static var changeTokenExpired: CKError.Code
An error that occurs when the change token expires.
static var constraintViolation: CKError.Code
An error that occurs when the server rejects the request because of a unique constraint
violation.
static var incompatibleVersion: CKError.Code
An error that occurs when the current app version is older than the oldest allowed version.
static var internalError: CKError.Code
A nonrecoverable error that CloudKit encounters.
Topics
Getting Error Codes


## Page 4

static var invalidArguments: CKError.Code
An error that occurs when the request contains invalid information.
static var limitExceeded: CKError.Code
An error that occurs when a request’s size exceeds the limit.
static var managedAccountRestricted: CKError.Code
An error that occurs when CloudKit rejects a request due to a managed-account restriction.
static var missingEntitlement: CKError.Code
An error that occurs when the app is missing a required entitlement.
static var networkFailure: CKError.Code
An error that occurs when a network is available, but CloudKit is inaccessible.
static var networkUnavailable: CKError.Code
An error that occurs when the network is unavailable.
static var notAuthenticated: CKError.Code
An error that occurs when the user is unauthenticated.
static var operationCancelled: CKError.Code
An error that occurs when an operation cancels.
static var partialFailure: CKError.Code
An error that occurs when an operation completes with partial failures.
static var participantMayNeedVerification: CKError.Code
An error that occurs when the user isn’t a participant of the share.
static var permissionFailure: CKError.Code
An error that occurs when the user doesn’t have permission to save or fetch data.
static var quotaExceeded: CKError.Code
An error that occurs when saving a record exceeds the user’s storage quota.
static var referenceViolation: CKError.Code
An error that occurs when CloudKit can’t find the target of a reference.
static var requestRateLimited: CKError.Code
An error that occurs when CloudKit rate-limits requests.
static var serverRecordChanged: CKError.Code


## Page 5

An error that occurs when CloudKit rejects a record because the server’s version is different
static var serverRejectedRequest: CKError.Code
An error that occurs when CloudKit rejects the request.
static var serverResponseLost: CKError.Code
An error that occurs when CloudKit is unable to maintain the network connection and provid
a response.
static var serviceUnavailable: CKError.Code
An error that occurs when CloudKit is unavailable.
static var tooManyParticipants: CKError.Code
An error that occurs when a share has too many participants.
static var unknownItem: CKError.Code
An error that occurs when the specified record doesn’t exist.
static var userDeletedZone: CKError.Code
An error that occurs when the user deletes a record zone using the Settings app.
static var zoneBusy: CKError.Code
An error that occurs when the server is too busy to handle the record zone operation.
static var zoneNotFound: CKError.Code
An error that occurs when the specified record zone doesn’t exist.
static var resultsTruncated: CKError.Code
An error that occurs when CloudKit truncates a query’s results.
Deprecated
enum Code
The error codes that CloudKit returns.
var partialErrorsByItemID: [AnyHashable : any Error]?
The dictionary that contains errors that relate to individual record operations.
var ancestorRecord: CKRecord?
Getting Partial Errors
Getting Conflicted Records


## Page 6

The original version of the record.
var clientRecord: CKRecord?
The local version of the record that includes any changes.
var serverRecord: CKRecord?
The server’s version of the record.
var retryAfterSeconds: Double?
The number of seconds to wait before you retry the request.
static var errorDomain: String
static var participantAlreadyInvited: CKError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
let CKErrorDomain: String
The error domain for CloudKit errors.
Getting Retry Information
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 7

enum Code
The error codes that CloudKit returns.
let CKErrorRetryAfterKey: String
The key to retrieve the number of seconds to wait before you retry a request.
let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 8

case accountTemporarilyUnavailable
An error that occurs when the user’s iCloud account is temporarily unavailable.
case alreadyShared
An error that occurs when CloudKit attempts to share a record with an existing share.
case assetFileModified
An error that occurs when the system modifies an asset while saving it.
case assetFileNotFound
An error that occurs when the system can’t find the specified asset.
case assetNotAvailable
An error that occurs when the system can’t access the specified asset.
case badContainer
An error that occurs when you use an unknown or unauthorized container.
case badDatabase
An error that occurs when the operation can’t complete for the specified database.
Topics
Error Codes
CloudKit / CKError / CKError.Code
Enumeration
CKError.Code
The error codes that CloudKit returns.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 9

case batchRequestFailed
An error that occurs when the system rejects the entire batch of changes.
case changeTokenExpired
An error that occurs when the change token expires.
case constraintViolation
An error that occurs when the server rejects the request because of a unique constraint
violation.
case incompatibleVersion
An error that occurs when the current app version is older than the oldest allowed version.
case internalError
A nonrecoverable error that CloudKit encounters.
case invalidArguments
An error that occurs when the request contains invalid information.
case limitExceeded
An error that occurs when a request’s size exceeds the limit.
case managedAccountRestricted
An error that occurs when CloudKit rejects a request due to a managed-account restriction.
case missingEntitlement
An error that occurs when the app is missing a required entitlement.
case networkFailure
An error that occurs when a network is available, but CloudKit is inaccessible.
case networkUnavailable
An error that occurs when the network is unavailable.
case notAuthenticated
An error that occurs when the user is unauthenticated.
case operationCancelled
An error that occurs when an operation cancels.
case partialFailure
An error that occurs when an operation completes with partial failures.


## Page 10

case participantMayNeedVerification
An error that occurs when the user isn’t a participant of the share.
case permissionFailure
An error that occurs when the user doesn’t have permission to save or fetch data.
case quotaExceeded
An error that occurs when saving a record exceeds the user’s storage quota.
case referenceViolation
An error that occurs when CloudKit can’t find the target of a reference.
case requestRateLimited
An error that occurs when CloudKit rate-limits requests.
case serverRecordChanged
An error that occurs when CloudKit rejects a record because the server’s version is different
case serverRejectedRequest
An error that occurs when CloudKit rejects the request.
case serverResponseLost
An error that occurs when CloudKit is unable to maintain the network connection and provid
a response.
case serviceUnavailable
An error that occurs when CloudKit is unavailable.
case tooManyParticipants
An error that occurs when a share has too many participants.
case unknownItem
An error that occurs when the specified record doesn’t exist.
case userDeletedZone
An error that occurs when the user deletes a record zone using the Settings app.
case zoneBusy
An error that occurs when the server is too busy to handle the record zone operation.
case zoneNotFound
An error that occurs when the specified record zone doesn’t exist.


## Page 11

case resultsTruncated
An error that occurs when CloudKit truncates a query’s results.
Deprecated
case participantAlreadyInvited
The user is already an invited participant on this share. They must accept the existing share
invitation before continuing.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
let CKErrorDomain: String
The error domain for CloudKit errors.
struct CKError
A type that describes a CloudKit error.
let CKErrorRetryAfterKey: String
Enumeration Cases
Initializers
Relationships
Conforms To
See Also
Errors


## Page 12

The key to retrieve the number of seconds to wait before you retry a request.
let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 13

An NSNumber that contains the number of seconds until you can retry a request. CloudKit adds
this key to the error’s userInfo dictionary when the error code is CKError.Code.service
Unavailable or CKError.Code.requestRateLimited.
let CKErrorDomain: String
The error domain for CloudKit errors.
struct CKError
A type that describes a CloudKit error.
enum Code
The error codes that CloudKit returns.
let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
Discussion
See Also
Errors
CloudKit / CKErrorRetryAfterKey
Global Variable
CKErrorRetryAfterKey
The key to retrieve the number of seconds to wait before you retry a request.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 14

let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 15

Encrypting User Data
An NSNumber that represents a Boolean value you use to determine whether a user action cause
CloudKit to delete a record zone. CloudKit adds this key to the error’s userInfo dictionary when
the error code is CKError.Code.zoneNotFound.
let CKErrorDomain: String
The error domain for CloudKit errors.
struct CKError
A type that describes a CloudKit error.
Mentioned in
Discussion
See Also
Errors
CloudKit / CKErrorUserDidResetEncryptedDataKey
Global Variable
CKErrorUserDidResetEncryptedDataKey
The key that determines whether CloudKit deletes a record zone because of a use
action.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 16

enum Code
The error codes that CloudKit returns.
let CKErrorRetryAfterKey: String
The key to retrieve the number of seconds to wait before you retry a request.
let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 17

The value of this key is a dictionary that maps an item ID to an error. The type of each ID depends
on where the error occurs. For example, if you receive a partial error when modifying a record, the
ID is an instance of CKRecord.ID that corresponds to the record that CloudKit can’t modify.
let CKErrorDomain: String
The error domain for CloudKit errors.
struct CKError
A type that describes a CloudKit error.
enum Code
The error codes that CloudKit returns.
let CKErrorRetryAfterKey: String
The key to retrieve the number of seconds to wait before you retry a request.
Discussion
See Also
Errors
CloudKit / CKPartialErrorsByItemIDKey
Global Variable
CKPartialErrorsByItemIDKey
The key to retrieve partial errors.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 18

let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 19

If the version of a record on the server is newer than the version you try to save, the server return
a CKError.Code.serverRecordChanged error. The error’s userInfo dictionary contains th
different versions of the conflicting records. Use these keys to retrieve the records, and to perform
any resolution logic necessary to resolve the conflict.
let CKRecordChangedErrorAncestorRecordKey: String
The key to retrieve the original version of the record.
let CKRecordChangedErrorClientRecordKey: String
The key to retrieve the local version of the record.
let CKRecordChangedErrorServerRecordKey: String
The key to retrieve the server’s version of the record.
Overview
Topics
Record Changed Error Keys
See Also
Errors
CloudKit / Record Changed Error Keys
API Collection
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 20

let CKErrorDomain: String
The error domain for CloudKit errors.
struct CKError
A type that describes a CloudKit error.
enum Code
The error codes that CloudKit returns.
let CKErrorRetryAfterKey: String
The key to retrieve the number of seconds to wait before you retry a request.
let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.


