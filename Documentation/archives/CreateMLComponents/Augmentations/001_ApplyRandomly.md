# 001_ApplyRandomly.pdf

## Page 1

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


## Page 2

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


## Page 3

An async sequence of augmented elements.


