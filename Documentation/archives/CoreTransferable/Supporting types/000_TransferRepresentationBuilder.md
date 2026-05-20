# 000_TransferRepresentationBuilder.pdf

## Page 1

static func buildBlock<Content>(Content) -> Content
Passes a single transfer representation to the builder unmodified.
static func buildExpression<R>(R) -> R
Builds a transfer representation from an expression.
static func buildExpression<Encoder, Decoder>(CodableRepresentation<Ite
, Encoder, Decoder>) -> CodableRepresentation<Item, Encoder, Decoder>
Builds an encodable and decodable transfer representation from an expression.
static func buildBlock<C1, C2>(C1, C2) -> TupleTransferRepresentation<
Item, (C1, C2)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3>(C1, C2, C3) -> TupleTransfer
Representation<Item, (C1, C2, C3)>
Topics
Building a transfer representation
Combining transfer representations
Core Transferable / TransferRepresentationBuilder
Structure
TransferRepresentationBuilder
Creates a transfer representation by composing existing transfer representations
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4>(C1, C2, C3, C4) -> TupleTransfer
Representation<Item, (C1, C2, C3, C4)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4, C5>(C1, C2, C3, C4, C5) -> Tuple
TransferRepresentation<Item, (C1, C2, C3, C4, C5)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4, C5, C6>(C1, C2, C3, C4, C5, C6) 
> TupleTransferRepresentation<Item, (C1, C2, C3, C4, C5, C6)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4, C5, C6, C7>(C1, C2, C3, C4, C5,
C6, C7) -> TupleTransferRepresentation<Item, (C1, C2, C3, C4, C5, C6, C
)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C8>(C1, C2, C3, C4,
C5, C6, C7, C8) -> TupleTransferRepresentation<Item, (C1, C2, C3, C4, C
, C6, C7, C8)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C8, C9>(C1, C2, C3,
C4, C5, C6, C7, C8, C9) -> TupleTransferRepresentation<Item, (C1, C2, C
, C4, C5, C6, C7, C8, C9)>
Combines multiple transfer representations into a single transfer representation.
static func buildBlock<C1, C2, C3, C4, C5, C6, C7, C8, C9, C10>(C1, C2,
C3, C4, C5, C6, C7, C8, C9, C10) -> TupleTransferRepresentation<Item, (
C1, C2, C3, C4, C5, C6, C7, C8, C9, C10)>
Combines multiple transfer representations into a single transfer representation.
struct TupleTransferRepresentation
See Also
Supporting types


## Page 3

A wrapper type for tuples that contain transfer representations.


