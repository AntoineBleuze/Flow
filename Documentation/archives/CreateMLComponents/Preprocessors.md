# Preprocessors.pdf

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


## Page 4

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


## Page 5

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


## Page 6

The encoded array has an element count equal to the number of categories to encode. The
encoded array for a given category has repeating zero values except at one index where the value
is 1.
init()
Creates a one-hot encoding estimator.
func fitted<S>(to: S, eventHandler: EventHandler?) throws -> OneHot
Encoder<Category>.Transformer
Fits a one-hot encoder to a sequence of categories.
Overview
Topics
Creating the estimator
Fitting
Default Implementations
Create ML Components / OneHotEncoder
Structure
OneHotEncoder
An estimator that encodes categorical values to an integer array.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 7

Estimator Implementations
UpdatableEstimator Implementations
Copyable
Estimator
Sendable
SendableMetatype
UpdatableEstimator
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
struct LinearTransformer
A transformer that runs an input through a scale and offset.
struct ImputeTransformer
A transformer that replaces missing values with a pre-defined value.
struct OrdinalEncoder
An ordinal encoder estimator encodes categorical values to ordinal integer values.
struct NumericImputer
An estimator that replaces missing values in the numeric input.
struct Reshaper
A transformer that reshapes a shaped array.
struct CategoricalImputer
An estimator that replaces missing values in the categorical input.
Relationships
Conforms To
See Also
Preprocessors


## Page 8

struct OptionalUnwrapper
A transformer that unwraps optional elements and throws when encountering missing values


## Page 9

init()
Creates an ordinal encoding estimator.
func fitted<S>(to: S, eventHandler: EventHandler?) throws -> Ordinal
Encoder<Category>.Transformer
Fits an ordinal encoder to a sequence of categories.
Estimator Implementations
UpdatableEstimator Implementations
Topics
Creating an encoder
Fitting
Default Implementations
Relationships
Create ML Components / OrdinalEncoder
Structure
OrdinalEncoder
An ordinal encoder estimator encodes categorical values to ordinal integer values
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 10

Copyable
Estimator
Sendable
SendableMetatype
UpdatableEstimator
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
struct LinearTransformer
A transformer that runs an input through a scale and offset.
struct ImputeTransformer
A transformer that replaces missing values with a pre-defined value.
struct OneHotEncoder
An estimator that encodes categorical values to an integer array.
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


## Page 11

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


## Page 12

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


## Page 13

A transformer that reshapes a shaped array.
struct CategoricalImputer
An estimator that replaces missing values in the categorical input.
struct OptionalUnwrapper
A transformer that unwraps optional elements and throws when encountering missing values


## Page 14

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


## Page 15

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


## Page 16

struct OptionalUnwrapper
A transformer that unwraps optional elements and throws when encountering missing values


## Page 17

init(CategoricalImputer<Element>.Strategy)
Creates an imputer with a strategy.
init(constant: Element)
Creates an imputer with a constant value to use when replacing missing values.
var strategy: CategoricalImputer<Element>.Strategy
The imputation strategy.
func fitted<S>(to: S, eventHandler: EventHandler?) -> CategoricalImpute
<Element>.Transformer
Fits a categorical imputer to a sequence of elements.
protocol Transformer
A transformer that takes an input and produces an output.
Topics
Creating an estimator
Getting the properties
Fitting
Create ML Components / CategoricalImputer
Structure
CategoricalImputer
An estimator that replaces missing values in the categorical input.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 18

enum Strategy
An imputation strategy.
Copyable
CustomDebugStringConvertible
Estimator
Sendable
SendableMetatype
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
struct Reshaper
A transformer that reshapes a shaped array.
struct OptionalUnwrapper
Relationships
Conforms To
See Also
Preprocessors


## Page 19

A transformer that unwraps optional elements and throws when encountering missing values


## Page 20

init()
Creates a transformer that unwraps an optional element or throws if the value is nil.
func applied(to: Element?, eventHandler: EventHandler?) throws ->
Element
Unwraps an optional element or throws if the value is nil.
Sendable, SendableMetatype, Transformer
Topics
Creating a transformer
Performing the transformation
Relationships
Conforms To
Create ML Components / OptionalUnwrapper
Structure
OptionalUnwrapper
A transformer that unwraps optional elements and throws when encountering
missing values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 21

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
struct Reshaper
A transformer that reshapes a shaped array.
struct CategoricalImputer
An estimator that replaces missing values in the categorical input.
See Also
Preprocessors


