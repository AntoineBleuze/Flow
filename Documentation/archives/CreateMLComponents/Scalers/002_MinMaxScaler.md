# 002_MinMaxScaler.pdf

## Page 1

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


## Page 2

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


