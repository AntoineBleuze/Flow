# 000_Controlling a DockKit accessory using your camera app.pdf

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


