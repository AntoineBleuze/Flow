# Articles.pdf

## Page 1

cp_drawable_compute_projection
cp_frame_binocular_frustum_matrix
cp_frame_monocular_frustum_matrix
cp_frame_timing_get_trackable_anchor_time
Topics
Functions
Compositor Services / CompositorServices Functions
API Collection
CompositorServices Functions


## Page 2

Immersion is the degeree to which your rendered content from your app replaces the viewing are
Compositor Services supports full and mixed immersion styles by default. People using your app
can control the immersion level by rotating the Digital Crown on Apple Vision Pro. For some
content, people may prefer progressive immersion, where the viewing area is only partially replac
by rendered content, for viewing comfort. This helps them retain the context of their environment
when they’re viewing content with complex scenes with movement.
To support progressive immersion requires some additional adoption from your app provide a ma
that represents the progressive immersion level. When you attach the mask to the same render
encoder where your content renders the system provides performant, single pass rendering. The
mask also allows the system to avoid rendering content outside of the masked area for additional
performance savings. The system provides support for smoothing and fading the edge of the
progressive portal into your surroundings.
Set the possible immersion styles to ensure your immersive space supports progressive immersio
Overview
Enable progressive immersion
Compositor Services / Controlling Metal rendering immersion level
Article
Controlling Metal rendering immersion
level
Enable flexible immersive rendering by supporting progressive immersion when
rendering your Metal content.


## Page 3

After allowing both progressive and full immersion styles, your app can switch between them.
After your app supports progressive immersion, configure the compositor layer. Check that the
layer capabilities support your preferred stencil format with drawableRenderContext
SupportedStencilformats. Set the drawableRenderContextStencilFormat property
for the stencil format to the layer configuration. Configure the drawableRenderContextRaste
SampleCount with the appropriate sample count depending on your app’s use of multisample
antialiasing:
Note
The progressive immersion style only works with the layered layout configuration.
Apply the portal stencil mask to the layer render drawable by adding a render context to your
command buffer with addRenderContext(commandBuffer:). This step is a requirement for
the system to efficiently draw the faded edges of the portal over your rendered 3D content. Use
the same command buffer for your subsequent drawing commands. Draw your mask on the stenc
with drawMaskOnStencilAttachment(commandEncoder:value:) to prevent invisible pixe
from rendering and then select an available stencil value. After rendering the scene, use end
Configure the compositor layer
Apply a stencil mask


## Page 4

Encoding(commandEncoder:) to cease rendering, rather than directly ending the command
encoder. This allows the portal effect to apply efficiently over your content.


