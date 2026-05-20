# Transfer customization.pdf

## Page 1

Choosing a transfer representation for a model type
Use this representation to rely on an existing transfer representation that’s suitable for the type. F
example, a Note type might use the String structure’s built-in Transferable conformance —
plain text representation — so it can be pasted into any text editor:
ProxyRepresentation makes it easy to provide alternative representations for receivers that
don’t support the preferred custom format.
Mentioned in
Overview
Core Transferable / ProxyRepresentation
Structure
ProxyRepresentation
A transfer representation that uses another type’s transfer representation as its
own.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Write the order of the representations in the transferRepresentation property from more
preferred to less preferred. In the previous example, if the receiver knows about the custom com
.example.todo content type, it will receive that custom content type. Using a Proxy
Representation as the alternative lets people paste the to-do item in any text editor that
doesn’t support the com.example.todo content type but works with text formats.
ProxyRepresentation is a convenience, and its evaluation isn’t supposed to be calculation-
heavy. Don’t perform long-running work in exporting and importing closures. They shouldn’
contain network requests, file operations, or other potentially time-consuming tasks as they can
cause delays during operations with Transferable items.
Use FileRepresentation or DataRepresentation to read and write files or for other lengt
tasks.
init(exporting: (Item) async throws -> ProxyRepresentation)
Creates a transfer representation that’s exported by proxy through another transfer
representation.
Deprecated
init(exporting: (Item) throws -> ProxyRepresentation)
Creates a transfer representation that’s exported by proxy through another transfer
representation.
Topics
Initializers


## Page 3

init(exporting: (Item) throws -> ProxyRepresentation, importing: (Proxy
Representation) throws -> Item)
Creates a transfer representation that’s imported and exported by proxy through another
transfer representation.
init(exporting: (Item) async throws -> ProxyRepresentation, importing: 
ProxyRepresentation) async throws -> Item)
Creates a transfer representation that’s imported and exported by proxy through another
transfer representation.
Deprecated
init(exporting: (Item) throws -> ProxyRepresentation, importing: (Proxy
Representation) async throws -> Item)
Creates a transfer representation that’s imported and exported by proxy through another
transfer representation.
init(importing: (ProxyRepresentation) async throws -> Item)
Creates a transfer representation that’s imported by proxy through another transfer
representation.
init(importing: (ProxyRepresentation) throws -> Item)
Creates a transfer representation that’s imported by proxy through another transfer
representation.
Sendable, SendableMetatype, TransferRepresentation
struct TransferRepresentationVisibility
Relationships
Conforms To
See Also
Transfer customization


## Page 4

The visibility levels that specify the kinds of apps and processes that can see an item in
transit.


## Page 5

static let all: TransferRepresentationVisibility
The visibility level that specifies that any app or process can access the item.
static let team: TransferRepresentationVisibility
The visibility level that specifies that the item is visible only to apps created by the current
app’s development team.
static let group: TransferRepresentationVisibility
The visibility level that specifies that the item is visible only to macOS apps in the same App
Group.
static let ownProcess: TransferRepresentationVisibility
The visibility level that specifies that the item is visible only within the app that’s the source o
the item.
Topics
Specifying transfer visibility
Relationships
Core Transferable / TransferRepresentationVisibility
Structure
TransferRepresentationVisibility
The visibility levels that specify the kinds of apps and processes that can see an
item in transit.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 6

Equatable, Sendable, SendableMetatype
struct ProxyRepresentation
A transfer representation that uses another type’s transfer representation as its own.
Conforms To
See Also
Transfer customization


