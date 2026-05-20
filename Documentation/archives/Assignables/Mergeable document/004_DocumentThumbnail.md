# 004_DocumentThumbnail.pdf

## Page 1

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


## Page 2

Types conforming to this protocol indicate that they are a page in a MergeableDocument
conforming object.
protocol MergeablePartsContainer
Objects conforming to this protocol allow merging in other replicas of themselves or merging
in individual parts of themselves.


