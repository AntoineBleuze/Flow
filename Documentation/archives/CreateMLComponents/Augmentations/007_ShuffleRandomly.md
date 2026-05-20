# 007_ShuffleRandomly.pdf

## Page 1

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


## Page 2

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


