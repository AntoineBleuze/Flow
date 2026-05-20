# 002_AVCaptureView.pdf

## Page 1

var session: AVCaptureSession?
The view’s associated capture session.
func setSession(AVCaptureSession?, showVideoPreview: Bool, showAudio
Preview: Bool)
Sets the view’s capture session.
var controlsStyle: AVCaptureViewControlsStyle
The style of the capture controls presented by the view.
enum AVCaptureViewControlsStyle
Constants that describe the capture view’s supported controls styles.
var videoGravity: AVLayerVideoGravity
A string value that defines how the capture view displays video within its bounds.
Topics
Configuring the Capture Session
Customizing the View
AVKit / AVCaptureView
Class
AVCaptureView
A view that displays standard user interface controls for capturing media data.
macOS 10.10+


## Page 2

var delegate: (any AVCaptureViewDelegate)?
The capture view’s delegate object.
protocol AVCaptureViewDelegate
The protocol that defines the methods you can implement to respond to capture view events
var fileOutput: AVCaptureFileOutput?
The capture file output used to record media data.
NSView
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
Configuring the Delegate
Recording Media
Relationships
Inherits From
Conforms To


## Page 3

SendableMetatype
Implementing Trimming in a macOS Player
Provide a QuickTime media-trimming experience in your macOS app.
class AVPlayerView
A view that displays content from a player and presents a native user interface to control
playback.
See Also
macOS playback and capture


