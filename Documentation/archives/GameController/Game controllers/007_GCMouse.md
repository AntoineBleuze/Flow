# 007_GCMouse.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4



