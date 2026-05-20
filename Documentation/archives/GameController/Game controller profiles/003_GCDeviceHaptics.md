# 003_GCDeviceHaptics.pdf

## Page 1

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


## Page 2

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


## Page 3

The charge level and state of a device’s battery.
class GCDeviceLight
The colored light on a device.


