# 003_ImmersiveCameraMask.pdf

## Page 1

case dynamic(ImmersiveDynamicMask)
A value that defines a control points based dynamically generated mask.
case image(ImmersiveImageMask)
A value that defines an image based mask.
Decodable
Encodable
Sendable
SendableMetatype
Topics
Enumeration Cases
Relationships
Conforms To
Immersive Media Support / ImmersiveCameraMask
Enumeration
ImmersiveCameraMask
A structure that holds the camera mask type information and its relevant mask
name.
macOS 26.0+
visionOS 26.0+


## Page 2

actor VenueDescriptor
The Apple Immersive Media Venue Descriptor is a collection of static metadata necessary fo
every Apple Immersive Video.
struct ImmersiveCamera
A structure that holds the required information for an immersive media camera to process an
render video frames.
struct ImmersiveCameraCalibration
A structure that represents immersive media camera calibration data.
struct ImmersiveDynamicMask
A type that holds the information required to dynamically generate an immersive media mask
at load time.
See Also
Camera metadata


