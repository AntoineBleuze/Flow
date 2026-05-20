# 003_NSFileProviderItemCapabilities.pdf

## Page 1

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


## Page 2

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


## Page 3

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


