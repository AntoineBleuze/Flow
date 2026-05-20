# Tabular adaptors.pdf

## Page 1

init(Estimator, annotationColumnID: ColumnID<Annotation>)
Creates a tabular estimator supervised adaptor.
var annotationColumnID: ColumnID<Annotation>
The annotation column identifier.
let estimator: Estimator
The wrapped estimator.
func encode(Estimator.Transformer, to: inout any EstimatorEncoder)
throws
Encodes a fitted transformer.
Topics
Creating an adaptor
Getting the properties
Encoding and decoding
Create ML Components / TabularEstimatorToSupervisedAdaptor
Structure
TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func decode(from: inout any EstimatorDecoder) throws -> Estimator.
Transformer
Decodes a previously fitted transformer.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> Estimator.Transformer
Returns the tabular transformer fitted using the provided tabular estimator.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, SupervisedTabularEstimator
struct TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
struct TabularTransformerToUpdatableEstimatorAdaptor
An updatable tabular estimator that always returns a predefined transformer.
struct UpdatableTabularEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable tabular estimator as an updatable supervised tabular
estimator.
Fitting
Relationships
Conforms To
See Also
Tabular adaptors


## Page 3

init(Transformer)
Creates a trivial tabular estimator.
let transformer: Transformer
A pre-defined tabular transformer.
func encode(Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this tabular estimator uses a pre-defined tabular transformer.
func decode(from: inout any EstimatorDecoder) throws -> Transformer
Returns the pre-defined tabular transformer.
Topics
Creating an estimator
Getting the transformer
Encoding and decoding
Fitting
Create ML Components / TabularTransformerToEstimatorAdaptor
Structure
TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 4

func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
Transformer
Returns the pre-defined tabular transformer.
Sendable, SendableMetatype, TabularEstimator
struct TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
struct TabularTransformerToUpdatableEstimatorAdaptor
An updatable tabular estimator that always returns a predefined transformer.
struct UpdatableTabularEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable tabular estimator as an updatable supervised tabular
estimator.
Relationships
Conforms To
See Also
Tabular adaptors


## Page 5

init(Transformer)
Creates an updatable tabular estimator from a tabular transformer.
func makeTransformer() -> Transformer
Creates a default-initialized transformer suitable for incremental fitting.
let transformer: Transformer
A pre-defined transformer.
Topics
Creating an estimator
Creating a default transformer
Getting the transformer
Encoding and decoding
Create ML Components / TabularTransformerToUpdatableEstimatorAdaptor
Structure
TabularTransformerToUpdatableEstimator
Adaptor
An updatable tabular estimator that always returns a predefined transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 6

func encode(Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> Transformer
Returns the pre-defined transformer.
func encodeWithOptimizer(Transformer, to: inout any EstimatorEncoder)
throws
Does nothing since this estimator uses a pre-defined transformer.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Transformer
Returns the pre-defined transformer.
func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
Transformer
Returns the pre-defined transformer.
func update(inout Transformer, with: DataFrame, eventHandler: Event
Handler?) async throws
Does nothing since this estimator uses a pre-defined transformer.
Sendable
SendableMetatype
TabularEstimator
UpdatableTabularEstimator
Fitting
Relationships
Conforms To
See Also
Tabular adaptors


## Page 7

struct TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
struct TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
struct UpdatableTabularEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable tabular estimator as an updatable supervised tabular
estimator.


## Page 8

init(Estimator, annotationColumnID: ColumnID<Annotation>)
Creates an updatable tabular estimator supervised adaptor.
var annotationColumnID: ColumnID<Annotation>
The annotation column identifier.
let estimator: Estimator
The wrapped estimator.
func encode(UpdatableTabularEstimatorToSupervisedAdaptor<Estimator,
Annotation>.Transformer, to: inout any EstimatorEncoder) throws
Topics
Creating an adaptor
Getting the properties
Encoding and decoding
Create ML Components / UpdatableTabularEstimatorToSupervisedAdaptor
Structure
UpdatableTabularEstimatorToSupervised
Adaptor
An adaptor that exposes an updatable tabular estimator as an updatable
supervised tabular estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 9

Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> UpdatableTabula
EstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
Returns the pre-defined transformer.
func encodeWithOptimizer(UpdatableTabularEstimatorToSupervisedAdaptor<
Estimator, Annotation>.Transformer, to: inout any EstimatorEncoder)
throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableTabularEstimatorToSupervisedAdaptor<Estimator, Annotation>.
Transformer
Reads the encoded transformer and optimizer.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> UpdatableTabularEstimatorToSupervisedAdaptor<
Estimator, Annotation>.Transformer
Fits a transformer to a data frame.
func makeTransformer() -> Estimator.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update(inout UpdatableTabularEstimatorToSupervisedAdaptor<Estimato
, Annotation>.Transformer, with: DataFrame, eventHandler: EventHandler?
async throws
Updates a transformer with a new data frame containing examples.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable
SendableMetatype
Fitting
Relationships
Conforms To


## Page 10

SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
struct TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
struct TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
struct TabularTransformerToUpdatableEstimatorAdaptor
An updatable tabular estimator that always returns a predefined transformer.
See Also
Tabular adaptors


