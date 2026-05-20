# 002_RandomTransformer.pdf

## Page 1

func applied(to: Self.Input, generator: inout some RandomNumberGenerato
, eventHandler: EventHandler?) async throws -> Self.Output
Performs the random transformation on a single input.
Required
associatedtype Input
The input type.
Required
associatedtype Output
The output type.
Required
Topics
Performing the transformation
Relationships
Conforming Types
Create ML Components / RandomTransformer
Protocol
RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

ApplyEachRandomly
ApplyRandomly
ChooseRandomly
RandomImageCropper
ShuffleRandomly
UniformRandomFloatingPointParameter
UniformRandomIntegerParameter
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
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
See Also
Protocols


## Page 3

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


