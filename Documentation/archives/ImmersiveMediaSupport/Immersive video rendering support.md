# Immersive video rendering support.pdf

## Page 1

App needs to query this type instance from VenueDescriptor instance given the immersive
camera identifier.
var cameraID: String
The camera identifier string of the Immersive camera associated with this view model.
var environmentBackdrop: MDLAsset?
The environment backdrop associated with the immersive camera view
var leftEye: MDLMesh
Left eye mesh associated with the immersive camera view.
var mask: ImmersiveVideoMask?
Generated immersive video mask associated with the immersive camera view
Overview
Topics
Instance Properties
Immersive Media Support / ImmersiveCameraViewModel
Structure
ImmersiveCameraViewModel
A view model that holds all the resources needed to render an immersive camera
view.
macOS 26.0+
visionOS 26.0+


## Page 2

var rightEye: MDLMesh
Right eye mesh associated with the immersive camera view.
Sendable, SendableMetatype
struct ImmersiveVideoMask
A video mask to use during video rendering to smooth the edges of the mesh.
Relationships
Conforms To
See Also
Immersive video rendering support


## Page 3

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


## Page 4

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


