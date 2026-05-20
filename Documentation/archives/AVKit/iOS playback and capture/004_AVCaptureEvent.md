# 004_AVCaptureEvent.pdf

## Page 1

Inspect a capture event’s phase to determine whether the event begins, ends, or is in a canceled
state.
var phase: AVCaptureEventPhase
The current phase of a capture event.
enum AVCaptureEventPhase
Constants that indicate the phase of a system capture event.
var shouldPlaySound: Bool
A Boolean value that indicates whether you must play a sound manually.
func play(AVCaptureEventSound) -> Bool
Overview
Topics
Inspecting the event
Playing a sound
AVKit / AVCaptureEvent
Class
AVCaptureEvent
An object that describes a user interaction with a system hardware button.
iOS 17.2+
iPadOS 17.2+
Mac Catalyst 17.2+


## Page 2

Plays the specified capture sound through AirPods.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Playing video content in a standard user interface
Play media full screen, embedded inline, or in a floating Picture in Picture (PiP) window using
player view controller.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVCaptureEventInteraction
An object that registers handlers to respond to capture events from system hardware button
class AVCaptureEventSound
A sound object for a capture event.
Relationships
Inherits From
Conforms To
See Also
iOS playback and capture


## Page 3

class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.


