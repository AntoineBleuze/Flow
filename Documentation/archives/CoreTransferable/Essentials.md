# Essentials.pdf

## Page 1

To conform to the Transferable protocol, implement the transferRepresentation
property. For example, an image editing app’s layer type might conform to Transferable to let
people drag and drop image layers to reorder them within a document.
The following shows how you can extend ImageDocumentLayer to conform to Transferable
Overview
Core Transferable / Transferable
Protocol
Transferable
A protocol that describes how a type interacts with transport APIs such as drag
and drop or copy and paste.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

When people drag and drop a layer within the app or onto another app that recognizes the custom
layer content type, the app uses the first representation. When people drag and drop the layer
onto a different image editor, it’s likely that the editor recognizes the PNG file type. The second
transfer representation adds support for PNG files.
The following declares the custom layer uniform type identifier:
Important
If your app declares custom uniform type identifiers, include corresponding entries in the app’s
Info.plist. For more information, see Defining file and data types for your app.
If one of your existing types conforms to Codable, Transferable automatically handles
conversion to and from Data. The following declares a simple Note structure that’s Codable an
an extension to make it Transferable:
To ensure compatibility with other apps that don’t know about the custom note type identifier, th
following adds an additional transfer representation that converts the note to text.


## Page 3

The order of the representations in the transfer representation matters; place the representation
that most accurately represents your type first, followed by a sequence of more compatible but
less preferable representations.
static var transferRepresentation: Self.Representation
The representation used to import and export the item.
Required
associatedtype Representation : TransferRepresentation
The type of the representation used to import and export the item.
Required
init(importing: URL, contentType: UTType?) async throws
Using the type’s Transferable conformance implementation, instantiates a value from the
given file.
init(importing: Data, contentType: UTType?) async throws
Using the type’s Transferable conformance implementation, instantiates a value from
given data.
var suggestedFilename: String?
A suggested filename of a Transferable value.
func export(to: URL, contentType: UTType?) async throws -> URL
Topics
Implementing a transfer representation
Initializers
Instance Properties
Instance Methods


## Page 4

Using the type’s Transferable conformance implementation, exports a value by writing it 
a provided destination directory.
func exported(as: UTType?) async throws -> Data
Using the type’s Transferable conformance implementation, exports a value as binary
data.
func exportedContentTypes(TransferRepresentationVisibility) -> [UTType]
Content types supported by a given value’s Transferable conformance for export (like
drag or copy).
func importedContentTypes() -> [UTType]
Content types supported by a given value’s Transferable conformance for import (like
drop or paste).
func withExportedFile<Result>(contentType: UTType?, fileHandler: (URL)
async throws -> Result) async throws -> Result
Using the type’s Transferable conformance implementation, exports a value by writing it 
disk and removes when not needed.
static func exportedContentTypes(visibility: TransferRepresentation
Visibility) -> [UTType]
The types that the instance of a Transferable is able to provide a representation for.
static func importedContentTypes() -> [UTType]
Content types statically supported by the Transferable conformance of the type for impo
(like drop or paste).
Sendable, SendableMetatype
Type Methods
Relationships
Inherits From
See Also


## Page 5

protocol TransferRepresentation
A declarative description of the process of importing and exporting a transferable item.
Choosing a transfer representation for a model type
Define a custom representation for your data using a combination of built-in types.
Essentials


## Page 6

Combine multiple existing transfer representations to compose a single transfer representation th
describes how to transfer an item in multiple scenarios.
The following shows a Greeting type that transfers both as a Codable type and by proxy
through its message string.
Overview
Core Transferable / TransferRepresentation
Protocol
TransferRepresentation
A declarative description of the process of importing and exporting a transferable
item.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

var body: Self.Body
A builder expression that describes the process of importing and exporting an item.
Required
associatedtype Body : TransferRepresentation
The transfer representation for the item.
Required
associatedtype Item : Transferable
The type of the item that’s being transferred.
Required
func exportingCondition((Self.Item) -> Bool) -> _ConditionalTransfer
Representation<Self>
Prevents the system from exporting an item if it does not meet the supplied condition.
func visibility(TransferRepresentationVisibility) -> some Transfer
Representation<Self.Item>
Specifies the kinds of apps and processes that can see an item in transit.
func suggestedFileName(String) -> some TransferRepresentation<Self.Item
Provides a filename to use if the receiver chooses to write the item to disk.
func suggestedFileName((Self.Item) -> String?) -> some Transfer
Representation<Self.Item>
Provides a filename to use if the receiver chooses to write the item to disk.
Topics
Implementing a transfer representation
Configuring exports
Controlling visibility
Instance Methods


## Page 8

Sendable, SendableMetatype
CodableRepresentation
DataRepresentation
FileRepresentation
ProxyRepresentation
TupleTransferRepresentation
protocol Transferable
A protocol that describes how a type interacts with transport APIs such as drag and drop or
copy and paste.
Choosing a transfer representation for a model type
Define a custom representation for your data using a combination of built-in types.
Relationships
Inherits From
Conforming Types
See Also
Essentials


## Page 9

When you enable types in your app to participate in system interactions like sharing or drag and
drop, you get to decide how — and if — you expose your app’s model data to other apps. You can
also control how different parts of your own app respond to receiving your models in different
contexts.
Core Transferable defines a set of transfer representations and modifiers that you can combine
together in different ways to get the behavior that’s right for the different data transfer and sharin
scenarios your app supports. For each of your app’s model types that participate in sharing and
data transfer, pick the built-in transfer representations to represent your model’s data, or define
your own. Then, determine whether your app allows people to share or receive the model’s data, o
both.
Core Transferable defines three main transfer representations: DataRepresentation, File
Representation, and CodableRepresentation. Use DataRepresentation for model
types where the entire model is stored in memory, and use FileRepresentation for types
stored on disk.
You use CodableRepresentation as convenient way to create a transfer representation if you
model is already Codable or you can easily make it Codable. For more information on making a
type Codable, see Encoding and Decoding Custom Types.
Overview
Compose transfer representations
Core Transferable / Choosing a transfer representation for a model type
Article
Choosing a transfer representation for a
model type
Define a custom representation for your data using a combination of built-in type


## Page 10

Important
If you use a CodableRepresentation, you’re often defining a new data type as well. As a
result, include corresponding entries in the app’s Info.plist. For more information, see
Defining file and data types for your app.
Use the ProxyRepresentation type to let another type that conforms to Transferable take
on the responsibility of representing your type. Common types like strings, data, and images are
already Transferable, and you can use them as proxy representations in some common
contexts.
You can combine multiple transfer representations together to support different clients or
scenarios. For example, you can combine a CodableRepresentation with a Proxy
Representation to let your app transfer its Note type to different parts of the app, but still
maintain compatibility with other text editors:
The order of the transfer representations in the transferRepresentation builder matters: th
most preferable representation comes first, followed by the less preferable — but more compatibl
— representations.
You can limit a transfer representation to support only importing, only exporting, or the
representation can support both. Imports occur when your app is the recipient of an item from
sharing, the drop of a drag-and-drop interaction, or the paste from a copy-and-paste interaction.
Conversely, exports occur when people share, copy, or drag an item out of your app. For example
your vector image editing app might support exporting, but choose not to import PNG images.
Transfer representation initializers control whether representations support sharing interactions fo
import and export. The following shows a data representation of tax information that can only
import tax forms and can only output tax returns.
Configure your model type for import or export


## Page 11

protocol Transferable
A protocol that describes how a type interacts with transport APIs such as drag and drop or
copy and paste.
protocol TransferRepresentation
A declarative description of the process of importing and exporting a transferable item.
See Also
Essentials


