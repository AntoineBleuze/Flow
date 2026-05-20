# 004_NSFileProviderTypeAndCreator.pdf

## Page 1

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


## Page 2

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


