# 008_UniformRandomFloatingPointParameter.pdf

## Page 1

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


## Page 2

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


## Page 3

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


