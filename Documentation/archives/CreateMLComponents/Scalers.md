# Scalers.pdf

## Page 1

init()
Creates a standard scaling estimator.
func fitted<S>(to: S, eventHandler: EventHandler?) throws -> Standard
Scaler<Element>.Transformer
Fits a transformer to a particular input sequence by computing the mean and standard
deviation.
Estimator Implementations
UpdatableEstimator Implementations
Topics
Creating an estimator
Fitting
Default Implementations
Create ML Components / StandardScaler
Structure
StandardScaler
An estimator that standardizes the input by removing the mean and scaling to uni
variance.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Copyable
Estimator
Sendable
SendableMetatype
UpdatableEstimator
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
struct MaxAbsScaler
An estimator that scales the input values so that the maximum absolute value is 1.0.
struct MinMaxScaler
An estimator that scales the input values so that they all lie in a closed range.
struct NormalizationScaler
An estimator that normalizes the input values using a normalization strategy.
struct RobustScaler
An estimator that scales the input using statistics that are robust to outliers.
Relationships
Conforms To
See Also
Scalers


## Page 3

init()
Creates a max abs scaler.
func fitted<S>(to: S, eventHandler: EventHandler?) throws -> MaxAbs
Scaler<Element>.Transformer
Fits a max abs scaler to a sequence of elements.
Estimator Implementations
Topics
Creating an estimator
Fitting
Default Implementations
Relationships
Create ML Components / MaxAbsScaler
Structure
MaxAbsScaler
An estimator that scales the input values so that the maximum absolute value is
1.0.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 4

Estimator, Sendable, SendableMetatype
struct StandardScaler
An estimator that standardizes the input by removing the mean and scaling to unit variance.
struct MinMaxScaler
An estimator that scales the input values so that they all lie in a closed range.
struct NormalizationScaler
An estimator that normalizes the input values using a normalization strategy.
struct RobustScaler
An estimator that scales the input using statistics that are robust to outliers.
Conforms To
See Also
Scalers


## Page 5

init(range: ClosedRange<Element>)
Creates a min max scaler.
var range: ClosedRange<Element>
The desired range of transformed values.
func fitted<S>(to: S, eventHandler: EventHandler?) throws -> MinMax
Scaler<Element>.Transformer
Fits a min max scaler to a sequence of elements.
Topics
Creating an estimator
Getting the properties
Fitting
Default Implementations
Create ML Components / MinMaxScaler
Structure
MinMaxScaler
An estimator that scales the input values so that they all lie in a closed range.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 6

Estimator Implementations
Estimator, Sendable, SendableMetatype
struct StandardScaler
An estimator that standardizes the input by removing the mean and scaling to unit variance.
struct MaxAbsScaler
An estimator that scales the input values so that the maximum absolute value is 1.0.
struct NormalizationScaler
An estimator that normalizes the input values using a normalization strategy.
struct RobustScaler
An estimator that scales the input using statistics that are robust to outliers.
Relationships
Conforms To
See Also
Scalers


## Page 7

init(norm: NormalizationScaler<Element>.NormalizationStrategy)
Creates a normalization scaler.
enum NormalizationStrategy
A normalization strategy.
var norm: NormalizationScaler<Element>.NormalizationStrategy
The normalization strategy.
func fitted<S>(to: S, eventHandler: EventHandler?) throws ->
NormalizationScaler<Element>.Transformer
Fits a normalization scaler to a sequence of elements.
Topics
Creating a scaler
Getting the normalization
Fitting
Create ML Components / NormalizationScaler
Structure
NormalizationScaler
An estimator that normalizes the input values using a normalization strategy.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 8

Estimator Implementations
Estimator, Sendable, SendableMetatype
struct StandardScaler
An estimator that standardizes the input by removing the mean and scaling to unit variance.
struct MaxAbsScaler
An estimator that scales the input values so that the maximum absolute value is 1.0.
struct MinMaxScaler
An estimator that scales the input values so that they all lie in a closed range.
struct RobustScaler
An estimator that scales the input using statistics that are robust to outliers.
Default Implementations
Relationships
Conforms To
See Also
Scalers


## Page 9

init(quantileRange: ClosedRange<Element>)
Creates a robust scaler.
var quantileRange: ClosedRange<Element>
The quantile range used to compute the scale.
func fitted<S>(to: S, eventHandler: EventHandler?) throws -> Robust
Scaler<Element>.Transformer
Fits a robust scaler to a sequence of elements.
Topics
Creating an estimator
Getting the properties
Fitting
Default Implementations
Create ML Components / RobustScaler
Structure
RobustScaler
An estimator that scales the input using statistics that are robust to outliers.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 10

Estimator Implementations
Estimator, Sendable, SendableMetatype
struct StandardScaler
An estimator that standardizes the input by removing the mean and scaling to unit variance.
struct MaxAbsScaler
An estimator that scales the input values so that the maximum absolute value is 1.0.
struct MinMaxScaler
An estimator that scales the input values so that they all lie in a closed range.
struct NormalizationScaler
An estimator that normalizes the input values using a normalization strategy.
Relationships
Conforms To
See Also
Scalers


