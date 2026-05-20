# 000_MergeableDocument.pdf

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


