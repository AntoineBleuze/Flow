# App integration.pdf

## Page 1

If your app draws fully immersive content using Metal, Compositor Services provides a bridge
between your SwiftUI code and your Metal rendering engine code. Use this framework to present
fully immersive scene that supports Metal rendering. When you present the scene from your app,
Compositor Services provides a layer, which contains the Metal types, textures, and other
information you need. The layer also provides timing information to help you manage your app’s
rendering loop and deliver frames of content in a timely manner.
Note
If you don’t use Metal to create a fully immersive experience, you don’t need to use
Compositor Services.
When creating fully immersive content using Metal, you draw everything the person sees. The
result of your drawing efforts is two images, one for each eye, to create a stereosopic effect when
viewed on Apple Vision Pro. Use the timing information in the layer to render up to 90 frames a
second using a custom rendering loop.
For information about how to draw content with Metal, see Metal.
To present your fully immersive experience, configure your app with an ImmersiveSpace scene
that gets its content from a CompositorLayer type. This type provides the LayerRenderer
type you need to set up and run your app’s custom rendering loop. The following example shows
Overview
Add an immersive space for your content
Compositor Services / Drawing fully immersive content using Metal
Article
Drawing fully immersive content using
Metal
Create a fully immersive experience in visionOS using a custom Metal-based
rendering engine.


## Page 2

how to set up the space and your app’s content. In the closure for the CompositorLayer type,
create a new thread to configure and start your app’s render loop.
Don’t include any style modifiers on a space that contains a CompositorLayer type. The system
automatically configures a space with CompositorLayer content as fully immersive, and ignore
any style modifiers.
Typically, apps don’t display an immersive space immediately at launch. Transitioning to a fully
immersive experience can be jarring if someone isn’t ready for it, so it’s preferable to display a
window first and let someone enter the space when they’re ready. However, if you need to display
space first, add the UIApplicationPreferredDefaultSceneSessionRole key to the
UIApplicationSceneManifest in your app’s Info.plist file. Set the value of this key to
CPSceneSessionRoleImmersiveSpaceApplication. When this key is present, the system
displays the first space it finds in your app’s list of scenes.
Customize the configuration of your layer


## Page 3

If your Metal rendering engine requires specific texture layouts, pixel formats, or rendering option
specify those details when you configure your CompositorLayer type. In your scene creation
code, pass a type that adopts CompositorLayerConfiguration as a parameter to your scen
content. The system uses that information to configure the Metal textures your LayerRenderer
provides. If you don’t provide a custom configuration, Compositor Services uses a set of default
configuration values.
To specify a set of custom options, define a type that adopts the CompositorLayer
Configuration protocol and implement its makeConfiguration(capabilities:
configuration:) method. In your implementation of that method, update the default values in
the configuration parameter with your preferred choices. Change only the values you want an
leave the other values alone. Configuration options that are available on a device might not be
available in Simulator, so use the capabilities parameter to validate your choices before
making them. The following example changes the pixel format to one that supports HDR values,
and configures the texture layout based on the current foveation setting:
Note
Apple Vision Pro uses the P3 color space for all pixel color values.
To use your configuration options for rendering, pass your custom CompositorLayer
Configuration type to your CompositorLayer at initialization time. The following example
modifies the previous scene’s setup code to include custom configuration data. Compositor
Services integrates your configuration details into the LayerRenderer type it creates.


## Page 4

When your app displays a space with a CompositorLayer, the system runs the code you provid
Use that code to configure your Metal rendering engine and spawn a thread for your rendering
loop, but don’t start rendering your content immediately. Instead, check the state of the Layer
Renderer type to see if the scene is actually running. The system might leave a scene in the
LayerRenderer.State.paused state while it confirms the person wants to enter the fully
immersive experience. The system changes the state to LayerRenderer.State.running onl
when it’s ready to display your scene’s content.
The following example shows the logic you might use to check the state of your loop each time
through your rendering loop. While the layer is paused, the code pauses the render loop thread an
waits until the layer starts running again. When the system or a person dismisses the scene, the
layer moves to the LayerRenderer.State.invalidated state to let you know it’s time to sto
your rendering loop.
Configure your app’s rendering loop


## Page 5

Important
Always run your render loop code in a dedicated thread, and not in your app’s main thread.
Creating Metal pipeline state information is potentially expensive, so use the setup phase of your
render loop to configure as much of your Metal code as possible. Start loading textures and shad
code, and set up the render and compute descriptors you need for your content. You can also use
your setup code to configure the ARKit code you need to fetch device anchor information.
Until your scene is visible, you can’t fetch new frames from the LayerRenderer and use them to
configure your rendering code. If you need information about the configuration of textures, create
LayerRenderer.Properties type using the same CompositorLayerConfiguration
information you used to configure your scene. The LayerRenderer.Properties type contain
the number of views to draw and the organization of textures for each frame.
While your layer is in the LayerRenderer.State.running state, fetch a new frame and fill it
with content each time through your render loop. The layer manages a finite number of frames, so
render only one frame at a time and submit it. Compositor Services provides timing information
with each frame to help you start work on the frame at the appropriate time and submit your
changes before the system needs them.
Update and encode a single frame of content


## Page 6

The following sequence shows the steps to create a single frame of content. Perform these steps
each time through your app’s render loop.
1. Call queryNextFrame() to fetch the next frame to use for drawing.
2. Call predictTiming() (or cp_frame_predict_timing) to get the predicted render
deadlines for your code. You use this information later to pause your thread until the optimal
rendering time.
3. Call startUpdate() to mark the start of the update phase.
4. Apply user interactions to your content and update any app-specific data.
5. Perform any rendering-related work that doesn’t rely on the device anchor information.
6. Call endUpdate() to mark the end of the update phase.
7. Call wait(until:tolerance:) (or cp_time_wait_until) to pause your render loop unt
the optimal rendering time.
8. Call startSubmission() to mark the start of submission phase.
9. Fetch the predicted device anchor from ARKit using the frameTiming information, and apply
that anchor to your frame.
10. Encode any drawing commands that depend on the device position or orientation.
11. Call encodePresent(commandBuffer:) to encode a presentation event into your comman
buffer.
12. Commit your command buffer.
13. Call endSubmission() to mark the end of your GPU submission.
The system uses data from the startUpdate(), endUpdate(), startSubmission(), and
endSubmission() functions to improve the timing information for subsequent frames. Call thes
functions to ensure your app has accurate timing information, and to help the system manage CP
and GPU resources efficiently.
The following example shows the structure of the drawing code for rendering one frame of conten
The custom my_engine_gather_inputs, my_engine_update_frame, and my_engine
_draw_and_submit_frame functions perform custom tasks the app needs to update its data
structures and render the content of the frame. The code also fetches the current device anchor
from ARKit using the custom my_engine_get_ar_device_anchor function and associates th
information with the frame.


## Page 7

For information about how to set up Metal command buffers and command encoders, see Setting
up a command structure.
During drawing, add the textures from your frame’s LayerRenderer.Drawable to your render
pass descriptor. The render pass descriptor tells Metal where to deliver the output of your
rendering commands. Because each frame of content relies on different textures, you must create
and configure a render pass descriptor with the current frame’s textures each time through your
render loop.
The following example shows a function that creates a new render pass descriptor and configures
its texture information. The LayerRenderer.Drawable in the example uses the Layer
Configure the render pass descriptor for the frame


## Page 8

Renderer.Layout.layered layout, which uses a single texture of type MTLTextureType
.type2DArray. You could use similar code to set up the render pass descriptor for the Layer
Renderer.Layout.shared layout.
For a LayerRenderer.Layout.dedicated layout, you must perform two render passes on
your content and create a separate render pass descriptor for each one. Configure each render
pass descriptor with the texture at a different index in the arrays of the LayerRenderer
.Drawable type.
To prevent the person viewing your content from experiencing disorientation or physical
discomfort, it’s essential to match the position of the camera in your scene to the location of the
person’s head. Matching the person’s head movements ensures that what they see doesn’t confli
with the input their body receives from the real world.
Because you render your app’s content in advance, you also need to know the position and
orientation of the device in advance. To retrieve this information, use ARKit to call ar_world
_tracking_provider_query_device_anchor_at_timestamp during the encoding proce
for your frame. ARKit provides this function to deliver the expected device anchor at the time you
specify. Use this information to configure any camera positions during rendering.
The following example shows how to retrieve the predicted device anchor using ARKit. Use the
timing information from the LayerRenderer.Drawable to get the most accurate presentation
Retrieve device anchor information and attach it to the
frame


## Page 9

time for the frame. Return the device anchor upon success or return nil if an error occurs.
When it displays your frame, the system checks for a discrepancy between the predicted device
anchor you provided for your frame and the actual device anchor the hardware reports. If there’s 
difference, the system automatically adjusts the rendered frame to compensate for the movemen
If you don’t want the system to make this adjustment, don’t specify a device anchor using the cp
_drawable_set_device_anchor function.
For more information about how to track the device anchor, see ARKit.
The goal of your Metal rendering engine is to produce 2D textures to display to the viewer. When
your content is 3D, you need to map points in your scene to the 2D texture in a way that makes th
content look realistically 3D to someone viewing it. This process requires you to create a projectio
matrix that maps points in your 3D content to points on the texture for each view. For stereoscopi
rendering, you also have to account for the positional differences between the device anchor and
the position of the person’s eyes.
During rendering, the rendering engine calls the method in the following example once for each
view in the frame. It uses the device anchor it assigned to the frame earlier to create a transform t
compensate for any differences between the device position and the view’s position. It also create
a projection matrix using the view’s tangents information and the distances to the near and far
projection planes. The makeProjectiveTransformFromTangents function assembles the
actual matrix values in the same way as init(leftTangent:rightTangent:topTangent:
bottomTangent:nearZ:farZ:reverseZ:).
Render each view with the correct perspective


## Page 10

When your scene is visible, you’re responsible for managing all interactions with your custom
content. Because you render everything yourself using Metal, you can’t rely on view-based event
or gesture recognizers for input. Instead, use one of the following techniques:
Add an .onSpatialEvent callback to your layer and map touch events to your content.
Respond to interactions with your custom content


## Page 11

Use ARKit hand tracking to manage input yourself.
When the system detects any direct or indirect touch events, it reports them to the .onSpatial
Event callback of the LayerRenderer. Use this callback to handle any interactions with your
custom content. The system executes your callback on the main thread each time a new touch
occurs or an active touch changes, so keep your callback code brief. The following example show
how to add this callback to your layer:
Important
To prevent issues when reading or writing event data, use locks or another synchronization
mechanism to access event data. The system delivers events on the app’s main thread, but
your rendering loop handles those events on a different thread. Synchronization is therefore
necessary to prevent errors, undefined behavior, or crashes.
For information about ARKit hand tracking, see ARKit.


## Page 12

Interacting with virtual content blended with passthrough
Present a mixed immersion style space to draw content in a person’s surroundings, and
choose how upper limbs appear with respect to rendered content.
Rendering hover effects in Metal immersive apps
Change the appearance of a rendered onscreen element when a player gazes at it.
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


## Page 13

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


## Page 14

A type that you use with an immersive space to display fully immersive content using Metal.
protocol CompositorLayerConfiguration
An interface for specifying the texture configurations and rendering behaviors to use with yo
Metal rendering engine.
struct DefaultCompositorLayerConfiguration
A type that configures the layer with the default texture configurations and rendering
behaviors for the current device.


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

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


## Page 21

Then it calcuates the optimal time to wait before submitting data for the next frame, and waits for
that length of time.
After that, the app retrieves the drawables from the current frame object. When running in visionO
26 or later, it uses LayerRenderer/Frame/queryDrawables() to retrieve all available Laye
Renderer.Drawable objects. In earlier visionOS versions, it retrieves a single Drawable and
puts it in an array so the output of the calls are the same type, regardless of the OS version.
Next, it iterates through the array of LayerRenderer.Drawable objects and passes each
Drawable, along with its offset index, to handleDrawable(_:_:), which handles processing a
single drawable.


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

A type that configures the layer with the default texture configurations and rendering
behaviors for the current device.


## Page 31

Use this type when your Metal rendering engine uses the default rendering options.
CompositorLayerConfiguration, Sendable, SendableMetatype
Drawing fully immersive content using Metal
Create a fully immersive experience in visionOS using a custom Metal-based rendering
engine.
Overview
Relationships
Conforms To
See Also
App integration
Compositor Services / DefaultCompositorLayerConfiguration
Structure
DefaultCompositorLayerConfiguration
A type that configures the layer with the default texture configurations and
rendering behaviors for the current device.
CompositorServices
SwiftUI
macOS 26.0+
visionOS 1.0+


## Page 32

Interacting with virtual content blended with passthrough
Present a mixed immersion style space to draw content in a person’s surroundings, and
choose how upper limbs appear with respect to rendered content.
Rendering hover effects in Metal immersive apps
Change the appearance of a rendered onscreen element when a player gazes at it.
struct CompositorLayer
A type that you use with an immersive space to display fully immersive content using Metal.
protocol CompositorLayerConfiguration
An interface for specifying the texture configurations and rendering behaviors to use with yo
Metal rendering engine.


