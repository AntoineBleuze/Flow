# tvOS playback and capture.pdf

## Page 1

tvOS 15 introduces an all-new playback experience that helps viewers stay in the moment by
providing a more consistent, useful, and interactive user interface. The redesigned UI provides
viewers with convenient access to relevant controls and information while always keeping the foc
on the content.
It’s simple to provide this playback experience in your app by using AVPlayerViewController
Using this class for your player UI provides your app the same features and familiar interactions
Overview
AVKit / Customizing the tvOS Playback Experience
Article
Customizing the tvOS Playback
Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a
more streamlined way to watch your content.


## Page 2

found in the Apple TV app, including support for voice commands using the Siri Remote and
presenting video in Picture in Picture. In tvOS 15, AVPlayerViewController is more
configurable and customizable than ever, giving you new ways to tailor your app’s video playback
experience.
Note
Existing apps that use AVPlayerViewController adopt the new styling and features of the
redesigned player UI when they link against the tvOS 15 SDK.
The player user interface displays a title view above the transport bar when the current player item
contains title and subtitle metadata. When playing live streaming content, the title view may also
display a badge to indicate that content state to the viewer.
The title view retrieves the values it displays from an asset’s commonIdentifierTitle and i
TunesMetadataTrackSubTitle metadata items, when available. If the media your app plays
doesn’t contain embedded metadata, you can add custom metadata by creating instances of
AVMetadataItem. The table below lists the metadata values that the player user interface
supports.
Metadata
Identifier
Type
Title
commonIdentifierTitle
Data
Subtitle
iTunesMetadataTrackSubTitle
String
Artwork
commonIdentifierArtwork
String
Display Supporting Metadata


## Page 3

Metadata
Identifier
Type
Description
commonIdentifierDescription
String
Genre
quickTimeMetadataGenre
String
Content rating
iTunesMetadataContentRating
String
In an app that defines a structure that stores simple string-based metadata values, you could map
its values to their appropriate metadata identifiers and build an array of metadata items as shown
below.
To apply the metadata to the current player item, set the array of metadata items as the value of
the player item’s externalMetadata property.
Only the title and subtitle values display in the title view. The player presents the other supported
metadata values in its Info tab, which the Display Content Tabs section below describes.


## Page 4

Note
If your app would prefer to always hide the title view, set the value of the player view
controller’s transportBarIncludesTitleView to false.
The redesigned transport bar displays controls along its trailing side, which provides viewers quic
access to common actions. The system automatically displays controls to configure common
playback settings, like selecting subtitles and enabling Picture in Picture, but apps can also add
custom controls to the transport bar.
You define custom transport bar items by creating instances of UIAction or UIMenu. For
example, to create a simple control that toggles whether the current movie is a favorite, you could
create an instance of UIAction as shown below.
Add Custom Transport Bar Items


## Page 5

You can also create more advanced arrangements of actions and present them in a menu. The
following example creates a custom preferences menu that adds a gear icon to the transport bar.
When a user clicks the icon, the system presents a pop-up menu with an option to enable looping
playback and an inline submenu to control playback speed.
To have the player view controller present the custom items, set them as the player view
controller’s transportBarCustomMenuItems property value.
Setting the custom action and menu adds two new items to the transport bar.


## Page 6

The tvOS player UI can display one or more content tabs below the transport bar to show
supporting information or related content. By default, the player presents an Info tab when an ass
contains embedded metadata or when you set external metadata on the player item, as the Displa
Supporting Metadata section above describes.
Your app can also define custom tabs by creating subclasses of UIViewController to present
your supporting content, and set them as the value of the player view controller’s customInfo
ViewControllers property. The system uses the custom view controller’s title property valu
as the tab title, so initialize it before setting it on the player view controller.
Display Content Tabs


## Page 7

For the player view controller to size your content appropriately, specify a preferredContent
Size or define appropriate auto layout constraints. The system sizes all view controllers to the
height of the tallest content tab, so size your custom view controllers consistently or verify that
they lay out as you expect at their runtime height.
A player view controller presents an Info tab when playing an asset with embedded or external
metadata. The tab’s view displays the metadata details, and it may show up to two UIAction
controls along its trailing edge, as shown below.
You customize the actions the view presents by setting a value for the player view controller’s
infoViewActions property. When playing nonlive content, this property contains a single-
element array that presents an action to play the content from the beginning. You may replace the
default value (if present), add an additional action, or set this property value to an empty array to
display no actions. The example below shows how to add a Watch Later action to the view.
You can use the tvOS player UI to present controls contextually, which you display for a specific
range of time in the content and then dismiss. A common use for this type of control is a Skip
button that displays during the title sequence of a movie or TV show. Clicking the button allows
viewers to bypass the introduction and quickly skip to the main content.
Present Actions in the Info Tab
Present Actions Contextually


## Page 8

AVPlayerViewController provides a contextualActions property that you can use to
specify one or more actions to present. The player displays them along the bottom-trailing side o
the screen. The following code example shows a simple implementation of an action that seeks th
player forward to the time of the main content.
When you set a value for the contextualActions property, the player presents the controls
immediately. To present them only during a relevant section of the content, observe the player
timing by adding a periodic or boundary time observer. The following example defines a periodic
time observer that fires every second during normal playback. In each invocation, it evaluates the
new time to determine if it falls within the presentation range. If it does, the example sets the skip
action as the contextual actions value; otherwise, it clears the value by setting it to an empty array
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP Live
Streaming support.
See Also
tvOS playback and capture


## Page 9

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
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 10

To help users navigate your content, the Chapters panel presents navigation markers that
represent points of interest within the media’s timeline. Users can skip to desired content by
selecting a marker with the Siri Remote.
In tvOS, a AVPlayerItem contains a navigationMarkerGroups property you use to supply
chapter information. Set this property to an array of AVNavigationMarkersGroup objects to
Overview
Set the Navigation Markers
AVKit / Presenting Navigation Markers
Article
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate
your content.


## Page 11

define the navigation markers for the current media.
Note
Although the player item defines the navigationMarkerGroups property as an array, the
system only supports the first group in the array.
An AVNavigationMarkersGroup contains one or more AVTimedMetadataGroup objects,
each representing an individual marker presented in the player’s Info panel. Each AVTimed
MetadataGroup stores a time range in the asset’s timeline to which this marker applies, an array
of AVMetadataItem objects to define the marker’s title, and, optionally, its thumbnail artwork.
The following code shows how you can present a chapter list for your media:


## Page 12



## Page 13

Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
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
See Also
tvOS playback and capture


## Page 14

class AVInterstitialTimeRange
A time range in an audiovisual presentation for content with an interstitial designation, such a
advertisements or legal notices.
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 15

Media playback apps often present additional content such as legal text, content warnings, or
advertisements alongside their main media content. One method is to use HTTP Live Streaming’s
(HLS) support for serving stitched playlists. Stitched playlists let you combine multiple media
playlists into a single, unified playlist that’s delivered to the client as a single stream. This stream
provides a smooth playback experience to users, with no breaks or interruptions in the action whe
the player presents the interstitial content. For more information about including ad content in you
HLS playlist, see Incorporating Ads into a Playlist.
AVKit in tvOS simplifies working with interstitial content delivered as part of a stitched playlist. Yo
define the time ranges in your presentation that contain interstitial content. As the player
encounters the time ranges during playback, you receive callbacks when they begin and end,
giving you the opportunity to enforce business rules or capture analytics.
AVPlayerItem in tvOS adds an interstitialTimeRanges property that you set to an array 
AVInterstitialTimeRange objects that the system uses to annotate the timeline with break
markers. Each object defines a CMTimeRange marking the interstitial time range in your media’s
timeline. The following code example shows how to create interstitial time ranges.
Overview
Define Interstitial Time Ranges
AVKit / Working with Interstitial Content
Article
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP
Live Streaming support.


## Page 16

When you define interstitial time ranges, AVPlayerViewController updates its user interface
in two important ways, as shown below. First, the player represents any interstitial time ranges as
small dots on the player’s timeline. This helps users understand where they are between interstiti
breaks and helps orient them to where they are in the overall media timeline. Second, the player
collapses interstitial time ranges from the time display. The current time and duration presented
represent only your main content, providing a better sense of the primary media’s timeline.
Note
The player interface’s collapsing of time ranges is only visual. Any programmatic operations
you perform, such as seeking, happen on the full asset timeline, inclusive of interstitial content.


## Page 17

When you adopt the AVPlayerViewControllerDelegate protocol, the player can notify you
app as it traverses interstitial time ranges, which is useful to help you enforce business rules. For
instance, a common requirement when presenting advertisements is to prevent users from
skipping past them. You can use the requiresLinearPlayback property of AVPlayerView
Controller to control whether users can navigate through the content using the Siri Remote.
During playback, this property is normally set to false, but when presenting an advertisement,
you can set it to true to prevent user navigation, as shown in the following example.
If your app presents interstitial content, such as ads or legal text, you may want to prevent users
from skipping past it. Implement this functionality by using the playerViewController(_:
timeToSeekAfterUserNavigatedFrom:to:) delegate method. The system calls this metho
whenever a user performs a seek operation using the Siri Remote, which happens either by swipin
left or right on the remote clickpad or by navigating chapter markers in the Info panel. The followi
code shows a simple example of how you might implement this method to prevent users from
skipping past advertisements.
Enforce Linear Playback
Prevent Skipping of Interstitial Content


## Page 18

For any forward seeks, the example code ensures that the user can’t skip past an ad break. It
attempts to find an interstitial time range within the time range of the user’s seek request. If it find
an interstitial time range, the code returns its start time, forcing playback to begin at the start of t
advertisement.
tvOS 15 adds support for coordinating and observing playback of interstitial assets. Automatic
handling of interstitial events allows the system to make smooth transitions between your main an
interstitial content, and doesn’t require you to coordinate playback between the players.
While an AVInterstitialTimeRange can be any arbitrary time range in the media, an
AVPlayerInterstitialEvent represents an HLS ad break or interstitial event. When you use
AVPlayerInterstitialEvent, AVKit internally enforces linear playback and other navigation
restrictions based on the event type.
You use translatesPlayerInterstitialEvents to indicate whether AVKit should generate
the value of interstitialTimeRanges from AVPlayerInterstitialEvent. When you pla
a stream that defines interstitial events, or when the client creates or modifies events using a
AVPlayerInterstitialEventController, the system populates interstitials. AVKit continu
to update interstitialTimeRanges when there are changes to the set of events.
On the server that distributes HLS content, use the EXT-X-DATERANGE tag to associate a date
range with a set of attributes.
Use AVPlayerInterstitialEventObserver to monitor the player for server-side events.
Generate Interstitial Events Automatically


## Page 19

You can supplement interstitial events with custom attribute-value pairs. For example, imagine
adding beacon positions and beacon URLs for advertisements delivered as an interstitial. Inspect
userDefinedAttributes on your event to get the information.
If you don’t update to the latest SDK and begin using streams that contain AVPlayer
InterstitialEventController, you need to manage your own interstitials except for AirPla
Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Presenting Content Proposals in tvOS
See Also
tvOS playback and capture


## Page 20

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
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 21

Media apps presenting serialized content, such as a TV show, often display a preview of the next
episode in the series when you finish watching the current one. The user interface for this preview
usually contains artwork and information about the proposed content. It also includes options for
the user to either watch the next episode or return to the main menu. You add this functionality to
your app using AVKit’s content proposals.
You create a content proposal using the AVContentProposal class. This type models the data
about the proposed content, such as its title, preview image, metadata, and content URL, and the
time at which to present the proposal. You create and configure a content proposal instance as
shown in the following code:
Overview
Create a Content Proposal
AVKit / Presenting Content Proposals in tvOS
Article
Presenting Content Proposals in tvOS
Display a preview of an upcoming media item at the conclusion of the currently
playing media item.


## Page 22

In addition to defining your content proposal’s data, you also need to create an interface to prese
this data to the user. You create this interface by subclassing the AVKit framework’s AVContent
ProposalViewController class. At runtime, the system passes your subclass a reference to
the current AVContentProposal, providing you the data to present. Your user interface should
provide visual and descriptive information about the proposed content, and should also include
options for the user to accept or reject the proposal.
When the system presents your proposal, it displays it over the currently playing full-screen video
You may want to scale this video to a smaller size so you can make more room to display the deta
of the proposed content. To do this, you override the view controller’s preferredPlayerView
Frame property and return the desired video frame.
When the system presents the proposal, the player’s view automatically animates to the specified
frame.
Create the Content Proposal’s User Interface


## Page 23

Note
To lay out your content relative to the newly sized and positioned video frame, you use the
UILayoutGuide provided by the view controller’s playerLayoutGuide property.
Your presented user interface should also provide controls so the user can accept or reject the
proposal. The event handlers for these actions should call the controller’s dismissContent
Proposal(for:animated:completion:) method, indicating the user’s choice.
To make your content proposal eligible for the system to present, set it as the nextContent
Proposal property value of the current AVPlayerItem. The following example shows how to
configure this property value in a playback app that manages a queue of Video objects, which is
custom value type that models the data of an individual video in the queue. The example code
creates the required playback objects, creates a new AVContentProposal for the next video in
the queue, and sets the video as the player item’s nextContentProposal.
Add Controls to the Content Proposal
Make the Content Proposal Eligible to be Presented


## Page 24

With the content proposal set as the player item’s nextContentProposal, the next step is to
implement the methods of the AVPlayerViewControllerDelegate protocol. You use these
methods to define how the system presents the content proposal, as well as to handle the
acceptance or rejection of the proposed content.
To present your custom view controller in response to a request to present the next content
proposal, implement the playerViewController(_:shouldPresent:) method. In this
method, you set an instance of your custom AVContentProposalViewController as the
player view controller’s contentProposalViewController property.
If the presented AVContentProposal provides a valid content URL, the player view controller
can automatically handle its acceptance or rejection. However, if you need more control over the
handling of these actions, implement the playerViewController(_:didAccept:) and
Present the Content Proposal


## Page 25

playerViewController(_:didReject:) methods. For example, the following code
implements the playerViewController(_:didAccept:)method to play the proposed video
and create a new content proposal for the next video in the queue.
Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP Live
Streaming support.
Working with Overlays and Parental Controls in tvOS
Add interactive overlays, parental controls, and livestream channel flipping using a player vie
controller.
Supporting Continuity Camera in your tvOS app
Capture high-quality photos, video, and audio in your Apple TV app by connecting an iPhone
or iPad as a continuity device.
See Also
tvOS playback and capture


## Page 26

class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVInterstitialTimeRange
A time range in an audiovisual presentation for content with an interstitial designation, such a
advertisements or legal notices.
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 27

Note
This sample code project is associated with WWDC 2019 session 503: Delivering Intuitive
Media Playback with AVKit.
Only navigation from live streaming supports channel flipping, so you need to replace the assets i
this sample with your live content to demonstrate this behavior.
By default, the sample demonstrates automatic support for parental controls. Activate parental
restrictions by following the steps below:
1. Go to Settings > General > Restrictions.
2. Turn on Restrictions.
3. Set a passcode (1111 for demonstration purposes; remember this passcode).
4. Scroll down to the Allowed Content section.
5. Select Movies and/or TV Shows.
Overview
Configure the Sample Code Project
AVKit / Working with Overlays and Parental Controls in tvOS
Sample Code
Working with Overlays and Parental
Controls in tvOS
Add interactive overlays, parental controls, and livestream channel flipping using a
player view controller.
Download
tvOS 13.0+
Xcode 15.3+


## Page 28

6. Set a restriction level (for example, PG or PG-13 if you are in the United States).
The first demo video has a rating of PG, and the second has a rating of PG-13. You can find or edi
these ratings in MainViewController.swift.
This sample also demonstrates explicit support for parental restrictions by directly calling playe
Item.requestPlaybackRestrictionsAuthorization(_ completion). You can test
explicit support by changing the value of checkParentalControlsExplicitly in the sample
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


## Page 29

class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 30

Continuity Camera brings the power of the cameras and microphones from an iOS or iPadOS
device to Apple TV, including advanced features like Center Stage and Portrait mode.
This sample project provides an example implementation that accesses a camera and microphon
from a nearby iPhone or iPad in an Apple TV app. It builds on a similar sample, Supporting
Continuity Camera in your macOS app, and shares some of its functionality, including automatic
camera selection and observing the state of video effects. The following sections focus on the
aspects specific to tvOS.
Note
This sample code project is associated with WWDC23 session 10256: Discover Continuity
Camera on tvOS.
To run this sample app, you need the following:
An Apple TV 4k (2nd generation) or later with tvOS 17 or later.
An iPhone or iPad with iOS 17 or iPadOS 17, respectively, or later.
Overview
Configure the sample code project
AVKit / Supporting Continuity Camera in your tvOS app
Sample Code
Supporting Continuity Camera in your
tvOS app
Capture high-quality photos, video, and audio in your Apple TV app by connecting
an iPhone or iPad as a continuity device.
Download
tvOS 17.0+
Xcode 15.3+


## Page 31

You need to run this sample code project on physical devices, because Simulator doesn’t include
the components to support cameras.
Continuity Camera works with all iPhone and iPad models that support video effects in Control
Center. You need to sign in with an Apple ID that uses two-factor authentication for the Apple TV
and the device with a camera. You can use a separate Apple ID for each device or the same Apple
ID for both.
The first time you run the app on an Apple TV, the system prompts you for permission to access t
the camera and microphone. The app needs these permissions to function correctly.
When the app launches, it immediately presents a continuity device picker by calling the
continuityDevicePicker(isPresented:onDidConnect:) modifier in its SwiftUI
implementation.
The picker only appears if the isPresented parameter — which is a Boolean Binding — is tru
The picker calls the closure the app passes to the onDidConnect parameter when a person
selects a device and the system successfully connects to it.
Present the continuity device picker


## Page 32

The handling closure’s AVContinuityDevice parameter represents the device that a person
selects on their Apple TV. Each continuity device has a videoDevices property, which is an arra
of AVCaptureDevice instances.
The app’s handleNewConnectionForDevice(_:) method is a minimal implementation that
selects the first video device in the array. Apps typically compare all the video device elements an
select one that’s appropriate for their needs.
Note
UIKit based apps can create a continuity device picker by creating an AVContinuity
DevicePickerViewController instance.
The app’s CaptureManager class creates and maintains an AVCaptureSession instance for
the app’s lifetime. The capture manager’s setActiveVideoInput(_:) method creates an
AVCaptureDeviceInput instance from the video device, and then tests to see whether it’s an
acceptable input for the capture session.
If the new device is an acceptable input, the method assigns it to the app’s activeInput
property. The property updates the capture session with its willSet and didSet property
observers.
Connect a video device to a capture session


## Page 33

The willSet observer removes the capture session’s current input, if applicable. The didSet
observer adds the new input to the capture session. The didSet observer also updates the is
Active Boolean property, which can cause the app to change its behavior and UI.
The app receives various updates related to its capture device by registering with
NotificationCenter and with key-value observation (KVO). See Using Key-Value Observing in Swif
and NSKeyValueObserving for more information.
The app specifically registers for the following events:
A specific video effect, such as Center Stage, changes its active state.
The system changes the capture device it prefers.
The active capture device disconnects from the system.
Note
People can enable video effects in Control Center on Apple TV.
The sample’s implementation that monitors the video effects and system changes is similar to the
macOS equivalent of this sample, Supporting Continuity Camera in your macOS app. The sample
also monitors Notification Center events related to the camera. The app’s capture manager
responds when a capture device disconnects by registering with Notification Center for the
.AVCaptureDeviceWasDisconnected event.
Register for capture device updates


## Page 34

The app’s CaptureDeviceNotificationObserver structure listens for the these events on
behalf of the capture manager and calls the manager’s notification(_:for:) method for
each event it gets from Notification Center.
At launch, the app creates an AudioCapturer instance, which checks for audio inputs
(microphones). It does this by inspecting the AVAudioSession.availableInputs property o
the AVAudioSession type’s shared instance, and then monitoring the property for updates.
The app monitors for new microphones — similar to how the app’s capture manager monitors for
new cameras — by observing the isInputAvailable property of the AVAudioSession type’s
shared instance.
When the app has access to a microphone, it configures an AVAudioEngine instance in the aud
capturer’s setupAndStartAudioSession() method.
Configure the audio engine with an audio input device


## Page 35

The method configures the audio engine for a conference call scenario when the app gains acces
to a microphone — at launch or later — with the following steps:
1. Configures the audio engine to produce sound from the system’s first audio output.
2. Enables voice processing on the audio engine’s input node.
3. Configures the audio engine for conversational audio.
4. Starts the audio engine.
The third step is important for conferencing apps that use Voice over IP (VoIP). The configure
AudioSessionForVoiceChat method configures the audio session by passing the .voice
Chat mode to the audio session’s setCategory(_:options:) method.
The app gains access to additional audio features and microphone modes, including automatic ga
correction, voice processing, and muting, by configuring the audio session for VoIP.
The app’s audio interface has a button that lets a person temporarily disable microphone
processing, including echo cancellation, by bypassing the audio engine’s voice processing. Each
time a person toggles the button, the app calls audio capturer’s bypassVoiceProcessing(_:
method.
The app can temporarily disable voice processing by setting the isVoiceProcessingBypasse
property of the audio engine’s inputNode to true. This gives the app all the incoming audio fro
Configure the audio engine for a call


## Page 36

the microphone without any adjustments from the system.
Note
The behavior of the audio engine’s isVoiceProcessingBypassed property is similar to k
AUVoiceIOProperty_BypassVoiceProcessing. For more information, see Audio Unit
Voice I/O.
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


## Page 37

class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 38

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


## Page 39

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


## Page 40

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


## Page 41

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


## Page 42

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


## Page 43

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


## Page 44

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


## Page 45

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


## Page 46

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


## Page 47

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


## Page 48

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


## Page 49

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


## Page 50

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


## Page 51

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


## Page 52

Working with Interstitial Content
When you associate interstitial time ranges with an AVPlayerItem you present with an
AVPlayerViewController, you can customize or restrict the presentation of interstitial conte
For example, you can allow the user to skip advertisements or prohibit skipping of a legal notice.
init(timeRange: CMTimeRange)
Initializes an interstitial time range object with the specified time range.
Mentioned in
Overview
Topics
Creating an Interstitial Time Range
Inspecting an Interstitial Time Range
AVKit / AVInterstitialTimeRange
Class
AVInterstitialTimeRange
A time range in an audiovisual presentation for content with an interstitial
designation, such as advertisements or legal notices.
iOS 16.0+
iPadOS 16.0+
tvOS 9.0+
visionOS 1.0+


## Page 53

var timeRange: CMTimeRange
The time range identified as interstitial content.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP Live
Streaming support.
Presenting Content Proposals in tvOS
Relationships
Inherits From
Conforms To
See Also
tvOS playback and capture


## Page 54

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
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 55

Presenting Navigation Markers
The most common form of a navigation markers group is a chapter list; however, you can also
provide other sets of markers to allow a user to jump to significant events in the presentation. For
example, a “Goals Scored” markers group might summarize key moments in a recorded sporting
event. When you associate navigation markers with an AVPlayerItem object you present with a
AVPlayerViewController, the user interface provides options for navigating each group.
init(title: String?, timedNavigationMarkers: [AVTimedMetadataGroup])
Initializes a navigation markers group with the specified title and array of timed navigation
markers.
Mentioned in
Overview
Topics
Creating a Navigation Marker Group
AVKit / AVNavigationMarkersGroup
Class
AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
tvOS 9.0+


## Page 56

init(title: String?, dateRangeNavigationMarkers: [AVDateRangeMetadata
Group])
Initializes a navigation markers group with the specified title and array of date range
navigation markers.
var title: String?
The title of the marker group.
var timedNavigationMarkers: [AVTimedMetadataGroup]?
The array of timed navigation markers for which the group provides navigation.
var dateRangeNavigationMarkers: [AVDateRangeMetadataGroup]?
The array of date range navigation markers for which the group provides navigation.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Customizing the tvOS Playback Experience
Inspecting Navigation Metadata
Relationships
Inherits From
Conforms To
See Also
tvOS playback and capture


## Page 57

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
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.


## Page 58

protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 59

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


## Page 60

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


## Page 61

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


## Page 62

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


## Page 63

If you set the display manager’s preferredDisplayCriteria, when a user enables a Match
Content setting, the TV attempts to change modes to match the currently playing video’s native
display criteria.
Important
Don’t directly instantiate a display manager object. Instead, access the current instance from
the key window’s avDisplayManager property.
var preferredDisplayCriteria: AVDisplayCriteria?
A hint for the TV to set the display mode to best match the currently playing content’s displa
criteria.
var isDisplayCriteriaMatchingEnabled: Bool
Overview
Topics
Matching a Video’s Native Display Mode
AVKit / AVDisplayManager
Class
AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match
the video’s native mode.
tvOS 11.2+
visionOS 1.0+


## Page 64

A Boolean value that indicates whether the user has enabled display critera matching.
var isDisplayModeSwitchInProgress: Bool
A Boolean value that indicates whether a display mode switch is in progress.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP Live
Streaming support.
Presenting Content Proposals in tvOS
Relationships
Inherits From
Conforms To
See Also
tvOS playback and capture


## Page 65

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
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 66

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


## Page 67

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


## Page 68

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


## Page 69

class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
protocol AVContinuityDevicePickerViewControllerDelegate
An interface that responds to events from a continuity device picker view controller.


## Page 70

Your app can respond to the various outcome events from an AVContinuityDevicePicker
ViewController instance with the following steps:
1. Adopt the AVContinuityDevicePickerViewControllerDelegate protocol with one of
the app’s classes.
2. Create an instance of that class.
3. Assign that instance to the view controller’s delegate property.
func continuityDevicePickerWillBeginPresenting(AVContinuityDevicePicker
ViewController)
Informs the delegate that a continuity device picker is about to present its UI so that a perso
can select and connect a continuity device.
Overview
Topics
Responding to continuity device events
AVKit / AVContinuityDevicePickerViewControllerDelegate
Protocol
AVContinuityDevicePickerViewController
Delegate
An interface that responds to events from a continuity device picker view
controller.
tvOS 9.0+


## Page 71

func continuityDevicePickerDidCancel(AVContinuityDevicePickerView
Controller)
Informs the delegate when a person declines to select a continuity device by dismissing an
app’s continuity device picker.
func continuityDevicePicker(AVContinuityDevicePickerViewController, did
Connect: AVContinuityDevice)
Informs the delegate when a person selects and connects a continuity device to the system
with a continuity device picker.
func continuityDevicePickerDidEndPresenting(AVContinuityDevicePickerVie
Controller)
Informs the delegate that a continuity device picker is no longer presenting its UI to a person
NSObjectProtocol
Customizing the tvOS Playback Experience
Adopt the latest features of the redesigned tvOS player user interface to provide a more
streamlined way to watch your content.
Presenting Navigation Markers
Present navigation markers in the Chapters panel to help users quickly navigate your conten
Working with Interstitial Content
Present additional content alongside your main media presentation using HTTP Live
Streaming support.
Presenting Content Proposals in tvOS
Relationships
Inherits From
See Also
tvOS playback and capture


## Page 72

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
class AVNavigationMarkersGroup
A set of markers for navigating playback of an audiovisual presentation.
class AVContentProposalViewController
A view controller that proposes content to watch next.
class AVDisplayManager
A tvOS management object that controls whether a TV switches modes to match the video’s
native mode.
class AVContinuityDevicePickerViewController
A view controller that provides an interface to a person so they can select and connect a
continuity device to the system.


