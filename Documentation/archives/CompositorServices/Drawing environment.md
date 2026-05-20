# Drawing environment.pdf

## Page 1

Drawing fully immersive content using Metal
When you draw a frame of content, the frame’s LayerRenderer.Drawable type provides the
actual textures and rendering information you need. Do as much work as possible in advance to
prepare for rendering, and retrieve the LayerRenderer.Drawable only when you’re ready to
start encoding commands into your Metal command buffers. The system recycles frames and the
drawables for efficiency, so if you retrieve the drawable too early, it might not be ready to use.
Use the drawable’s LayerRenderer.Drawable.View instances to determine where to draw
your content in the provided textures. After you finish encoding your content, call encode
Present(commandBuffer:) to add a presentation notification to your command buffer. This
command tells Compositor Services when to display the frame, and is essential for displaying you
frame on time.
Mentioned in
Overview
Topics
Getting the views
Compositor Services / LayerRenderer / LayerRenderer.Drawable
Structure
LayerRenderer.Drawable
A type that provides the textures and information you need to draw a frame of
content.
macOS 26.0+
visionOS 1.0+


## Page 2

var views: [LayerRenderer.Drawable.View]
An array of viewports that tell you how to draw to the drawable’s textures
struct View
A type that provides information on how to render content into the frame’s textures.
var deviceAnchor: DeviceAnchor?
The device position and orientation you used to render the frame.
var colorTextures: [any MTLTexture]
An array of color textures to use to render the current frame.
var depthTextures: [any MTLTexture]
An array of depth textures to use to render the current frame.
func encodePresent(commandBuffer: any MTLCommandBuffer)
Encodes a notification event to the specified command buffer to present the drawable’s
content onscreen.
var rasterizationRateMaps: [any MTLRasterizationRateMap]
The rasterization rate maps to use when rendering the frame.
var flippedRasterizationRateMaps: [any MTLRasterizationRateMap]
The rasterization rate maps that are flipped around the y-axis.
enum AxisDirectionConvention
Constants that indicate the axis and direction to use for a perspective projection matrix.
Accessing the device orientation
Getting the render textures
Enqueueing a command buffer
Getting the rasterization rate map
Getting the projection matrix
Accessing pixel depth information


## Page 3

var depthRange: simd_float2
The distances to the far and near clipping planes from the person viewing the content, in
meters.
var state: LayerRenderer.Drawable.State
The current operational state of a drawable instance.
enum State
The state of ownership for the drawable.
var frameTiming: LayerRenderer.Frame.Timing
The timing information for the drawable’s frame.
var presentationFrameIndex: CompositorFrameIndex
The sequential index of a drawable’s frame.
var target: LayerRenderer.Drawable.Target
Returns a value that indicates the target of the drawable type.
enum Target
The target where the drawable will be displayed/used.
init()
Creates an uninitialized drawable.
struct RenderContext
An object the compositer uses for rendering all effects associated with a layer renderer
drawable.
Managing the state machine
Synchronizing the drawing operation
Retrieving the target
Creating a drawable
Adding a render context


## Page 4

func addRenderContext(commandBuffer: any MTLCommandBuffer) -> Layer
Renderer.Drawable.RenderContext
Adds and returns a render context to a LayerRenderer.Drawable providing a metal
command buffer.
func addRenderContext() -> LayerRenderer.Drawable.RenderContext
Adds and returns a render context to a LayerRenderer.Drawable that draws any conten
required by the compositor.
struct TrackingArea
var isContentCaptureProtected: Bool
Returns whether content capture is protected and it is safe to draw content that should be
protected from capture.
var trackingAreasTextures: [any MTLTexture]
Use the returned texture in your render pipeline to store the tracking areas ID used for hover
effects and indirect gestures. The layer’s texture topology determines the layout and conten
for each texture. The drawable’s views contain information about how those views map to th
textures.
func addTrackingArea(identifier: LayerRenderer.Drawable.TrackingArea.
Identifier) -> LayerRenderer.Drawable.TrackingArea
Returns a tracking area which is create on the drawable’s list of tracking areas.
func computeProjection(convention: AxisDirectionConvention, viewIndex:
Int) -> matrix_float4x4
func encodePresent()
Encodes a notification event to the specified command buffer to present the drawable’s
content onscreen.
Structures
Instance Properties
Instance Methods
Relationships


## Page 5

BitwiseCopyable
struct View
A type that provides information on how to render content into the frame’s textures.
Conforms To
See Also
Drawing environment


## Page 6

Compositor Services provides a view for each distinct render viewpoint. For example, a head-
mounted display typically contains two views: one for each eye. Use the information in the views t
set up your render pass descriptor, or to determine which part of a texture to fill with content.
var textureMap: LayerRenderer.Drawable.View.TextureMap
The texture map for a view.
struct TextureMap
A type that provides details about the textures associated with a view.
var transform: simd_float4x4
The transformation matrix that converts between the device’s coordinate space to the positi
of the view in that space.
Overview
Topics
Getting the view’s texture map
Getting the transformations
Compositor Services
/ LayerRenderer.Drawable / LayerRenderer.Drawable.View
Structure
LayerRenderer.Drawable.View
A type that provides information on how to render content into the frame’s texture
macOS 26.0+
visionOS 1.0+
/


## Page 7

var tangents: simd_float4
The tangent values for the angles you use to determine the planes of the viewing frustum.
Deprecated
init()
Creates a view type.
BitwiseCopyable
struct Drawable
A type that provides the textures and information you need to draw a frame of content.
Creating a view
Relationships
Conforms To
See Also
Drawing environment


