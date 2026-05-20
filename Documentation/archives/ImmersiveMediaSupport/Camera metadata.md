# Camera metadata.pdf

## Page 1

This type contains information that includes camera definitions such as the lens calibration
information, as well as data necessary for the rendering of the video frames.
init(device: (any MTLDevice)?)
Creates an empty venue descriptor instance.
convenience init(aimeURL: URL, device: (any MTLDevice)?) async throws
Creates a venue descriptor instance from an AIME file.
var cameras: [ImmersiveCamera]
An array of all the immersive cameras contained in the venue descriptor.
Overview
Topics
Creating a venue descriptor
Configuring cameras
Immersive Media Support / VenueDescriptor
Class
VenueDescriptor
The Apple Immersive Media Venue Descriptor is a collection of static metadata
necessary for every Apple Immersive Video.
macOS 26.0+
visionOS 26.0+


## Page 2

func addCamera(ImmersiveCamera) throws
Adds a new immersive camera definition to the venue descriptor.
func removeCamera(id: String) throws
Removes an immersive camera definition from the venue descriptor.
func cameraViewModel(for: String) -> ImmersiveCameraViewModel?
Returns the camera view model for the given immersive camera identifier.
func save(to: URL) throws
Generates an AIME file at the specified location.
var aimeData: Data?
Property holding the complete static metadata needed for the immersive media playback.
init(aimeData: Data, device: (any MTLDevice)?) async throws
Creates a venue descriptor instance from memory.
Actor, Sendable, SendableMetatype
struct ImmersiveCamera
A structure that holds the required information for an immersive media camera to process an
render video frames.
Saving a venue descriptor data
Initializers
Relationships
Conforms To
See Also
Camera metadata


## Page 3

struct ImmersiveCameraCalibration
A structure that represents immersive media camera calibration data.
enum ImmersiveCameraMask
A structure that holds the camera mask type information and its relevant mask name.
struct ImmersiveDynamicMask
A type that holds the information required to dynamically generate an immersive media mask
at load time.


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

Immersive media dynamic masks are generated by interpolating a set of control points or sample
points on the surface of a unit sphere.
var controlPointInterpolation: ImmersiveDynamicMask.ControlPoint
Interpolation
Type of the interpolation method used while processing control points.
var edgeTreatment: ImmersiveDynamicMask.EdgeTreatment
The edge treatment type used for the immersive media mask.
var edgeWidthInDegrees: Float
The edge width in degrees used for the dynamic mask generation.
var leftControlPoints: [Point3DFloat]
The left eye control points.
Overview
Topics
Instance Properties
Immersive Media Support / ImmersiveDynamicMask
Structure
ImmersiveDynamicMask
A type that holds the information required to dynamically generate an immersive
media mask at load time.
macOS 26.0+
visionOS 26.0+


## Page 13

var name: String
A unique name string of the dynamic mask.
var rightControlPoints: [Point3DFloat]
The right eye control points.
var stereoRelation: ImmersiveDynamicMask.StereoRelation
Represents how the left eye mask relates to the right eye mask.
enum ControlPointInterpolation
A value that represents the interpolation method used while processing the control points.
enum EdgeTreatment
A value that represents an edge treatment type for the immersive media mask.
enum StereoRelation
A value that determines how the left mask relates to the right, or vice versa.
init(name: String, stereoRelation: ImmersiveDynamicMask.StereoRelation,
edgeTreatment: ImmersiveDynamicMask.EdgeTreatment, controlPoint
Interpolation: ImmersiveDynamicMask.ControlPointInterpolation, left
ControlPoints: [Point3DFloat], rightControlPoints: [Point3DFloat], edge
WidthInDegrees: Float)
Decodable
Encodable
Sendable
SendableMetatype
Enumerations
Initializers
Relationships
Conforms To


## Page 14

actor VenueDescriptor
The Apple Immersive Media Venue Descriptor is a collection of static metadata necessary fo
every Apple Immersive Video.
struct ImmersiveCamera
A structure that holds the required information for an immersive media camera to process an
render video frames.
struct ImmersiveCameraCalibration
A structure that represents immersive media camera calibration data.
enum ImmersiveCameraMask
A structure that holds the camera mask type information and its relevant mask name.
See Also
Camera metadata


