# Mergeable document.pdf

## Page 1

var pages: [Self.Page]
The collection of pages in this document.
Required
associatedtype Page : MergeableDocumentPage
The page type this document contains.
Required
func exportToPDF(visibleParts: [Self.PartID]) async -> PDFDocument
Exports the indicated layers of this document into a single PDFDocument.
Required
func pageThumbnails(visibleParts: [Self.PartID]) async -> [Self.Page.ID
: Self.Page.Thumbnail]
Topics
Getting the pages
Exporting the layers
Exporting the thumbnails
Assignables / MergeableDocument
Protocol
MergeableDocument
Documents conforming to this protocol can merge several copies of the documen
into a single document.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

Exports thumbnails of each page such that the thumbnails contain the indicated layers.
Required Default implementation provided.
associatedtype Error : Error
The error type for this type.
Required
Equatable
Hashable
Identifiable
MergeablePartsContainer
AssignableDocument, AssignedWorkDocument
struct MergeablePartsContainerPartID
The ID of a part in a MergeablePartsContainer.
protocol MergeableDocumentPage
Types conforming to this protocol indicate that they are a page in a MergeableDocument
conforming object.
protocol MergeablePartsContainer
Objects conforming to this protocol allow merging in other replicas of themselves or merging
in individual parts of themselves.
Getting the error type
Relationships
Inherits From
Conforming Types
See Also
Mergeable document


## Page 3

struct DocumentThumbnail
A structure that contains an image of an entire page or a portion of a page and the ID of the
page the image is from.


## Page 4

init(String)
Initiailizes an instance of a document part ID.
var rawValue: String
The underlying value of the part ID.
Equatable, Hashable
Topics
Initializers
Instance Properties
Relationships
Conforms To
Assignables / MergeablePartsContainerPartID
Structure
MergeablePartsContainerPartID
The ID of a part in a MergeablePartsContainer.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 5

protocol MergeableDocument
Documents conforming to this protocol can merge several copies of the document into a
single document.
protocol MergeableDocumentPage
Types conforming to this protocol indicate that they are a page in a MergeableDocument
conforming object.
protocol MergeablePartsContainer
Objects conforming to this protocol allow merging in other replicas of themselves or merging
in individual parts of themselves.
struct DocumentThumbnail
A structure that contains an image of an entire page or a portion of a page and the ID of the
page the image is from.
See Also
Mergeable document


## Page 6

associatedtype Document : MergeableDocument
The document type this page is for.
Required
typealias Thumbnail
The thumbnail type for this page.
Identifiable
Topics
Implementing a mergeable page
Relationships
Inherits From
Conforming Types
Assignables / MergeableDocumentPage
Protocol
MergeableDocumentPage
Types conforming to this protocol indicate that they are a page in a Mergeable
Document conforming object.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 7

AssignableDocument.Page, AssignedWorkDocument.Page
protocol MergeableDocument
Documents conforming to this protocol can merge several copies of the document into a
single document.
struct MergeablePartsContainerPartID
The ID of a part in a MergeablePartsContainer.
protocol MergeablePartsContainer
Objects conforming to this protocol allow merging in other replicas of themselves or merging
in individual parts of themselves.
struct DocumentThumbnail
A structure that contains an image of an entire page or a portion of a page and the ID of the
page the image is from.
See Also
Mergeable document


## Page 8

func merge(other: Self) throws -> Bool
Merge another object of this type into this object.
Required
Deprecated
func merge(partID: Self.PartID, partDataURL: URL) throws -> Bool
Merges an individual part into the specified part of this object.
Required
Deprecated
func export(partIDs: [Self.PartID]) async throws -> [Self.PartID : URL]
Given a set of part identifiers, return a dictionary of part ID to URL to the part data file for the
requested parts.
Required
Deprecated
Topics
Merging the parts
Exporting the parts
Assignables / MergeablePartsContainer
Protocol
MergeablePartsContainer
Objects conforming to this protocol allow merging in other replicas of themselves
or merging in individual parts of themselves.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 9

var partIDs: [Self.PartID]
Returns a collection of part IDs reflecting the manifest of parts available in the document.
Required
typealias PartID
The type for document layer IDs.
var isPartial: Bool
Documents are considered partial when they are reconstituted missing one or more of their
associated document part IDs. When a document is considered partial it is expected that we
shouldn’t be able to both read or write to the parts that the document has neither been
reconstituted or merged with.
Required
func exportParts(identifiedBy: [Self.PartID]) async throws -> [Self.Par
ID : MergeablePartData]
Given a set of part identifiers, return a dictionary of part ID to part data.
Required
func makePart(for: Self.PartID) throws -> MergeablePartData?
Creates data for the part with the given identifier.
Required
func merge(Self) async throws -> Bool
Merge another object of this type into this object.
Required
func merge(partData: MergeablePartData, into: Self.PartID) async throws
-> Bool
Merges an individual part into the specified part of this object.
Required
Getting the part identifiers
Inspecting the parts
Instance Methods


## Page 10

Equatable, Hashable
MergeableDocument
AssignableDocument, AssignedWorkDocument
protocol MergeableDocument
Documents conforming to this protocol can merge several copies of the document into a
single document.
struct MergeablePartsContainerPartID
The ID of a part in a MergeablePartsContainer.
protocol MergeableDocumentPage
Types conforming to this protocol indicate that they are a page in a MergeableDocument
conforming object.
struct DocumentThumbnail
A structure that contains an image of an entire page or a portion of a page and the ID of the
page the image is from.
Relationships
Inherits From
Inherited By
Conforming Types
See Also
Mergeable document


## Page 11

var pageID: Document.Page.ID
The ID of the page this thumbnail is for.
protocol MergeableDocument
Documents conforming to this protocol can merge several copies of the document into a
single document.
struct MergeablePartsContainerPartID
The ID of a part in a MergeablePartsContainer.
protocol MergeableDocumentPage
Topics
Getting the page identifier
See Also
Mergeable document
Assignables / DocumentThumbnail
Structure
DocumentThumbnail
A structure that contains an image of an entire page or a portion of a page and the
ID of the page the image is from.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 12

Types conforming to this protocol indicate that they are a page in a MergeableDocument
conforming object.
protocol MergeablePartsContainer
Objects conforming to this protocol allow merging in other replicas of themselves or merging
in individual parts of themselves.


