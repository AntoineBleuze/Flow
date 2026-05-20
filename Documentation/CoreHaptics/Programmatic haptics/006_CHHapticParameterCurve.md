# 006_CHHapticParameterCurve.pdf

## Page 1

Representing haptic patterns in AHAP files
Parameter curves serve the same purpose as dynamic parameters in that they alter a property
value during playback. Unlike dynamic parameters, which change a property value instantaneous
parameter curves interpolate linearly between parameter values to ensure a smooth transition.
Mentioned in
Overview
Core Haptics / CHHapticParameterCurve
Class
CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually
during playback.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS
tvOS 14.0+
visionOS 1.0+


## Page 2

For example, a parameter curven’tr haptic intensity modulates the intensity over time, ensuring a
smooth transition between the current intensity and the upcoming one. Parameter curves apply to
all events in a pattern; it isn’t possible to apply one to only a single event.
init(parameterID: CHHapticDynamicParameter.ID, controlPoints: [CHHaptic
ParameterCurve.ControlPoint], relativeTime: TimeInterval)
Creates a parameter curve from its parameter ID, control points, and start time.
class ControlPoint
A single control point in a parameter curve.
var controlPoints: [CHHapticParameterCurve.ControlPoint]
An array containing the curve’s control points.
var parameterID: CHHapticDynamicParameter.ID
The parameter ID defining the type of parameter that the curve represents.
var relativeTime: TimeInterval
The time at which this parameter curve is applied, relative to the start time of the pattern.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Topics
Creating a Curve
Describing the Curve
Relationships
Inherits From
Conforms To


## Page 3

Hashable
NSObjectProtocol
Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
See Also
Programmatic haptics


