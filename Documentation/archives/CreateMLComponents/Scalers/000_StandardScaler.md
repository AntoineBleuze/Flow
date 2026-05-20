# 000_StandardScaler.pdf

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


