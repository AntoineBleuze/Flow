# 001_Interacting with virtual content blended with passthrough.pdf

## Page 1

Note
This sample code project is associated with WWDC24 session 10092: Render Metal with
passthrough in visionOS.
Drawing fully immersive content using Metal
Create a fully immersive experience in visionOS using a custom Metal-based rendering
engine.
Rendering hover effects in Metal immersive apps
Change the appearance of a rendered onscreen element when a player gazes at it.
struct CompositorLayer
Overview
See Also
App integration
Compositor Services / Interacting with virtual content blended with passthrough
Sample Code
Interacting with virtual content blended
with passthrough
Present a mixed immersion style space to draw content in a person’s surrounding
and choose how upper limbs appear with respect to rendered content.
Download
visionOS 2.0+
Xcode 16.0+


## Page 2

A type that you use with an immersive space to display fully immersive content using Metal.
protocol CompositorLayerConfiguration
An interface for specifying the texture configurations and rendering behaviors to use with yo
Metal rendering engine.
struct DefaultCompositorLayerConfiguration
A type that configures the layer with the default texture configurations and rendering
behaviors for the current device.


