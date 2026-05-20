# 005_AVPlayerViewControllerDelegate.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


