# 006_AVInputPickerInteraction.pdf

## Page 1

init()
Creates a new instance of AVInputPickerController using a default sharedInstance from
AVAudioSession.
init(audioSession: AVAudioSession?)
Creates a new instance of AVInputPickerInteraction using a specific AVAudioSession.
var isPresented: Bool
A Boolean value that indicates whether the picker is currently visible.
func present()
Presents the input picker.
func dismiss()
Dismisses the input picker.
Topics
Creating an input picker
Managing presentation
AVKit / AVInputPickerInteraction
Class
AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.
iOS 26.0+
iPadOS 26.0+


## Page 2

var delegate: (any AVInputPickerInteraction.Delegate)?
The input picker view’s delegate.
protocol Delegate
The AVInputPickerInteractionDelegate protocol defines methods you use to receiv
notifications about transitions in an AVInputPickerInteraction object.
var audioSession: AVAudioSession
The audio session for the picker.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
UIInteraction
Setting the delegate
Accessing the audio session
Relationships
Inherits From
Conforms To
See Also
iOS playback and capture


## Page 3

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
class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVCaptureEventSound
A sound object for a capture event.


