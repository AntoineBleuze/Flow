# 003_CompositorLayer.pdf

## Page 1

Drawing fully immersive content using Metal
Use a CompositorLayer to specify the content of an ImmersiveSpace when you want to
render that content yourself using Metal. When you present a space with this content, Composito
Services creates a LayerRenderer type for you to use with your rendering code. The layer
renderer provides configuration details, timing information, and the Metal types and information
you need to configure your rendering loop and manage the rendering process.
The following example shows a ImmersiveSpace that uses a CompositorLayer to specify its
content. Use the closure for the CompositorLayer to set up and start your Metal rendering cod
In this example, Compositor Services creates the layer using a default set of Metal configuration
options. To customize the configuration of your Metal rendering environment, pass a custom
CompositorLayerConfiguration type to your CompositorLayer at initialization time.
Mentioned in
Overview
Compositor Services / CompositorLayer
Structure
CompositorLayer
A type that you use with an immersive space to display fully immersive content
using Metal.
CompositorServices
SwiftUI
macOS 26.0+
visionOS 1.0+
macOS
visionOS


## Page 2

For more information about how to set up and start your Metal rendering engine, see Drawing full
immersive content using Metal.
init(configuration: any CompositorLayerConfiguration, renderer: (Layer
Renderer) -> Void)
Creates a CompositorLayer instance.
init(configuration: any CompositorLayerConfiguration, renderer: (Layer
Renderer, NWEndpoint?) -> Void)
init(configuration: any CompositorLayerConfiguration, renderer: (Layer
Renderer) -> Void, Void)
Deprecated
CompositorContent
Copyable
ImmersiveSpaceContent
Sendable
Topics
Initializers
Relationships
Conforms To


## Page 3

SendableMetatype
Drawing fully immersive content using Metal
Create a fully immersive experience in visionOS using a custom Metal-based rendering
engine.
Interacting with virtual content blended with passthrough
Present a mixed immersion style space to draw content in a person’s surroundings, and
choose how upper limbs appear with respect to rendered content.
Rendering hover effects in Metal immersive apps
Change the appearance of a rendered onscreen element when a player gazes at it.
protocol CompositorLayerConfiguration
An interface for specifying the texture configurations and rendering behaviors to use with yo
Metal rendering engine.
struct DefaultCompositorLayerConfiguration
A type that configures the layer with the default texture configurations and rendering
behaviors for the current device.
See Also
App integration


