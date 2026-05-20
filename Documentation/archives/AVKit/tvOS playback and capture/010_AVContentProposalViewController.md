# 010_AVContentProposalViewController.pdf

## Page 1

Presenting Content Proposals in tvOS
Subclass this class to define the user interface for your content proposal.
var contentProposal: AVContentProposal?
A prosal of content to play.
class AVContentProposal
An object that describes the content to propose playing after the current item finishes.
var dateOfAutomaticAcceptance: Date?
The date that the system automatically accepts a proposal if the user doesn’t intervene.
Mentioned in
Overview
Topics
Configuring the Proposal
AVKit / AVContentProposalViewController
Class
AVContentProposalViewController
A view controller that proposes content to watch next.
tvOS 10.0+


## Page 2

var playerLayoutGuide: UILayoutGuide
A layout guide that tracks the size and location of the player view.
var preferredPlayerViewFrame: CGRect
The preferred presentation frame of the player view while the content proposal is active.
func dismissContentProposal(for: AVContentProposalAction, animated: Boo
, completion: (() -> Void)?)
Dismisses the current content proposal.
enum AVContentProposalAction
Constant that indicate the action a user takes when dismissing a content proposal.
var playerViewController: AVPlayerViewController?
The player view controller that presents a content proposal.
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
Dismissing the Proposal
Accessing the Player View Controller
Relationships
Inherits From
Conforms To


## Page 3

UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
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
See Also
tvOS playback and capture


## Page 4

protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVInterstitialTimeRange
A time range in an audiovisual presentation for content with an interstitial designation, such a
advertisements or legal notices.
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


