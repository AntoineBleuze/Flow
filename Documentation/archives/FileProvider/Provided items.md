# Provided items.pdf

## Page 1

For a list of all the properties defined by NSFileProviderItem, see NSFileProviderItem
Protocol.
protocol NSFileProviderItemProtocol
A protocol that defines the properties of an item managed by the File Provider extension.
struct NSFileProviderItemIdentifier
A unique identifier for an item managed by the File Provider extension.
struct NSFileProviderItemCapabilities
An item’s capabilities, which define the actions that the user can perform in the document
browser.
struct NSFileProviderTypeAndCreator
Discussion
See Also
Provided items
File Provider / NSFileProviderItem
Type Alias
NSFileProviderItem
An item the File Provider extension manages.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 2

A structure that contains the file type and file creator codes for an item.


## Page 3

Synchronizing the File Provider Extension
Most of these properties are optional. A File Provider extension doesn’t need to implement all
properties for all items.
var itemIdentifier: NSFileProviderItemIdentifier
The item’s persistent identifier.
Required
var filename: String
The item’s filename.
Required
Mentioned in
Overview
Topics
Providing Required Properties
File Provider / NSFileProviderItemProtocol
Protocol
NSFileProviderItemProtocol
A protocol that defines the properties of an item managed by the File Provider
extension.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 4

var typeIdentifier: String
The item’s Uniform Type Identifier (UTI).
Deprecated
var contentType: UTType
The item’s Uniform Type Identifier (UTI).
var capabilities: NSFileProviderItemCapabilities
The item’s capabilities.
var childItemCount: NSNumber?
The number of items contained by this item.
var documentSize: NSNumber?
The document’s size, in bytes.
var contentPolicy: NSFileProviderContentPolicy
enum NSFileProviderContentPolicy
var parentItemIdentifier: NSFileProviderItemIdentifier
The persistent identifier of the item’s parent folder.
Required
var isTrashed: Bool
A Boolean value that indicates whether an item is in the trash.
var symlinkTargetPath: String?
The target of the symlink.
var contentModificationDate: Date?
The date the item was last modified.
var creationDate: Date?
The date the item was created.
Managing Content
Specifying Content Location
Tracking Usage


## Page 5

var lastUsedDate: Date?
The date the item was last used.
var itemVersion: NSFileProviderItemVersion
A version object that tracks changes to an item.
var versionIdentifier: Data?
A data value used to determine when the item changes.
var isMostRecentVersionDownloaded: Bool
A Boolean value that indicates whether the item is the most recent version downloaded from
the server.
var isUploading: Bool
A Boolean value that indicates whether the item is currently uploading to your remote server
var isUploaded: Bool
A Boolean value that indicates whether the item has been uploaded to your remote server.
var uploadingError: (any Error)?
An object describing an error that occurred while uploading the item.
var isDownloading: Bool
A Boolean value that indicates whether the item is currently downloading from your remote
server.
var isDownloaded: Bool
A Boolean value that indicates whether the item has been downloaded from your remote
server.
var downloadingError: (any Error)?
An object describing an error that occurred while downloading the item.
var isShared: Bool
A Boolean value that indicates whether the item is shared with other users.
Tracking Versions
Monitoring File Transfers
Sharing


## Page 6

var isSharedByCurrentUser: Bool
A Boolean value that indicates whether the item was shared by the current user.
var mostRecentEditorNameComponents: PersonNameComponents?
The most recent editor’s name.
var ownerNameComponents: PersonNameComponents?
The name of the item’s owner.
var extendedAttributes: [String : Data]
The extended file attributes synced by the File Provider extension.
var fileSystemFlags: NSFileProviderFileSystemFlags
Flags that define an item’s on-disk properties and its appearance in the user interface.
struct NSFileProviderFileSystemFlags
Flags that define an item’s on-disk properties and its appearance in the user interface.
var tagData: Data?
An abstract data blob representing the tags associated with the item.
var userInfo: [AnyHashable : Any]?
A property list that contains additional data about the item.
var favoriteRank: NSNumber?
A 64-bit, unsigned integer indicating the order of the favorite item in the Favorites list.
let NSFileProviderFavoriteRankUnranked: UInt64
A value that indicates that the item is not ranked.
var typeAndCreator: NSFileProviderTypeAndCreator
The file type and creator codes for the item.
NSObjectProtocol
Managing Metadata
Relationships
Inherits From


## Page 7

NSFileProviderItemDecorating
typealias NSFileProviderItem
An item the File Provider extension manages.
struct NSFileProviderItemIdentifier
A unique identifier for an item managed by the File Provider extension.
struct NSFileProviderItemCapabilities
An item’s capabilities, which define the actions that the user can perform in the document
browser.
struct NSFileProviderTypeAndCreator
A structure that contains the file type and file creator codes for an item.
Inherited By
See Also
Provided items


## Page 8

static let rootContainer: NSFileProviderItemIdentifier
The persistent identifier for the root directory of the file provider’s shared file hierarchy.
static let workingSet: NSFileProviderItemIdentifier
The persistent identifier representing the working set of documents and directories.
static let trashContainer: NSFileProviderItemIdentifier
The persistent identifier for the parent of all trashed items.
init(String)
Returns a newly instantiated persistent identifier.
init(rawValue: String)
Returns a newly instantiated persistent identifier.
Topics
Constants
Initializers
File Provider / NSFileProviderItemIdentifier
Structure
NSFileProviderItemIdentifier
A unique identifier for an item managed by the File Provider extension.
iOS 8.0+
iPadOS 8.0+
macOS 11.0+
visionOS 1.0+


## Page 9

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
typealias NSFileProviderItem
An item the File Provider extension manages.
protocol NSFileProviderItemProtocol
A protocol that defines the properties of an item managed by the File Provider extension.
struct NSFileProviderItemCapabilities
An item’s capabilities, which define the actions that the user can perform in the document
browser.
struct NSFileProviderTypeAndCreator
A structure that contains the file type and file creator codes for an item.
Relationships
Conforms To
See Also
Provided items


## Page 10

Exporting file provider metrics data
init(rawValue: UInt)
Returns a newly created item capabilities value.
static var allowsAddingSubItems: NSFileProviderItemCapabilities
A value indicating that the user can add subitems.
static var allowsContentEnumerating: NSFileProviderItemCapabilities
A value indicating that the item’s contents can be enumerated.
static var allowsDeleting: NSFileProviderItemCapabilities
Mentioned in
Topics
Initializers
Constants
File Provider / NSFileProviderItemCapabilities
Structure
NSFileProviderItemCapabilities
An item’s capabilities, which define the actions that the user can perform in the
document browser.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 11

A value indicating that the item can be deleted.
static var allowsEvicting: NSFileProviderItemCapabilities
A value indicating that the system can delete the local copy of the item.
static var allowsReading: NSFileProviderItemCapabilities
A value indicating that the value can be read from.
static var allowsRenaming: NSFileProviderItemCapabilities
A value indicating that the item can be renamed.
static var allowsReparenting: NSFileProviderItemCapabilities
A value indicating that the item can be moved.
static var allowsTrashing: NSFileProviderItemCapabilities
A value indicating that the item can be moved to the trash.
static var allowsWriting: NSFileProviderItemCapabilities
A value indicating that the item can be written to.
static var allowsExcludingFromSync: NSFileProviderItemCapabilities
A value indicating that the user can exclude the item from sync operations.
static var allowsAll: NSFileProviderItemCapabilities
A convenience value for enabling all capabilities.
Deprecated
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
Relationships
Conforms To


## Page 12

typealias NSFileProviderItem
An item the File Provider extension manages.
protocol NSFileProviderItemProtocol
A protocol that defines the properties of an item managed by the File Provider extension.
struct NSFileProviderItemIdentifier
A unique identifier for an item managed by the File Provider extension.
struct NSFileProviderTypeAndCreator
A structure that contains the file type and file creator codes for an item.
See Also
Provided items


## Page 13

init()
Returns a new type and creator structure with both codes set to 0.
init(type: OSType, creator: OSType)
Creates a structure that contains the provided type and creator codes.
var creator: OSType
The item’s creator code.
var type: OSType
The item’s type code.
Topics
Creating Type and Creator Structures
Accessing Type and Creator Codes
Relationships
File Provider / NSFileProviderTypeAndCreator
Structure
NSFileProviderTypeAndCreator
A structure that contains the file type and file creator codes for an item.
iOS 16.0+
iPadOS 16.0+
macOS 12.0+
visionOS 1.0+


## Page 14

BitwiseCopyable, Sendable
typealias NSFileProviderItem
An item the File Provider extension manages.
protocol NSFileProviderItemProtocol
A protocol that defines the properties of an item managed by the File Provider extension.
struct NSFileProviderItemIdentifier
A unique identifier for an item managed by the File Provider extension.
struct NSFileProviderItemCapabilities
An item’s capabilities, which define the actions that the user can perform in the document
browser.
Conforms To
See Also
Provided items


