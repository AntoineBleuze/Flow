# Assignable document.pdf

## Page 1

The document has several parts, which includes the ability to modify the PDF, annotate the PDF,
and define question regions in the PDF.
To add a question to this assignable, you can use appendQuestion(pageID:rect:max
Score:) which will take care of associating a box to a page and adding a question connected to
that box to the document.
This document is fully mergeable, which means that any copies of this document that are
independently mutated can be merged into a determinisitic resulting document. You can merge
copies of this document into this one using merge(_:). You can also merge individual parts of
copies of this document into this one with merge(partData:into:). For example, if deviceA
has documentA and deviceB has documentB, which is a copy of documentA. When a user change
a question in documentB on deviceB, deviceB can export that part’s data and send it to deviceA t
be merged back into documentA.
You can create as many of these objects as you have memory for. This type assumes single-
threaded access.
Overview
Topics
Assignables / AssignableDocument
Structure
AssignableDocument
An assignable document is an augmented PDF that allows teachers to mark up th
PDF with the intention of students taking the assessment.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

init(pdfURL: URL, id: String?) throws
Initializes a new assessment document that is based on the PDF located at the provided URL
If the file located at the URL provided cannot be accessed, this initializer throws.
init(id: AssignableDocument.ID, partData: [AssignableDocument.PartID :
MergeablePartData]) async throws
Construct an instance of this object with the parts data passed in.
enum MergeablePartData
init(id: AssignableDocument.ID, partData: [AssignableDocument.PartID :
URL]) throws
Construct an instance of this object with the parts data passed in.
Deprecated
init(pdfURL: URL, authors: [some UserIdentity], id: String?) throws
Initializes a new assessment document that is based on the PDF located at the provided URL
If the file located at the URL provided cannot be accessed, this initializer throws.
Deprecated
typealias ID
A type representing the stable identity of this document.
var id: AssignableDocument.ID
The stable identity of this document.
var isMultiPageDocument: Bool
true, if this document has more than one page; false, otherwise.
var isPartial: Bool
Denotes whether or not this document is a partial one.
enum PartIDs
An enumeration containing the identities of parts managed by this view.
var partIDs: [AssignableDocument.PartID]
Returns a collection of identifiers reflecting the manifest of parts available in the document.
Creating an assignable document
Inspecting an assignable document


## Page 3

struct Question
A question in the assignable document.
struct QuestionBox
A box on a page for a question.
var questions: [AssignableDocument.Question]
A collection of questions defined for this assignable.
typealias Element
The type for elements of this document. An element is a component of the document such a
a page or question.
var pagesDebugDescription: String
enum Error
Errors for this document type.
func appendQuestion(pageID: AssignableDocument.Page.ID, rect: CGRect,
maxScore: Double?) -> AssignableDocument.Question.ID
Creates a new question and appends it to the document.
func questions(on: AssignableDocument.Page.ID) -> [AssignableDocument.
Question]
Find questions that exist on the specified page.
func removeQuestion(AssignableDocument.Question.ID) -> Assignable
Document.Question?
Removes a question and its boxes from the document.
Deprecated
func computeMaxScore(defaultQuestionMaxScore: Double?) -> Double?
Computes the maximum possible score for this AssignableDocument as defined by each
individual question’s maxScore.
Getting and setting the questions
Computing the max score
Getting the authors


## Page 4

var authors: [AnyUserIdentity]
The set of identities of users that created or modified this assignable. Treated as a set.
typealias Configuration
The configuration for an assessment which contains options for display of marks and their
point values.
var configuration: some AssignableDocumentConfiguration
The configuration of this assessment which contains options for display of marks and their
point values.
enum CorrectMarkType
The glyph to use that represents a correct mark.
func merge(AssignableDocument) async throws -> Bool
Merge another object of this type into this object.
func merge(partData: MergeablePartData, into: AssignableDocument.PartID
async throws -> Bool
Merges an individual part into the specified part of this object.
func merge(other: AssignableDocument) throws -> Bool
Merge another object of this type into this object.
Deprecated
func merge(partID: AssignableDocument.PartID, partDataURL: URL) throws 
> Bool
Merges an individual part’s data into the specified part of this object.
Deprecated
func questionThumbnails(visibleParts: [AssignableDocument.PartID]) asyn
-> [AssignableDocument.Question.ID : [AssignableDocument.Question.
Thumbnail]]
Produces thumbnails of question regions within the document.
Getting the configuration
Merging the parts
Producing thumbnails


## Page 5

func makePart(for: AssignableDocument.PartID) throws -> MergeablePart
Data?
Creates data for the part with the given identifier.
func exportBaseAsPDF() async -> PDFDocument
Exports the base part of this document to a PDFDocument.
func exportParts(identifiedBy: [AssignableDocument.PartID]) async throw
-> [AssignableDocument.PartID : MergeablePartData]
Given a set of part identifiers, return a dictionary of part ID to part data.
func export(partIDs: [AssignableDocument.PartID]) async throws -> [
AssignableDocument.PartID : URL]
Given a set of part identifiers, return a dictionary of part ID to data objects for the requested
layers.
Deprecated
subscript(AssignableDocument.Page.ID) -> AssignableDocument.Page?
Access the page that the identifier denotes, if any.
subscript(AssignableDocument.QuestionBox.ID) -> AssignableDocument.
QuestionBox?
Access the question box that the identifier denotes, if any.
Deprecated
subscript(AssignableDocument.Question.ID) -> AssignableDocument.Questio
?
Access the question that the identifier denotes, if any.
Deprecated
static func == (AssignableDocument, AssignableDocument) -> Bool
Making the parts
Exporting the parts
Accessing documents
Comparing assignable documents


## Page 6

Returns a Boolean value indicating whether two values are equal.
func hash(into: inout Hasher)
Hashes the essential components of this value by feeding them into the given hasher.
Assignable Implementations
MergeableDocument Implementations
Assignable
Copyable
Equatable
Hashable
Identifiable
MergeableDocument
MergeablePartsContainer
struct AssignedWorkDocument
An assigned work document is a document that contains taker and scorer markup specific to
a taker. It also contains a copy of the assignable document upon which it is based.
protocol Assignable
Documents conforming to this protocol can be assigned to a user.
Hashing the assignable document
Default Implementations
Relationships
Conforms To
See Also
Assignable document


## Page 7



## Page 8

This document has a collection of AssignedWorkDocument.ScoreAnnotation objects that
represent marks such as correct and incorrect marks on a page. Score annotations are not
automatically associated with a question defined in the AssignableDocument that this work
document is based on. To determine the score for the work, you use computeScore.
You cannot instantiate this document type directly. Instead, you instantiate it by calling
assign(to:) or makeAssignedWorkDocument().
This document is fully mergeable, which means that any copies of this document that are
independently mutated can be merged into a determinisitic resulting document. You can merge
copies of this document into this one using merge(_:). You can also merge individual parts of
copies of this document into this one with merge(partData:into:). For example, if deviceA
has documentA and deviceB has documentB, which is a copy of documentA. When a user change
a question in documentB on deviceB, deviceB can export that part’s data and send it to deviceA t
be merged back into documentA.
You can create as many of these objects as you have memory for. This type assumes single-
threaded access.
Overview
Topics
Assignables / AssignedWorkDocument
Structure
AssignedWorkDocument
An assigned work document is a document that contains taker and scorer markup
specific to a taker. It also contains a copy of the assignable document upon which
it is based.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 9

init(id: AssignedWorkDocument.ID, assignableDocument: AssignableDocumen
, partData: [AssignedWorkDocument.PartID : MergeablePartData]) async 
throws
Construct an instance of this object with the parts data passed in.
init(id: AssignedWorkDocument.ID, assignableDocument: AssignableDocumen
, partData: [AssignedWorkDocument.PartID : URL]) throws
Construct an instance of this object with the parts data passed in.
Deprecated
typealias ID
A type representing the stable identity of this document.
var id: AssignedWorkDocument.ID
The stable identity of this document.
var isMultiPageDocument: Bool
true, if this document has more than one page; false, otherwise.
var isPartial: Bool
Denotes whether or not this document is a partial one.
enum PartIDs
An enumeration containing the identities of parts managed by this view.
var partIDs: [MergeablePartsContainerPartID]
Returns a collection of identifiers reflecting the manifest of parts available in the document.
var scoreAnnotations: [AssignedWorkDocument.ScoreAnnotation]
The collection of score annotations for this work document. Treated as a multiset. i.e. The
order of the elements doesn’t matter and duplicate values are allowed.
var scorers: [AnyUserIdentity]
The identities of users scoring this assigned work. Treated as a set.
var pagesDebugDescription: String
enum Error
Creating an assigned work document
Inspecting a work document


## Page 10

Errors for this document type.
var assignableDocument: AssignableDocument
The assignable document that this work document is based on.
var assignees: [AnyUserIdentity]
The identities of takers of this document. Treated as a set.
typealias Configuration
The configuration for an assessment taker work which contains an optional manual score for
the document.
var configuration: any AssignedWorkDocumentConfiguration
The configuration for a taker work which contains an optional manual score for the documen
func merge(AssignedWorkDocument) async throws -> Bool
Merge another object of this type into this object.
func merge(partData: MergeablePartData, into: AssignedWorkDocument.Part
ID) async throws -> Bool
Merges an individual part into the specified part of this object.
func merge(other: AssignedWorkDocument) throws -> Bool
Merge another object of this type into this object.
Deprecated
func merge(partID: AssignedWorkDocument.PartID, partDataURL: URL) throw
-> Bool
Merges an individual part’s data into the specified part of this object.
Deprecated
Getting the assignable document
Getting the assignees
Getting the configuration
Merging the parts
Producing thumbnails


## Page 11

func questionThumbnails(visibleParts: [AssignedWorkDocument.PartID])
async -> [AssignableDocument.Question.ID : [AssignableDocument.Question
Thumbnail]]
Produces thumbnails of question regions within the document.
func computeScore() -> Double
Gathers all of the points based on all the AssignedWorkDocument.ScoreAnnotations 
the document and its kind property.
struct ScoreAnnotation
A score mark on page of the work document.
func makePart(for: AssignedWorkDocument.PartID) throws -> MergeablePart
Data?
Creates data for the part with the given identifier.
func exportParts(identifiedBy: [AssignedWorkDocument.PartID]) async 
throws -> [AssignedWorkDocument.PartID : MergeablePartData]
Given a set of part identifiers, return a dictionary of part ID to part data.
func export(partIDs: [AssignedWorkDocument.PartID]) async throws -> [
AssignedWorkDocument.PartID : URL]
Given a set of part identifiers, return a dictionary of part ID to data objects for the requested
parts.
Deprecated
static func == (AssignedWorkDocument, AssignedWorkDocument) -> Bool
Returns a Boolean value indicating whether two values are equal.
func hash(into: inout Hasher)
Computing the score
Making the parts
Exporting the parts
Comparing work documents
Hashing the work document


## Page 12

Hashes the essential components of this value by feeding them into the given hasher.
subscript(AssignedWorkDocument.Page.ID) -> AssignedWorkDocument.Page?
Access the page that the ID points to, if any.
subscript(AssignedWorkDocument.ScoreAnnotation.ID) -> AssignedWork
Document.ScoreAnnotation?
Access the score annotation that the identifier refers to, if any.
MergeableDocument Implementations
Copyable
Equatable
Hashable
Identifiable
MergeableDocument
MergeablePartsContainer
struct AssignableDocument
An assignable document is an augmented PDF that allows teachers to mark up the PDF with
the intention of students taking the assessment.
protocol Assignable
Accessing work documents
Default Implementations
Relationships
Conforms To
See Also
Assignable document


## Page 13

Documents conforming to this protocol can be assigned to a user.


## Page 14

func assign(to: AnyUserIdentity) throws -> AssignedWorkDocument
Assign this document to a user.
Required Default implementation provided.
Deprecated
func assign(to: some UserIdentity) throws -> AssignedWorkDocument
Assign this document to a user.
Required Default implementation provided.
Deprecated
func makeAssignedWorkDocument() throws -> AssignedWorkDocument
Create a new instance of an AssignedWorkDocument.
Required
func makeAssignedWorkDocument(id: String) throws -> AssignedWorkDocumen
Create a new instance of an AssignedWorkDocument.
Topics
Assigning a document
Instance Methods
Assignables / Assignable
Protocol
Assignable
Documents conforming to this protocol can be assigned to a user.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 15

Required
AssignableDocument
struct AssignableDocument
An assignable document is an augmented PDF that allows teachers to mark up the PDF with
the intention of students taking the assessment.
struct AssignedWorkDocument
An assigned work document is a document that contains taker and scorer markup specific to
a taker. It also contains a copy of the assignable document upon which it is based.
Relationships
Conforming Types
See Also
Assignable document


