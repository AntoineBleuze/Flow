# 005_CHHapticDynamicParameter.pdf

## Page 1

Dynamic parameters change their associated event parameters at specific times. When you send
dynamic parameter to a haptic pattern player, the value associated with the parameter changes
abruptly at the specified time, across all events in the pattern. To precipitate a gradual change, us
a CHHapticParameterCurve object.
For haptic intensity and audio volume, the final property value is equal to the original event
parameter value multiplied by the dynamic parameter value. For all other parameters, the final
property value is equal to the dynamic parameter value added to the original event parameter
value. In both cases, the resulting value is limited to the range with minimum and maximum values
corresponding to the specified event parameter.
init(parameterID: CHHapticDynamicParameter.ID, value: Float, relative
Time: TimeInterval)
Creates a dynamic parameter from its ID, value, and start time.
Overview
Topics
Creating a Dynamic Parameter
Core Haptics / CHHapticDynamicParameter
Class
CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during
playback.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 2

struct ID
The identifier that reveals the type of property associated with a dynamic parameter.
var parameterID: CHHapticDynamicParameter.ID
The dynamic parameter ID defining the type of parameter being modified.
var relativeTime: TimeInterval
The time at which this dynamic parameter is applied, relative to the start time of the pattern.
var value: Float
The value of the dynamic parameter.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
Specifying a Dynamic Parameter’s Value
Relationships
Inherits From
Conforms To
See Also
Programmatic haptics


## Page 3

Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


