# 000_AssignableDocumentView.pdf

## Page 1

init(document: Binding<AssignableDocumentView.Document>, activePartID:
MergeablePartsContainerPartID?, hiddenPartIDs: [MergeablePartsContainer
PartID], selectedPageID: Binding<AssignableDocumentView.Document.Page.I
?>?, selectedQuestionID: Binding<AssignableDocumentView.Document.
Question.ID?>?, showsPageThumbnails: Bool, isStructureEditingEnabled:
Bool)
Displays an AssignableDocument.
typealias Document
The document type that this view presents.
Topics
Creating a document view
Customizing the view
Initializers
Assignables / AssignableDocumentView
Structure
AssignableDocumentView
SwiftUI View to display an AssignableDocument.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

init(document: Binding<AssignableDocumentView.Document>, activePartID:
MergeablePartsContainerPartID?, hiddenPartIDs: [MergeablePartsContainer
PartID], selectedPageID: Binding<AssignableDocumentView.Document.Page.I
?>?, selectedQuestionID: Binding<AssignableDocumentView.Document.
Question.ID?>?, showsPageThumbnails: Bool, isStructureEditingEnabled:
Bool, allowsPencilDrawing: Bool, onMarkupActivation: (Bool) -> Void)
Displays an AssignableDocument.
Sendable, SendableMetatype, View
struct AssignedWorkDocumentView
SwiftUI View to display an AssignedWorkDocument
Relationships
Conforms To
See Also
Presentation


