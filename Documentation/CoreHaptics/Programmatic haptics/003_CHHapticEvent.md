# 003_CHHapticEvent.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


