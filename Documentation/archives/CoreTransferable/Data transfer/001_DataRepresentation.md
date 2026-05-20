# 001_DataRepresentation.pdf

## Page 1

Choosing a transfer representation for a model type
Use this transfer representation if your model is stored in memory. For example, a drawing app
might have a notion of a layer that can be converted to and from a custom binary data format and
also converted to the PNG image type:
You can provide multiple transfer representations for a model type, even if the transfer
representation types are the same. The following shows the ImageDocumentLayer structure
conforming to Transferable with two DataRepresentation instances composed together:
Mentioned in
Overview
Core Transferable / DataRepresentation
Structure
DataRepresentation
A transfer representation for types that provide their own binary data conversion.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

The example drawing app’s custom transfer representation comes first so that apps that know
about the custom transfer representation can use it. The second transfer representation offers
export compatibility with other apps that work with PNG images.
Avoid registering data with the UTType.data content type. Instead, choose a content type that
best describes the data structure. For example, register PDF data with UTType.pdf so the data
can be dragged, shared, or imported to apps that support that data type:
Tip
If a type conforms to Codable, CodableRepresentation might be a more convenient
choice than DataRepresentation.
init(contentType: UTType, exporting: (Item) async throws -> Data,
importing: (Data) async throws -> Item)
Creates a representation that allows transporting an item as binary data.
Topics
Creating a transfer representation


## Page 3

init(importedContentType: UTType, importing: (Data) async throws -> Ite
)
Creates a representation that allows importing an item as binary data.
init(exportedContentType: UTType, exporting: (Item) async throws -> Dat
)
Creates a representation that allows exporting an item as binary data.
Sendable, SendableMetatype, TransferRepresentation
struct CodableRepresentation
A transfer representation for types that participate in Swift’s protocols for encoding and
decoding.
Relationships
Conforms To
See Also
Data transfer


