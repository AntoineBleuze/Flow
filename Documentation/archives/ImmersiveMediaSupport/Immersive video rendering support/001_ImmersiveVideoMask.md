# 001_ImmersiveVideoMask.pdf

## Page 1

This type holds the generated video mask texture and its relevant information.
var layout: ImmersiveVideoMask.Layout
The layout of this mask, see ImmersiveVideoMask.Layout for more details.
var texture: any MTLTexture
The mask texture ready for rendering.
var isInEquirectangularProjection: Bool
A Boolean value that indicates whether the generated mask texture is in equirectangular
projection space. If true, the app renderer needs to transform vertices of the mesh to
equirectangular projection space to generate UVs to access the mask texture.
Overview
Topics
Instance Properties
Enumerations
Immersive Media Support / ImmersiveVideoMask
Structure
ImmersiveVideoMask
A video mask to use during video rendering to smooth the edges of the mesh.
macOS 26.0+
visionOS 26.0+


## Page 2

enum Layout
A value that represents the layout of the video mask.
static func == (ImmersiveVideoMask, ImmersiveVideoMask) -> Bool
Compares two masks.
init(layout: ImmersiveVideoMask.Layout, isInEquirectangularProjection:
Bool, texture: any MTLTexture)
Creates an immersive video mask object.
Equatable, Sendable, SendableMetatype
struct ImmersiveCameraViewModel
A view model that holds all the resources needed to render an immersive camera view.
Operators
Initializers
Relationships
Conforms To
See Also
Immersive video rendering support


