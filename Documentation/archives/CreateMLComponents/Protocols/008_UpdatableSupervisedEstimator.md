# 008_UpdatableSupervisedEstimator.pdf

## Page 1

func appending(_:)
Composes this updatable estimator with an updatable estimator.
func adaptedAsTemporal() -> UpdatableSupervisedEstimatorToTemporal
Adaptor<Self>
Exposes this supervised estimator as a temporal supervised estimator.
Deprecated
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Required
Topics
Appending
Adapting
Encoding and decoding
Create ML Components / UpdatableSupervisedEstimator
Protocol
UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
func readWithOptimizer(from: URL) throws -> Self.Transformer
Reads the encoded transformer and optimizer from a file.
func writeWithOptimizer(Self.Transformer, to: URL, overwrite: Bool)
throws
Writes the encoded transformer and optimizer to a file.
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
Required Default implementation provided.
func update<InputSequence>(inout Self.Transformer, with: InputSequence)
async throws
SupervisedEstimator
FullyConnectedNetworkClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
Reading and writing
Transforming
Relationships
Inherits From
Conforming Types


## Page 3

FullyConnectedNetworkMultiLabelClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Scalar conforms to Decodable, Scalar conforms to Encodable, Label conforms to Comparable, Label
conforms to Decodable, Label conforms to Encodable, and Label conforms to Hashable.
FullyConnectedNetworkRegressor
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LinearRegressor
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LinearTimeSeriesForecaster
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LogisticRegressionClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
MultivariateLinearRegressor
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
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
See Also
Protocols


## Page 4

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


