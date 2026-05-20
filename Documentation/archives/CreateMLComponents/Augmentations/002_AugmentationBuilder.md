# 002_AugmentationBuilder.pdf

## Page 1

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


## Page 2

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


