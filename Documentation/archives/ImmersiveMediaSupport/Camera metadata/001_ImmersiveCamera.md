# 001_ImmersiveCamera.pdf

## Page 1

This type holds information including the camera identifier, type, default presentation rate, pose,
and calibration data. Immersive media content can be captured with more than one camera
calibrated lens, which means it’s necessary to use different geometry for each to render the
corresponding video clips. AIV content creators should be able to add or remove any camera at a
point during the creation and iteration process.
init(id: String, calibration: ImmersiveCameraCalibration, type:
ImmersiveCamera.CameraType, presentationFrameRate: Int, pose:
Pose3DFloat)
var calibration: ImmersiveCameraCalibration
Calibration details for this camera.
Overview
Topics
Initializers
Instance Properties
Immersive Media Support / ImmersiveCamera
Structure
ImmersiveCamera
A structure that holds the required information for an immersive media camera to
process and render video frames.
macOS 26.0+
visionOS 26.0+


## Page 2

var id: String
A unique and non empty identifier string for this immersive camera.
var pose: Pose3DFloat
The pose of this immersive camera.
var presentationFrameRate: Int
Presentation frame rate suited for this immersive camera.
var type: ImmersiveCamera.CameraType
Represents the type of the camera.
static let defaultPresentationFrameRate: Int
Default presentation frame rate for any immersive camera.
enum CameraType
A value that represents the type of immersive camera.
Decodable
Encodable
Identifiable
Sendable
SendableMetatype
Type Properties
Enumerations
Relationships
Conforms To
See Also
Camera metadata


## Page 3

actor VenueDescriptor
The Apple Immersive Media Venue Descriptor is a collection of static metadata necessary fo
every Apple Immersive Video.
struct ImmersiveCameraCalibration
A structure that represents immersive media camera calibration data.
enum ImmersiveCameraMask
A structure that holds the camera mask type information and its relevant mask name.
struct ImmersiveDynamicMask
A type that holds the information required to dynamically generate an immersive media mask
at load time.


