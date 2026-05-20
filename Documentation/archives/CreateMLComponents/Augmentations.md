# Augmentations.pdf

## Page 1

init<RandomTransformer>(probability: Double, () -> RandomTransformer)
Creates an augmentation that applies each transformer randomly in the given order.
let probability: Double
The probability of applying each transformer. Default value is 0.5.
func applied(to: Element, generator: inout some RandomNumberGenerator,
eventHandler: EventHandler?) async throws -> Element
Applies each transformer randomly in order with a probability.
Topics
Creating an augmentation
Getting the probability
Applying transformers
Relationships
Create ML Components / ApplyEachRandomly
Structure
ApplyEachRandomly
Applies each transformer randomly given a probability.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

RandomTransformer
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.
Conforms To
See Also
Augmentations


## Page 3

init<Input>(probability: Double, () -> RandomTransformer)
Creates an apply randomly augmentation.
let probability: Double
The probability of applying the transformer. Default value is 0.5.
func applied(to: RandomTransformer.Input, generator: inout some Random
NumberGenerator, eventHandler: EventHandler?) async throws -> Random
Transformer.Output
Randomly applies a transformer on an input.
Topics
Creating an augmentation
Getting the probability
Applying transformers
Create ML Components / ApplyRandomly
Structure
ApplyRandomly
Randomly applies the transformer with the given probability.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 4

RandomTransformer, Sendable, SendableMetatype
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
Relationships
Conforms To
See Also
Augmentations


## Page 5

An async sequence of augmented elements.


## Page 6

static buildPartialBlock(accumulated:next:)
Builds a partial result by combining an accumulated random transformer and a new random
transformer.
static buildPartialBlock(first:)
Builds a partial result random transformer from the first random transformer.
Sendable, SendableMetatype
Topics
Building augmentations
Relationships
Conforms To
Create ML Components / AugmentationBuilder
Structure
AugmentationBuilder
A series of augmentations.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 7

struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.
See Also
Augmentations


## Page 8

var transformer: RandomTransformer
The transformation applied to each element.
func batches(ofSize: Int, dropsLastPartialBatch: Bool) -> Augmentation
Sequence<Base, RandomTransformer, RandomNumberGenerator, Annotation>.
BatchedSequence
Batches a augmentation sequence.
struct BatchedSequence
An async sequence that batches an augmentation sequence.
Topics
Getting the transformer
Batching an augmentation sequence
Creating an iterator
Create ML Components / AugmentationSequence
Structure
AugmentationSequence
An async sequence of augmented elements.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 9

func makeAsyncIterator() -> AugmentationSequence<Base, RandomTransforme
, RandomNumberGenerator, Annotation>.AsyncIterator
Creates the asynchronous iterator that produces elements of this asynchronous sequence.
typealias Element
The type of element produced by this asynchronous sequence.
AsyncSequence Implementations
AsyncSequence
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Default Implementations
Relationships
Conforms To
See Also
Augmentations


## Page 10

Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.


## Page 11

Augmenting images to expand your training data
init<Input>(generator: RandomNumberGenerator, () -> RandomTransformer)
Creates an augmenter from a random number generator and an augmentation builder.
func applied<S, Annotation>(to: S) -> AugmentationSequence<S, Random
Transformer, RandomNumberGenerator, Annotation>
Applies an augmentation per input of the base sequence.
Mentioned in
Topics
Creating an augmenter
Applying an augmentation
Create ML Components / Augmenter
Structure
Augmenter
An augmenter.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 12

func applied<C, Annotation>(to: C, upsampledBy: Int) -> Upsampled
AugmentationSequence<C, RandomTransformer, RandomNumberGenerator,
Annotation>
Applies an augmentation repeatedly to an array of inputs.
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.
See Also
Augmentations


## Page 13

init<RandomTransformer>(() -> RandomTransformer)
Creates a choose randomly augmentation.
func applied(to: Element, generator: inout some RandomNumberGenerator,
eventHandler: EventHandler?) async throws -> Element
Chooses a random transformer from a list of transformers and applies the chosen transform
RandomTransformer
Topics
Creating an augmentation
Applying transformers
Relationships
Conforms To
Create ML Components / ChooseRandomly
Structure
ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 14

struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.
See Also
Augmentations


## Page 15

init(scale: ClosedRange<Double>, aspectRatio: Double?)
Creates an augmentation that crops an input image at a random location with a scale that
indicates the lower and upper bounds to randomly scale the height and width of the image.
The range must be between 0 and 1.
init(targetSize: CGSize)
Creates an augmentation that crops an input image at a random location to the specified
target size.
init(targetWidth: Double, targetHeight: Double)
Creates an augmentation that crops an input image at a random location to the specified
target width and height.
func applied(to: CIImage, generator: inout some RandomNumberGenerator,
eventHandler: EventHandler?) async throws -> CIImage
Randomly crops an image at a random location of a given size.
Topics
Creating an image cropper
Performing the augmentation
Create ML Components / RandomImageCropper
Structure
RandomImageCropper
Crops an image at a random location.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 16

RandomTransformer, Sendable, SendableMetatype
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
Relationships
Conforms To
See Also
Augmentations


## Page 17

An async sequence of augmented elements.


## Page 18

init<RandomTransformer>(() -> RandomTransformer)
Creates a random shuffle augmentation.
func applied(to: Element, generator: inout some RandomNumberGenerator,
eventHandler: EventHandler?) async throws -> Element
Apply transformations in a random order.
RandomTransformer
Topics
Creating a transformer
Performing the transformation
Relationships
Conforms To
Create ML Components / ShuffleRandomly
Structure
ShuffleRandomly
Apply transformations in a random order.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 19

struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.
See Also
Augmentations


## Page 20

Augmenting images to expand your training data
The parameter is chosen from a continuous uniform distribution in the specified range.
Note that a new transformer is created every time this transformer is applied. This may cause
performance issues if the embedded transformer creation is costly.
init<Input>(range: ClosedRange<Parameter>, (Parameter) -> Random
Transformer)
Creates a Random Parameter transformer.
Mentioned in
Overview
Topics
Creating a transformer
Create ML Components / UniformRandomFloatingPointParameter
Structure
UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 21

var range: ClosedRange<Parameter>
The range of a random number to use as input to the transformer.
func applied(to: RandomTransformer.Input, generator: inout some Random
NumberGenerator, eventHandler: EventHandler?) async throws -> Random
Transformer.Output
Performs the random apply operation on the input.
RandomTransformer
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
Getting the range
Applying
Relationships
Conforms To
See Also
Augmentations


## Page 22

An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.


## Page 23

The parameter is chosen from a discrete uniform distribution in the specified range.
Note that a new transformer is created every time this transformer is applied. This may cause
performance issues if the embedded transformer creation is costly.
init(range:_:)
Creates a Random Parameter transformer.
var range: Range<Parameter>
The range of a random number to use as input to the transformer.
Overview
Topics
Creating a transformer
Getting the range
Create ML Components / UniformRandomIntegerParameter
Class
UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 24

func applied(to: RandomTransformer.Input, generator: inout some Random
NumberGenerator, eventHandler: EventHandler?) async throws -> Random
Transformer.Output
Performs the random apply operation on the input.
RandomTransformer
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Applying
Relationships
Conforms To
See Also
Augmentations


## Page 25

Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.


## Page 26

let transformer: RandomTransformer
The transformation applied to each element.
func makeAsyncIterator() -> UpsampledAugmentationSequence<Base, Random
Transformer, RandomNumberGenerator, Annotation>.AsyncIterator
Creates the asynchronous iterator that produces elements of this asynchronous sequence.
typealias Element
The type of element produced by this asynchronous sequence.
Topics
Getting the transformer
Creating an iterator
Default Implementations
Create ML Components / UpsampledAugmentationSequence
Structure
UpsampledAugmentationSequence
An async sequence of augmented elements.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 27

AsyncSequence Implementations
AsyncSequence
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct AugmentationBuilder
A series of augmentations.
struct AugmentationSequence
An async sequence of augmented elements.
struct Augmenter
An augmenter.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Relationships
Conforms To
See Also
Augmentations


## Page 28

Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.


