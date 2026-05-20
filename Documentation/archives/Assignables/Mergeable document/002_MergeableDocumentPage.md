# 002_MergeableDocumentPage.pdf

## Page 1

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


## Page 2

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


