# 001_Presenting Navigation Markers.pdf

## Page 1

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


## Page 2

define the navigation markers for the current media.
Note
Although the player item defines the navigationMarkerGroups property as an array, the
system only supports the first group in the array.
An AVNavigationMarkersGroup contains one or more AVTimedMetadataGroup objects,
each representing an individual marker presented in the player’s Info panel. Each AVTimed
MetadataGroup stores a time range in the asset’s timeline to which this marker applies, an array
of AVMetadataItem objects to define the marker’s title, and, optionally, its thumbnail artwork.
The following code shows how you can present a chapter list for your media:


## Page 3



## Page 4

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


## Page 5

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


