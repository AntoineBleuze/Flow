# 003_Presenting Content Proposals in tvOS.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


