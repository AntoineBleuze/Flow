# 007_UpdatableEstimator.pdf

## Page 1

func adaptedAsSupervised<Annotation>(annotationType: Annotation.Type) -
UpdatableEstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this estimator as a supervised estimator.
func adaptedAsTemporal() -> UpdatableEstimatorToTemporalAdaptor<Self>
Exposes this estimator as a temporal estimator.
Deprecated
func appending(_:)
Composes this updatable estimator with another updatable estimator.
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Topics
Adapting
Appending
Encoding and decoding
Create ML Components / UpdatableEstimator
Protocol
UpdatableEstimator
An estimator that can be incrementally updated.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Required
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence)
async throws
Estimator
NumericImputer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
OneHotEncoder
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
OrdinalEncoder
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
PreprocessingUpdatableEstimator
StandardScaler
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
Transforming
Relationships
Inherits From
Conforming Types


## Page 3

TransformerToUpdatableEstimatorAdaptor
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
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
See Also
Protocols


## Page 4

A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


