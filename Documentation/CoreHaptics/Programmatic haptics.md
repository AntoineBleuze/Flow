# Programmatic haptics.pdf

## Page 1

Note
This sample code project is associated with WWDC21 session 10278: Practice Audio Haptic
Design.
You must run the sample on iPhone 8 or later.
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
Overview
Configure the Sample Code Project
See Also
Programmatic haptics
Core Haptics / Delivering Rich App Experiences with Haptics
Sample Code
Delivering Rich App Experiences with
Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into
key interactive moments.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 12.5+


## Page 2

Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


## Page 3

The sample code project, HapticBounce, demonstrates how to play a haptic with audio when a
bouncing sphere collides with the edges of the screen. The sample app shows how to vary the
volume of the synthesized audio signal and the intensity of the transient haptic pattern based on
the sphere’s velocity during impact.
Although the sample app uses UIKit Dynamics and UIKit for simplicity and familiarity with UIKit
classes, but your app can also use a 2D engine like SpriteKit to represent interactive object
collisions.
Note
HapticBounce requires Xcode 11 or later. Simulator doesn’t support a haptic interface, so build
and run this sample on an iPhone 8, 8 Plus, X, XR, XS, or XS Max running iOS 13 or later.
Check for device compatibility and set up an instance of CHHapticEngine, as the sample
demonstrates when you launch the app.
Overview
Configure the App to Play Haptics
Core Haptics / Playing Collision-Based Haptic Patterns
Sample Code
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision
speed.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 12.0+


## Page 4

See Preparing your app to play haptics for more information about setting up the engine.
Express the walls as boundaries in a UICollisionBehavior with the sphere.
Define the Objects in UIKit Dynamics


## Page 5

Each bounce against the wall is a dynamic item behavior, which lets you tweak the elasticity to
match the haptic effect. An animator of class UIDynamicAnimator ties together all of these
dynamic objects with gravity.
HapticBounce uses the device’s accelerometer to move the sphere. It adjusts the accelerometer b
responding to motion updates in a completion handler.
When the sphere collides with a wall, the dynamics framework sends a callback to its delegate.
ViewController implements this delegate, UICollisionBehaviorDelegate, to respond to
collisions.
To vary the haptic at the point of collision, check the sphere’s velocity and map it to a normalized 
to 1) intensity and sharpness value, as follows:
Play Variable Haptic Patterns on Collision


## Page 6

The sample sets kMaxVelocity based on experimentation dropping the sphere from a maximum
possible height, but you can adjust the value to create a stronger or weaker intensity pattern.
On each impact, you can create a haptic player, an inexpensive operation, on the spot, using the
desired haptic parameters.
Starting the player plays the haptic.
In addition to playing haptic patterns, the haptic engine also synthesizes audio. The engine in
HapticBounce plays this audio by adding an audio event to the same haptic player as the haptic
event, as follows:
Synthesize Audio to Play With the Haptic


## Page 7

Instead of adjusting haptic intensity and sharpness based on the sphere’s velocity, you vary audio
volume and pitch.
Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.
See Also
Programmatic haptics


## Page 8

This sample, HapticPalette, defines a two-dimensional touch area, where the x-axis varies the
haptic pattern’s sharpness, and the y-axis maps to haptic intensity. Use this interface to explore
the range of haptic patterns that you can create with Core Haptics. By sliding your finger inside th
bounded area, you can vary the parameters of the generated haptic pattern.
Overview
Core Haptics / Updating Continuous and Transient Haptic Parameters in Real Time
Sample Code
Updating Continuous and Transient Haptic
Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 12.0+


## Page 9

Note
HapticPalette requires Xcode 11 or later. Simulator doesn’t support a haptic interface, so build
and run this sample on an iPhone 8, 8 Plus, X, XR, XS, or XS Max running iOS 13 or later.
This sample checks for device compatibility and sets up an instance of CHHapticEngine on
launch. Before proceeding, start the engine, so it can begin accepting haptics requests.
See Preparing your app to play haptics for more information about setting up the engine.
As the app demonstrates, you can create a sustained vibration by generating a continuous haptic
pattern of nonzero duration. When you first create the pattern, on app launch, set the intensity an
sharpness through an event parameter.
Configure the App to Play Haptics
Create a Continuous Haptic Pattern


## Page 10

The sample app allows you to change the continuous pattern’s intensity and sharpness by draggi
your finger inside the region labeled Continuous. This region is a view that translates the touch
coordinates into normalized intensity and sharpness values. To enable this behavior, the code
attaches a UILongPressGestureRecognizer to each palette view. When the user begins to
drag a finger in the view, the gesture handler maps the touch coordinates to intensity and
sharpness values.
The normalized mapping converts the user’s finger location to the available spectrum. Using thes
normalized values, you can create intensity and sharpness events that determine how the haptic
pattern feels to the user. In this example, touching the palette area in the upper-right corner
generates a crisp haptic vibration at full strength.
The app retains the original pattern player instead of creating a new one with each change. To tel
the continuous haptic pattern player to change or modulate its haptic as it’s playing, send dynami
parameters to the player.


## Page 11

To vary a continuous haptic pattern, send dynamic parameters of class CHHapticDynamic
Parameter to the original pattern. This modifies the haptic pattern as it’s playing. In this example
the dynamic parameters for intensity and sharpness immediately change the haptic pattern’s
strength and character to follow the user’s finger.
Note
Sending a dynamic parameter for intensity multiplies the original pattern’s event intensity by
the dynamic parameter value. Sending a dynamic parameter for sharpness adds the dynamic
parameter value to the original pattern’s event sharpness.
Only when the gesture ends does the app stop the pattern player.
Alter the Continuous Haptic Pattern by Sending Dynamic
Parameters


## Page 12

When the app sends the continuous pattern player a dynamic parameter, the value of that
parameter changes immediately, resulting in a viscerally different haptic pattern on the device. If
your app needs to change the parameter value gradually, consider scheduling a CHHaptic
ParameterCurve.
The bottom half of the screen generates transient haptic experiences. A transient haptic event is
momentary. This sample generates a transient haptic pattern when the gesture begins. It’s also
helpful to generate subsequent transient haptic patterns if the user continues to interact with the
interface. As long as the user’s finger remains inside the transient zone, the app continues to
create a new transient haptic pattern based on the latest sharpness and intensity values. To
accomplish this spacing, you use a dispatch timer to separate the transient haptic patterns by a
time interval of 600 milliseconds, so they feel distinct.
Ask the engine to create a player from the transient pattern when the timer fires, and then play it.
Create a Transient Haptic Pattern


## Page 13

Creating haptic pattern players is inexpensive, so you don’t need to keep them around. Even if the
user slides rapidly across the touch zone, the engine creates players, plays them, and discards
them without lag.
Note
While haptic pattern players are lightweight and inexpensive to create and start, starting the
haptic engine is expensive, as is stopping it, so start and stop the engine sparingly. This
sample starts the engine only once, on app launch.
Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
See Also
Programmatic haptics


## Page 14

class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


## Page 15

Each event represents a single haptic or audio signal. The event type determines whether it’s
audio or haptic. Use a CHHapticPatternPlayer object obtained through CHHapticEngine
factory methods to play events. Haptic events can be transient or continuous. Transient haptic
patterns are brief impulses that occur at a specific point in time, such as the haptic feedback you
feel from swiping through a picker or toggling a switch. Continuous haptic patterns, like the
vibration from a ringtone, take the form of lengthier feedback over a period of time.
In the following graphic, transient haptic patterns on the left trigger at a specific time with a
specific intensity. Continuous haptic patterns on the right sustain the haptic feedback over a
specific duration of time, such as three seconds.
Specify when an event begins by setting its relativeTime property. Specify the length of the
event by setting its duration property. Set optional parameters to customize event properties.
For example, you can specify the intensity of a haptic event by creating an event parameter with I
hapticIntensity.
Overview
Core Haptics / CHHapticEvent
Class
CHHapticEvent
An object that describes a single haptic or audio event.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 16

var type: CHHapticEvent.EventType
The type of the haptic event.
struct EventType
The types of audio and haptic event waveforms.
init(audioResourceID: CHHapticAudioResourceID, parameters: [CHHaptic
EventParameter], relativeTime: TimeInterval)
Initializes a haptic event from a previously loaded audio resource, specifying event paramete
and start time.
init(audioResourceID: CHHapticAudioResourceID, parameters: [CHHaptic
EventParameter], relativeTime: TimeInterval, duration: TimeInterval)
Initializes a haptic event from a previously loaded audio resource, specifying event
parameters, start time, and duration.
init(eventType: CHHapticEvent.EventType, parameters: [CHHapticEvent
Parameter], relativeTime: TimeInterval)
Initializes a haptic event of the specified type, parameters, and start time.
init(eventType: CHHapticEvent.EventType, parameters: [CHHapticEvent
Parameter], relativeTime: TimeInterval, duration: TimeInterval)
Initializes a haptic event of the specified type, parameters, start time, and duration.
var eventParameters: [CHHapticEventParameter]
An array of event parameters, possibly empty.
struct ParameterID
An identifier for an event parameter.
var relativeTime: TimeInterval
The start time of the event, relative to other events in the same pattern.
Topics
Categorizing Haptic Events
Creating Haptic Events
Configuring Haptic Events


## Page 17

var duration: TimeInterval
The duration of the haptic event.
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
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
Relationships
Inherits From
Conforms To
See Also
Programmatic haptics


## Page 18

class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


## Page 19

Event parameters specify values for haptics associated with the event. For example, an intensity
event parameter determines how intense the haptic feels when it fires. Event parameters are stati
they don’t change over the course of the pattern. To change a parameter value after a haptic has
started playing, use a CHHapticDynamicParameter to make an immediate change, or a
CHHapticParameterCurve to transition smoothly.
When you send a dynamic parameter to the haptic pattern, its value changes immediately, at the
specified time. When you send a parameter curve instead, the value changes gradually according
to the type of curve you specified.
Overview
Core Haptics / CHHapticEventParameter
Class
CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 20

init(parameterID: CHHapticEvent.ParameterID, value: Float)
Creates a haptic event parameter from its ID and value.
struct ParameterID
An identifier for an event parameter.
var parameterID: CHHapticEvent.ParameterID
The haptic parameter ID indicating what type of parameter the current event represents.
var value: Float
The value of the parameter.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Creating an Event Parameter
Specifying an Event Parameter’s Value
Relationships
Inherits From
Conforms To
See Also


## Page 21

Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.
Programmatic haptics


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

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


## Page 27

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


