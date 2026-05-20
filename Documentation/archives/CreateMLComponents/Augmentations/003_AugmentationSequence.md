# 003_AugmentationSequence.pdf

## Page 1

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


## Page 2

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


## Page 3

Crops an image at a random location.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
struct UpsampledAugmentationSequence
An async sequence of augmented elements.


