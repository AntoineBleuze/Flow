# 000_Transformer.pdf

## Page 1

func applied(to: Self.Input, eventHandler: EventHandler?) async throws 
> Self.Output
Performs the transformation on a single input.
Required Default implementations provided.
func adaptedAsAnnotatedFeatureTransformer<Annotation>(annotationType:
Annotation.Type) -> some Transformer<AnnotatedFeature<Self.Input,
Annotation>, AnnotatedFeature<Self.Output, Annotation>>
Returns an annotated-feature transformer that transforms the features using this transforme
while leaving the annotations unchanged.
func adaptedAsAnnotatedPredictionTransformer<Annotation>(annotationType
Annotation.Type) -> some Transformer<AnnotatedPrediction<Self.Input,
Annotation>, AnnotatedPrediction<Self.Output, Annotation>>
Returns an annotated-prediction transformer that transforms the predictions using this
transformer while leaving the annotations unchanged.
func adaptedAsEstimator() -> TransformerToEstimatorAdaptor<Self>
Exposes this transformer as a trivial estimator.
Topics
Applying and adapting
Create ML Components / Transformer
Protocol
Transformer
A transformer that takes an input and produces an output.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func adaptedAsRandomTransformer() -> some RandomTransformer<Self.Input,
Self.Output>
Returns a random transformer wrapping a transformer.
func adaptedAsTemporal()
Exposes this transformer as a temporal transformer.
func adaptedAsUpdatableEstimator() -> TransformerToUpdatableEstimator
Adaptor<Self>
Exposes this transformer as a trivial estimator.
associatedtype Input
The input type.
Required
associatedtype Output
The output type.
Required
func appending(_:)
Composes this transformer with an annotated-feature transformer.
func callAsFunction(_:eventHandler:)
Performs the transformation on a single input.
func prediction(from:)
Performs a prediction from a single input.
func prediction<S, Annotation>(from: S, eventHandler: EventHandler?)
async throws -> [AnnotatedPrediction<Self.Output, Annotation>]
Performs a prediction on a sequence of annotated inputs.
func export(to: URL) throws
Exports this transformer as a CoreML model.
Appending
Transforming and predicting
Exporting


## Page 3

func export(to: URL, metadata: ModelMetadata) throws
Exports this transformer as a CoreML model with userInfo.
Classifier
ImageFeatureExtractor
Regressor
TabularTransformer
AudioConvertingTransformer
AudioReader
ColumnConcatenator
ColumnSelectorTransformer
ComposedTabularTransformer
ComposedTransformer
DateFeatureExtractor
FullyConnectedNetworkClassifierModel
FullyConnectedNetworkMultiLabelClassifierModel
FullyConnectedNetworkRegressorModel
HumanBodyActionPeriodPredictor
HumanBodyPoseExtractor
HumanHandPoseExtractor
ImageBlur
ImageColorTransformer
ImageCropper
ImageExposureAdjuster
ImageFeaturePrint
ImageFlipper
ImageReader
ImageRotator
ImageScaler
ImputeTransformer
JointsSelector
LinearRegressorModel
LinearTimeSeriesForecaster.Model
Relationships
Inherited By
Conforming Types


## Page 4

Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LinearTransformer
LogisticRegressionClassifierModel
MLModelClassifierAdaptor
MLModelImageFeatureExtractor
MLModelRegressorAdaptor
MLModelTransformerAdaptor
MaxAbsScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
MinMaxScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
MultivariateLinearRegressor.Model
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
NormalizationScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
OneHotEncoder.Transformer
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
OptionalUnwrapper
OrdinalEncoder.Transformer
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
PoseSelector
RandomImageNoiseGenerator
Reshaper
RobustScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
StandardScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
TimeSeriesClassifier.Model
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
TreeClassifierModel
TreeRegressorModel
VideoReader
See Also
Protocols


## Page 5

protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 6



