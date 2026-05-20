# Document elements.pdf

## Page 1

associatedtype Document : MergeableDocument
The document type this element is for.
Required
Equatable, Hashable
AssignableDocumentElement, AssignedWorkDocumentElement
Topics
Implementing a document element
Relationships
Inherits From
Inherited By
Conforming Types
Assignables / DocumentElement
Protocol
DocumentElement
Represents an element that is contained within a document. Such elements can
have identifiers that uniquely identify them within a document.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

AssignableDocument.Page
AssignableDocument.Question
AssignableDocument.QuestionBox
AssignedWorkDocument.Page
AssignedWorkDocument.ScoreAnnotation
struct BasicDocumentElementID
A default implementation for a document element identifier.
protocol DocumentElementID
An identifier for an element in a document.
protocol AssignableDocumentElement
An element of an AssignableDocument.
protocol AssignedWorkDocumentElement
An element of an AssignedWorkDocument.
See Also
Document elements


## Page 3

Decodable
DocumentElementID
Encodable
Equatable
Hashable
protocol DocumentElement
Represents an element that is contained within a document. Such elements can have
identifiers that uniquely identify them within a document.
protocol DocumentElementID
An identifier for an element in a document.
Relationships
Conforms To
See Also
Document elements
Assignables / BasicDocumentElementID
Structure
BasicDocumentElementID
A default implementation for a document element identifier.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 4

protocol AssignableDocumentElement
An element of an AssignableDocument.
protocol AssignedWorkDocumentElement
An element of an AssignedWorkDocument.


## Page 5

associatedtype Element : DocumentElement
The document element type that this reference is for.
Required
Decodable
Encodable
Equatable
Hashable
AssignableDocument.Page.ID, AssignedWorkDocument.Page.ID, 
Topics
Implementing an element identifier
Relationships
Inherits From
Conforming Types
Assignables / DocumentElementID
Protocol
DocumentElementID
An identifier for an element in a document.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 6

BasicDocumentElementID
protocol DocumentElement
Represents an element that is contained within a document. Such elements can have
identifiers that uniquely identify them within a document.
struct BasicDocumentElementID
A default implementation for a document element identifier.
protocol AssignableDocumentElement
An element of an AssignableDocument.
protocol AssignedWorkDocumentElement
An element of an AssignedWorkDocument.
See Also
Document elements


## Page 7

DocumentElement, Equatable, Hashable
AssignableDocument.Page, AssignableDocument.Question, 
AssignableDocument.QuestionBox
protocol DocumentElement
Represents an element that is contained within a document. Such elements can have
identifiers that uniquely identify them within a document.
struct BasicDocumentElementID
A default implementation for a document element identifier.
Relationships
Inherits From
Conforming Types
See Also
Document elements
Assignables / AssignableDocumentElement
Protocol
AssignableDocumentElement
An element of an AssignableDocument.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 8

protocol DocumentElementID
An identifier for an element in a document.
protocol AssignedWorkDocumentElement
An element of an AssignedWorkDocument.


## Page 9

DocumentElement, Equatable, Hashable
AssignedWorkDocument.Page, AssignedWorkDocument.ScoreAnnotation
protocol DocumentElement
Represents an element that is contained within a document. Such elements can have
identifiers that uniquely identify them within a document.
struct BasicDocumentElementID
A default implementation for a document element identifier.
Relationships
Inherits From
Conforming Types
See Also
Document elements
Assignables / AssignedWorkDocumentElement
Protocol
AssignedWorkDocumentElement
An element of an AssignedWorkDocument.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 10

protocol DocumentElementID
An identifier for an element in a document.
protocol AssignableDocumentElement
An element of an AssignableDocument.


