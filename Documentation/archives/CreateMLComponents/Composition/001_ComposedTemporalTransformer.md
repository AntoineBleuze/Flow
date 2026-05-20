# 001_ComposedTemporalTransformer.pdf

## Page 1

The inner transformer’s output must match the outer transformer input. The result of this
transformer is equivalent to invoking outer(inner(x)) on an input x,
init(Inner, Outer)
Creates a transformer composition from two temporal transformers.
var inner: Inner
The inner transformer.
var outer: Outer
The outer transformer.
Overview
Topics
Creating the transformer
Getting the properties
Create ML Components / ComposedTemporalTransformer
Structure
ComposedTemporalTransformer
A temporal transformer that composes two temporal transformers by applying
them one after the other.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func applied<S>(to: S, eventHandler: EventHandler?) async throws ->
ComposedTemporalTransformer<Inner, Outer>.OutputSequence
Performs the composed transformation on an input sequence.
typealias Intermediate
The intermediate type.
typealias Input
The input type.
typealias Output
The output type.
typealias OutputSequence
The output sequence type.
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Equatable
Sendable
SendableMetatype
TemporalTransformer
struct ComposedTransformer
Applying a transformer
Relationships
Conforms To
See Also
Composition


## Page 3

A transformer that composes two transformers by applying them one after the other.
struct ComposedTabularTransformer
A transformer that composes two tabular transformers by applying them one after the other


