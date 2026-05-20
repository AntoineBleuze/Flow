# 001_LayerRenderer_Drawable_View.pdf

## Page 1

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


## Page 2

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


