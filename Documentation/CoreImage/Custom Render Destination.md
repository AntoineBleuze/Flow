# Custom Render Destination.pdf

## Page 1

This sample shows how to assemble a SwiftUI app that displays a Metal view with animated image
that you generate procedurally from Core Image.
To accomplish this, the sample sets up a Scene in a WindowGroup with a single content view. The
sample’s ContentView adopts the View protocol and initializes a Renderer using a closure to
vend a CIImage. It then adds a MetalView, with the instantiated Renderer, to the content body
The sample combines view update and state changes to produce the animation:
For view update, the MetalView structure conforms to the UIViewRepresentable or
NSViewRepresentable protocol of the SwiftUI life cycle.
For state changes, the Renderer is a StateObject conforming to the ObservableObject
protocol.
The Renderer class generates an image for an animation frame by conforming to the MetalKit
MTKViewDelegate delegate protocol. The protocol’s draw(in:) function commits render destinatio
work to the GPU using a render task in a Metal command buffer.
For more information about drawing with MetalKit see Using a Render Pipeline to Render Primitive
MetalKit calls the draw(in:) delegate function of the Renderer automatically.
Overview
Generate an animation
Core Image / Generating an animation with a Core Image Render Destination
Sample Code
Generating an animation with a Core
Image Render Destination
Animate a filtered image to a Metal view in a SwiftUI app using a Core Image
Render Destination.
Download
iOS 15.5+
iPadOS 15.5+
macOS 12.0+
Xcode 14.0+


## Page 2

An image-supplying function parameterized by both timestamp and scale factor initializes the
Renderer. This function combines checkerboard and hue-adjustment filters to generate animate
checkerboard pattern images cropped to a fixed size.
After the sample initializes the Renderer, the Renderer makes a command buffer and gets the
currentDrawable.


## Page 3

The Renderer then configures a CIRenderDestination with the command buffer, current
Drawable, dimensions, and pixel format, along with a closure that returns the texture for the
currentDrawable.
The sample uses the render destination to create an animation frame at a specific timestamp.
Finally, the sample composites the render destination’s centered image on a background and
submits work to the GPU to render and present the result.


## Page 4

The sample adds an EDR effect, a shiny ripple with a bright specular highlight, to the rendered
checkerboard animation in three steps:
1. Opt into EDR support for the view and set an accommodating color space and pixel format.
2. Query the EDR headroom for each frame and pass headroom to the image provider closure fo
the Renderer.
3. Set the peak specular highlight value to the maximum value of white with respect to the curren
headroom, or a reasonable default value.
For more information about adding an EDR effect, see Display EDR content with Core Image, Meta
and SwiftUI.
The MetalView opts into EDR support setting wantsExtendedDynamicRangeContent to true on
the backing CAMetalLayer. When enabled, the layer uses a wide gamut colorspace to render colo
beyond SDR range. Similarly, the MTKView sets a wide gamut colorPixelFormat to render the
generated EDR image.
The Renderer queries the current EDR headroom for each draw call using either
maximumPotentialExtendedDynamicRangeColorComponentValue (NSScreen) or
currentEDRHeadroom (UIScreen). If EDR headroom is unavailable the sample sets headroom to 1
.0 clamping to SDR.
Add an EDR effect
Configure the view for EDR support
Query EDR headroom


## Page 5

The sample’s ripple effect takes a gradient shadingImage to shade the contor of the ripple so that
appears to reflect light from the upper-left corner. CILinearGradient generates the gradient shadi
image between the current maximum RGB white, color0, and a fully transparent clear color, color1
Leverage EDR headroom


## Page 6

class CIRenderDestination
A specification for configuring all attributes of a render task’s destination and issuing
asynchronous render tasks.
class CIRenderInfo
An encapsulation of a render task’s timing, passes, and pixels processed.
class CIRenderTask
A single render task.
enum CIRenderDestinationAlphaMode
Different ways of representing alpha.
See Also
Custom Render Destination


## Page 7

The CIRenderDestination class provides an API for specifying a render task destination’s
properties, such as buffer format, alpha mode, clamping behavior, blending, and color space,
properties formerly tied to CIContext.
You can create a CIRenderDestination object for each surface or buffer to which you must
render. You can also render multiple times to a single destination with different settings such as
colorspace and blend mode by mutating a single CIRenderDestination object between
renders.
Renders issued to a CIRenderDestination return to the caller as soon as the CPU has issued
the task, rather than after the GPU has performed the task, so you can start render tasks on
subsequent frames without waiting for previous renders to finish. If the render fails, a CIRender
Task will return immediately.
init(pixelBuffer: CVPixelBuffer)
Creates a render destination based on a Core Video pixel buffer.
Overview
Topics
Creating a Render Destination
Core Image / CIRenderDestination
Class
CIRenderDestination
A specification for configuring all attributes of a render task’s destination and
issuing asynchronous render tasks.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 8

init(ioSurface: IOSurface)
Creates a render destination based on an IOSurface object.
init(mtlTexture: any MTLTexture, commandBuffer: (any MTLCommandBuffer)?
Creates a render destination based on a Metal texture.
init(width: Int, height: Int, pixelFormat: MTLPixelFormat, commandBuffe
: (any MTLCommandBuffer)?, mtlTextureProvider: (() -> any MTLTexture)?)
Creates a render destination based on a Metal texture with specified pixel format.
init(glTexture: UInt32, target: UInt32, width: Int, height: Int)
Creates a render destination based on an OpenGL texture.
init(bitmapData: UnsafeMutableRawPointer, width: Int, height: Int, byte
PerRow: Int, format: CIFormat)
Creates a render destination based on a client-managed buffer.
var alphaMode: CIRenderDestinationAlphaMode
The render destination’s representation of alpha (transparency) values.
enum CIRenderDestinationAlphaMode
Different ways of representing alpha.
var blendKernel: CIBlendKernel?
The destination’s blend kernel.
var blendsInDestinationColorSpace: Bool
Indicator of whether to blend in the destination’s color space.
var colorSpace: CGColorSpace?
The destination’s color space.
var width: Int
The render destination’s row width.
var height: Int
The render destination’s buffer height.
var isClamped: Bool
Indicator of whether or not the destination clamps.
Customizing Rendering


## Page 9

var isDithered: Bool
Indicator of whether or not the destination dithers.
var isFlipped: Bool
Indicator of whether the destination is flipped.
var captureTraceURL: URL?
Tell the next render using this destination to capture a Metal trace.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Generating an animation with a Core Image Render Destination
Animate a filtered image to a Metal view in a SwiftUI app using a Core Image Render
Destination.
class CIRenderInfo
An encapsulation of a render task’s timing, passes, and pixels processed.
Instance Properties
Relationships
Inherits From
Conforms To
See Also
Custom Render Destination


## Page 10

class CIRenderTask
A single render task.
enum CIRenderDestinationAlphaMode
Different ways of representing alpha.


## Page 11

A CIRenderInfo object allows Xcode Quick Look to visualize the render graph with detailed
timing information.
var kernelExecutionTime: TimeInterval
The amount of time a render spent executing kernels.
var passCount: Int
The number of passes the render took.
var pixelsProcessed: Int
The number of pixels the render produced executing kernels.
var kernelCompileTime: TimeInterval
Overview
Topics
Instance Properties
Core Image / CIRenderInfo
Class
CIRenderInfo
An encapsulation of a render task’s timing, passes, and pixels processed.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 12

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Generating an animation with a Core Image Render Destination
Animate a filtered image to a Metal view in a SwiftUI app using a Core Image Render
Destination.
class CIRenderDestination
A specification for configuring all attributes of a render task’s destination and issuing
asynchronous render tasks.
class CIRenderTask
A single render task.
enum CIRenderDestinationAlphaMode
Different ways of representing alpha.
Relationships
Inherits From
Conforms To
See Also
Custom Render Destination


## Page 13

A single render task issued in conjunction with CIRenderDestination.
A CIRenderTask object appears in Xcode Quick Look as a graph.
func waitUntilCompleted() throws -> CIRenderInfo
Waits until the CIRenderTask finishes and returns.
NSObject
Overview
Topics
Instance Methods
Relationships
Inherits From
Core Image / CIRenderTask
Class
CIRenderTask
A single render task.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 14

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Generating an animation with a Core Image Render Destination
Animate a filtered image to a Metal view in a SwiftUI app using a Core Image Render
Destination.
class CIRenderDestination
A specification for configuring all attributes of a render task’s destination and issuing
asynchronous render tasks.
class CIRenderInfo
An encapsulation of a render task’s timing, passes, and pixels processed.
enum CIRenderDestinationAlphaMode
Different ways of representing alpha.
Conforms To
See Also
Custom Render Destination


## Page 15

case none
Designates a destination with no alpha compositing.
case premultiplied
Designates a destination that expects premultiplied alpha values.
case unpremultiplied
Designates a destination that expects non-premultiplied alpha values.
init?(rawValue: UInt)
Topics
Enumeration Cases
Initializers
Relationships
Conforms To
Core Image / CIRenderDestinationAlphaMode
Enumeration
CIRenderDestinationAlphaMode
Different ways of representing alpha.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 16

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Generating an animation with a Core Image Render Destination
Animate a filtered image to a Metal view in a SwiftUI app using a Core Image Render
Destination.
class CIRenderDestination
A specification for configuring all attributes of a render task’s destination and issuing
asynchronous render tasks.
class CIRenderInfo
An encapsulation of a render task’s timing, passes, and pixels processed.
class CIRenderTask
A single render task.
See Also
Custom Render Destination


