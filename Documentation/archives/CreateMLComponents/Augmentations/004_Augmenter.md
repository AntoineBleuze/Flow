# 004_Augmenter.pdf

## Page 1

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


## Page 2

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


