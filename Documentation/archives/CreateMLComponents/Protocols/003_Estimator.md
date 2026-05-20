# 003_Estimator.pdf

## Page 1

associatedtype Transformer : Transformer
The transformer type created by this estimator.
Required
func appending(_:)
Composes this estimator with another estimator.
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required Default implementation provided.
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required Default implementation provided.
Topics
Getting the properties
Appending
Encoding and decoding
Create ML Components / Estimator
Protocol
Estimator
An estimator that creates a transformer by fitting to a data set.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
func adaptedAsSupervised<Annotation>(annotationType: Annotation.Type) -
EstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this estimator as a supervised estimator.
func adaptedAsTemporal() -> EstimatorToTemporalAdaptor<Self>
Exposes this estimator as a temporal estimator.
Deprecated
func fitted<S>(to: S, eventHandler: EventHandler?) async throws -> Self
Transformer
Fits a transformer to a sequence of examples.
Required
func fitted<S>(to: S) async throws -> Self.Transformer
UpdatableEstimator
CategoricalImputer
MaxAbsScaler
MinMaxScaler
NormalizationScaler
NumericImputer
Reading and writing
Fitting and adapting
Relationships
Inherited By
Conforming Types


## Page 3

OneHotEncoder
OrdinalEncoder
PreprocessingEstimator
PreprocessingUpdatableEstimator
RobustScaler
StandardScaler
TransformerToEstimatorAdaptor
TransformerToUpdatableEstimatorAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
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
See Also
Protocols


## Page 4

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


