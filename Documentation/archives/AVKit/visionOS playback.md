# visionOS playback.pdf

## Page 1

Note
This sample code project is associated with WWDC25 session 296: Support immersive video
playback in visionOS apps.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
Overview
See Also
visionOS playback
AVKit / Playing immersive media with AVKit
Sample Code
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching
experience.
Download
visionOS 26.0+
Xcode 26.0+


## Page 2

class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
An object that controls video experiences.
class AVMultiviewManager
An object that manages viewing multiple videos at once.
class AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a SharePlay
session.


## Page 3

This sample code project demonstrates how to use the multiview video playback APIs using
SwiftUI. It illustrates how an app might display video when showing a video in the embedded
experience, and how apps might immediately display a video in the expanded experience. From
these experiences, someone can enter the multiview video playback experience to display multip
videos simultaneously.
The multiview experience lets your app display multiple videos simultaneously. Use this type of
experience in apps where watching multiple videos makes sense, such as in a sports app or a
security camera app. In a multiview experience, a person starts with one video as their main focus
and adds more videos that interest them. In visionOS, your app can display up to five simultaneou
videos.
Overview
AVKit / Creating a multiview video playback experience in visionOS
Sample Code
Creating a multiview video playback
experience in visionOS
Build an interface that plays multiple videos simultaneously and handles
transitions to different experience types gracefully.
Download
visionOS 2.0+
Xcode 16.0+


## Page 4

Multiview experiences work with the existing AVPlayerViewController class to manage your
content. Each instance of the player view controller exposes an experienceController
property that manages the available experiences for your content and the transitions between
embedded, expanded, and multiview experiences. Use this experience controller to configure the
experiences you support, and to initiate transitions between different experience types.
To facilitate the addition of new videos to your app’s multiview experience, create a custom
browsing user interface and provide it to the shared AVMultiviewManager class. The
AVMultiviewManager instance coordinates the arrangement of AVPlayerViewController
instances in the multiview experience. As your app adds new view controllers, the AVMultiview
Manager updates the layout to maintain a comfortable and engaging user experience.
Adding support for the multiview experience starts with displaying the AVPlayerView
Controller. The AVPlayerViewController is a UIKit view controller that AVKit provides. U
UIViewControllerRepresentable to adapt this for SwiftUI. The following code example
creates a SystemVideoPlayer view with an AVPlayer property. This property allows the
SwiftUI view that contains the SystemVideoPlayer view to initialize the player with an
AVPlayerItem and change the video using the replaceCurrentItem(with:) method.
The multiview experience is disabled by default, so your app needs to allow it by setting allowed
Experiences on AVExperienceController to include .multiview. In the multiview
experience, you can present video from multiple AVPlayerViewController instances togethe
in an interface that an AVMultiviewManager manages.
Display the system video player
Enable the multiview experience on your video players


## Page 5

After allowing the multiview experience, the system player includes a Multiview button in the top
left corner of the expanded and embedded video player. People can close the multiview experien
to return to the embedded video player at any time.
An AVPlayerViewController displays a single video. When someone enters the multiview
experience, AVMultiviewManager manages the layout of the system video players and display
your content browser beneath the videos. The content browser allows people to select additional
videos to play within the experience. Anyone can remove a video from the multiview experience b
clicking the close button in the corner of a video, or by using your content browser. After selecting
multiple videos, a person can close the content browser to navigate to the playback controls for
each video. To provide the view for the content browser, set the contentSelectionView
Controller property on the shared AVMultiviewManager.
Create a content browser for adding and removing videos


## Page 6

When designing your content selection view, follow the Human Interface Guidelines to create an
intuitive experience. This sample code project uses a UIHostingController class to provide a
SwiftUI view as the content selection view controller.
To provide visual context, it’s important to show an image that represents each video. Depending
on your app, this may be a generated thumbnail or a graphic unique to each video. For informatio


## Page 7

about creating an image from a video asset, see Creating images from a video asset.
Using the AVExperienceController.Delegate methods, your app can react to changes in
the multiview experience. This protocol informs your app about the transitions you
programmatically initiate and the transitions that trigger within the multiview experience. Update
your class to conform to this protocol and set it as the delegate.
The sample code project uses this protocol to start videos that someone adds to the multiview
experience, swap which video is showing in the embedded video player, and update the state tha
shows which videos are part of the multiview experience. The sample app creates a Multiview
StateModel class to conform to this protocol, retains the videos and their player view controller
and sets this delegate on each of the VideoModel objects in the initialization of the Multiview
StateModel.
If your app displays the video player in the embedded state, your view needs to handle changing
the AVPlayerViewController that’s displaying when someone changes the video within the
multiview experience.
The SystemVideoPlayer view in the “Display the system video player” section above is
responsible for displaying a single video. To switch which video is playing in the embedded
experience and retain the current playback state of the video, create a UIViewController
Representable that has an AVPlayerViewController property. To insure that SwiftUI
provides the updated view controller in makeUIViewController, identify the view using the
video’s ID.
Observe changes in the multiview experience
Change the embedded video


## Page 8

To support changing the embedded video set the embeddedVideo property to the video item th
you want to play. If the video is already selected, consider pausing the video and removing it from
the view hierarchy.
Your content selection view is responsible for adding and removing videos from the multiview
experience. To determine whether to add or remove a video when a person selects an item, keep
track of which videos are present in the AVMultiviewManager. Depending on the needs of you
app, you can either create all AVPlayerViewController instances on initialization, or create
them on demand as you display additional videos.
When a person selects a video in the content browser, your app adds or removes the video from
the multiview experience by calling transition(to:) on the associated AVPlayerView
Controller instance.
The transition(to:) function performs a request to transition the video to the provided state
but this doesn’t always succeed. This transition fails if you already presented the maximum numb
of videos. Transitioning to the .embedded state fails for the last video in the AVMultiview
Manager if the view controller isn’t in the view hierarchy. Only update the state and view hierarch
when the transition completes successfully. Use the experienceController(_:didChange
Show and hide videos from your content browser


## Page 9

TransitionContext:) delegate method to update your state and view hierarchy for complete
transitions. The system calls these delegate methods for changes that your content selection view
and the AVMultiviewManager trigger.
Set the newly selected embedded video


## Page 10

People can add and remove videos from the multiview experience through the user interface that
your content selection view or the AVMultiviewManager provides. If your app supports
displaying embedded videos, the video playing when someone first enters the multiview
experience may be different than the one playing when they return to the embedded experience.
Continue to show the currently playing video when a person returns to the embedded experience
For example, a person may start the multiview experience viewing video A, and then add video B
and others. They may then remove video A prior to closing the experience and returning to your
view with the embedded experience. In this case, update the view they return to so it displays
video B rather than the initial video A. You can perform view hierarchy and state changes to
prepare for a transition in experienceController(_:prepareForTransitionUsing:).
To display a video in the expanded or embedded states, the original container needs to be in the
view hierarchy. This transition fails to complete when the AVPlayerViewController isn’t in th
view hierarchy because the system requires a scene to transition to these states.
If you aren’t embedding the video in the view hierarchy, specify a fallbackPlacement to displa
the video over the provided scene. You can specify this just before presenting the video in
experienceController(_:prepareForTransitionUsing:), or set it earlier in the app lif
cycle. Retrieve this UIScene argument from the UIWindowSceneDelegate object. For more
information about how to provide this delegate in your SwiftUI app, see UIApplication
DelegateAdaptor.
Show expanded videos outside the view hierarchy


## Page 11

Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
An object that controls video experiences.
class AVMultiviewManager
An object that manages viewing multiple videos at once.
class AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a SharePlay
session.
See Also
visionOS playback


## Page 12

The recommended way to provide a video playback interface for your visionOS app is to adopt
AVPlayerViewController. Using this class makes it simple to provide the same playback use
interface and features found in system apps like TV and Music. It also provides essential system
integration to deliver an optimal viewing experience whether you’re playing standard 2D content o
immersive 3D video with spatial audio. This article describes best practices for presenting the
player in visionOS and covers the options the player provides to customize its user interface to be
fit your app.
Note
In addition to providing the system playback interface, you can also use AVPlayerView
Controller to present a media-trimming experience similar to QuickTime Player in macOS.
See Trimming and exporting media in visionOS for more information.
Use AVPlayerViewController to play video in windowed environments in visionOS. It
automatically adapts its user interface to best fit its presentation. For example, when you present
nested inside another view, it displays an inline user interface:
Overview
Explore presentation options
AVKit / Adopting the system player interface in visionOS
Article
Adopting the system player interface in
visionOS
Provide an optimized viewing experience for watching 3D video content.


## Page 13

Note
When you present the player inline, it only displays standard 2D video. To play 3D content,
present it fullscreen.
Present the player in full-screen mode by setting it as the exclusive root view of your app, or by
presenting it using the fullScreenCover(item:onDismiss:content:) modifier. In full-
screen mode, the player presents a more content-forward design that dims the environment by
default to provide more suitable viewing. This provides a streamlined viewing experience for both
2D and 3D content.


## Page 14

The user interface displays a title view above the transport bar when the current player item
contains title and subtitle metadata. When playing live-streaming content, the title view may also
display a badge to indicate the content state to the viewer.
Display supporting metadata


## Page 15

The title view displays the values of an asset’s commonIdentifierTitle and iTunes
MetadataTrackSubTitle metadata items, when available. If your media doesn’t provide
embedded metadata, you can add supplemental metadata to display by creating instances of
AVMetadataItem. The table below lists the metadata values the player user interface supports.
Metadata
Identifier
Type
Title
commonIdentifierTitle
String
Subtitle
iTunesMetadataTrackSubTitle
String
Artwork
commonIdentifierArtwork
Data
Description
commonIdentifierDescription
String
Genre
quickTimeMetadataGenre
String
Content rating
iTunesMetadataContentRating
String


## Page 16

In an app that defines a simple structure to hold string and data items, you can map its values to
their appropriate metadata identifiers and build an array of metadata items:
To apply the metadata to the current player item, set the array of metadata items as the value of
the player item’s externalMetadata property:
Only the title and subtitle values display in the title view. The player presents the other supported
metadata values in its Info tab, which the section below describes.
The visionOS player UI can display one or more content tabs in the user interface to show
supporting information or related content. By default, the player presents an Info tab when an ass
contains embedded metadata or when you set external metadata on the player item, as the Displa
supporting metadata section above describes.
Your app can also present custom tabs to show supporting content. You define your tab content a
standard SwiftUI views, wrap them in a UIHostingController, and set them as the custom
Display custom informational views


## Page 17

InfoViewControllers property. The player UI uses the title property of the hosting
controller to display as the tab title in the interface, so set this value before setting it on the playe
view controller.
The player UI presents an Info tab when the asset it displays provides embedded or external
metadata. The tab’s view displays the metadata details, and it may show up to two UIAction
controls along its trailing edge:
Present actions in the Info tab


## Page 18

Customize the actions the view presents by setting a value for the player view controller’s info
ViewActions property. When playing nonlive content, this property contains a single-element
array that presents an action to play the content from the beginning. You can replace the default
value (if present), add an additional action, or set this property value to an empty array to display
no actions. The example below shows how to add a Add to Favorites action to the view:
You can use the visionOS player UI to present controls contextually, which your app displays for a
specific range of time in the content and then dismiss. A common use for this type of control is a
skip button that displays during the title sequence of a movie or TV show. People can tap the
button to bypass the introduction and quickly skip to the main content.
Display actions contextually


## Page 19

AVPlayerViewController provides a contextualActions property you can use to specify
one or more actions to present. The player displays them along the bottom-trailing side of the
screen. The following code example shows a simple implementation of an action that seeks the
player forward to the time of the main content:
When you set a value for the contextualActions property, the player presents the controls
immediately. To present them only during a relevant section of the content, observe the player
timing by adding a periodic or boundary time observer. The following example defines a periodic
time observer that fires every second during normal playback. In each invocation, it evaluates the
new time to determine whether it falls within the presentation range. If it does, the example sets t


## Page 20

skip action as the contextual actions value; otherwise, it clears the value by setting it to an empty
array.
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
An object that controls video experiences.
class AVMultiviewManager
See Also
visionOS playback


## Page 21

An object that manages viewing multiple videos at once.
class AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a SharePlay
session.


## Page 22

You use AVPlayerViewController to present the system video-player interface in your
visionOS app. In addition to its primary role, AVPlayerViewController can also provide a
media-trimming experience similar to the interface of QuickTime Player in macOS, like that below.
When you enable this feature, people can specify a segment of the media timeline for display. Thi
article describes how to adopt this feature in your app, and shows how to use AVFoundation to
export the trimmed result.
Overview
AVKit / Trimming and exporting media in visionOS
Article
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing
media.


## Page 23

Apps typically provide a user-interface element to put the player view controller into trimming
mode. Because the player doesn’t support trimming certain media, such as HTTP Live Streaming 
protected content, apps observe the state of the canBeginTrimming property to update the
enabled state of their user interface accordingly. For example, the following code observes the
state of the canBeginTrimming property and updates the state of a published property, which
sets the appropriate enabled state in the UI:
After you determine that the player view controller supports editing the current media’s timeline,
call the player’s beginTrimming(completionHandler:) method to enable its trimming
interface. Call this method from an asynchronous context:
Determine whether the media supports trimming
Enable the trimming user interface


## Page 24

This method returns a Boolean value that indicates whether the user pinched the Done button or
the Cancel button. Pinching the Done button causes the view controller to update the values of th
player item’s reversePlaybackEndTime and forwardPlaybackEndTime properties to matc
the trimmed selection.
A convenient way to export your trimmed selection is to use AVAssetExportSession. This
object provides a simple preset-based approach to transcode media in various formats. Create an
instance of an export session by passing it the player item’s asset and an export preset.
Additionally, configure its output URL and file type:
To export only the portion of the asset that matches your trimmed selection, create a CMTime
Range based on the reverse and forward playback end times of the current player item:
Export the trimmed media selection


## Page 25

Finally, begin the export operation to begin asynchronously transcoding the media to the output
URL:
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
An object that controls video experiences.
class AVMultiviewManager
An object that manages viewing multiple videos at once.
class AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a SharePlay
session.
See Also
visionOS playback


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

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


## Page 32

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


## Page 33

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


## Page 34

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


## Page 35

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


## Page 36

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


## Page 37

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


## Page 38

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


## Page 39

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


## Page 40

Use this class to control, observe, and respond to experience changes for an AVPlayerView
Controller. A player view controller’s presentation APIs will no longer be honored after attachi
an experience controller. Using the other presentation APIs may preclude the use of this class.
var allowedExperiences: AVExperienceController.Experiences
The set of experiences the application supports.
var availableExperiences: AVExperienceController.Experiences
The allowed experiences that are available to use on the device at this time.
struct Experiences
A structure that represents a collection of experiences to use with an experience controller.
var experience: AVExperienceController.Experience
The current experience.
Overview
Topics
Configuring the experience
AVKit / AVExperienceController
Class
AVExperienceController
An object that controls video experiences.
visionOS 2.0+


## Page 41

enum Experience
The types of experiences the system supports.
var configuration: AVExperienceController.Configuration
The configuration options per experience.
struct Configuration
A structure that stores per-experience configuration.
func transition(to: AVExperienceController.Experience) async ->
AVExperienceController.TransitionContext.TransitionResult
Transitions the video to a different experience.
var delegate: (any AVExperienceController.Delegate)?
A delegate object for the experience controller.
protocol Delegate
A protocol that defines the methods to implement to respond to experience changes.
struct ExpandedConfiguration
A structure that specifies options for an expanded experience.
struct TransitionContext
The state of the transition provided to the delegate object.
Sendable, SendableMetatype
Transitioning experiences
Configuring a delegate
Structures
Relationships
Conforms To


## Page 42

Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVMultiviewManager
An object that manages viewing multiple videos at once.
class AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a SharePlay
session.
See Also
visionOS playback


## Page 43

Watch multiple videos at the same time with AVExperienceController.Experience
.multiview using multiple AVExperienceController objects.
static var `default`: AVMultiviewManager
Use this default AVMultiviewManager to customize the multiview experience.
var contentSelectionViewController: AVContentSelectionViewController?
A view controller that presents a user interface to select additional video content to display.
class AVContentSelectionViewController
A view controller for providing additional UI to the multiview experience.
Overview
Topics
Accessing the default instance
Providing additional UI
AVKit / AVMultiviewManager
Class
AVMultiviewManager
An object that manages viewing multiple videos at once.
visionOS 2.0+


## Page 44

func dismiss()
Dismiss the multiview presentation.
Sendable, SendableMetatype
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
Dismissing the multiview experience
Relationships
Conforms To
See Also
visionOS playback


## Page 45

An object that controls video experiences.
class AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a SharePlay
session.


## Page 46

Access an experience coordinator by querying a player view controller for its groupExperience
Coordinator object.
func coordinateWithSession<T>(GroupSession<T>)
Begins coordinating viewing environment state with a group session.
NSObject
Overview
Topics
Coordinating state changes
Relationships
Inherits From
AVKit / AVGroupExperienceCoordinator
Class
AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a
SharePlay session.
visionOS 1.0+


## Page 47

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
An object that controls video experiences.
class AVMultiviewManager
An object that manages viewing multiple videos at once.
Conforms To
See Also
visionOS playback


## Page 48



