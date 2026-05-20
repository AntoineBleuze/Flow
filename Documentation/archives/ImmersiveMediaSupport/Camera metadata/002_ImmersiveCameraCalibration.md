# 002_ImmersiveCameraCalibration.pdf

## Page 1

This data includes calibration type, calibration name, calibration file name, lens definition, mask
data, camera origin, and other relevant data.
struct CameraOrigin
A type that holds the position information representing the origin from which to render the
calibration in 3D space relative to the person’s eye.
struct CameraTextureMapping
A type that holds the matrices used for video frame texture mapping on the camera lens
geometry.
enum CalibrationType
A value that represents the calibration type used to generate camera calibration geometry.
Overview
Topics
Structures
Enumerations
Immersive Media Support / ImmersiveCameraCalibration
Structure
ImmersiveCameraCalibration
A structure that represents immersive media camera calibration data.
macOS 26.0+
visionOS 26.0+


## Page 2

init(name: String, type: ImmersiveCameraCalibration.CalibrationType,
mask: ImmersiveCameraMask?, positionable: Bool, origin: ImmersiveCamera
Calibration.CameraOrigin, textureMapping: ImmersiveCameraCalibration.
CameraTextureMapping, environmentFilename: String?)
Creates a mesh based calibration from USDZ data and a image-based mask.
var environmentFilename: String?
The USDZ filename of a backdrop to use for this calibration.
var mask: ImmersiveCameraMask?
Immersive camera mask that needs to be used for this calibration.
var name: String
A string identifying this calibration.
var origin: ImmersiveCameraCalibration.CameraOrigin
Position information that represents the origin from which to render the calibration in 3D
space relative to the person’s eye.
var positionable: Bool
A Boolean value that indicates whether to anchor this calibration in mixed reality 3D space
rather than centering it on the person’s eye position.
var textureMapping: ImmersiveCameraCalibration.CameraTextureMapping
Texture mapping that describes how each section of the video frame maps into the
calibration.
var type: ImmersiveCameraCalibration.CalibrationType
The type of this calibration.
Initializers
Instance Properties
Relationships
Conforms To


## Page 3

Decodable
Encodable
Sendable
SendableMetatype
actor VenueDescriptor
The Apple Immersive Media Venue Descriptor is a collection of static metadata necessary fo
every Apple Immersive Video.
struct ImmersiveCamera
A structure that holds the required information for an immersive media camera to process an
render video frames.
enum ImmersiveCameraMask
A structure that holds the camera mask type information and its relevant mask name.
struct ImmersiveDynamicMask
A type that holds the information required to dynamically generate an immersive media mask
at load time.
See Also
Camera metadata


