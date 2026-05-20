# 002_Working with Interstitial Content.pdf

## Page 1

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


## Page 2

When you define interstitial time ranges, AVPlayerViewController updates its user interface
in two important ways, as shown below. First, the player represents any interstitial time ranges as
small dots on the player’s timeline. This helps users understand where they are between interstiti
breaks and helps orient them to where they are in the overall media timeline. Second, the player
collapses interstitial time ranges from the time display. The current time and duration presented
represent only your main content, providing a better sense of the primary media’s timeline.
Note
The player interface’s collapsing of time ranges is only visual. Any programmatic operations
you perform, such as seeking, happen on the full asset timeline, inclusive of interstitial content.


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


