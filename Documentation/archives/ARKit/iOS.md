# iOS.pdf

## Page 1

ARKit requires iOS 11.0 or later and an iOS device with an A9 or later processor. Some ARKit
features require later iOS versions or specific devices. ARKit also uses a device camera, so you
need to configure iOS privacy controls so the user can permit camera access for your app.
How to handle device compatibility support depends on how your app uses ARKit:
If the basic functionality of your app requires AR (using the back camera): Add the arkit k
in the UIRequiredDeviceCapabilities section of your app’s Info.plist file. Using this key
makes your app available only to ARKit-compatible devices.
If augmented reality is a secondary feature of your app: Check for whether the current devic
supports the AR configuration you want to use by testing the isSupported property of the
appropriate ARConfiguration subclass.
If your app uses face-tracking AR: Face tracking requires the front-facing TrueDepth camera
on iPhone X. Your app remains available on other devices, so you must test the ARFace
TrackingConfiguration.isSupported property to determine face-tracking support on th
current device.
Tip
Check the isSupported property before offering AR features in your app’s UI, so that users
on unsupported devices aren’t disappointed by trying to access those features.
Overview
Handle User Consent and Privacy
ARKit / Verifying Device Support and User Permission
Article
Verifying Device Support and User
Permission
Check whether your app can use ARKit and respect user privacy at runtime.


## Page 2

For your app to use ARKit, the user must explicitly grant your app permission for camera access.
ARKit automatically asks the user for permission the first time your app runs an AR session.
iOS requires your app to provide a static message to be displayed when the system asks for
camera or microphone permission. Your app’s Info.plist file must include the
NSCameraUsageDescription key. For that key, provide text that explains why your app needs
camera access so that the user can feel confident granting permission to your app.
Note
If you create a new ARKit app using the Xcode template, a default camera usage description is
provided for you.
If your app uses ARFaceTrackingConfiguration, ARKit provides your app with personal faci
information. If you use ARKit face tracking features, your app must include a privacy policy
describing to users how you intend to use face tracking and face data. For details, see the Apple
Developer Program License Agreement.
class ARSession
The object that manages the major tasks associated with every AR experience, such as
motion tracking, camera passthrough, and image analysis.
class ARAnchor
An object that specifies the position and orientation of an item in the physical environment.
ARKit in iOS
Integrate iOS device camera and motion features to produce augmented reality experiences
your app or game.
See Also
iOS


## Page 3

Displaying an AR Experience with Metal
Managing Session Life Cycle and Tracking Quality
An ARSession object coordinates the major processes that ARKit performs on your behalf to
create an augmented reality experience. These processes include reading data from the device’s
motion sensing hardware, controlling the device’s built-in camera, and performing image analysis
on captured camera images. The session synthesizes all of these results to establish a
correspondence between the real-world space the device inhabits and a virtual space where you
model AR content.
Every AR experience requires an ARSession. If you implement a custom renderer, you instantiate
the session yourself.
Mentioned in
Overview
Create a Session
ARKit / ARSession
Class
ARSession
The object that manages the major tasks associated with every AR experience,
such as motion tracking, camera passthrough, and image analysis.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 4

If you use one of the standard renderers (like ARView, ARSCNView, or ARSKView), the renderer
creates a session object for you. When you want to interact with your app’s session, you access it
on your app’s renderer.
Running a session requires a configuration. Subclasses of ARConfiguration determine how
ARKit tracks a device’s position and motion relative to the real world, and thus it determines the
kinds of AR experiences you create. For example, ARWorldTrackingConfiguration enables
you to augment the user’s view of the world around them though the device’s back camera.
func run(ARConfiguration, options: ARSession.RunOptions)
Starts AR processing for the session with the specified configuration and options.
var identifier: UUID
A unique identifier of the running session.
struct RunOptions
Options for transitioning an AR session’s current state when you change its configuration.
var configuration: ARConfiguration?
An object that defines motion and scene tracking behaviors for the session.
func pause()
Pauses processing in the session.
var delegate: (any ARSessionDelegate)?
An object you provide to receive captured video images and tracking information, or to
respond to changes in session status.
var delegateQueue: dispatch_queue_t?
The dispatch queue through which the session calls your delegate methods.
Run a Session
Topics
Configuring and running a session
Responding to events


## Page 5

protocol ARSessionDelegate
Methods you can implement to receive captured video frame images and tracking state from
an AR session.
protocol ARSessionObserver
Methods you can implement to respond to changes in the state of an AR session.
func add(anchor: ARAnchor)
Adds the specified anchor to be tracked by the session.
func remove(anchor: ARAnchor)
Removes the specified anchor from tracking by the session.
func getCurrentWorldMap(completionHandler: (ARWorldMap?, (any Error)?) 
> Void)
Returns an object encapsulating the world-tracking session’s space-mapping state and set o
anchors.
Recording and Replaying AR Session Data
Record an AR session in Reality Composer and replay it in your ARKit app.
func createReferenceObject(transform: simd_float4x4, center: simd_float
, extent: simd_float3, completionHandler: (ARReferenceObject?, (any
Error)?) -> Void)
Creates a reference object (for 3D object detection) from the specified region of the session
world space.
func setWorldOrigin(relativeTransform: simd_float4x4)
Changes the basis for the AR world coordinate space using the specified transform.
Managing anchors
Saving or sharing state
Scanning 3D objects
Updating the world origin
Finding real-world surfaces


## Page 6

Cast a ray from a point on the screen to find intersections with real-world surfaces.
func raycast(ARRaycastQuery) -> [ARRaycastResult]
Checks once for intersections between a ray and real-world surfaces.
func trackedRaycast(ARRaycastQuery, updateHandler: ([ARRaycastResult]) 
> Void) -> ARTrackedRaycast?
Repeats a ray-cast query over time to notify you of updated surfaces in the physical
environment.
func getGeoLocation(forPoint: simd_float3, completionHandler: (
CLLocationCoordinate2D, CLLocationDistance, (any Error)?) -> Void)
Converts a position in the framework’s local coordinate system to latitude, longitude and
altitude.
var currentFrame: ARFrame?
The most recent still frame captured by the active camera feed, including ARKit’s
interpretation of it.
class ARFrame
A video image captured as part of a session with position-tracking information.
func captureHighResolutionFrame(completion: (ARFrame?, (any Error)?) ->
Void)
Requests a frame outside of the normal frequency that contains a high-resolution captured
image.
func update(with: ARSession.CollaborationData)
Updates your session with information about the physical environment that is collected by
another user.
class CollaborationData
An object that holds information that a user has collected about the physical environment.
Converting local coordinates to geographic coordinates
Accessing the camera frame
Managing collaboration
Providing a session


## Page 7

protocol ARSessionProviding
An object that provides a session.
func captureHighResolutionFrame(using: AVCapturePhotoSettings?,
completion: (ARFrame?, (any Error)?) -> Void)
Requests a single, high resolution frame to be captured.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Verifying Device Support and User Permission
Check whether your app can use ARKit and respect user privacy at runtime.
class ARAnchor
An object that specifies the position and orientation of an item in the physical environment.
ARKit in iOS
Instance Methods
Relationships
Inherits From
Conforms To
See Also
iOS


## Page 8

Integrate iOS device camera and motion features to produce augmented reality experiences
your app or game.


## Page 9

Displaying an AR Experience with Metal
Providing 2D Virtual Content with SpriteKit
Providing 3D Virtual Content with SceneKit
To track the static positions and orientations of real or virtual objects relative to the camera, creat
anchor objects and use the add(anchor:) method to add them to your AR session.
Tip
Adding an anchor to the session helps ARKit to optimize world-tracking accuracy in the area
around that anchor, so that virtual objects appear to stay in place relative to the real world. If a
virtual object moves, remove the corresponding anchor from the old position and add one at
the new position.
Some ARKit features automatically add special anchors to a session. World-tracking sessions can
add ARPlaneAnchor, ARObjectAnchor, and ARImageAnchor objects if you enable the
corresponding features; face-tracking sessions add ARFaceAnchor objects.
Mentioned in
Overview
ARKit / ARAnchor
Class
ARAnchor
An object that specifies the position and orientation of an item in the physical
environment.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 10

In addition to creating your own ARAnchor instances to track the real-world positions of your
virtual content, you can also subclass ARAnchor to associate custom data with anchors you
create. Ensure that your anchor classes behave correctly when ARKit updates frames or saves an
loads anchors in an ARWorldMap:
Anchor subclasses must fullfill the requirements of the ARAnchorCopying protocol. ARKit ca
init(anchor:) (on a background thread) to copy instances of your anchor class from each
ARFrame to the next. Your implementation of this initializer should copy the values of any
custom properties your subclass adds.
Anchor subclasses must also adopt the NSSecureCoding protocol. Override encode(with:
and init(coder:) to save and restore the values your subclass’ custom properties when
ARKit saves and loads them in a world map.
Anchors are considered equal based on their identifier property.
Only anchors that do not adopt ARTrackable are included when you save a world map.
init(transform: simd_float4x4)
Creates a new anchor object with the specified transform.
init(name: String, transform: simd_float4x4)
Creates a new anchor object with the specified transform and a descriptive name.
var name: String?
A descriptive name for the anchor.
var identifier: UUID
A unique identifier for the anchor.
var sessionIdentifier: UUID?
The unique identifier of the session that owns this anchor.
var transform: simd_float4x4
Subclassing Notes
Topics
Creating Anchors
Tracking Anchors


## Page 11

A matrix encoding the position, orientation, and scale of the anchor relative to the world
coordinate space of the AR session the anchor is placed in.
NSObject
ARAppClipCodeAnchor
ARBodyAnchor
AREnvironmentProbeAnchor
ARFaceAnchor
ARGeoAnchor
ARImageAnchor
ARMeshAnchor
ARObjectAnchor
ARParticipantAnchor
ARPlaneAnchor
ARAnchorCopying
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Relationships
Inherits From
Inherited By
Conforms To
See Also


## Page 12

Verifying Device Support and User Permission
Check whether your app can use ARKit and respect user privacy at runtime.
class ARSession
The object that manages the major tasks associated with every AR experience, such as
motion tracking, camera passthrough, and image analysis.
ARKit in iOS
Integrate iOS device camera and motion features to produce augmented reality experiences
your app or game.
iOS


## Page 13

Verifying Device Support and User Permission
Check whether your app can use ARKit and respect user privacy at runtime.
OpenUSD schemas for AR
Add augmented reality functionality to your 3D content using USD schemas.
Choosing Which Camera Feed to Augment
Add visual effects to the user’s environment in an AR experience through the front or rear
camera.
Managing Session Life Cycle and Tracking Quality
Keep the user informed on the current session state and recover from interruptions.
Displaying an AR Experience with Metal
Control rendering of your app’s virtual content on top of a camera feed.
class ARSession
The object that manages the major tasks associated with every AR experience, such as
motion tracking, camera passthrough, and image analysis.
Configuration Objects
Topics
Essentials
Setup
ARKit / ARKit in iOS
API Collection
ARKit in iOS
Integrate iOS device camera and motion features to produce augmented reality
experiences in your app or game.


## Page 14

Configure your augmented reality session to detect and track specific types of content.
struct RealityView
A view that contains RealityKit content.
class ARView
A view that enables you to display an AR experience with RealityKit.
class ARSCNView
A view that blends virtual 3D content from SceneKit into your augmented reality experience.
Deprecated
class ARSKView
A view that blends virtual 2D content from SpriteKit into the 3D space of an augmented reali
experience.
class ARCoachingOverlayView
A view that displays standardized onboarding instructions to direct users toward a specific
goal.
Content Anchors
Identify items in the physical environment, including planar surfaces, images, physical object
body positions, and faces.
Environmental Analysis
Analyze the video from the cameras and the accompanying data, and use ray-casting and
depth-map information to determine the location of items.
Camera, Lighting, and Effects
Determine the camera position and lighting for the current session, and apply effects, such a
occlusion, to elements of the environment.
Data Management
Obtain detailed information about skeletal and face geometry, and saved world data.
Creating USD files for Apple devices
Generate 3D assets that render as expected.
Views
Virtual Content


## Page 15

Add an AR experience to your app or website, or customize your content’s appearance in Quick
Look.
Previewing a Model with AR Quick Look
Display a model or scene that the user can move, scale, and share with others.
Adding Visual Effects in AR Quick Look and RealityKit
Balance the appearance and performance of your AR experiences with modeling strategies.
Adding an Apple Pay Button or a Custom Action in AR Quick Look
Provide a banner that users can tap to make a purchase or perform a custom action in an AR
experience.
OpenUSD schemas for AR
Add augmented reality functionality to your 3D content using USD schemas.
Specifying a lighting environment in AR Quick Look
Add metadata to your USDZ file to specify its lighting characteristics.
Communicate with other devices to create a shared AR experience.
Streaming an AR experience
Control an AR experience remotely by transferring sensor and user input over the network.
Creating a collaborative session
Enable nearby devices to share an AR experience by using a peer-to-peer multiuser strategy
Creating a multiuser AR experience
Enable nearby devices to share an AR experience by using a host-guest multiuser strategy.
class ARParticipantAnchor
An anchor for another user in multiuser augmented reality experiences.
class CollaborationData
An object that holds information that a user has collected about the physical environment.
AR Quick Look
Shared Experiences
Audio


## Page 16

Creating an immersive ar experience with audio
Use sound effects and environmental sound layers to create an engaging AR experience.
struct ARError
An error reported by ARKit.
enum Code
Codes that identify errors in ARKit.
Verifying Device Support and User Permission
Check whether your app can use ARKit and respect user privacy at runtime.
class ARSession
The object that manages the major tasks associated with every AR experience, such as
motion tracking, camera passthrough, and image analysis.
class ARAnchor
An object that specifies the position and orientation of an item in the physical environment.
Errors
See Also
iOS


