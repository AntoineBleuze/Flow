# 012_AVContinuityDevicePickerViewController.pdf

## Page 1

The view controller presents an interface on an Apple TV that lets a person choose a nearby
continuity device (AVContinuityDevice). Your app can then connect to that device’s cameras
and microphones (see AVCaptureDevice and AVAudioSessionPortDescription,
respectively).
Important
The continuity device picker presents any devices near the Apple TV that use the same Apple
ID.
To respond to the various outcome events from the picker, your app needs to implement the
AVContinuityDevicePickerViewControllerDelegate and assign it to the picker’s
delegate property.
Note
SwiftUI apps can present the same interface with the continuityDevicePicker(is
Presented:onDidConnect:) view modifier.
Overview
AVKit / AVContinuityDevicePickerViewController
Class
AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and
connect a continuity device to the system.
tvOS 17.0+


## Page 2

class var isSupported: Bool
A Boolean value that indicates whether the system supports connecting to a continuity devic
var delegate: (any AVContinuityDevicePickerViewControllerDelegate)?
The delegate that responds to events from the continuity device picker view controller.
UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
Topics
Checking for feature support
Designating a delegate
Relationships
Inherits From
Conforms To


## Page 3

UITraitEnvironment
UIUserActivityRestoring
Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP Live
Streaming support.
Presenting Content Proposals in tvOS
Display a preview of an upcoming media item at the conclusion of the currently playing med
item.
Working with Overlays and Parental Controls in tvOS
Add interactive overlays, parental controls, and livestream channel flipping using a player vie
controller.
Supporting Continuity Camera in your tvOS app
Capture high-quality photos, video, and audio in your Apple TV app by connecting an iPhone
or iPad as a continuity device.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVInterstitialTimeRange
A time range in an audiovisual presentation for content with an interstitial designation, such a
advertisements or legal notices.
See Also
tvOS playback and capture


## Page 4

class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


