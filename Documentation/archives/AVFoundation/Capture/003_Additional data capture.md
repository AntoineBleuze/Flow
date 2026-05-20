# 003_Additional data capture.pdf

## Page 1

Capturing photos with depth
Get a depth map with a photo to create effects like the system camera’s Portrait mode (on
compatible devices).
Creating auxiliary depth data manually
Generate a depth image and attach it to your own image.
Capturing depth using the LiDAR camera
Access the LiDAR camera on supporting devices to capture precise depth data.
AVCamFilter: Applying filters to a capture stream
Render a capture stream with rose-colored filtering and depth effects.
Streaming depth data from the TrueDepth camera
Visualize depth data in 2D and 3D from the TrueDepth camera.
Enhancing live video by leveraging TrueDepth camera data
Apply your own background to a live capture feed streamed from the front-facing TrueDepth
camera.
class AVCaptureDepthDataOutput
A capture output that records scene depth information on compatible camera devices.
class AVDepthData
Topics
Depth data capture
AVFoundation / Additional data capture
API Collection
Additional data capture
Capture additional data including depth and metadata, and synchronize capture
from multiple outputs.


## Page 2

A container for per-pixel distance or disparity information captured by compatible camera
devices.
class AVCameraCalibrationData
Information about the camera characteristics used to capture images and depth data.
class AVCaptureMetadataInput
A capture input for providing timed metadata to a capture session.
class AVCaptureMetadataOutput
A capture output for processing timed metadata produced by a capture session.
class AVMetadataObject
The abstract superclass for objects provided by a metadata capture output.
Metadata types
Inspect the supported metadata object types that the framework supports.
class AVCaptureDataOutputSynchronizer
An object that coordinates time-matched delivery of data from multiple capture outputs.
class AVCaptureSynchronizedDataCollection
A set of data samples collected simultaneously from multiple capture outputs.
class AVCaptureSynchronizedSampleBufferData
A container for video or audio samples collected using synchronized capture.
class AVCaptureSynchronizedMetadataObjectData
A container for metadata objects collected using synchronized capture.
class AVCaptureSynchronizedDepthData
A container for scene depth information collected using synchronized capture.
class AVCaptureSynchronizedData
The abstract superclass for media samples collected using synchronized capture.
Metadata capture
Synchronized capture


## Page 3

Capture setup
Configure built-in cameras and microphones, and external capture devices, for media captur
Photo capture
Capture high-quality still images, Live Photos, and supporting photo data.
Audio and video capture
Capture audio and video directly to media files, or capture streams of media for direct acces
to media sample buffers.
See Also
Capture


