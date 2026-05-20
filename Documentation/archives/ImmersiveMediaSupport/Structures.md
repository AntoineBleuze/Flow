# Structures.pdf

## Page 1

This initializer method creates these types from ILPD data (JSON contents) reads from ILPD files.
These lens definition metadata types are also used for STMap generation to transform AIV video
frames of one lens projection type to another during content previews.
init(from: Data) throws
Creates an ImmersiveCameraLensDefinition object from a ILPD data blob, basically t
JSON contents of a ILPD file..
var cameraID: String
The unique identifier of the immersive camera associated with this lens definition instance.
Overview
Topics
Initializers
Instance Properties
Immersive Media Support / ImmersiveCameraLensDefinition
Structure
ImmersiveCameraLensDefinition
This type holds the ILPD lens configuration parameters to generate camera
calibration type instance.
macOS 26.0+
visionOS 26.0+


## Page 2

func generateSTMap(device: any MTLDevice, cameraEye: ImmersiveCameraLen
Definition.Eye, stmapType: ImmersiveCameraLensDefinition.STMapType, int
: any MTLTexture) async throws
Generates an STMap for the given projection type and for the given camera eye into the
provided texture asynchronously.
enum Eye
A value that represents a camera lens eye.
enum STMapType
A value that represents a camera lens projection type.
Decodable
Encodable
Sendable
SendableMetatype
Instance Methods
Enumerations
Relationships
Conforms To


## Page 3

init(leftEye: CVPixelBuffer, rightEye: CVPixelBuffer, presentationTime:
CMTime)
Creates a video frame from the left and right eye pixel buffers.
init(pixelBuffer: CVPixelBuffer, presentationTime: CMTime, layout:
ImmersiveVideoFrame.VideoLayout)
Creates a video frame with one pixelBuffer and specified layout.
let layout: ImmersiveVideoFrame.VideoLayout
Video layout associated with the video frame pixel buffers.
let pixelBuffers: [CVPixelBuffer]
An array of pixel buffers associated with this immersive frame.
Topics
Initializers
Instance Properties
Immersive Media Support / ImmersiveVideoFrame
Structure
ImmersiveVideoFrame
A type that represents an immersive video frame. An immersive video frame
contains: - layout (SideBySide, OverUnder, Separate, Mono) - presentationTime:
frame presentation time - pixelBuffers: an array with one or more images
representing the frame.
macOS 26.0+
visionOS 26.0+


## Page 4

let presentationTime: CMTime
Presentation timestamp associated with the pixel buffers.
enum VideoLayout
A value that specifies the layout of left and right eyes within an immersive video frame.
Equatable, Sendable, SendableMetatype
Enumerations
Relationships
Conforms To


