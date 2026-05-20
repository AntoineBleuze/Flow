# 000_ApplyEachRandomly.pdf

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


