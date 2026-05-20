# 001_ImmersiveVideoFrame.pdf

## Page 1

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


## Page 2

let presentationTime: CMTime
Presentation timestamp associated with the pixel buffers.
enum VideoLayout
A value that specifies the layout of left and right eyes within an immersive video frame.
Equatable, Sendable, SendableMetatype
Enumerations
Relationships
Conforms To


