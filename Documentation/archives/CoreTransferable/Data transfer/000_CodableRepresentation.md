# 000_CodableRepresentation.pdf

## Page 1

Choosing a transfer representation for a model type
Mentioned in
Overview
Core Transferable / CodableRepresentation
Structure
CodableRepresentation
A transfer representation for types that participate in Swift’s protocols for encodin
and decoding.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Important
If your app declares custom uniform type identifiers, include corresponding entries in the app’s
Info.plist. For more information, see Defining file and data types for your app.
init(for: Item.Type, contentType: UTType)
Creates a transfer representation for a given type and type identifier.
init(for: Item.Type, contentType: UTType, encoder: Encoder, decoder:
Decoder)
Creates a transfer representation for a given type with the encoder and decoder you supply.
Sendable, SendableMetatype, TransferRepresentation
struct DataRepresentation
A transfer representation for types that provide their own binary data conversion.
Topics
Creating a transfer representation
Relationships
Conforms To
See Also
Data transfer


