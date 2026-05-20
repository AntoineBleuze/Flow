# 000_Generating an animation with a Core Image Render Destination.pdf

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


