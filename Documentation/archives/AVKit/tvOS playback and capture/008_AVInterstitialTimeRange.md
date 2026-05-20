# 008_AVInterstitialTimeRange.pdf

## Page 1

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


## Page 2

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


## Page 3

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


