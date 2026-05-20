# iOS playback and capture.pdf

## Page 1

AVKit is a cross-platform media playback UI framework built on top of AVFoundation and Core
Media. It makes it easy to play AVPlayer-based media content using the same user interface as
Apple’s own apps. For UIKit apps, AVKit provides AVPlayerViewController, a view controller
that displays content from a player and presents a native user interface to control playback.
This sample app demonstrates three display options for media playback using AVPlayerView
Controller: full screen, embedded inline, or in a floating PiP window.
The sample uses AVPlayerViewController in full-screen playback mode to scale the video t
fill the display, enabling a distraction-free environment that hides the system and app controls un
people take action to reveal them. To demonstrate video inline playback, the sample embeds the
AVPlayerViewController view in the app’s user interface. The sample also uses AVPlayer
ViewController to play video in PiP mode, where the video remains in view in a floating video
overlay while the user interacts with other apps. The user manages the player using the standard
player interface.
Getting started with AVPlayerViewController is straightforward. You create an AVPlayer,
and then create an AVPlayerViewController and assign the player to it. And finally, you
present the AVPlayerViewController. When playing full screen, embedded inline, or in a
floating PiP window, you implement callback methods to respond to the various AVPlayerView
Controller events.
Overview
AVKit / Playing video content in a standard user interface
Sample Code
Playing video content in a standard user
interface
Play media full screen, embedded inline, or in a floating Picture in Picture (PiP)
window using a player view controller.
Download
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
Xcode 13.4+


## Page 2

Note
This sample code project is associated with WWDC 2019 session 503: Delivering Intuitive
Media Playback with AVKit.
The sample’s loadPlayerViewControllerIfNeeded function creates an AVPlayerView
Controller that it uses to play the videos in the various playback modes.
The sample implements the AVPlayerViewControllerDelegate methods to respond to
player view controller events. This allows the sample to handle the app’s user interface based on
the player view controller state, along with observing for potential errors. To receive notifications 
the player view controller events, the project’s PlayerViewControllerCoordinator assigns
itself as the player view controller delegate.
A player view controller requires an AVPlayer object to provide the media content to display. Th
AVPlayer plays media assets that AVFoundation models using the AVAsset class, which
represent the media to play. However, an AVAsset only models the static aspects of the media,
such as its duration or creation date, and on its own, is unsuitable for playback with an AVPlayer
To play an asset, the sample creates an instance of its dynamic counterpart, AVPlayerItem. Th
object models the timing and presentation state of an asset that an instance of AVPlayer plays.
The sample creates an AVPlayer from the AVPlayerItem, and assigns the AVPlayer to the
AVPlayerViewController.
Create and configure the player view controller
Play media full screen


## Page 3

When the user taps on one of the app’s views to play video full screen, the sample calls the
present(_:animated:completion:) method to present the video full screen modally, not a
a subview controller of some other view controller. The sample uses the default modal presentatio
style UIModalPresentationStyle.automatic, which resolves to a full-screen presentation
To begin playback, the sample calls the AVPlayerViewController player’s play() method.
The sample implements the playerViewController(_:willBeginFullScreen
PresentationWithAnimationCoordinator:) delegate method to receive notifications whe
the AVPlayerViewController is about to start displaying its contents full screen. This delega
method passes the player view controller and transition coordinator to use for coordinating
animations. When the sample presents or dismisses a view controller, UIKit creates a transition
coordinator object automatically and assigns it to the view controller’s transitionCoordinat
property. The transition coordinator object only lasts for the duration of the transition animation.
The sample calls the transition coordinator’s animate(alongsideTransition:
completion:) method to run the animations at the same time as the view controller transition
animations. The sample also implements the animate(alongsideTransition:
completion:) method’s completion handler that executes after the transition finishes. In the
completion handler, the sample updates the playback state string that displays in the content
overlay view on top of the player view controller. The sample also checks whether the transition
succeeds or the user cancels it. If it succeeds, the sample saves a strong reference to the player
view controller. The sample uses this reference to dismiss any active player view controllers befor
restoring the app’s interface when PiP stops.
Handle player view controller full-screen events


## Page 4

The sample implements the playerViewController(_:willEndFullScreen
PresentationWithAnimationCoordinator:) delegate method to receive notifications whe
the AVPlayerViewController is about to stop displaying its contents full screen. In this
method, the sample also calls the transition coordinator’s animate(alongsideTransition:
completion:) method to run the animations at the same time as the view controller transition
animations. The sample implements the animate(alongsideTransition:completion:)
method’s completion handler to update the debug string that displays in the content overlay view
on top of the player view controller.
AVPlayerViewController provides a contentOverlayView property for adding
noninteractive custom views, such as a logo or watermark, between the video content and the
controls.
The sample creates a custom view DebugHUD for displaying the current playback state (embedde
inline, full-screen active, and so on) of a video playback item. The sample’s addDebugHUDTo
PlayerViewControllerIfNeeded function adds this custom view to the contentOverlay
View.
Display custom overlays in the player view controller


## Page 5

The sample’s PlayerViewControllerCoordinator declares the status variable that
maintains the current playback state.
The PlayerViewControllerCoordinator updates the playback state in the DebugHUD view
in response to player view controller events and other state changes. For example, to receive
notifications when the player view controller video frames are ready for display, the sample
observes the player view controller’s isReadyForDisplay property. When the property change
the PlayerViewControllerCoordinator updates the status variable to reflect the current
playback state.
The sample’s embedInline function incorporates the player view controller’s view into the app’s
view hierarchy for inline playback. To do this, the function first checks whether an AVPlayerVie
Controller object already exists in the view hierarchy, and if so, removes it. Next, the function
adds the AVPlayerViewController as a subview of the current view controller. After that, it
Play media inline


## Page 6

adds the AVPlayerViewController view to the specified containing view so that it resides o
top of any subviews. Lastly, the function calls the view controller didMove(toParent:) functio
Container view controller subclasses need to call didMove(toParent:) after a transition to the
new subview completes or, in the case of no transition, immediately after the call to add
Child(_:).
The user manages inline playback using the standard player interface.
To use PiP, the sample configures its audio session and background modes. For more information
see Configuring your app for media playback. After this configuration, the player view controller
automatically supports PiP playback.
To receive notifications when PiP is about to start, or fails to start, the sample implements the
delegate methods playerViewControllerWillStartPictureInPicture(_:) and playe
View(_:failedToStartPictureInPictureWithError:), respectively. To receive
notifications when PiP stops, the sample implements the playerViewControllerDidStop
PictureInPicture(_:) method.
Each of the sample’s AVPlayerViewControllerDelegate method implementations updates
the DebugHUD custom view to reflect the current playback state.
Configure audio session and background modes for PiP
Handle PiP player view controller events


## Page 7

To handle the restore process when PiP stops, the sample implements the playerView(_:
restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:)
method. The framework calls this method when control returns to the app, giving the app the
opportunity to determine how to properly restore its video playback interface. The sample sends
the callback up to its own delegate to handle the restore operation.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
Restore the video playback interface when PiP stops
See Also
iOS playback and capture


## Page 8

A protocol that defines the methods to implement to respond to player view controller event
class AVCaptureEventInteraction
An object that registers handlers to respond to capture events from system hardware button
class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVCaptureEventSound
A sound object for a capture event.
class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.


## Page 9

Adopting the system player interface in visionOS
Customizing the tvOS Playback Experience
Adopting Picture in Picture in a Custom Player
Trimming and exporting media in visionOS
Working with Interstitial Content
A player view controller makes it simple to add media playback capabilities to your app that match
the styling and features of the native system players. Using this object also means that your app
automatically adopts the new features and styling of future operating system releases.
Important
The framework doesn’t support subclassing AVPlayerViewController.
Mentioned in
Overview
Support AirPlay
AVKit / AVPlayerViewController
Class
AVPlayerViewController
A view controller that displays content from a player and presents a native user
interface to control playback.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
tvOS 9.0+
visionOS 1.0+


## Page 10

AirPlay lets users stream media to Apple TV, HomePod, and AirPlay 2-compatible speakers and
smart TVs. A player view controller supports AirPlay automatically, but you need to configure your
app to enable it. See Configuring your app for media playback for more information about
configuring your app for background playback.
AVPlayerViewController provides Picture in Picture (PiP) playback in iOS and tvOS. PiP
playback lets users minimize the video player to a small floating window so they can perform othe
activities in the primary app or in another app.
Note
To enable PiP playback in your macOS app, use AVPlayerView.
AVPlayerViewController in tvOS brings advanced Siri Remote control features to your app.
This support lets users play and navigate your content, and access supporting features like
subtitles and alternate audio tracks. This object also provides support for using Siri Remote voice
commands, such as “Skip ahead 15 seconds” and “What did they say?”, to control playback of yo
content.
AVKit for tvOS extends the features of AVPlayerViewController and AVPlayerItem to
provide additional ways to navigate and present content. Features unique to the tvOS player user
interface include:
Navigation Marker Groups. A group of navigation markers that allow a viewer to jump between
significant events in the media timeline. The most common type of navigation marker group is a
chapter list, but you can also create additional or alternative means of navigation — for example
to allow the user to quickly jump between key moments in a recorded sporting event. The playe
view controller lets the user choose between multiple marker groups for navigating through the
media timeline.
Use the AVNavigationMarkersGroup class to create and describe navigation markers, then
use the navigationMarkerGroups property to associate marker groups with the current
AVPlayerItem object.
Interstitial Content. Some content might not relate to the main content that your app presents, 
might have different presentation requirements. For example, you might not allow the user to
skip over advertisements when scrubbing through the playback timeline, or to skip mandatory
legal notices.
Adopt Picture in Picture playback
Customize the tvOS playback experience


## Page 11

Use the AVInterstitialTimeRange class to describe interstitial content, and the
interstitialTimeRanges property to associate those time ranges with the current AVPlaye
Item object.
Content Proposals. When presenting serialized content, like a TV show, you often want to
propose additional content for the viewer to watch when the current episode ends. It’s
straightforward to add this functionality to your app using content proposals.
Use the AVContentProposal class to describe the proposed content, and set it as the next
ContentProposal property of the current AVPlayerItem object. You can implement the
methods of the player view controller’s delegate object to prepare to present a content proposa
and perform actions in response to the viewer accepting, rejecting, or deferring the proposal.
var showsPlaybackControls: Bool
A Boolean value that indicates whether the player view controller shows playback controls.
var contentOverlayView: UIView?
A view that displays between the video content and the playback controls.
var videoGravity: AVLayerVideoGravity
A string that specifies how the video displays within the bounds of the view controller’s view
var videoBounds: CGRect
The size and position of the video image within the bounds of the view controller’s view.
var showsTimecodes: Bool
A Boolean value that determines whether the player view displays timecodes, if available.
var appliesPreferredDisplayCriteriaAutomatically: Bool
A Boolean value that indicates whether the view controller automatically sets the screen’s
display criteria to match that of the currently playing asset.
var playbackControlsIncludeTransportBar: Bool
A Boolean value that indicates whether the player shows the transport bar and related
controls.
Topics
Configuring presentation
Customizing the tvOS player UI


## Page 12

var playbackControlsIncludeInfoViews: Bool
A Boolean value that indicates whether the player presents video metadata, navigation
markers, and playback settings views when the user requests them.
var transportBarIncludesTitleView: Bool
A Boolean value that indicates whether the player user interface shows the title view above
the scrubber.
var transportBarCustomMenuItems: [UIMenuElement]
An array of actions and menus to display with the default player controls.
var customInfoViewControllers: [UIViewController]
An array of view controllers to display as content tabs in the player user interface.
var infoViewActions: [UIAction]!
An array of actions to present in the Info content view.
var contextualActions: [UIAction]
An array of action controls to present contextually during playback.
var customOverlayViewController: UIViewController?
A view controller that presents custom content over the player view.
var unobscuredContentGuide: UILayoutGuide
A layout guide that represents an area that fixed-position playback controls don’t obscure
when visible.
var customInfoViewController: UIViewController?
A view controller that provides client-specific content and controls alongside system-provid
information and settings panels.
Deprecated
var infoViewActions: [UIAction]!
An array of actions to present in the Info content view.
var customInfoViewControllers: [UIViewController]
An array of view controllers to display as content tabs in the player user interface.
var contextualActions: [UIAction]
An array of action controls to present contextually during playback.
Configuring the visionOS player UI


## Page 13

var contextualActionsInfoView: UIView
A view the system shows adjacent to the contextual actions that’s suitable for showing relate
information.
var contextualActionsPreviewImage: UIImage?
An image to show alongside the contextual actions.
var requiresMonoscopicViewingMode: Bool
A Boolean value that indicates whether to permit playback of 2D video content only.
var experienceController: AVExperienceController
The experience controller for this view controller.
var groupExperienceCoordinator: AVGroupExperienceCoordinator
The group experience coordinator for this view controller.
var canBeginTrimming: Bool
A Boolean value that indicates whether the current media supports trimming.
func beginTrimming(completionHandler: ((Bool) -> Void)?)
Presents the system trimming interface controls inside the player view.
var allowsVideoFrameAnalysis: Bool
A Boolean value that indicates whether to perform video frame analysis.
var toggleLookupAction: UIAction
An action that enables the visual lookup interface.
var videoFrameAnalysisTypes: AVVideoFrameAnalysisType
The types of analysis a player view controller performs on a paused video frame.
struct AVVideoFrameAnalysisType
Constants that define the types of analysis a player view controller may perform on a paused
video frame.
Presenting the visionOS trimming UI
Configuring frame analysis
Configuring playback speed


## Page 14

var speeds: [AVPlaybackSpeed]
A list of user-selectable playback speeds to show in the playback speed control.
var selectedSpeed: AVPlaybackSpeed?
The currently selected playback speed.
func selectSpeed(AVPlaybackSpeed)
Selects a specified playback speed.
class AVPlaybackSpeed
An object that represents a user-selectable playback speed in a playback user interface.
var allowsPictureInPicturePlayback: Bool
A Boolean value that indicates whether the player allows Picture in Picture playback.
var canStartPictureInPictureAutomaticallyFromInline: Bool
A Boolean value that indicates whether Picture in Picture starts automatically when
transitioning to the background when the view controller presents its content inline.
var entersFullScreenWhenPlaybackBegins: Bool
A Boolean value that determines whether the player automatically displays in full screen whe
the user taps the play button.
var exitsFullScreenWhenPlaybackEnds: Bool
A Boolean value that indicates whether the player exits full-screen mode when playback end
var allowedSubtitleOptionLanguages: [String]?
An array of language codes that restrict the set of subtitle languages available to the user.
var requiresFullSubtitles: Bool
A Boolean value that indicates whether the user can disable the display of subtitles.
var requiresLinearPlayback: Bool
Configuring Picture in Picture
Managing full-screen behavior
Managing subtitles
Preventing navigation


## Page 15

A Boolean value that determines whether the player allows the user to skip media content.
var isSkipForwardEnabled: Bool
A Boolean value that indicates whether forward-skipping is available.
var isSkipBackwardEnabled: Bool
A Boolean value that indicates whether backward-skipping is available.
var skippingBehavior: AVPlayerViewControllerSkippingBehavior
The behavior that skipping gestures perform.
enum AVPlayerViewControllerSkippingBehavior
Constants that represent the player view controller’s skipping behavior.
var isReadyForDisplay: Bool
A Boolean value that indicates whether the player item’s first video frame is ready for display
var updatesNowPlayingInfoCenter: Bool
A Boolean value that indicates whether the view controller updates Now Playing information.
var contentProposalViewController: AVContentProposalViewController!
The view controller responsible for the presentation of content proposals.
var player: AVPlayer?
The player object that provides the media content for the view controller to display.
var delegate: (any AVPlayerViewControllerDelegate)?
The delegate object for the player view controller.
Configuring skipping behavior
Determining display readiness
Updating Now Playing information
Proposing additional content
Accessing the player
Accessing the delegate object


## Page 16

var pixelBufferAttributes: [String : Any]?
The pixel buffer attributes of the video frames the view controller presents.
var preferredDisplayDynamicRange: AVDisplayDynamicRange
Describes how High Dynamic Range (HDR) video content renders.
enum AVDisplayDynamicRange
Describes how High Dynamic Range (HDR) video content renders.
class var mediaCharacteristicsForSupportedCustomMediaSelectionSchemes: 
AVMediaCharacteristic]
UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
Configuring pixel buffers
High dynamic range
Type Properties
Relationships
Inherits From
Conforms To


## Page 17

UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Playing video content in a standard user interface
Play media full screen, embedded inline, or in a floating Picture in Picture (PiP) window using
player view controller.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVCaptureEventInteraction
An object that registers handlers to respond to capture events from system hardware button
class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVCaptureEventSound
A sound object for a capture event.
class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.
See Also
iOS playback and capture


## Page 18

Adopting Picture in Picture in a Standard Player
Presenting Content Proposals in tvOS
Working with Interstitial Content
func playerViewControllerShouldDismiss(AVPlayerViewController) -> Bool
Asks the delegate object whether the player view controller dismisses itself upon request.
func playerViewControllerWillBeginDismissalTransition(AVPlayerView
Controller)
Tells the delegate when the player view controller is about to start its dismissal transition.
func playerViewControllerDidEndDismissalTransition(AVPlayerView
Controller)
Tells the delegate when the player view controller ends its dismissal transition.
Mentioned in
Topics
Dismissing the Player View Controller
AVKit / AVPlayerViewControllerDelegate
Protocol
AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view
controller events.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
tvOS 9.0+
visionOS 1.0+


## Page 19

func playerViewControllerShouldAutomaticallyDismissAtPictureInPicture
Start(AVPlayerViewController) -> Bool
Asks the delegate whether the player view controller automatically dismisses itself when
Picture in Picture starts.
func playerViewControllerWillStartPictureInPicture(AVPlayerView
Controller)
Tells the delegate when Picture in Picture is about to start.
func playerViewControllerDidStartPictureInPicture(AVPlayerViewControlle
)
Tells the delegate when Picture in Picture starts.
func playerViewController(AVPlayerViewController, failedToStartPictureI
PictureWithError: any Error)
Tells the delegate when Picture in Picture fails to start.
func playerViewControllerWillStopPictureInPicture(AVPlayerViewControlle
)
Tells the delegate when Picture in Picture is about to stop.
func playerViewControllerDidStopPictureInPicture(AVPlayerViewController
Tells the delegate when Picture in Picture stops.
func playerViewController(AVPlayerViewController, restoreUserInterface
ForPictureInPictureStopWithCompletionHandler: (Bool) -> Void)
Tells the delegate when Picture in Picture is about to stop so you can restore your app’s user
interface.
func playerViewController(AVPlayerViewController, timeToSeekAfterUser
NavigatedFrom: CMTime, to: CMTime) -> CMTime
Tells the delegate when the user skips, scrubs, or otherwise navigates to a new time and
wants to resume playback at the target time.
func playerViewController(AVPlayerViewController, willResumePlayback
AfterUserNavigatedFrom: CMTime, to: CMTime)
Tells the delegate when the user navigates to a new time and playback is about to begin.
Responding to Picture in Picture Life Cycle Events
Responding to Navigation Events


## Page 20

func skipToPreviousItem(for: AVPlayerViewController)
Tells the delegate when the user requests skipping to the previous item in the timeline.
func skipToNextItem(for: AVPlayerViewController)
Tells the delegate when the user requests skipping to the next item in the timeline.
func playerViewController(AVPlayerViewController, willPresent:
AVInterstitialTimeRange)
Tells the delegate when the player view controller is about to start playing a range of
interstitial content.
func playerViewController(AVPlayerViewController, didPresent:
AVInterstitialTimeRange)
Tells the delegate when the player view controller finishes playing a range of interstitial
content.
func playerViewController(AVPlayerViewController, shouldPresent:
AVContentProposal) -> Bool
Asks the delegate whether the player view controller presents a content proposal.
func playerViewController(AVPlayerViewController, didAccept: AVContent
Proposal)
Tells the delegate when the user accepts the proposed content.
func playerViewController(AVPlayerViewController, didReject: AVContent
Proposal)
Tells the delegate when the user rejects the proposed content.
func playerViewController(AVPlayerViewController, didSelect: AVMedia
SelectionOption?, in: AVMediaSelectionGroup)
Tells the delegate when the user selects a media option from a media selection group.
Responding to Interstitial Content Playback Events
Responding to Content Proposals
Responding to Media Selection
Responding to Transport Bar Changes


## Page 21

func playerViewController(AVPlayerViewController, willTransitionTo
VisibilityOfTransportBar: Bool, with: any AVPlayerViewController
AnimationCoordinator)
Tells the delegate when the transport bar’s visibility is about to change.
protocol AVPlayerViewControllerAnimationCoordinator
A protocol that defines the methods to implement to synchronize animations with playback
controls’ visibility animation.
func playerViewController(AVPlayerViewController, skipToNextChannel: (
Bool) -> Void)
Tells the delegate when the user wants to skip to the next channel.
func playerViewController(AVPlayerViewController, skipToPreviousChannel
(Bool) -> Void)
Tells the delegate when the user wants to skip to the previous channel.
func nextChannelInterstitialViewController(for: AVPlayerViewController)
-> UIViewController
Asks the delegate for a view controller that describes the layout of the next channel’s
interstitial view.
func previousChannelInterstitialViewController(for: AVPlayerView
Controller) -> UIViewController
Asks the delegate for a view controller that describes the layout of the previous channel’s
interstitial view.
func playerViewController(AVPlayerViewController, willBeginFullScreen
PresentationWithAnimationCoordinator: any UIViewControllerTransition
Coordinator)
Tells the delegate when the player view controller is about to start full-screen display.
func playerViewController(AVPlayerViewController, willEndFullScreen
PresentationWithAnimationCoordinator: any UIViewControllerTransition
Coordinator)
Tells the delegate when the player view controller is about to end full-screen display.
Responding to Channel Changes
Responding to Full-Screen Presentations


## Page 22

func playerViewController(AVPlayerViewController, restoreUserInterface
ForFullScreenExitWithCompletionHandler: (Bool) -> Void)
Tells the delegate to restore the app’s user interface after returning from a full-screen
presentation.
NSObjectProtocol
Playing video content in a standard user interface
Play media full screen, embedded inline, or in a floating Picture in Picture (PiP) window using
player view controller.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
class AVCaptureEventInteraction
An object that registers handlers to respond to capture events from system hardware button
class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVCaptureEventSound
A sound object for a capture event.
class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.
Relationships
Inherits From
See Also
iOS playback and capture


## Page 23

The system Camera app allows people to perform capture functions by pressing hardware button
on their iOS device. UIKit apps can add similar functionality by using this type to register handlers
that respond to interactions from device hardware.
Note
In SwiftUI, respond to capture events from hardware buttons using onCameraCapture
Event(isEnabled:action:) and onCameraCaptureEvent(isEnabled:primary
Action:secondaryAction:) instead.
The following example shows how to add a handler that captures a photo when a user presses a
hardware button on their device.
Overview
AVKit / AVCaptureEventInteraction
Class
AVCaptureEventInteraction
An object that registers handlers to respond to capture events from system
hardware buttons.
iOS 17.2+
iPadOS 17.2+
Mac Catalyst 17.2+


## Page 24

The event handler queries the capture event to determine its phase, and when the interaction end
captures a photo.
Important
You can only use this API for capture use cases. The system sends capture events only to apps
that actively use the camera. Backgrounded capture apps, and apps not performing capture,
don’t receive events.
Adopting this API overrides default hardware button behavior, so apps must always respond
appropriately to any events received. Failing to handle events results in a nonfunctional button
that provides a poor user experience. If your app is temporarily unable to handle events,
disable the interaction by setting its isEnabled property to false, which restores the
system button behavior.
init(handler: (AVCaptureEvent) -> Void)
Topics
Creating an interaction


## Page 25

Creates a capture event interaction with a handler that responds to presses of hardware
buttons.
init(primary: (AVCaptureEvent) -> Void, secondary: (AVCaptureEvent) ->
Void)
Creates a capture event interaction with handlers that respond independently to presses of
hardware buttons.
var isEnabled: Bool
A Boolean value that indicates whether this capture event interaction is in an enabled state.
class var defaultCaptureSoundDisabled: Bool
A Boolean value that indicates whether the default sound is in a disabled state.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
UIInteraction
Inspecting the interaction
Relationships
Inherits From
Conforms To
See Also
iOS playback and capture


## Page 26

Playing video content in a standard user interface
Play media full screen, embedded inline, or in a floating Picture in Picture (PiP) window using
player view controller.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVCaptureEventSound
A sound object for a capture event.
class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.


## Page 27

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


## Page 28

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


## Page 29

class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.


## Page 30

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


## Page 31

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


## Page 32

class AVCaptureEvent
An object that describes a user interaction with a system hardware button.
class AVInputPickerInteraction
Use AVInputPickerInteraction to present an input picker.


## Page 33

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


## Page 34

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


## Page 35

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


