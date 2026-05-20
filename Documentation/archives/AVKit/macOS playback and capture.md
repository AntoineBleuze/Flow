# macOS playback and capture.pdf

## Page 1

You use AVPlayerView to provide a playback experience like that of QuickTime Player in macOS
However, AVPlayerView not only provides the QuickTime playback interface, but it also provide
the QuickTime media-trimming experience.
Before attempting to put the player into trimming mode, verify that trimming is allowed by queryin
the player view’s canBeginTrimming property. This property returns false if you’re playing an
asset delivered over HTTP Live Streaming or if the asset is content protected. If you’re presenting
menu item to initiate trimming, a good place to perform this check is in the validateUser
InterfaceItem(_:) method of NSDocument, so that the menu item can automatically be
disabled if trimming is disallowed.
Overview
Verify that Trimming Is Allowed
Enter Trimming Mode
AVKit / Implementing Trimming in a macOS Player
Article
Implementing Trimming in a macOS Player
Provide a QuickTime media-trimming experience in your macOS app.


## Page 2

After you’ve determined that the media supports trimming, you call the begin
Trimming(completionHandler:). This method takes a completion block that you use to
determine whether the user completed the trim or canceled the operation.
Because AVAsset is an immutable object, you may be wondering how its duration is changed
when you click the Trim button. Trimming relies on a feature of AVPlayerItem to adjust the
presented time range. AVPlayerItem provides the reversePlaybackEndTime and forward
PlaybackEndTime properties that set the in and out points for a media item. It doesn’t change
the underlying asset, but essentially changes your effective view of it. To save the results of the
user’s trim operation, you export a new copy of the asset, trimming it to the specified times. The
simplest way to do this is to use AVAssetExportSession, which provides a simple and
performant way for you to transcode the media of an asset. You create a new export session,
passing it the asset to export along with a transcoding preset to use.
This example uses a preset to export the media as a 720p, M4V file, but AVAssetExport
Session supports a wide variety of export presets. To find out what export session presets are
supported for the current asset, you can use the session’s exportPresets(compatible
With:) class method, passing it the asset you want to export. This method returns an array of
valid presets that you can use in your export.
Transcode the Trimmed Asset
Select the Trimmed Asset


## Page 3

To export only the content the user trimmed, you use the current player item’s reverse and forwar
end-time values to define a CMTimeRange to set on the export session.
To perform the actual export operation, you call its exportAsynchronously(completion
Handler:) method. Check the status of the export session in the completion handler and handl
completion and failure cases.
class AVPlayerView
A view that displays content from a player and presents a native user interface to control
playback.
class AVCaptureView
A view that displays standard user interface controls for capturing media data.
Export the Trimmed Asset
See Also
macOS playback and capture


## Page 4

Implementing Trimming in a macOS Player
The player view supports several controls styles, ranging from no controls to controls matching th
look of QuickTime Player. This makes it easy for you to tailor the presentation to best match your
use of the player view. Regardless of the selected controls style, the player view always supports
the following standard set of keyboard shortcuts to control playback:
The Space bar plays and pauses playback.
The right and left arrow keys step frame-by-frame through the video.
JKL navigation:
The J key rewinds. Press it multiple times to cycle through rewind speeds.
The K key stops playback.
The L key fast-forwards. Press it multiple times to cycle through fast-forward speeds.
The player view also makes it simple to add trimming capabilities to your player. Call the view’s
beginTrimming(completionHandler:) method to present a trimming UI that matches the
QuickTime Player interface.
Mentioned in
Overview
AVKit / AVPlayerView
Class
AVPlayerView
A view that displays content from a player and presents a native user interface to
control playback.
macOS 10.9+


## Page 5

var controlsStyle: AVPlayerViewControlsStyle
The player view’s controls style.
enum AVPlayerViewControlsStyle
Constants that indicate which user interface controls the view displays.
var showsFrameSteppingButtons: Bool
A Boolean value that determines whether the player view displays frame stepping buttons.
var showsSharingServiceButton: Bool
A Boolean value that determines whether the player view displays a sharing service button.
var showsFullScreenToggleButton: Bool
A Boolean value that determines whether the player view displays a full-screen toggle button
var showsTimecodes: Bool
A Boolean value that determines whether the player view displays timecodes, if available.
var contentOverlayView: NSView?
A view that adds additional custom views between the video content and the controls.
var actionPopUpButtonMenu: NSMenu?
An action pop-up button menu that the player view displays.
var updatesNowPlayingInfoCenter: Bool
A Boolean value that indicates whether the player view controller updates the Now Playing in
center.
var isReadyForDisplay: Bool
A Boolean value that indicates whether the current player item’s first video frame is ready fo
display.
var videoBounds: NSRect
The current size and position of the video image that displays within the player view’s bound
Topics
Customizing the user interface
Customizing the video presentation


## Page 6

var videoGravity: AVLayerVideoGravity
A value that determines how the player view displays video content within its bounds.
var allowsVideoFrameAnalysis: Bool
A Boolean value that indicates whether to perform video frame analysis.
var videoFrameAnalysisTypes: AVVideoFrameAnalysisType
struct AVVideoFrameAnalysisType
Constants that define the types of analysis a player view controller may perform on a paused
video frame.
var speeds: [AVPlaybackSpeed]
A list of user-selectable playback speeds to show in the playback speed control.
var selectedSpeed: AVPlaybackSpeed?
The currently selected playback speed.
func selectSpeed(AVPlaybackSpeed)
Selects a specified playback speed.
class AVPlaybackSpeed
An object that represents a user-selectable playback speed in a playback user interface.
var allowsPictureInPicturePlayback: Bool
A Boolean value that determines whether the player view allows Picture in Picture playback.
var pictureInPictureDelegate: (any AVPlayerViewPictureInPictureDelegate
)?
The Picture in Picture delegate object.
protocol AVPlayerViewPictureInPictureDelegate
A protocol that defines the methods to implement to respond to Picture in Picture playback
events.
Configuring frame analysis
Configuring the playback speed
Configuring picture in picture


## Page 7

var allowsMagnification: Bool
A Boolean value that indicates whether the magnify gesture changes the video’s view
magnification.
var magnification: CGFloat
The factor by which the video’s view is currently scaled.
func setMagnification(CGFloat, centeredAt: CGPoint)
Scales the video’s view by a specified factor, and centers the result on a specified point.
func flashChapterNumber(Int, chapterTitle: String?)
Displays the chapter number and title in the player view for a brief moment.
var canBeginTrimming: Bool
A Boolean value that indicates whether the player view can begin trimming.
func beginTrimming(completionHandler: ((AVPlayerViewTrimResult) -> Void
)?)
Puts the player view into trimming mode.
enum AVPlayerViewTrimResult
Constants that specify an action a user takes when trimming media in a player view.
var player: AVPlayer?
The player instance that provides the media content for the view.
var delegate: (any AVPlayerViewDelegate)?
The player view’s delegate object.
Magnifying video
Displaying the chapter and title
Trimming media
Setting the player object
Setting the delegate object


## Page 8

protocol AVPlayerViewDelegate
A protocol that defines the methods to implement to participate in the player view’s full-
screen presentation life cycle.
var preferredDisplayDynamicRange: AVDisplayDynamicRange
Describes how High Dynamic Range (HDR) video content renders.
enum AVDisplayDynamicRange
Describes how High Dynamic Range (HDR) video content renders.
NSView
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
High dynamic range
Relationships
Inherits From
Conforms To


## Page 9

Implementing Trimming in a macOS Player
Provide a QuickTime media-trimming experience in your macOS app.
class AVCaptureView
A view that displays standard user interface controls for capturing media data.
See Also
macOS playback and capture


## Page 10

var session: AVCaptureSession?
The view’s associated capture session.
func setSession(AVCaptureSession?, showVideoPreview: Bool, showAudio
Preview: Bool)
Sets the view’s capture session.
var controlsStyle: AVCaptureViewControlsStyle
The style of the capture controls presented by the view.
enum AVCaptureViewControlsStyle
Constants that describe the capture view’s supported controls styles.
var videoGravity: AVLayerVideoGravity
A string value that defines how the capture view displays video within its bounds.
Topics
Configuring the Capture Session
Customizing the View
AVKit / AVCaptureView
Class
AVCaptureView
A view that displays standard user interface controls for capturing media data.
macOS 10.10+


## Page 11

var delegate: (any AVCaptureViewDelegate)?
The capture view’s delegate object.
protocol AVCaptureViewDelegate
The protocol that defines the methods you can implement to respond to capture view events
var fileOutput: AVCaptureFileOutput?
The capture file output used to record media data.
NSView
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
Configuring the Delegate
Recording Media
Relationships
Inherits From
Conforms To


## Page 12

SendableMetatype
Implementing Trimming in a macOS Player
Provide a QuickTime media-trimming experience in your macOS app.
class AVPlayerView
A view that displays content from a player and presents a native user interface to control
playback.
See Also
macOS playback and capture


