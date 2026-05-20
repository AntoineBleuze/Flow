# 010_UpsampledAugmentationSequence.pdf

## Page 1

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


## Page 2

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


## Page 3

Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.


