# 002_Rendering hover effects in Metal immersive apps.pdf

## Page 1

In visionOS, both SwiftUI views and RealityKit entities can take advantage of hover effects, which
change the appearance of a rendered onscreen element when a player gazes at it or highlights it
using assistive technologies. In visionOS 26, fully immersive apps that render their own content
using Metal can also use hover effects.
This sample code project demonstrates how to pass in uniforms and attributes to your Metal
shaders so your app can implement system-provided hover effects in a privacy-preserving way. O
launch, the app opens to an immersive virtual space with a large shape that shatters into several
pieces. If a player looks at one of the pieces, it highlights, much like a RealityKit entity with a Hove
EffectComponent does. If the player taps while gazing at the various pieces, they return to the
original position, reassembling the original shape.
Overview
Compositor Services / Rendering hover effects in Metal immersive apps
Sample Code
Rendering hover effects in Metal
immersive apps
Change the appearance of a rendered onscreen element when a player gazes at i
Download
macOS 26.0+
visionOS 26.0+
Xcode 26.0+


## Page 2

Play
To protect privacy, Metal shaders can’t get information about where a person using an Apple Visio
Pro device is currently looking. RealityKit apps can add gaze highlighting using a HoverEffect
Component. For Full Space Metal apps, that’s not an option. Instead, Compositor Services
provides a privacy-preserving mechanism for highlighting the virtual objects that Metal renders.
The system does the gaze testing and highlight rendering, not the app.
Compositor Services provides your app with an Integer frame buffer for passing in the indices o
the draw calls your app needs the system to highlight. The system then does gaze hit-testing on
those items, and when a player looks at one of them, it renders a highlight over it. It does this out 
process, and your app can’t access the actual gaze data, but can respond to spatial gestures that
player generates by tapping those items.
Understand the flow


## Page 3

Color
Depth
Tracking Areas
In CompositorServicesHoverEffectApp, the app declares a WindowGroup for a small
SwiftUI window that shows at launch, and an ImmersiveSpace that puts the app in Full Space
mode when a player activates it. The app declares the space to ImmersionStyle with full. Th
body of the ImmersiveSpace displays a CompositorLayer that the makeCompositor
Layer() function creates, configures, and returns.
The makeCompositorLayer() function first sets up the depth and color buffers by specifying
their format.
Then it enables foveation if the device supports it. For more information on using foveation in you
Metal apps, see Drawing fully immersive content using Metal.
Then makeCompositorLayer() checks whether the app is running in visionOS 26 or later. If it 
it enables hover effects by specifying a trackingAreasFormat value of MTLPixelFormat
Declare the immersive space
Set up the compositor layer
Set up tracking areas


## Page 4

.r8Uint, which tells the system to enable gaze tracking and highlighting using unsigned integer
values to represent different draw calls.
Important
Using an 8-bit integer buffer, your app is limited to 255 tracking areas per frame. If your app
needs more, you can also use 16-bit integers, which allows up to 65,534 tracking areas, but
also increases your app’s memory consumption.
After that, makeCompositorLayer() specifies the type of access its shaders need to the
tracking-area data. Because the app offers multisample antialiasing (MSAA) as an option, it
specifies different access depending on whether MSAA is available on the device and enabled in
the app’s preferences. Metal handles MSAA for color buffers automatically, but not for integer
buffers. When using both hover effects and MSAA, the app configures a usage of “.shaderWrite”
instead of “.renderTarget” on the tracking area texture, because the texture will be the output of a
custom tile resolver.
Rendered scenes look better with MSAA, so the app offers it as a configurable option. To work
around the fact that some pixels don’t reference the correct draw call identifier, it implements a
compute shader to ensure the draw call for any specific pixel is correct. To do that, the app’s
shaders need .shaderWrite access when MSAA is enabled. If MSAA isn’t enabled, the
configuration only needs write access to the render target, and uses the provided draw call
identifier values.
If the player requests a specific render quality, the function passes that value into the configuratio
Override maximum render quality


## Page 5

Note
If you plan to let people override the maximum render quality, make sure you thoroughly test
performance. Increasing the render quality greatly increases the amount of processing power
used by your app.
Then, in the trailing closure, it calls the render(_:) function.
The render(_:) function creates a high-priority asynchronous task so that the rendering work
doesn’t occur on the main thread. Then it creates a RenderData object, which is an Actor obje
that holds all of the app’s render-related objects. Using an actor ensures that all code affecting
the rendering data runs in the same global concurrency thread pool.
The function starts by setting up world tracking, loading assets, and implementing the render
pipelines for its shaders. For more information about world tracking, see Tracking specific points 
world space.
Set up rendering
Listen for spatial events


## Page 6

Next, the sample app checks whether it’s running in visionOS 26 or later again. If it is, it registers 
closure that the renderer calls whenever that renderer generates a spatial event, such as a gestur
the player makes while gazing at content with hover effects on.
The system calls the app’s closure when a tap gesture starts, as well as when it ends. The app
checks specifically for the .ended event so that a piece only returns to its original position after
the gesture is over. It gets the tracking-area identifier from the event and stores it in the render
data to inform the shaders. It also begins another task that sleeps for a period of time and then
unhides the tapped item.
The last thing the render(_:renderData:) function does is call the renderLoop() function
on the render data actor. By putting the render loop on the actor, it ensures all attempts to read a
write render data happen in the same concurrent context.
The renderLoop() function enters a while loop until the system invalidates the renderer. Each
time through the loop, it gets the next frame from the renderer.
Start the render loop


## Page 7

Then it calcuates the optimal time to wait before submitting data for the next frame, and waits for
that length of time.
After that, the app retrieves the drawables from the current frame object. When running in visionO
26 or later, it uses LayerRenderer/Frame/queryDrawables() to retrieve all available Laye
Renderer.Drawable objects. In earlier visionOS versions, it retrieves a single Drawable and
puts it in an array so the output of the calls are the same type, regardless of the OS version.
Next, it iterates through the array of LayerRenderer.Drawable objects and passes each
Drawable, along with its offset index, to handleDrawable(_:_:), which handles processing a
single drawable.


## Page 8

Before processing a draw call, handleDrawable(_:_:) retrieves all the objects it needs,
including the draw calls, device anchor, renderer pass descriptor, encoder, and viewports. It also
calls the setUpMSAA(drawable:offset:) function to cache the textures the system needs
when resolving the correct object ID for pixels that system anti-aliasing impacts in a compute
shader. The function adds the color, depth, and tracking to the drawable’s texture cache because
the compute shader needs access to that information.
The sample app then iterates through each of the drawable’s draw calls using handleDraw
Call(encoder:drawable:drawCall:id:). A critical step for gaze tracking happens here.
When running in visionOS 26 or later, the system creates a tracking area for the drawable and the
calls addHoverEffect() on it, passing the raw value from the tracking area into a uniform, whic
is a constant value that the app passes to its shaders.
Handle draw calls and MSAA
Add a hover effect to the drawable’s tracking area


## Page 9

In addition to returning the fragment color, for hover effects to work, the app’s fragment shader
also needs to return the object index of the fragment’s corresponding draw call. Without the obje
index, the system can’t perform gaze testing or highlighting.
The sample does this by declaring a Metal struct in shaders.metal. This lets the fragment
shader return both the color and the object index.
Then, in the fragment shader, after doing any other fragment processing the app needs to render
its content, the sample returns the calculated color for the fragment, and its object index passes i
from the spatial event closure.
At this point, hover effects work, however, gaze tracking isn’t taking system-provided anti-aliasing
into account. Because Metal’s MSAA resolve ignores integer buffers, and MSAA needs to comput
a value from all the MSAA samples, the app uses a compute shader to resolve the MSAA samples
of the tracking area textures.
Return hover indices from your fragment shader
Implement a custom resolver for MSAA support


## Page 10

The system calls this compute function for every pixel. The function loops through the fragments
and selects the highest object index of any of MSAA samples. The function then writes the value 
the texture.
Drawing fully immersive content using Metal
Create a fully immersive experience in visionOS using a custom Metal-based rendering
engine.
Interacting with virtual content blended with passthrough
Present a mixed immersion style space to draw content in a person’s surroundings, and
choose how upper limbs appear with respect to rendered content.
struct CompositorLayer
A type that you use with an immersive space to display fully immersive content using Metal.
protocol CompositorLayerConfiguration
An interface for specifying the texture configurations and rendering behaviors to use with yo
Metal rendering engine.
struct DefaultCompositorLayerConfiguration
A type that configures the layer with the default texture configurations and rendering
behaviors for the current device.
See Also
App integration


