# Game controllers.pdf

## Page 1

Note
This sample code project is associated with WWDC21 session 10081: Tap Into Virtual and
Physical Game Controllers. This sample code project was previously associated with WWDC20
session 10614: Advancements in Game Controllers and originally associated with WWDC17
session 604: SceneKit: What’s New.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
Overview
See Also
Game controllers
Game Controller / Supporting Game Controllers
Sample Code
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people
interact with your game through haptics, lighting, and motion sensing.
Download
iOS 14.0+
iPadOS 14.0+
macOS 11.0+
tvOS 14.0+
Xcode 12.5+


## Page 2

class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.


## Page 3

To add support for the second-generation Siri Remote in your Apple TV game, you make a few
changes to your Xcode project and code.
First configure your Xcode project to handle directional gamepads and multiple micro gamepads.
On the Signing & Capabilities tab in the project editor, add the Game Controllers capability to you
project and check Directional Gamepad under Game Controllers. For more information, see
Configuring game controllers.
On the Info tab, add the GCSupportsMultipleMicroGamepads key and set the value to YES.
For more information, see Managing your app’s information property list values.
In your code, handle multiple micro gamepad connections. When a game controller connects,
check if the controller is a directional gamepad using the isKind(of:) method:
Overview
Configure your project
Handle multiple micro gamepads
Game Controller / Letting players use their second-generation Siri Remote as a game controller
Article
Letting players use their second-
generation Siri Remote as a game
controller
Support the second-generation Siri Remote as a game controller in your Apple TV
game.


## Page 4

Check if the device category is second-generation Siri Remote using the productCategory
property:
If these conditions are true, you can use the connected second-generation Siri Remote as a game
controller.
To access the center button of the second-generation Siri Remote, use the buttons property:
Then to access the directional pad, use the dpads property:
If your game requires an analog touch surface, check whether the directional pad is digital using
the isAnalog property:
For example, the Universal Electronic remote that works with Apple TV is a directional gamepad b
with physical non-analog buttons.
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
Access the remote buttons and directional pad
See Also
Game controllers


## Page 5

protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.


## Page 6

The Game Controller framework provides the ability to discover spatial game controllers and stylu
allows you to connect, read button or thumbstick inputs, and play haptics. After you connect to a
device, you use RealityKit or ARKit to combine tracking data with input from the device.
To begin developing with spatial game controllers, you need to configure your Xcode project. To
add the spatial game controller profile to your project, perform the following steps:
1. In Xcode, select your project in Xcode’s project navigator.
2. Select your project’s target.
3. Click the Signing & Capabilities tab in the project editor.
4. Add the Game Controller capability.
5. Select the Spatial Gamepad profile.
Note
You don’t need to enable the Spatial Gamepad profile if your app only supports stylus input.
Overview
Configure your project
Discover a controller or stylus
Game Controller / Discovering and tracking spatial game controllers and styli
Article
Discovering and tracking spatial game
controllers and styli
Receive controller and stylus input to interact with content in your augmented
reality app.


## Page 7

The system can notify your app when a spatial game controller connects or disconnects by
listening for GCControllerDidConnect and GCControllerDidDisconnect. A notification
that includes information as to whether the controller provides spatial input:
More than one controller can connect to a device at a time. You can use the connection notificatio
to track each connection as they happen, or check controllers() to iterate through an up-to-
date list of the currently connected controllers.
To get notifications for styli, use GCStylusDidConnectNotification and GCStylusDid
DisconnectNotification. These notifications provide a GCStylus, and you can get a list of
all currently connected styli by querying styli.
Note
Use GCControllerDidConnect and GCStylusDidConnectNotification when your
app launches to get the initial connection state. Checking for controllers and styli isn’t
synchronous and may return an empty list even with an accessory in a connected state.
You use input to access the button and thumbstick inputs of a spatial controller. When you work
with spatial game controllers, the input button mapping expose the following inputs:
Handle input mapping


## Page 8

Use input to access inputs from a spatial stylus accessory. A stylus exposes the following inputs
For information on polling for input and receiving callbacks, see Handling input events. For more
information on how to play haptics, see Playing Haptics on Game Controllers.
In RealityKit, an AnchorEntity provides a way to tether virtual content to physical locations or
objects in your real work space. For example, an image in your environment, your hands, or a
spatial game controller. On visionOS, accessory anchoring works in immersive and shared spaces
Use AnchoringComponent.AccessoryAnchoringSource with a GCController or
GCStylus to anchor virtual content onto the accessory. Each controller and stylus accessory has
list of possible locations you can anchor to, and depends on the accessory you use. You can
anchor virtual content to a location on the accessory by specifying a name from a list of possible
accessoryLocations.
For apps that don’t depend on high location accuracy, use the predicted tracking mode. If you
need higher location accuracy — at the cost of higher latency — use continuous tracking mode
Track spatial position with RealityKit anchor entities


## Page 9

Before using SpatialTrackingSession to get the transforms of a spatial game controller, you
app needs request permission to track an accessory. Set NSAccessoryTrackingUsage
Description in your app’s Info.plist file that explains how your app intends to use tracking
information.
If you use ARKit, tracking works similarly to the object and image tracking APIs. For more
information about tracking accessories, see Tracking accessories in volumetric windows.
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
See Also
Game controllers


## Page 10

class GCStylus
An object that represents a physical stylus connected to the device.


## Page 11

This protocol provides common properties for game controllers, and mouse and keyboard device
var vendorName: String?
The manufacturer-provided name for the device, or the user’s name for the device.
Required
var productCategory: String
The product category that identifies the type of controller.
Required
Product category constants
var handlerQueue: dispatch_queue_t
The dispatch queue that the framework uses to call element value change handlers.
Overview
Topics
Getting device information
Handling input
Game Controller / GCDevice
Protocol
GCDevice
A protocol that defines a common interface for game input devices.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 12

Required
var physicalInputProfile: GCPhysicalInputProfile
The device’s physical input profile, such as a controller’s extended gamepad.
Required
Deprecated
NSObjectProtocol
GCController
GCKeyboard
GCMouse
GCRacingWheel
GCStylus
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
Relationships
Inherits From
Conforming Types
See Also
Game controllers


## Page 13

class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.


## Page 14

Adding touch controls to games that support game controllers in iOS
Handling input events
Discovering and tracking spatial game controllers and styli
This class represents a real or virtual controller that a user interacts with during a game. A real
controller is a physical controller that connects directly or wirelessly to the device. A real controlle
can be formfitting or can attach closely to a device so players can use controls on both
simultaneously. A virtual controller is a software emulation of a real controller.
You discover controllers, and then you process the input from those controllers during gameplay.
Use the controllers() method to get the currently connected controllers. If necessary, use th
startWirelessControllerDiscovery(completionHandler:) method to connect with
wireless controllers.
This framework supports multiple connected game controllers. To identify which player is using a
controller in a multiplayer game, check the playerIndex property and set it, if necessary. For
single-player games, use the current property to get the controller that the player is actively
using.
Mentioned in
Overview
Game Controller / GCController
Class
GCController
A representation of a real game controller, a virtual controller, or a snapshot of a
controller.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 15

A controller’s profile encapsulates the details about a controller’s buttons, pads, axis, and other
input elements. Get the controller’s profile using one of the profile properties, such as extended
Gamepad, and then process the input from its elements.
You can either get the values of input elements on each iteration of your game loop, or set handle
to receive callbacks when those values change. For example, use the leftThumbstick propert
of the GCExtendedGamepad profile to get the thumbstick state. Use the valueChanged
Handler property to set a handler that you implement to process any input values that change in
the profile.
Alternatively, you can create a snapshot of a real or virtual controller using the capture()
method. A snapshot is a copy of a controller at a moment in time with its current element values.
Creating a snapshot may impact performance, and over time a snapshot doesn’t stay current.
Unlike other types of controllers, you can set the values of elements in a snapshot.
class func controllers() -> [GCController]
Returns the connected controllers for the device.
class func startWirelessControllerDiscovery(completionHandler: (() ->
Void)?)
Starts searching for nearby wireless controllers.
class func stopWirelessControllerDiscovery()
Stops searching for nearby wireless controllers.
static let GCControllerDidConnect: NSNotification.Name
A notification that posts after a controller connects to the device.
static let GCControllerDidDisconnect: NSNotification.Name
A notification that posts after a controller disconnects from the device.
class var current: GCController?
The most recently used game controller.
static let GCControllerDidBecomeCurrent: NSNotification.Name
A notification that posts when a controller becomes the current controller.
Topics
Discovering controllers
Handling multiple controllers


## Page 16

static let GCControllerDidStopBeingCurrent: NSNotification.Name
A notification that posts when a controller stops being the current controller.
var isAttachedToDevice: Bool
A Boolean value that indicates whether the controller closely integrates with the device.
class func supportsHIDDevice(IOHIDDevice) -> Bool
Returns a Boolean value that indicates whether the framework supports the specified human
interface device.
class var shouldMonitorBackgroundEvents: Bool
A Boolean value that indicates whether the app needs to respond to controller events when 
isn’t the frontmost app.
var input: GCControllerLiveInput
The input profile for the controller.
class GCControllerLiveInput
The input profile for a controller.
class GCControllerInputState
A class that represents an input state for gamepads and arcade sticks.
var extendedGamepad: GCExtendedGamepad?
The extended gamepad profile.
class GCPhysicalInputProfile
The base class for controller profiles that support physical buttons, thumbsticks, and
directional pads.
class GCKeyboardInput
A controller profile that uses the keyboard as the input device.
class GCMouseInput
A controller profile that tracks input from a mouse.
Inspecting a controller
Accessing controller input
Accessing controller profiles


## Page 17

class GCExtendedGamepad
A controller profile that supports the extended set of gamepad controls.
class GCDualShockGamepad
A controller profile that supports the DualShock 4 controller.
class GCXboxGamepad
A controller profile that supports the Xbox controller.
class GCDualSenseGamepad
A controller profile that supported the DualSense controller.
var microGamepad: GCMicroGamepad?
The micro gamepad profile.
class GCMicroGamepad
A controller profile that supports the Siri Remote.
class GCDirectionalGamepad
A profile that supports only the directional pad, without motion or rotation.
var motion: GCMotion?
The motion input profile.
var physicalInputProfile: GCPhysicalInputProfile
The physical input profile for the controller.
var gamepad: GCGamepad?
The gamepad profile.
Deprecated
class GCControllerElement
An input for a physical control, such as a button or thumbstick.
class GCControllerAxisInput
A control element that tracks movement along an axis.
class GCControllerButtonInput
A control element that represents a button touch or press.
class GCControllerTouchpad
Accessing controller elements


## Page 18

A control element that represents a touch event on a touchpad.
class GCControllerDirectionPad
A control element associated with a directional pad or a thumbstick.
class GCDeviceCursor
A control element for the cursor used as a directional pad.
class GCDualSenseAdaptiveTrigger
A class that encapsulates the features of a DualSense adaptive trigger.
var playerIndex: GCControllerPlayerIndex
The player index for the controller.
enum GCControllerPlayerIndex
The possible values for controller player indices.
var battery: GCDeviceBattery?
The controller’s battery information.
var haptics: GCDeviceHaptics?
The controller’s haptics information.
var light: GCDeviceLight?
The controller’s light settings.
class func withExtendedGamepad() -> GCController
Returns a snapshot of a newly created controller with an extended gamepad profile.
class func withMicroGamepad() -> GCController
Returns a snapshot of a newly created controller with a micro gamepad profile.
func capture() -> GCController
Returns a snapshot of the controller with its current element values.
var isSnapshot: Bool
Identifying controllers and displaying a player index
Accessing battery, haptics, and light objects
Creating snapshots


## Page 19

A Boolean value that indicates whether the controller is a snapshot of a controller.
var controllerPausedHandler: ((GCController) -> Void)?
The block that the framework calls when the user presses the pause button on the controlle
Deprecated
protocol GCGameControllerSceneDelegate
class GCEventInteraction
An interaction that indicates the view’s intent to receive game controller events through the
Game Controller framework.
class GCGameControllerActivationContext
struct DidBecomeCurrentMessage
A message that posts after a game controller becomes the most recently used controller.
struct DidConnectMessage
A message that posts after a game controller accessory connects to the device.
struct DidDisconnectMessage
A message that posts after a game controller accessory disconnects from the device.
struct DidStopBeingCurrentMessage
A message that posts after a game controller stops being the most recently used controller.
NSObject
Responding to a paused controller or controller event
Identifying the activation context
Structures
Relationships
Inherits From
Conforms To


## Page 20

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GCDevice
Hashable
NSObjectProtocol
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.
See Also
Game controllers


## Page 21

Handling input events
class var connectedRacingWheels: Set<GCRacingWheel>
The racing wheels connected to the device.
static let GCRacingWheelDidConnect: NSNotification.Name
A notification that posts after a racing wheel controller connects to the device.
static let GCRacingWheelDidDisconnect: NSNotification.Name
A notification that posts after a racing wheel controller disconnects from the device.
func acquireDevice() throws
Starts receiving events from the racing wheel.
Mentioned in
Topics
Discovering racing wheels
Getting events
Game Controller / GCRacingWheel
Class
GCRacingWheel
An object that represents a physical racing wheel controller connected to a devic
Mac Catalyst 16.0+
macOS 13.0+


## Page 22

func relinquishDevice()
Stops receiving events from the racing wheel.
var isAcquired: Bool
A Boolean value that indicates whether the racing wheel sends events to the app.
var wheelInput: GCRacingWheelInput
The physical input profile for the racing wheel.
func capture() -> GCRacingWheel
Returns a snapshot of the racing wheel with its current element values.
var isSnapshot: Bool
A Boolean value that indicates whether the object is a snapshot of a racing wheel.
struct DidConnectMessage
A message that posts after a racing wheel accessory connects to the device.
struct DidDisconnectMessage
A message that posts after a racing wheel accessory disconnects from the device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Accessing the controller profile
Creating snapshots
Structures
Relationships
Inherits From
Conforms To


## Page 23

Equatable
GCDevice
Hashable
NSObjectProtocol
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.
See Also
Game controllers


## Page 24

To get the keyboard object and its input values, register for the GCKeyboardDidConnect (Swift
or GCKeyboardDidConnectNotification (Objective-C) notification for when a keyboard
connects to the device, or use the coalesced class property. Then get the input values from the
keyboard object’s keyboardInput controller profile.
class var coalesced: GCKeyboard?
The keyboard currently connected to the device.
static let GCKeyboardDidConnect: NSNotification.Name
A notification that posts after a keyboard connects to the device.
static let GCKeyboardDidDisconnect: NSNotification.Name
A notification that posts after a single keyboard, or the last of multiple keyboards, disconnec
from the device.
Overview
Topics
Discovering keyboards
Game Controller / GCKeyboard
Class
GCKeyboard
An object that represents a physical keyboard connected to a device.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 25

var keyboardInput: GCKeyboardInput?
The controller profile for the keyboard.
struct DidConnectMessage
A message that posts after a keyboard accessory connects to the device.
struct DidDisconnectMessage
A message that posts after a keyboard accessory disconnects from the device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GCDevice
Hashable
NSObjectProtocol
Supporting Game Controllers
Getting input values
Structures
Relationships
Inherits From
Conforms To
See Also
Game controllers


## Page 26

Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.


## Page 27

To get a mouse object and its input values, register for the GCMouseDidConnect (Swift) or
GCMouseDidConnectNotification (Objective-C) notification for when a mouse connects to
the device. Then register for the GCMouseDidBecomeCurrent (Swift) or GCMouseDidBecome
CurrentNotification (Objective-C) notification for when it becomes the current mouse.
Alternatively, use the current class property or the mice() class method to get a mouse objec
Then get the current input values from the mouse object’s mouseInput controller profile.
class func mice() -> [GCMouse]
Returns any mice that the user connects to the device.
static let GCMouseDidConnect: NSNotification.Name
A notification that posts after a mouse connects to the device.
static let GCMouseDidDisconnect: NSNotification.Name
A notification that posts after a mouse disconnects from the device.
Overview
Topics
Discovering mouse devices
Game Controller / GCMouse
Class
GCMouse
An object that represents a physical mouse connected to a device.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 28

class var current: GCMouse?
The most recent mouse that the user connects.
static let GCMouseDidBecomeCurrent: NSNotification.Name
A notification that posts when a mouse becomes the most recent mouse that the user
connects.
static let GCMouseDidStopBeingCurrent: NSNotification.Name
A notification that posts when a mouse stops being the most recent mouse that the user
connects.
var mouseInput: GCMouseInput?
The controller profile for the mouse device.
struct DidBecomeCurrentMessage
A message that posts after a mouse becomes the most recently used mouse.
struct DidConnectMessage
A message that posts after a mouse accessory connects to the device.
struct DidDisconnectMessage
A message that posts after a mouse accessory disconnects from the device.
struct DidStopBeingCurrentMessage
A message that posts after a mouse stops being the most recently used mouse.
NSObject
Handling multiple mouse devices
Getting input values
Structures
Relationships
Inherits From


## Page 29

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GCDevice
Hashable
NSObjectProtocol
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.
Conforms To
See Also
Game controllers


## Page 30



## Page 31

Discovering and tracking spatial game controllers and styli
Use the styli property to get the currently connect stylus accessories when your application
starts. Register for GCStylusDidConnectNotification and GCStylusDidDisconnect
Notification to get notified when a stylus connects of disconnects while your application is
running.
Mentioned in
Overview
Game Controller / GCStylus
Class
GCStylus
An object that represents a physical stylus connected to the device.
visionOS 26.0+


## Page 32

Check the productCategory to determine the type of stylus. A spatial stylus - capable of 6DoF
tracking by Apple Vision Pro - has a GCProductCategorySpatialStylus category.
Use the input property to get the input profile of the stylus. A spatial stylus includes a pressure
sensitive tip and an input cluster composed of two buttons.
The primary button (GCInputStylusPrimaryButton) is the front button (closest to the
stylus tip) in the input cluster of the stylus. This button is frequently used grab virtual objects.
The secondary button (GCInputStylusSecondaryButton) is the middle button in the inpu
cluster. It can measures pressure/force levels. It’s intended to be used for controlling in-air
drawing, selection, and generic interactions.
The tip is also represented as a button (GCInputStylusTip).
Use the haptics property to get the haptics profile of the stylus. A spatial stylus may optionally
support haptic feedback to a single locality - GCHapticsLocalityDefault.
Topics


## Page 33

class var styli: [GCStylus]
Get the collection of stylus accessories currently connected to the device.
var input: (any GCDevicePhysicalInput)?
Gets the input profile for the stylus.
var haptics: GCDeviceHaptics?
Gets the haptics profile for the stylus, if supported.
var GCInputStylusPrimaryButton: String
var GCInputStylusSecondaryButton: String
var GCInputStylusTip: String
struct DidConnectMessage
A message that posts after a stylus accessory connects to the device.
struct DidDisconnectMessage
A message that posts after a stylus accessory disconnects from the device.
NSObject
CVarArg
Accessing the styli
Getting input values and haptics
Retrieving the buttons
Structures
Relationships
Inherits From
Conforms To


## Page 34

CustomDebugStringConvertible
CustomStringConvertible
Equatable
GCDevice
Hashable
NSObjectProtocol
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
See Also
Game controllers


