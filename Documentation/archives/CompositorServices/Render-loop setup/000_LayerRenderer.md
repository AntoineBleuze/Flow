# 000_LayerRenderer.pdf

## Page 1

Drawing fully immersive content using Metal
A layer renderer type creates a bridge between a SwiftUI scene and the Metal code you use to dra
fully immersive experiences. When you present an immersive space with CompositorLayer
content, the system creates a LayerRenderer type and makes it available to the content’s
closure. Use the information in the layer renderer to set up your app’s rendering loop, and to start
drawing frames of content.
Each layer renderer has information that tells the system how to configure the Metal textures and
data types your app needs. Compositor Services provides a default configuration for layers, but
you can customize the configuration as needed. Specify your custom configuration details using
the CompositorLayerConfiguration protocol and pass a type with those details to the
initializer for your immersive space’s content. Use the layer renderer’s capability information to
validate any configuration choices you make.
For information about how to create and configure a layer renderer and use it to run your renderin
loop, see Drawing fully immersive content using Metal.
Mentioned in
Overview
Compositor Services / LayerRenderer
Class
LayerRenderer
A type that provides the Metal types and timing information you need to draw you
content.
macOS 26.0+
visionOS 1.0+


## Page 2

var configuration: LayerRenderer.Configuration
The configuration details for the specified layer.
struct Configuration
A type that stores the texture formats, layout information, and other details you use to
configure your rendering loop code.
struct Capabilities
The color formats, depth formats, and features that you can use to configure your rendering
engine.
var properties: LayerRenderer.Properties
The configured properties of the layer renderer.
struct Properties
A type that describes the organization of the layer renderer’s textures and the relationships
between those textures and the views you use for drawing.
var device: any MTLDevice
The GPU device that the layer renderer uses for drawing operations
var state: LayerRenderer.State
A value that indicates whether the layer renderer is currently visible and ready for you to draw
content.
func waitUntilRunning()
Stops further execution of your code until the layer renderer leaves the paused state.
enum State
Topics
Configuring the layer renderer
Getting the layer renderer properties
Getting the GPU device
Managing the rendering loop


## Page 3

The states of the layer renderer, which tell you how to proceed with drawing operations.
struct Clock
A type that supports operations that require a precise time measurement.
func queryNextFrame() -> LayerRenderer.Frame?
Returns the next frame to use for drawing.
struct Frame
A type that provides access to the timing information and data types you need to render a
single frame of content.
struct Drawable
A type that provides the textures and information you need to draw a frame of content.
var minimumFrameRepeatCount: Int32
The number of additional frames for which the system displays the same content.
var renderQuality: LayerRenderer.RenderQuality
Get the render quality to be used by the drawables.
var defaultRenderQuality: LayerRenderer.RenderQuality
The default render quality used on this platform.
var maxRenderQuality: LayerRenderer.RenderQuality
The max render quality the layer can use when drawing to the drawables.
Defining layer renderer quality
Declare the render quality of your textures to enable high-quality rendering.
struct RenderQuality
Render quality controls the quality which drawing happens at.
Drawing a frame of content
Configuring the frame update rate
Defining quality level
Structures


## Page 4

var commandQueue: any MTL4CommandQueue
Returns the command queue that the layer uses for drawing operations.
var onSpatialEvent: (SpatialEventCollection) -> Void
A closure that receives the spatial events updates from the LayerRenderer
var onSpatialEvent: (SpatialEventCollection) -> Void
A closure that receives the spatial events updates from the LayerRenderer
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
struct Frame
A type that provides access to the timing information and data types you need to render a
single frame of content.
Instance Properties
Relationships
Inherits From
Conforms To
See Also
Render-loop setup


