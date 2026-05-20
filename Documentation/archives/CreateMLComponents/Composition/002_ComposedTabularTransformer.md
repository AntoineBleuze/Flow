# 002_ComposedTabularTransformer.pdf

## Page 1

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


## Page 2

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


