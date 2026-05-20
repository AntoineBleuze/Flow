# Errors.pdf

## Page 1

enum Code
The error codes for the File Provider extension.
static var filenameCollision: NSFileProviderError.Code
An error indicating that an item with the same name already exists in the same directory.
static var insufficientQuota: NSFileProviderError.Code
An error indicating that the File Provider extension can’t upload the item because it would
push the account over its quota.
static var noSuchItem: NSFileProviderError.Code
An error indicating that the specified item doesn’t exist.
static var notAuthenticated: NSFileProviderError.Code
An error indicating that you can’t verify the user’s credentials.
static var pageExpired: NSFileProviderError.Code
An error indicating that the page is too old, and that the system must restart the enumeratio
operation from the beginning.
Topics
Accessing error codes
File Provider / NSFileProviderError
Structure
NSFileProviderError
A structure that contains information about File Provider extension errors.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 2

static var serverUnreachable: NSFileProviderError.Code
An error indicating that the File Provider extension can’t reach the remote server.
static var syncAnchorExpired: NSFileProviderError.Code
An error indicating that the sync anchor is too old, and that the system must restart the sync
operation from the beginning.
static var directoryNotEmpty: NSFileProviderError.Code
An error indicating an attempt to nonrecursively delete a directory that isn’t empty.
static var providerNotFound: NSFileProviderError.Code
An error indicating that the File Provider manager can’t find the specified provider.
static var providerTranslocated: NSFileProviderError.Code
An error indicating the File Provider extension is in a disabled state due to Gatekeeper’s
restrictions for apps from outside the App Store.
static var olderExtensionVersionRunning: NSFileProviderError.Code
An error indicating that the registered provider in the system is an older version than the one
the app uses.
static var newerExtensionVersionFound: NSFileProviderError.Code
An error indicating that the registered provider in the system is a newer version than the one
the app uses.
static var nonEvictable: NSFileProviderError.Code
An error indicating that the File Provider extension can’t evict an item.
static var nonEvictableChildren: NSFileProviderError.Code
An error indicating that the File Provider extension can’t evict a directory because it contains
nonevictable items.
static var unsyncedEdits: NSFileProviderError.Code
An error indicating that the item contains unsynced changes.
static var cannotSynchronize: NSFileProviderError.Code
An error indicating a failed sync attempt.
static var deletionRejected: NSFileProviderError.Code
An error indicating a failed deletion action.
static var versionNoLongerAvailable: NSFileProviderError.Code
An error that indicates whether the specified version is no longer available.


## Page 3

static var domainDisabled: NSFileProviderError.Code
static var excludedFromSync: NSFileProviderError.Code
static var applicationExtensionNotFound: NSFileProviderError.Code
An error indicating that there isn’t an app extension within the app bundle.
static var providerDomainNotFound: NSFileProviderError.Code
An error indicating that there isn’t a registered domain for the corresponding identifier.
static var providerDomainTemporarilyUnavailable: NSFileProviderError.
Code
An error indicating that the system is unable to service requests for the domain temporarily,
and you can try again later.
static var errorDomain: String
static var localVersionConflictingWithServer: NSFileProviderError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
The error codes for the File Provider extension.
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 4

let NSFileProviderErrorDomain: String
The error domain for the File Provider extension.
let NSFileProviderErrorItemKey: String
The key for accessing information about sync-related errors.
let NSFileProviderErrorNonExistentItemIdentifierKey: String
The key for accessing the specified item’s identifier when the item doesn’t exist.
let NSFileProviderErrorCollidingItemKey: String
The key for accessing the existing item from a filename collision error’s user info dictionary.
Deprecated


## Page 5

case filenameCollision
An error indicating that an item with the same name already exists in the same directory.
case insufficientQuota
An error indicating that the File Provider extension can’t upload the item because it would
push the account over its quota.
case noSuchItem
An error indicating that the specified item doesn’t exist.
case notAuthenticated
An error indicating that you can’t verify the user’s credentials.
case serverUnreachable
An error indicating that the File Provider extension can’t reach the remote server.
case syncAnchorExpired
An error indicating that the sync anchor is too old, and that the system must restart the sync
operation from the beginning.
Topics
Error codes
File Provider / NSFileProviderError / NSFileProviderError.Code
Enumeration
NSFileProviderError.Code
The error codes for the File Provider extension.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 6

static var pageExpired: NSFileProviderError.Code
An error indicating that the page is too old, and that the system must restart the enumeratio
operation from the beginning.
case directoryNotEmpty
An error indicating an attempt to nonrecursively delete a directory that isn’t empty.
case providerNotFound
An error indicating that the File Provider manager can’t find the specified provider.
case providerTranslocated
An error indicating the File Provider extension is in a disabled state due to Gatekeeper’s
restrictions for apps from outside the App Store.
case olderExtensionVersionRunning
An error indicating that the registered provider in the system is an older version than the one
the app uses.
case newerExtensionVersionFound
An error indicating that the registered provider in the system is a newer version than the one
the app uses.
case nonEvictable
An error indicating that the File Provider extension can’t evict an item.
case nonEvictableChildren
An error indicating that the File Provider extension can’t evict a directory because it contains
nonevictable items.
case unsyncedEdits
An error indicating that the item contains unsynced changes.
case cannotSynchronize
An error indicating a failed sync attempt.
case deletionRejected
An error indicating a failed deletion action.
case versionNoLongerAvailable
An error indicating that the specified version is no longer available.
case domainDisabled
case excludedFromSync


## Page 7

case applicationExtensionNotFound
An error indicating that there isn’t an app extension within the app bundle.
case providerDomainNotFound
An error indicating that there isn’t a registered domain for the corresponding identifier.
case providerDomainTemporarilyUnavailable
An error indicating that the system is unable to service requests for the domain temporarily,
and you can try again later.
case localVersionConflictingWithServer
Returned by createItemBasedOnTemplate or modifyItem if the provider does not wish to syn
the item.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct NSFileProviderError
Enumeration Cases
Initializers
Relationships
Conforms To
See Also
Errors


## Page 8

A structure that contains information about File Provider extension errors.
let NSFileProviderErrorDomain: String
The error domain for the File Provider extension.
let NSFileProviderErrorItemKey: String
The key for accessing information about sync-related errors.
let NSFileProviderErrorNonExistentItemIdentifierKey: String
The key for accessing the specified item’s identifier when the item doesn’t exist.
let NSFileProviderErrorCollidingItemKey: String
The key for accessing the existing item from a filename collision error’s user info dictionary.
Deprecated


## Page 9

struct NSFileProviderError
A structure that contains information about File Provider extension errors.
enum Code
The error codes for the File Provider extension.
let NSFileProviderErrorItemKey: String
The key for accessing information about sync-related errors.
let NSFileProviderErrorNonExistentItemIdentifierKey: String
The key for accessing the specified item’s identifier when the item doesn’t exist.
let NSFileProviderErrorCollidingItemKey: String
The key for accessing the existing item from a filename collision error’s user info dictionary.
Deprecated
See Also
Errors
File Provider / NSFileProviderErrorDomain
Global Variable
NSFileProviderErrorDomain
The error domain for the File Provider extension.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 10

If a specific item caused the error, the system sets the NSFileProviderErrorItemKey key to
the item’s identifier, and it sets the NSUnderlyingErrorKey key to the error encountered by th
item.
struct NSFileProviderError
A structure that contains information about File Provider extension errors.
enum Code
The error codes for the File Provider extension.
let NSFileProviderErrorDomain: String
The error domain for the File Provider extension.
let NSFileProviderErrorNonExistentItemIdentifierKey: String
The key for accessing the specified item’s identifier when the item doesn’t exist.
Discussion
See Also
Errors
File Provider / NSFileProviderErrorItemKey
Global Variable
NSFileProviderErrorItemKey
The key for accessing information about sync-related errors.
iOS 13.0+
iPadOS 13.0+
macOS 10.15+
visionOS 1.0+


## Page 11

let NSFileProviderErrorCollidingItemKey: String
The key for accessing the existing item from a filename collision error’s user info dictionary.
Deprecated


## Page 12

Use this key to access the item’s identifier from a noSuchItem error’s userInfo dictionary.
struct NSFileProviderError
A structure that contains information about File Provider extension errors.
enum Code
The error codes for the File Provider extension.
let NSFileProviderErrorDomain: String
The error domain for the File Provider extension.
let NSFileProviderErrorItemKey: String
The key for accessing information about sync-related errors.
Discussion
See Also
Errors
File Provider / NSFileProviderErrorNonExistentItemIdentifierKey
Global Variable
NSFileProviderErrorNonExistentItem
IdentifierKey
The key for accessing the specified item’s identifier when the item doesn’t exist.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 13

let NSFileProviderErrorCollidingItemKey: String
The key for accessing the existing item from a filename collision error’s user info dictionary.
Deprecated


## Page 14

Deprecated
Use NSFileProviderErrorItemKey instead.
struct NSFileProviderError
A structure that contains information about File Provider extension errors.
enum Code
The error codes for the File Provider extension.
let NSFileProviderErrorDomain: String
The error domain for the File Provider extension.
let NSFileProviderErrorItemKey: String
The key for accessing information about sync-related errors.
See Also
Errors
File Provider / NSFileProviderErrorCollidingItemKey Deprecated
Global Variable
NSFileProviderErrorCollidingItem
Key Deprecated
The key for accessing the existing item from a filename collision error’s user info
dictionary.
iOS 8.0–13.0 Deprecated
iPadOS 8.0–13.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 15

let NSFileProviderErrorNonExistentItemIdentifierKey: String
The key for accessing the specified item’s identifier when the item doesn’t exist.


