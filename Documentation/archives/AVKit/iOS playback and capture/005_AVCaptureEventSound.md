# 005_AVCaptureEventSound.pdf

## Page 1

Important
To use AirPods Camera Control, it must be available in your country or region. AirPods Camera
Control is not currently available in the European Union.
init(url: URL) throws
Creates a sound object for a capture event.
class var cameraShutter: AVCaptureEventSound
The default sound for photo capture.
class var beginVideoRecording: AVCaptureEventSound
Overview
Topics
Creating a sound
Accessing default sounds
AVKit / AVCaptureEventSound
Class
AVCaptureEventSound
A sound object for a capture event.
iOS 26.0+
iPadOS 26.0+


## Page 2

The default sound for starting a video recording.
class var endVideoRecording: AVCaptureEventSound
The default sound for ending a video recording.
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
Relationships
Inherits From
Conforms To
See Also
iOS playback and capture


## Page 3

class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.


