# 001_MaxAbsScaler.pdf

## Page 1

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


## Page 2

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


