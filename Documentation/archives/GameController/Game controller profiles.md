# Game controller profiles.pdf

## Page 1

Handling input events
Receive controller input using either polling or callbacks.
protocol GCDevicePhysicalInput
The common properties and methods for objects that represent the input profile of a device
protocol GCDevicePhysicalInputState
The common properties for physical devices with elements.
protocol GCDevicePhysicalInputStateDiff
The common functions for objects that contain the differences between a current and
previous input state object.
struct GCPhysicalInputElementCollection
A collection of physical input elements.
protocol GCPhysicalInputElement
The common properties of physical input elements.
protocol GCButtonElement
Topics
Essentials
Elements
Game Controller / Input
API Collection
Input
Receive controller input in the way that best integrates with the flow of your game
or game engine.


## Page 2

The common properties of an element that represents a momentary switch, such as a push
button.
protocol GCAxisElement
The common properties for an element that represents an absolute or relative input value
along an axis.
protocol GCSwitchElement
The common properties for an element that represents a switch.
protocol GCDirectionPadElement
The common properties of elements that represent directional pads.
protocol GCPhysicalInputSource
A protocol for a description of an element without any system-level remapping of the contro
struct GCPhysicalInputElementName
The name of a physical input element.
protocol GCPhysicalInputElementTypedName
A type-safe name for accessing elements of a physical input element collection.
struct GCButtonElementName
The names of the button elements.
struct GCAxisElementName
The names for the elements that provide values along an axis.
struct GCSwitchElementName
The name for an element that represents a switch.
struct GCDirectionPadElementName
The names for directional pad elements.
Extended gamepad input names
Constants for names of extended gamepad elements.
DualShock controller input names
Element inputs
Element names


## Page 3

Constants for names of DualShock 4 elements.
Xbox controller input names
Constants for names of Xbox elements.
Micro gamepad input names
Constants for names of micro gamepad elements.
Directional Gamepad Input Names
Constants for names of directional pad elements.
class GCMotion
A controller profile that supports orientation and motion.
class GCDeviceBattery
The charge level and state of a device’s battery.
class GCDeviceHaptics
The locations of haptic actuators on a game controller.
class GCDeviceLight
The colored light on a device.
See Also
Game controller profiles


## Page 4

The motion controller profile provides attitude and rotation data, as well as acceleration and sens
information. Use this profile to get motion input from a controller that measures acceleration and
rotation rate. If the controller’s motion property is a GCMotion object, the controller supports
motion.
This illustration shows the direction of the x, y, and z axes of an iPhone when held upright.
Overview
Game Controller / GCMotion
Class
GCMotion
A controller profile that supports orientation and motion.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+


## Page 5

var controller: GCController?
The controller for the profile.
var valueChangedHandler: GCMotionValueChangedHandler?
The block that the profile calls when an element’s value changes.
typealias GCMotionValueChangedHandler
The signature for the block that the profile calls when an element’s value changes.
var hasAttitude: Bool
A Boolean value that indicates whether the controller provides attitude data.
Topics
Getting the Controller
Receiving a Callback When Input Values Change
Verifying Capabilities


## Page 6

var hasRotationRate: Bool
A Boolean value that indicates whether the controller provides rotation data.
var hasGravityAndUserAcceleration: Bool
A Boolean value that indicates whether the controller provides gravity and user acceleration
data.
var hasAttitudeAndRotationRate: Bool
A Boolean value that indicates whether the controller provides attitude and rotation data.
Deprecated
var attitude: GCQuaternion
The attitude of the controller.
struct GCQuaternion
A quaternion that represents a controller’s measurement of attitude.
var rotationRate: GCRotationRate
The rotation rate of the controller.
struct GCRotationRate
A structure that represents rotation rates around the x, y, and z axes.
struct GCEulerAngles
A structure that specifies the controller’s attitude as a series of rotations around the x, y, and
z axes.
var acceleration: GCAcceleration
The total acceleration of the controller that includes gravity and the acceleration the user
applies to the controller.
var gravity: GCAcceleration
The gravity acceleration vector from the controller’s reference frame.
var userAcceleration: GCAcceleration
The acceleration that the user applies to the controller.
struct GCAcceleration
Accessing Attitude and Rotation Data
Accessing Gravity and Acceleration Data


## Page 7

A three-dimensional acceleration vector.
var sensorsRequireManualActivation: Bool
A Boolean value that indicates whether the sensors that compute the motion data require
manual activation.
var sensorsActive: Bool
A Boolean value that indicates whether the sensors that compute the motion data are active
func setStateFrom(GCMotion)
Copies the input values from a specified motion profile to a snapshot of a motion profile.
func setAttitude(GCQuaternion)
Sets the controller’s attitude.
func setRotationRate(GCRotationRate)
Sets the controller’s rotation rate.
func setAcceleration(GCAcceleration)
Sets the total acceleration of the controller that includes gravity and the user’s acceleration.
func setGravity(GCAcceleration)
Sets the controller’s gravity data.
func setUserAcceleration(GCAcceleration)
Sets the acceleration the user applies to the controller.
NSObject
Accessing Sensor Data
Setting Snapshot Values
Relationships
Inherits From
Conforms To


## Page 8

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Input
Receive controller input in the way that best integrates with the flow of your game or game
engine.
class GCDeviceBattery
The charge level and state of a device’s battery.
class GCDeviceHaptics
The locations of haptic actuators on a game controller.
class GCDeviceLight
The colored light on a device.
See Also
Game controller profiles


## Page 9

Use this class to display the state of a device’s battery to a player.
var batteryLevel: Float
The charge level of a device’s battery.
var batteryState: GCDeviceBattery.State
The state of a device’s battery.
enum State
A state that indicates whether a device’s battery has power and is charging.
Overview
Topics
Getting the battery level and state
Relationships
Game Controller / GCDeviceBattery
Class
GCDeviceBattery
The charge level and state of a device’s battery.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 10

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Input
Receive controller input in the way that best integrates with the flow of your game or game
engine.
class GCMotion
A controller profile that supports orientation and motion.
class GCDeviceHaptics
The locations of haptic actuators on a game controller.
class GCDeviceLight
The colored light on a device.
Inherits From
Conforms To
See Also
Game controller profiles


## Page 11

Use this class to create a haptic engine with a specified locality. Any patterns you send to that
engine play on the specified actuators.
Important
The supportsHaptics property of the engine that returns from the createEngine(with
Locality:) method applies to the device, not the game controller. Use the supported
Localities method in this class to determine whether a game controller supports haptics.
func createEngine(withLocality: GCHapticsLocality) -> CHHapticEngine?
Creates a haptics engine with the specified locality.
let GCHapticDurationInfinite: Float
An infinite duration for a haptics event.
Overview
Topics
Creating a haptics engine
Game Controller / GCDeviceHaptics
Class
GCDeviceHaptics
The locations of haptic actuators on a game controller.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 12

var supportedLocalities: Set<GCHapticsLocality>
The locations of haptic actuators on the device.
struct GCHapticsLocality
The location of one or more haptics actuators on a game controller.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Input
Receive controller input in the way that best integrates with the flow of your game or game
engine.
class GCMotion
A controller profile that supports orientation and motion.
class GCDeviceBattery
Getting the localities
Relationships
Inherits From
Conforms To
See Also
Game controller profiles


## Page 13

The charge level and state of a device’s battery.
class GCDeviceLight
The colored light on a device.


## Page 14

var color: GCColor
The color of a device’s light.
class GCColor
The color of a device light.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Getting the light’s color
Relationships
Inherits From
Conforms To
Game Controller / GCDeviceLight
Class
GCDeviceLight
The colored light on a device.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+


## Page 15

Equatable
Hashable
NSObjectProtocol
Input
Receive controller input in the way that best integrates with the flow of your game or game
engine.
class GCMotion
A controller profile that supports orientation and motion.
class GCDeviceBattery
The charge level and state of a device’s battery.
class GCDeviceHaptics
The locations of haptic actuators on a game controller.
See Also
Game controller profiles


