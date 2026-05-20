# 005_Reshaper.pdf

## Page 1

init(shape: [Int])
Creates a reshape transformer.
var shape: [Int]
The target shape.
func applied<S>(S, eventHandler: EventHandler?) throws -> [MLShapedArra
<Scalar>]
Reshapes a sequence of inputs.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
throws -> MLShapedArray<Scalar>
Topics
Creating a transformer
Getting the shape
Performing the transformation
Create ML Components / Reshaper
Structure
Reshaper
A transformer that reshapes a shaped array.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Reshapes the input.
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Equatable
Sendable
SendableMetatype
Transformer
struct LinearTransformer
A transformer that runs an input through a scale and offset.
struct ImputeTransformer
A transformer that replaces missing values with a pre-defined value.
struct OneHotEncoder
An estimator that encodes categorical values to an integer array.
struct OrdinalEncoder
An ordinal encoder estimator encodes categorical values to ordinal integer values.
struct NumericImputer
An estimator that replaces missing values in the numeric input.
struct CategoricalImputer
An estimator that replaces missing values in the categorical input.
Relationships
Conforms To
See Also
Preprocessors


## Page 3

struct OptionalUnwrapper
A transformer that unwraps optional elements and throws when encountering missing values


