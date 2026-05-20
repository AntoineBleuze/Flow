# visionOS.pdf

## Page 1

In visionOS, ARKit can enable new kinds of
experiences that leverage data such as hand
tracking and world sensing. The system gates
access to this kind of sensitive information.
Because people can decline your app’s request
to use ARKit data or revoke access later, you
need to provide alternative ways to use your
app and to handle cases where your app loses
access to data.
People need to know why your app wants to access data from ARKit. Add the following keys to yo
app’s information property list to provide a user-facing usage description that explains how your
app uses the data:
NSHandsTrackingUsageDescription
Use this key if your app uses hand tracking.
NSWorldSensingUsageDescription
Use this key if your app uses image tracking, plane detection, or scene reconstruction.
Note
World tracking — unlike world sensing — doesn’t require authorization. For more information,
see Tracking specific points in world space.
Overview
Add usage descriptions for ARKit data access
visionOS / Setting up access to ARKit data
Article
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.


## Page 2

You can choose when someone sees an authorization request to use ARKit data. If you need
precise control over when the request appears, call the requestAuthorization(for:)
method on ARKitSession to explicitly authorize access at the time you call it. Otherwise, peopl
see an authorization request when you call the run(_:) method. This is an implicit authorization
because the timing of the request depends entirely on when you start the session.
To help protect people’s privacy, ARKit data is available only when your app presents a Full Space
and other apps are hidden. Present one of these space styles before calling the run(_:) method
The following shows an app structure that’s set up to use a space with ARKit:
Choose between up-front or as-needed authorization
Open a space and run a session


## Page 3

Call openImmersiveSpace from your app’s user interface to create a space, start running an
ARKit session, and kick off an immersive experience. The following shows a simple view with a
button that opens the space:
Someone might not want to give your app access to data from ARKit, or they might choose to
revoke that access later in Settings. Handle these situations gracefully, and remove or transition
content that depends on ARKit data. For example, you might fade out content that you need to
remove, or recenter content to an appropriate starting position. If your app uses ARKit data to pla
content in a person’s surroundings, consider letting people place content using the system-
provided interface.
Providing alternatives is especially important if you’re using ARKit for user input. People using
accessibility features, trackpads, keyboards, or other forms of input might need a way to use you
app without ARKit.
Happy Beam
Leverage a Full Space to create a fun game using ARKit.
Incorporating real-world surroundings in an immersive experience
Create an immersive experience by making your app’s content respond to the local shape of
the world.
Provide alternatives for declined and revoked
authorizations
See Also
ARKit


## Page 4

Placing content on detected planes
Detect horizontal surfaces like tables and floors, as well as vertical planes like walls and doo
Tracking specific points in world space
Retrieve the position and orientation of anchors your app stores in ARKit.
Tracking preregistered images in 3D space
Place content based on the current position of a known image in a person’s surroundings.
Exploring object tracking with ARKit
Find and track real-world objects in visionOS using reference objects trained with Create ML
Object tracking with Reality Composer Pro experiences
Use object tracking in visionOS to attach digital content to real objects to create engaging
experiences.
Building local experiences with room tracking
Use room tracking in visionOS to provide custom interactions with physical spaces.
Placing entities using head and device transform
Query and react to changes in the position and rotation of Apple Vision Pro.
Drawing in the air and on surfaces with a spatial stylus
Create a spatial stylus drawing experience that balances latency and accuracy for both in-ai
and on-surface drawing.


## Page 5

Sessions in ARKit require either implicit or explicit authorization. To explicitly ask for permission fo
a particular kind of data and choose when a person is prompted for that permission, call request
Authorization(for:) before run(_:).
The following shows a session that starts by requesting implicit authorization to use world sensing
Because a PlaneDetectionProvider instance’s required authorizations include ARKit
Session.AuthorizationType.worldSensing, the system asks someone using your app to
permit world sensing before ARKit supplies any of that kind of data.
Overview
ARKit / ARKitSession
Class
ARKitSession
The main entry point for receiving data from ARKit.
macOS 26.0+
visionOS 1.0+


## Page 6

Note
ARKit stops sessions when they’re deinitialized; keep a reference to a session instance for as
long as the session needs to run.
convenience init()
Creates a new session.
func run([any DataProvider]) async throws
Runs a session with the data providers you supply.
func stop()
Stops all data providers running in this session.
struct Error
An error that might occur when running data providers on an ARKit session.
func requestAuthorization(for: [ARKitSession.AuthorizationType]) async 
> [ARKitSession.AuthorizationType : ARKitSession.AuthorizationStatus]
Requests authorization from the user to use the specified kinds of ARKit data.
enum AuthorizationType
The authorization types you can request from ARKit.
func queryAuthorization(for: [ARKitSession.AuthorizationType]) async ->
[ARKitSession.AuthorizationType : ARKitSession.AuthorizationStatus]
Checks whether the current session is authorized for particular authorization types without
requesting authorization.
enum AuthorizationStatus
The authorization states for a type of ARKit data.
Topics
Starting and stopping a session
Getting authorization
Observing a session


## Page 7

var events: ARKitSession.Events
An asynchronous sequence of events that provide updates to the current authorization statu
of the session.
struct Events
A sequence of events.
enum Event
Enumeration of possible session events.
var description: String
A textual representation of this session.
convenience init(device: RemoteDeviceIdentifier)
Create a new session connected to the specified device.
var dataProviders: [any DataProvider]
A list of all data providers on this session.
CustomStringConvertible, Sendable, SendableMetatype
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
Initializers
Instance Properties
Relationships
Conforms To
See Also
visionOS


## Page 8

protocol DataProvider
A source of live data from ARKit.
protocol Anchor
The identity, location, and orientation of an object in world space.
ARKit in visionOS
Create immersive augmented reality experiences.


## Page 9

Most providers supply an asynchronous sequence of updated anchors for the provider’s data typ
For example, a HandTrackingProvider instance’s anchorUpdates property gives updates
over time for hand anchors.
var state: DataProviderState
The current status of data coming from this provider.
Required
static var requiredAuthorizations: [ARKitSession.AuthorizationType]
The kinds of authorization you need to use a particular data provider type.
Required
static var isSupported: Bool
Overview
Topics
Inspecting a data provider
Inspecting a data provider type
ARKit / DataProvider
Protocol
DataProvider
A source of live data from ARKit.
macOS 26.0+
visionOS 1.0+


## Page 10

A Boolean value that indicates whether the current runtime environment supports a particula
provider type.
Required
CustomStringConvertible, Sendable, SendableMetatype
AccessoryTrackingProvider
BarcodeDetectionProvider
CameraFrameProvider
CameraRegionProvider
EnvironmentLightEstimationProvider
HandTrackingProvider
ImageTrackingProvider
ObjectTrackingProvider
PlaneDetectionProvider
RoomTrackingProvider
SceneReconstructionProvider
SharedCoordinateSpaceProvider
StereoPropertiesProvider
WorldTrackingProvider
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
class ARKitSession
The main entry point for receiving data from ARKit.
Relationships
Inherits From
Conforming Types
See Also
visionOS


## Page 11

protocol Anchor
The identity, location, and orientation of an object in world space.
ARKit in visionOS
Create immersive augmented reality experiences.


## Page 12

var id: UUID
A unique identifier that distinguishes this anchor from all other anchors.
Required
var timestamp: TimeInterval
Required Default implementation provided.
var originFromAnchorTransform: simd_float4x4
The position and orientation of this anchor in world space.
Required
struct AnchorUpdate
Information about the event that updated an anchor.
struct AnchorUpdateSequence
An asynchronous sequence of updates to anchors.
Topics
Inspecting an anchor
Tracking anchors over time
ARKit / Anchor
Protocol
Anchor
The identity, location, and orientation of an object in world space.
macOS 26.0+
visionOS 1.0+


## Page 13

CustomStringConvertible
Identifiable
Sendable
SendableMetatype
TrackableAnchor
AccessoryAnchor
BarcodeAnchor
CameraRegionAnchor
DeviceAnchor
EnvironmentProbeAnchor
HandAnchor
ImageAnchor
MeshAnchor
ObjectAnchor
PlaneAnchor
RoomAnchor
WorldAnchor
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
class ARKitSession
The main entry point for receiving data from ARKit.
Relationships
Inherits From
Inherited By
Conforming Types
See Also
visionOS


## Page 14

protocol DataProvider
A source of live data from ARKit.
ARKit in visionOS
Create immersive augmented reality experiences.


## Page 15

ARKit in visionOS offers a new set of sensing capabilities that you adopt individually in your app,
using data providers to deliver updates asynchronously. The available capabilities include:
Plane detection. Detect surfaces in a person’s surroundings and use them to anchor content.
World tracking. Determine the position and orientation of Apple Vision Pro relative to its
surroundings, and add world anchors to place content.
Hand tracking. Use a person’s hand and finger positions as input for custom gestures and
interactivity.
Scene reconstruction. Build a mesh of a person’s physical surroundings and incorporate it into
your immersive spaces to support interactions.
Image tracking. Look for known images in a person’s surroundings and use them as anchor
points for custom content.
Object tracking. Use 3D reference objects to find and track real-world objects in a person’s
environment.
Barcode detection. Detect and scan QR codes and barcodes in a variety of formats in a
person’s surroundings.
Room tracking. Use room anchors to identify specific rooms and implement per-room
experiences.
Light estimation. Understand the lighting characteristics of a room to help improve the
appearance of shiny or semi-reflective materials in your virtual content.
Camera frames. Access camera frames from a device in several formats.
Accessory tracking. Work with the real-time position and orientation of accessories that a
person is using.
Overview
ARKit / ARKit in visionOS
API Collection
ARKit in visionOS
Create immersive augmented reality experiences.


## Page 16

Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
class ARKitSession
The main entry point for receiving data from ARKit.
protocol DataProvider
A source of live data from ARKit.
enum DataProviderState
The possible states of a data provider.
protocol Anchor
The identity, location, and orientation of an object in world space.
protocol TrackableAnchor
An anchor that can gain and lose its tracking state over the course of a session.
Topics
Setup


## Page 17

struct ARKitCoordinateSpace
An object which represents an ARKit coordinate space.
class BarcodeDetectionProvider
An object that provides the real-time position of barcodes the framework detects in a person
environment.
struct BarcodeAnchor
A barcode’s position in a person’s surroundings.
class CameraFrameProvider
An object that provides camera streams.
struct CameraFrame
The representation of a camera frame.
struct CameraVideoFormat
A structure that represents a camera video format.
class StereoPropertiesProvider
The StereoPropertiesProvider serves the latest viewpoint properties on the device.
struct ViewpointProperties
The ViewpointProperties is a record of render camera transforms at some particular time.
class CameraRegionProvider
A camera region provider. An enterprise license is required to use the CameraRegionProvide
The provider will not deliver any data without it. The app must include the following
entitlement: com.apple.developer.arkit.camera-region.allow
struct CameraRegionAnchor
Represents a region in space to capture a camera stream of.
Barcode detection
Camera sampling
Rendering
Camera region


## Page 18

Placing content on detected planes
Detect horizontal surfaces like tables and floors, as well as vertical planes like walls and doo
class PlaneDetectionProvider
A source of live data about planes in a person’s surroundings.
struct PlaneAnchor
An anchor that represents horizontal and vertical planes.
Tracking specific points in world space
Retrieve the position and orientation of anchors your app stores in ARKit.
class WorldTrackingProvider
A source of live data about the device pose and anchors in a person’s surroundings.
struct WorldAnchor
A fixed location in a person’s surroundings.
struct DeviceAnchor
The position and orientation of Apple Vision Pro.
Happy Beam
Leverage a Full Space to create a fun game using ARKit.
class HandTrackingProvider
A source of live data about the position of a person’s hands and hand joints.
struct HandAnchor
A hand’s position in a person’s surroundings.
struct HandSkeleton
A collection of joints in a hand.
Plane detection
World tracking
Hand tracking
Scene reconstruction


## Page 19

Incorporating real-world surroundings in an immersive experience
Create an immersive experience by making your app’s content respond to the local shape of
the world.
class SceneReconstructionProvider
A source of live data about the shape of a person’s surroundings.
struct MeshAnchor
A volume of space that contains a mesh of a person’s surroundings.
Tracking and altering images
Create images from rectangular shapes found in the user’s environment, and augment their
appearance.
Detecting Images in an AR Experience
React to known 2D images in the user’s environment, and use their positions to place AR
content.
Tracking preregistered images in 3D space
Place content based on the current position of a known image in a person’s surroundings.
class ImageTrackingProvider
A source of live data about a 2D image’s position in a person’s surroundings.
struct ImageAnchor
A 2D image’s position in a person’s surroundings.
struct ReferenceImage
A 2D image the system uses as a reference to find the same image in a person’s surrounding
struct GeometryElement
A container for vertex indices of lines or triangles.
struct GeometrySource
A container for geometrical vector data.
Image tracking
Geometry
Lighting estimation


## Page 20

class EnvironmentLightEstimationProvider
A source of live data about lighting information in the environment.
struct EnvironmentProbeAnchor
An environment probe in the world.
class ObjectTrackingProvider
A source of real-time position of reference objects in a person’s environment.
struct ObjectAnchor
A reference object ARKit is tracking.
Exploring object tracking with ARKit
Find and track real-world objects in visionOS using reference objects trained with Create ML
Implementing object tracking in your visionOS app
Create engaging interactions by training models to recognize and track real-world objects in
your app.
class AccessoryTrackingProvider
Provides the real time position of accessories in the user’s environment.
struct Accessory
Represents an accessory to be tracked.
struct AccessoryAnchor
Represents a tracked accessory.
Tracking accessories in volumetric windows
Translate the position and velocity of tracked handheld accessories to throw virtual balls at a
stack of cans.
Tracking a handheld accessory as a virtual sculpting tool
Use a tracked accessory with Apple Vision Pro to create a virtual sculpture.
Object tracking
Accessory tracking
Room tracking


## Page 21

class RoomTrackingProvider
A source of real-time information about the room that a person is currently in.
struct RoomAnchor
The representation of a room ARKit is currently tracking.
enum SurfaceClassification
A value describing the classification of a surface.
Building local experiences with room tracking
Use room tracking in visionOS to provide custom interactions with physical spaces.
class SharedCoordinateSpaceProvider
Provides ability to establish a shared coordinate space among multiple participants.
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
class ARKitSession
The main entry point for receiving data from ARKit.
protocol DataProvider
A source of live data from ARKit.
protocol Anchor
The identity, location, and orientation of an object in world space.
Shared coordinate spaces
See Also
visionOS


