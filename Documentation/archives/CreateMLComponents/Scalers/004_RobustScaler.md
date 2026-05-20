# 004_RobustScaler.pdf

## Page 1

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


## Page 2

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


