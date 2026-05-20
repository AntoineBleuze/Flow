# 000_ImmersiveCameraViewModel.pdf

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


