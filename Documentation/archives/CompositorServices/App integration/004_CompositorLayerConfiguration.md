# 004_CompositorLayerConfiguration.pdf

## Page 1

Drawing fully immersive content using Metal
If you use a custom configuration for your Metal rendering engine, adopt this protocol in a custom
type and use it to specify the configuration options you need. In your custom type, implement the
makeConfiguration(capabilities:configuration:) method and use it to modify the
default set of rendering options. When specifying your configuration, validate choices against the
actual capabilities of the current device.
For information on how to specify custom configuration options for your rendering engine, see
Drawing fully immersive content using Metal.
Mentioned in
Overview
Topics
Specifying the custom options
Compositor Services / CompositorLayerConfiguration
Protocol
CompositorLayerConfiguration
An interface for specifying the texture configurations and rendering behaviors to
use with your Metal rendering engine.
CompositorServices
SwiftUI
macOS 26.0+
visionOS 1.0+


## Page 2

func makeConfiguration(capabilities: LayerRenderer.Capabilities,
configuration: inout LayerRenderer.Configuration)
Creates and returns a type that contains the rendering options for Compositor Services to us
when configuring a layer.
Required
static var `default`: DefaultCompositorLayerConfiguration
The default configuration options that Compositor Services uses to configure the layer.
DefaultCompositorLayerConfiguration
Drawing fully immersive content using Metal
Create a fully immersive experience in visionOS using a custom Metal-based rendering
engine.
Interacting with virtual content blended with passthrough
Present a mixed immersion style space to draw content in a person’s surroundings, and
choose how upper limbs appear with respect to rendered content.
Rendering hover effects in Metal immersive apps
Change the appearance of a rendered onscreen element when a player gazes at it.
struct CompositorLayer
A type that you use with an immersive space to display fully immersive content using Metal.
struct DefaultCompositorLayerConfiguration
Getting the default options
Relationships
Conforming Types
See Also
App integration


## Page 3

A type that configures the layer with the default texture configurations and rendering
behaviors for the current device.


