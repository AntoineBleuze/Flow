# 001_ImputeTransformer.pdf

## Page 1

init(value: Element)
Creates an impute transformer.
var value: Element
Impute value used to replace missing values.
func applied(to: Element?, eventHandler: EventHandler?) -> Element
Imputes a single input.
Topics
Creating a transformer
Getting the impute value
Performing the transformation
Relationships
Create ML Components / ImputeTransformer
Structure
ImputeTransformer
A transformer that replaces missing values with a pre-defined value.
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
struct LinearTransformer
A transformer that runs an input through a scale and offset.
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
A transformer that unwraps optional elements and throws when encountering missing values
Conforms To
See Also
Preprocessors


