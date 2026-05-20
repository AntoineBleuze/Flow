# 005_SupervisedEstimator.pdf

## Page 1

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
associatedtype Annotation : Equatable
The annotation type.
Required
associatedtype Transformer : Transformer
The transformer type created by this estimator.
Required
func appending(_:)
Composes this supervised estimator with an estimator.
Topics
Reading and writing
Appending
Create ML Components / SupervisedEstimator
Protocol
SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func adaptedAsTemporal() -> SupervisedEstimatorToTemporalAdaptor<Self>
Exposes this supervised estimator as a temporal supervised estimator.
Deprecated
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> Self.Transformer
Fits a transformer to a sequence of examples.
Required Default implementation provided.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> Self.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
Required Default implementation provided.
func fitted<Input>(to: Input) async throws -> Self.Transformer
func fitted<Input, Validation>(to: Input, validateOn: Validation) async
throws -> Self.Transformer
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required Default implementation provided.
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required Default implementation provided.
UpdatableSupervisedEstimator
Adapting and fitting
Encoding and decoding
Relationships
Inherited By
Conforming Types


## Page 3

EstimatorToSupervisedAdaptor
FullyConnectedNetworkClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
FullyConnectedNetworkMultiLabelClassifier
FullyConnectedNetworkRegressor
LinearRegressor
LinearTimeSeriesForecaster
LogisticRegressionClassifier
MultivariateLinearRegressor
PreprocessingSupervisedEstimator
PreprocessingUpdatableSupervisedEstimator
TimeSeriesClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
UpdatableEstimatorToSupervisedAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
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
See Also
Protocols


## Page 4

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


