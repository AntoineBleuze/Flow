# 003_NormalizationScaler.pdf

## Page 1

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


## Page 2

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


