# Controlling the dock accessory.pdf

## Page 1

This sample code project shows you how to use your camera app with a DockKit accessory to
frame and track subjects in real time. It demonstrates how DockKit system tracking works for you
camera app, and how you can override system tracking to frame and track specific subjects using
custom machine learning signals. It also shows you how to integrate physical buttons on your
DockKit device with camera controls.
The sample uses SwiftUI and the features of Swift concurrency to build a responsive camera app
with DockKit control. See AVCam: Building a camera app for more details about the camera
implementation design. This sample code project uses the sample app from that project as a
starting point to write a basic camera app. The following diagram depicts the app’s design:
Overview
DockKit / Controlling a DockKit accessory using your camera app
Sample Code
Controlling a DockKit accessory using
your camera app
Follow subjects in real time using an iPhone that you mount on a DockKit
accessory.
Download
iOS 18.0+
Xcode 16.1+


## Page 2

The sample app defines two key services:
CaptureService is an actor that manages the interactions with the AVFoundation capture
APIs. This object configures the capture pipeline and manages its life cycle, and it defines an
asynchronous interface to capture videos. It also delegates handling of those operatons to the
app’s MovieCapture object.
DockControlService is an actor that manages interactions with a DockAccessory using
DockKit APIs. This object listens to DockAccessory connection/disconnection events,
manages subscriptions to the connected DockAccessory, and controls its movements using
an asynchronous interface. It also delegates camera control in response to DockAccessory
events to the CameraModel object.
Note
Configuring and starting a capture session are blocking operations that can take time to
complete. To keep the user interface responsive, the app defines CaptureService as an
actor type to ensure that AVFoundation capture API calls don’t occur on the main thread.
Because Simulator doesn’t have access to device cameras and can’t connect to a DockKit device
it isn’t suitable for running the sample app. To run the app, you need an iPhone with iOS 18 or late
See AVCam: Building a camera app to learn how to write a basic camera app to capture videos
using an iPhone’s front and rear cameras.
Configure the sample code project
Write a basic camera app to take photos


## Page 3

AVCaptureSession is a singleton class that provides connection and disconnection notification
with a DockKit accessory by subscribing to the accessoryStateChanges API.
The dock control service subscribes to accessoryStateChanges in its setUp(features:
DockAccessoryFeatures) method.
When an accessory connects, DockKit sets it up to use system tracking, and to listen to accessor
events and battery states in setupAccessorySubscriptions(for accesory: Dock
Accessory).
The app provides a tracking mode menu to switch between system tracking, custom tracking, and
manual tracking. The default is system tracking, which the app sets by calling setSystem
TrackingEnabled(_:) to true.
Configure the DockKit accessory manager
Change the tracking mode


## Page 4

The app provides various menus and options to configure the selected subjects, selected frame,
region to track, and more. All menus and buttons primarily live in the main DockKit menu.
The app provides a tap-to-track toggle to enable or disable selecting a specific subject to track b
tapping the camera view. When the tap-to-track toggle is enabled, the selectSubject(at
point: CGPoint?) method allows people to select tapped subjects.
The app provides a region-of-interest toggle to enable or disable setting a region of interest to
frame the selected subjects by holding and dragging the camera view. When toggling the region o
interest, the setRegionOfInterest(to region: CGRect) method allows setting a region
CGRect in the camera view. The dock accessory keeps the subjects framed in the selected regio
The app provides a framing mode menu to select a FramingMode.
The app uses the helper function dockKitFramingMode(from: framing) to map a local
FramingMode enumeration to DockAccessory.FramingMode.
Tap to track the subject
Set the region of interest
Set the framing mode


## Page 5

When someone sets the TrackingMode to TrackingMode.manual, the app provides chevron
to move DockAccessory up, left, right, and down by using the setAngularVelocity(_:) AP
The app provides buttons to run the four default animations that DockAccessory provides.
Before running the animation, the app disables system tracking. When the animation is complete,
Implement manual control using actuator velocities
Run the default animations


## Page 6

the app restores system tracking to its prior value.
The app uses the helper function dockKitAnimation(from animation: Animation) to
map a local animation enumeration to DockAccessory.Animation.
The DockKit menu provides toggles to subscribe to various states, like battery and tracking, and
displays them in the app’s UI.
The dock control service subscribes to batteryStates to acquire the current battery state of t
accessory. The current battery state includes the battery level, charging indicator, and so forth.
Implement the battery state


## Page 7

The dock control service subscribes to trackingStates to get a list of tracked subjects with
attributes like saliency and speaking confidence. The dock control service delegates the handling
of the conversion from a normalized subject rectangle to camera view space coordinates to the
CameraModel, which uses the capture service for the operation. The app uses these states, alon
with the transformed subject rectangle, to show an overlay on the faces of the subjects.
The dock control service subscribes to an async stream of AccessoryEvents. A physical inpu
on the DockAccessory triggers an accessory event. When the app receives an accessory event
it delegates handling of the event to the CameraModel, which uses the capture service to perfor
camera operations.
Implement the tracking states
Implement camera control using accessory events


## Page 8

CameraModel implements the sample’s CameraCaptureDelegate protocol and provides the
helper methods to control the camera.
The capture service implements the updateMagnification(for zoomType: CameraZoom
Type, by scale: Double = 0.2) method in response to a zoom event from the accessory.
The capture service implements the startRecording() method in response to a start-capture
shutter event, and a stopRecording() method in response to a stop-capture shutter event.
Implement the camera zoom
Implement the camera shutter


## Page 9

The capture service implements the selectNextVideoDevice() method in reponse to the
camera flip event.
class DockAccessoryManager
Observe the state of dock accessories and enable or disable system tracking.
class DockAccessory
Obtain accessory information and control tracking behavior.
enum DockKitError
A list of errors that DockKit sends.
Implement the camera flip
See Also
Controlling the dock accessory


## Page 10

DockAccessoryManager enables and disables system tracking for camera-enabled apps, and
provides docking and undocking notifications. If you want to customize the tracking behavior of a
dock accessory, use accessoryStateChanges to obtain that accessory.
This class is a singleton, so use shared to fetch the single instance.
static let shared: DockAccessoryManager
The accessory manager singleton object.
var accessoryStateChanges: DockAccessory.StateChanges
Obtain a reference to a dock accessory and receive notifications about its state.
Overview
Topics
Obtaining a manager
Controlling dock accessories
Changing tracking behavior
DockKit / DockAccessoryManager
Class
DockAccessoryManager
Observe the state of dock accessories and enable or disable system tracking.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
visionOS 1.0+


## Page 11

var isSystemTrackingEnabled: Bool
An indication of whether system tracking is enabled.
func setSystemTrackingEnabled(Bool) async throws
Enable and disable system tracking for camera-enabled apps.
Sendable, SendableMetatype
Controlling a DockKit accessory using your camera app
Follow subjects in real time using an iPhone that you mount on a DockKit accessory.
class DockAccessory
Obtain accessory information and control tracking behavior.
enum DockKitError
A list of errors that DockKit sends.
Relationships
Conforms To
See Also
Controlling the dock accessory


## Page 12

DockAccessory provides information about the dock accessory including its model name and
firmware version. It also controls the dock accessory when you disable system tracking. Use Doc
Accesory to perform animations, or explicitly control the position of the dock accessory in three
dimensional space by supplying coordinates in units of radians. The collection of the X, Y, and Z
values corresponding to pitch, yaw, and roll is the angular position of the dock accessory.
If there are multiple subjects in a video frame, direct the dock accessory to focus on a particular
area of the frame using setFramingMode(_:).
Important
DockKit throws a DockKitError.frameRateTooHigh exception if you animate or set the
orientation of the dock accessory too quickly, so keep call rates at 2 times per second or less.
func selectSubject(at: CGPoint) async throws
Overview
Topics
Selecting and tracking
DockKit / DockAccessory
Class
DockAccessory
Obtain accessory information and control tracking behavior.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+


## Page 13

Selects a subject to track at the supplied coordinates.
func track([AVMetadataObject], cameraInformation: DockAccessory.Camera
Information) async throws
Automatically generate and send tracking vectors to the device.
func track([DockAccessory.Observation], cameraInformation: DockAccessor
.CameraInformation) async throws
Automatically generate and send tracking vectors to the device.
struct Observation
An observation of the contents of a single video frame.
struct CameraInformation
A collection of tracking information about the camera currently in use.
enum CameraOrientation
The set of camera orientations used to extract coordinates.
func animate(motion: DockAccessory.Animation) async throws -> Progress
Starts an animation sequence.
func setRegionOfInterest(CGRect) async throws
Sets the area in the video frame in which the dock accessory tracks a subject.
var regionOfInterest: CGRect
The area in the video frame in which the dock accessory tracks a subject.
enum Animation
Character animations that describe how to move the dock accessory.
func setLimits(DockAccessory.Limits) throws
Sets limits for the axes of rotation.
func setOrientation(Vector3D, duration: Duration, relative: Bool) throw
-> Progress
Sets the position of each axis of orientation to radians for pitch, yaw, and roll.
Deprecated
Performing animation
Setting position and limits


## Page 14

func setOrientation(Rotation3D, duration: Duration, relative: Bool)
throws -> Progress
Sets the position of each axis of orientation to radians for pitch, yaw, and roll.
Deprecated
func setAngularVelocity(Vector3D) async throws
Sets the angular velocity of each axis of orientation.
func setFramingMode(DockAccessory.FramingMode) async throws
Customize the dock accessory’s tracking behavior.
var framingMode: DockAccessory.FramingMode
The current framing mode.
enum FramingMode
The mode to control framing of the subject when tracking.
var motionStates: DockAccessory.MotionStates
Motion information from the dock accessory that includes current orientation and velocity of
all axes.
var limits: DockAccessory.Limits
Current limits for the axes of rotation and maximum angular velocity.
struct MotionState
An event that indicates the state of a dock accessory’s current position and speed.
struct MotionStates
An asynchronous sequence of orientation and velocity updates from the device.
struct Limits
Soft limits on multiple axes of rotation.
var firmwareVersion: String?
The firmware version of the dock accessory.
Setting framing mode
Getting position and limits
Getting accessory information


## Page 15

var hardwareModel: String?
The model of the dock accessory.
let identifier: DockAccessory.Identifier
The name and unique identifer of the dock accessory.
struct Identifier
Information that uniquely identifies the dock accessory.
enum Category
Types of supported dock accesories.
enum State
The state of a dock accessory.
struct StateChange
An event that indicates a change in the state of a dock accessory.
struct StateChanges
An asynchronous sequence of dock accessory state changes.
func hash(into: inout Hasher)
Creates a unique identifier representing the object.
var debugDescription: String
The text description of the dock accessory state.
struct AccessoryEvents
An asynchronous sequence of dock accessory events.
struct BatteryState
A struct that represents an accessory battery state.
struct BatteryStates
An asynchronous sequence of dock accessory battery states.
struct TrackedObject
The state of a tracked object in the active tracking session.
Inspecting the object
Structures


## Page 16

struct TrackedPerson
The state of a tracked person in the active tracking session.
struct TrackingState
A representation of the active tracking session state.
struct TrackingStates
An asynchronous sequence of tracking session states.
var accessoryEvents: DockAccessory.AccessoryEvents
Events from the accessory that signify button presses or common camera controls.
var batteryStates: DockAccessory.BatteryStates
Battery states from the accessory that indicate changes in battery charge or readiness
var trackingStates: DockAccessory.TrackingStates
Provides an access to the asynchronous sequence of tracking session states
func selectSubjects([UUID]) async throws
Selects subjects to track with specific identifiers
func setOrientation(Rotation3D, duration: Duration, relative: Bool)
async throws -> Progress
Sets the position of each axis of orientation to radians for pitch, yaw, and roll.
func setOrientation(Vector3D, duration: Duration, relative: Bool) async
throws -> Progress
Sets the position of each axis of orientation to radians for pitch, yaw, and roll.
func track([DockAccessory.Observation], cameraInformation: DockAccessor
.CameraInformation, image: CVPixelBuffer) async throws
Automatically generate and send tracking vectors to the device.
func track([AVMetadataObject], cameraInformation: DockAccessory.Camera
Information, image: CVPixelBuffer) async throws
Automatically generate and send tracking vectors to the device.
Instance Properties
Instance Methods


## Page 17

enum AccessoryEvent
An enumeration that represents an accessory event.
enum BatteryChargeState
The charging state of an accessory battery
enum TrackedSubjectType
The subjects that the dock can track.
CustomDebugStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
Controlling a DockKit accessory using your camera app
Follow subjects in real time using an iPhone that you mount on a DockKit accessory.
class DockAccessoryManager
Observe the state of dock accessories and enable or disable system tracking.
enum DockKitError
A list of errors that DockKit sends.
Enumerations
Relationships
Conforms To
See Also
Controlling the dock accessory


## Page 18

case invalidParameter
The supplied parameter is invalid.
case notConnected
The dock accessory isn’t connected to a device.
case notSupported
The method isn’t supported on a specific platform.
case notSupportedByDevice
The device doesn’t support the requested operation.
case cameraTCCMissing
The camera terms and conditions are missing.
case frameRateTooHigh
The call rate for the method is too frequent.
Topics
Getting errors
Enumeration Cases
DockKit / DockKitError
Enumeration
DockKitError
A list of errors that DockKit sends.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+


## Page 19

case frameRateTooLow
The frame rate is too low to track an object.
case noSubjectFound
There is no subject in the video frame.
Copyable
Equatable
Error
Hashable
LocalizedError
Sendable
SendableMetatype
Controlling a DockKit accessory using your camera app
Follow subjects in real time using an iPhone that you mount on a DockKit accessory.
class DockAccessoryManager
Observe the state of dock accessories and enable or disable system tracking.
class DockAccessory
Obtain accessory information and control tracking behavior.
Relationships
Conforms To
See Also
Controlling the dock accessory


