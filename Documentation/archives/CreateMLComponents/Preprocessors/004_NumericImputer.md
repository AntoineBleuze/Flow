# 004_NumericImputer.pdf

## Page 1

init(NumericImputer<Element>.Strategy)
Creates an imputer with a strategy.
init(constant: Element)
Creates an imputer with a constant value to use when replacing missing values.
var strategy: NumericImputer<Element>.Strategy
The imputation strategy.
func fitted<S>(to: S, eventHandler: EventHandler?) -> NumericImputer<
Element>.Transformer
Fits a numeric imputer to a sequence of elements.
protocol Transformer
Topics
Creating an estimator
Getting the properties
Fitting
Create ML Components / NumericImputer
Structure
NumericImputer
An estimator that replaces missing values in the numeric input.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

A transformer that takes an input and produces an output.
enum Strategy
An imputation strategy.
UpdatableEstimator Implementations
Copyable
Estimator
Sendable
SendableMetatype
UpdatableEstimator
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
struct LinearTransformer
A transformer that runs an input through a scale and offset.
struct ImputeTransformer
A transformer that replaces missing values with a pre-defined value.
struct OneHotEncoder
An estimator that encodes categorical values to an integer array.
struct OrdinalEncoder
An ordinal encoder estimator encodes categorical values to ordinal integer values.
struct Reshaper
Default Implementations
Relationships
Conforms To
See Also
Preprocessors


## Page 3

A transformer that reshapes a shaped array.
struct CategoricalImputer
An estimator that replaces missing values in the categorical input.
struct OptionalUnwrapper
A transformer that unwraps optional elements and throws when encountering missing values


