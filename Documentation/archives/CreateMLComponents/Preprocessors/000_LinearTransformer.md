# 000_LinearTransformer.pdf

## Page 1

init(scale: Element, offset: Element)
Creates a linear transformer.
var offset: Element
The amount to be offset after scaling.
var scale: Element
The amount to be scaled.
func applied(to:eventHandler:)
Scales an input.
Topics
Creating a regressor
Getting the properties
Performing the transformation
Create ML Components / LinearTransformer
Structure
LinearTransformer
A transformer that runs an input through a scale and offset.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Copyable
CustomDebugStringConvertible
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Transformer
struct ImputeTransformer
A transformer that replaces missing values with a pre-defined value.
struct OneHotEncoder
An estimator that encodes categorical values to an integer array.
struct OrdinalEncoder
An ordinal encoder estimator encodes categorical values to ordinal integer values.
struct NumericImputer
An estimator that replaces missing values in the numeric input.
struct Reshaper
A transformer that reshapes a shaped array.
struct CategoricalImputer
An estimator that replaces missing values in the categorical input.
struct OptionalUnwrapper
Relationships
Conforms To
See Also
Preprocessors


## Page 3

A transformer that unwraps optional elements and throws when encountering missing values


