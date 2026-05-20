# Render-loop setup.pdf

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


## Page 5

A frame represents a snapshot of your app’s content at a single moment in time. In your rendering
loop, you render your content into static images many times a second to create the illusion of
animation. A LayerRenderer.Frame provides the Metal textures and information you need to
render one of those images.
During each iteration of your app’s rendering loop, call queryNextFrame() to retrieve the next
frame to render. The system manages a finite number of frames and recycles them to maximize
efficiency. You typically draw only one frame at a time, starting work on each new frame only afte
completing the previous frame.
Separate the work you do for each frame into two phases: the update phase and the encode phas
Use the update phase to perform tasks that don’t depend on the current device pose. For examp
you might update your app’s data structures to reflect recent interactions with your content. Use
the submission phase to retrieve the current pose and render the frame’s content using that
information. Each frame provides a LayerRenderer.Drawable type with access to the specific
textures and rendering details for that frame.
Overview
Topics
Getting timing information
Compositor Services / LayerRenderer / LayerRenderer.Frame
Structure
LayerRenderer.Frame
A type that provides access to the timing information and data types you need to
render a single frame of content.
macOS 26.0+
visionOS 1.0+


## Page 6

func predictTiming() -> LayerRenderer.Frame.Timing?
Computes and returns the predicted timing information for the frame.
struct Timing
A type that stores information about a frame’s encoding, rendering, and presentation
deadlines.
func startUpdate()
Notifies Compositor Services that you started updating the app-specific content for the
frame.
func endUpdate()
Notifies Compositor Services that you finished updating the app-specific content you need t
render the frame.
func queryDrawables() -> [LayerRenderer.Drawable]
Returns the array of drawables expected to be used for the given frame. These drawables
each have textures, transforms and timing information for drawing the frame.
func queryDrawable() -> LayerRenderer.Drawable?
Retrieves the frame’s drawable, which contains the textures and drawing environment for the
frame.
Deprecated
func startSubmission()
Notifies Compositor Services that you’re ready to generate the Metal commands to render th
specified frame.
func endSubmission()
Notifies Compositor Services that you finished generating the GPU commands to render the
specified frame.
Reporting frame update times
Getting the drawable environment
Reporting frame submission times
Getting frame-related details


## Page 7

var frameIndex: LayerFrameIndex
The sequential index number of a frame.
typealias LayerFrameIndex
A frame index in the layer’s timeline.
typealias CompositorFrameIndex
The sequential index for a frame in the compositor’s timeline.
init()
Creates an uninitialized frame.
func binocularFrustumMatrix(convention: AxisDirectionConvention,
increaseTangents: SIMD4<Float>, depthRange: SIMD2<Float>) -> matrix
_float4x4
func binocularFrustumMatrixForDrawableTarget(drawableTarget: Layer
Renderer.Drawable.Target, convention: AxisDirectionConvention, increase
Tangents: SIMD4<Float>, depthRange: SIMD2<Float>) -> matrix_float4x4
Returns the transform which can be used for binocular frustum culling. A matrix to convert
between the device coordinate space to normalized device coordinate space. This should be
acquired between starting and submitting a frame. Renderer should not utilize this transform
for actual rendering output.
func drawableTargetViewCount(target: LayerRenderer.Drawable.Target) ->
Int
Returns the number of view in the drawable target.
func monocularFrustumMatrix(convention: AxisDirectionConvention, view
Index: Int, increaseTangents: SIMD4<Float>, depthRange: SIMD2<Float>) -
matrix_float4x4
func monocularFrustumMatrixForDrawableTarget(drawableTarget: Layer
Renderer.Drawable.Target, convention: AxisDirectionConvention, viewInde
: Int, increaseTangents: SIMD4<Float>, depthRange: SIMD2<Float>) ->
matrix_float4x4
Returns the transform which can be used for monocular frustum culling for given view. A
matrix to convert between the device coordinate space to normalized device coordinate spa
Creating a frame
Instance Methods


## Page 8

This should be acquired between starting and submitting a frame. Renderer should not utiliz
this transform for actual rendering output.
BitwiseCopyable
class LayerRenderer
A type that provides the Metal types and timing information you need to draw your content.
Relationships
Conforms To
See Also
Render-loop setup


