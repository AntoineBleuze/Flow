# Composition.pdf

## Page 1

The inner transformer’s output must match the outer transformer input. The result of this
transformer is equivalent to invoking outer(inner(x)) on an input x,
init(Inner, Outer)
Creates a transformer composition from two transformers.
var inner: Inner
The inner transformer.
var outer: Outer
The outer transformer.
Overview
Topics
Creating the transformer
Getting the properties
Create ML Components / ComposedTransformer
Structure
ComposedTransformer
A transformer that composes two transformers by applying them one after the
other.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func applied(to: ComposedTransformer<Inner, Outer>.Input, eventHandler:
EventHandler?) async throws -> ComposedTransformer<Inner, Outer>.Output
Performs the composed transformation on a single input.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Equatable
Sendable
SendableMetatype
Transformer
struct ComposedTemporalTransformer
A temporal transformer that composes two temporal transformers by applying them one afte
the other.
Performing the transformation
Relationships
Conforms To
See Also
Composition


## Page 3

struct ComposedTabularTransformer
A transformer that composes two tabular transformers by applying them one after the other


## Page 4

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


## Page 5

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


## Page 6

A transformer that composes two transformers by applying them one after the other.
struct ComposedTabularTransformer
A transformer that composes two tabular transformers by applying them one after the other


## Page 7

The result of this transformer is equivalent to invoking outer(inner(x)) on an input x,
init(Inner, Outer)
Creates a composed tabular transformer from two tabular transformers.
var inner: Inner
The inner transformer.
var outer: Outer
The outer transformer.
Overview
Topics
Creating the transformer
Getting the properties
Create ML Components / ComposedTabularTransformer
Structure
ComposedTabularTransformer
A transformer that composes two tabular transformers by applying them one afte
the other.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 8

func applied(to: DataFrame, eventHandler: EventHandler?) async throws -
DataFrame
Performs the composed transformation on a single input.
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Equatable
Sendable
SendableMetatype
TabularTransformer
Transformer
struct ComposedTransformer
A transformer that composes two transformers by applying them one after the other.
struct ComposedTemporalTransformer
A temporal transformer that composes two temporal transformers by applying them one afte
the other.
Applying a transformation
Relationships
Conforms To
See Also
Composition


