# Picture in Picture.pdf

## Page 1

Note
This sample code project is associated with WWDC20 session 10176: Master Picture in Picture
on tvOS.
This sample code project must be run on a physical device.
Adopting Picture in Picture in a Standard Player
Add Picture in Picture (PiP) playback to your app using a player view controller.
Overview
Requirements
See Also
Picture in Picture
AVKit / Adopting Picture in Picture Playback in tvOS
Sample Code
Adopting Picture in Picture Playback in
tvOS
Add advanced multitasking capabilities to your video apps by using Picture in
Picture playback in tvOS.
Download
iOS 14.0+
iPadOS 14.0+
tvOS 14.0+
Xcode 12.5+


## Page 2

Adopting Picture in Picture in a Custom Player
Add controls to your custom player user interface to invoke Picture in Picture (PiP) playback
Adopting Picture in Picture for video calls
Add multitasking capability to your video-call apps by using Picture in Picture (PiP).
Accessing the camera while multitasking on iPad
Operate the camera in Split View, Slide Over, Picture in Picture, and Stage Manager modes.
class AVPictureInPictureController
A controller that responds to user-initiated Picture in Picture playback of video in a floating,
resizable window.


## Page 3

The AVPlayerViewController provides the standard video playback experience across iOS,
iPadOS, and tvOS. In tvOS, it supports a wide variety of remotes, skipping, scanning, scrubbing,
Siri commands, interstitial support, and more. After you configure your audio session and set the
project capabilities as described in Configuring your app for media playback, your player
automatically supports PiP playback. When your app runs on a supported device, the user can
manage PiP in the standard player.
PiP playback starts when the user selects the PiP button in the player interface. In iOS and iPadOS
PiP playback starts automatically if your video is playing in full-screen mode and the user exits the
app. When a video isn’t filling the entire screen in width, use canStartPictureInPicture
AutomaticallyFromInline to indicate a video is the primary focus. In either case, the player
window minimizes to a movable, floating window. In general, the system automatically pauses the
video upon scene backgrounding, so you don’t need to pause video based on activation state.
Tip
In iOS and iPadOS, you can disable automatic invocation of Picture in Picture in Settings >
General > Picture in Picture. Check this setting if you think you’ve set up everything correctly
but find that your video doesn’t enter PiP mode when you return to the Home screen.
Selecting the stop button in the PiP interface terminates PiP and restores video playback within
your app. AVKit can’t make assumptions about how you designed your app, so it doesn’t know ho
to properly restore your video playback interface. Instead, it delegates that responsibility to you.
Overview
Familiarize Yourself with the PiP Controls
AVKit / Adopting Picture in Picture in a Standard Player
Article
Adopting Picture in Picture in a Standard
Player
Add Picture in Picture (PiP) playback to your app using a player view controller.


## Page 4

Starting in iOS 14, the PiP user interface provides controls that allow users to skip forward and
backward within a video. The system enables these controls by default for apps linked in iOS 14 o
later. If you need to restrict skipping content for legal disclaimers or advertisements, use
requiresLinearPlayback during the required section of your video. Set this property back to
false once you can allow seeking again.
To handle the restore process, your code must adopt the AVPlayerViewControllerDelegat
protocol and implement the playerViewController(_:restoreUserInterfaceFor
PictureInPictureStopWithCompletionHandler:) method. The framework calls this
method when control returns to your app, giving you the opportunity to determine how to properl
restore your video player’s interface. If you originally presented your video player using the
present(_:animated:completion:) method of UIViewController, restore your player
interface in the same way in the delegate callback method.
Avoid adding animations during the swap so you can ensure quick restoration for your user.
Important
To allow the system to finish restoring your user interface, call the completion handler with a
value of true.
In tvOS, users can play videos in PiP alongside a full-screen video. Video playback can move
between PiP and full screen, so your app needs to be ready to handle the swap to provide a
seamless PiP experience. When you swap your content with another app, consider your content
that’s going into PiP and your content leaving PiP to go full screen. The illustration below shows th
life cycle of your full-screen content swapping with another app’s PiP.
Restore Your Video Playback Interface
Swap PiP Content in tvOS


## Page 5

The illustration below shows the life cycle of your app’s PiP content moving to full screen.
When you swap content within your app, you need to handle both sides of the life cycle events
from both video players. The following sequence shows you the callbacks to expect with a video
that swaps content between PiP and full screen.
1. The video starting PiP receives playerViewControllerWillStartPictureIn
Picture(_:), but the system hasn’t started the animations.
2. The video going full screen receives playerViewController(_:restoreUserInterfac
ForPictureInPictureStopWithCompletionHandler:) to restore its full-screen user
interface.
3. The video going full screen receives playerViewControllerWillStopPictureIn
Picture(_:), and the system hasn’t started the animations.
4. The video starting PiP receives playerViewControllerDidStartPictureIn
Picture(_:), and the system completes the swap and animations for the video that started
PiP.
5. The video going full screen receives playerViewControllerDidStopPictureIn
Picture(_:), and the system completes the swap and animations for the video that moved f
screen.


## Page 6

Adopting Picture in Picture Playback in tvOS
Add advanced multitasking capabilities to your video apps by using Picture in Picture playba
in tvOS.
Adopting Picture in Picture in a Custom Player
Add controls to your custom player user interface to invoke Picture in Picture (PiP) playback
Adopting Picture in Picture for video calls
Add multitasking capability to your video-call apps by using Picture in Picture (PiP).
Accessing the camera while multitasking on iPad
Operate the camera in Split View, Slide Over, Picture in Picture, and Stage Manager modes.
class AVPictureInPictureController
A controller that responds to user-initiated Picture in Picture playback of video in a floating,
resizable window.
See Also
Picture in Picture


## Page 7

Add PiP playback to your custom player by using the AVKit framework’s AVPictureInPicture
Controller class. This class lets you implement the same PiP behavior found in AVPlayerVie
Controller in your custom player.
To participate with PiP in iOS and tvOS, customize your app’s audio playback capabilities by
configuring its audio session and background modes. For more information, see Configuring your
app for media playback.
Begin by adding a user interface (UI) to your custom player interface to enable users to begin PiP
playback. Make this UI consistent with the system default UI that AVPlayerViewController
presents. Access the standard images for controlling PiP playback by using the pictureIn
PictureButtonStartImage and pictureInPictureButtonStopImage class properties o
AVPictureInPictureController. These methods return system default images to present i
your UI.
Overview
Configure Audio Session and Background Modes
Update Your Custom Player User Interface
AVKit / Adopting Picture in Picture in a Custom Player
Article
Adopting Picture in Picture in a Custom
Player
Add controls to your custom player user interface to invoke Picture in Picture (PiP
playback.


## Page 8

Use key-value observing (KVO) on the controller’s canStopPictureInPicture property to
display the appropriate affordances and provide the correct behavior in your playback UI. If fals
display a start PiP affordance. If true, your app stops your custom playback UI and displays UI
affordances to swap if you’re creating a tvOS app. For more information about KVO, see Using Ke
Value Observing in Swift.
Create an instance of AVPictureInPictureController to control PiP playback in your app.
Before attempting to create the controller instance, verify that the current hardware supports PiP
playback by calling the isPictureInPictureSupported() method.
Create the PiP Controller


## Page 9

This example creates a new AVPictureInPictureController instance, passing it a referenc
to the AVPlayerLayer that presents the video content. The system supports displaying content
from an AVPlayerLayer or AVSampleBufferDisplayLayer in a PiP window.
For PiP functionality to work, maintain a strong reference to the controller object.
Note
The PiP display doesn’t use the AVPlayerLayer that you passed to AVPictureInPicture
Controller, so AVFoundation stops vending video frames to AVPlayerLayer when PiP
mode is active.
To participate in PiP life-cycle events, your code should adopt the AVPictureInPicture
ControllerDelegate protocol and set itself as the controller’s delegate. Also, use KVO on the
controller’s isPictureInPicturePossible property to observe whether using PiP mode is
possible in the current context, for example, when the system is displaying an active FaceTime
window. By observing this property, you can determine when it’s appropriate to change the enabl
state of your PiP button.
On tvOS, MPNowPlayingSession ties your AVPlayer instances to a session. Your app can hav
many playing sessions, and in the case of PiP, your player must be tied to a session. You can have
Now Playing session for your PiP content and one for your full-screen content. When you update 
session, the system ignores updates from the default MPNowPlayingInfoCenter, so migrate
away from MPNowPlayingInfoCenter.default() and switch to MPNowPlayingSession
across your whole app.
The system determines which Now Playing information to display, so publish your information eve
if the UI isn’t displaying your session — the system might display your session at any moment. Fo
more information about Now Playing metadata, see the Now Playing Metadata Properties topic
group at MPNowPlayingInfoCenter.
With the AVPictureInPictureController setup complete, add an @IBAction method to
handle user-initiated requests to start or stop PiP playback.
Publish the Now Playing State
Handle User-Initiated Requests


## Page 10

Important
Only begin PiP playback in response to user interaction and never programmatically. The App
Store review team rejects apps that fail to follow this requirement.
A user selects the stop PiP affordance in the PiP window to return control to your app. By default,
this action terminates playback when control returns to the app. It’s your responsibility to properly
restore your video playback interface.
To handle the restore process, implement the pictureInPictureController(_:restore
UserInterfaceForPictureInPictureStopWithCompletionHandler:) delegate metho
and restore your player interface as needed. When the restoration is complete, call the completio
handler with a value of true.
While PiP is active, dismiss playback controls in your main player, and present artwork in the PiP
window to indicate that PiP mode is active. To implement this functionality, use the pictureIn
PictureControllerWillStartPictureInPicture(_:) and pictureInPicture
ControllerDidStopPictureInPicture(_:) delegate methods, and take the required
actions.
Restore Control to Your App
Dismiss Playback Controls


## Page 11

Adopting Picture in Picture Playback in tvOS
Add advanced multitasking capabilities to your video apps by using Picture in Picture playba
in tvOS.
Adopting Picture in Picture in a Standard Player
Add Picture in Picture (PiP) playback to your app using a player view controller.
Adopting Picture in Picture for video calls
Add multitasking capability to your video-call apps by using Picture in Picture (PiP).
Accessing the camera while multitasking on iPad
Operate the camera in Split View, Slide Over, Picture in Picture, and Stage Manager modes.
class AVPictureInPictureController
A controller that responds to user-initiated Picture in Picture playback of video in a floating,
resizable window.
See Also
Picture in Picture


## Page 12

Use PiP in your video-call apps so users can multitask with other apps while on video calls. When
user enables PiP, your app scales down to a corner of the screen, so they can see the Home Scre
and interact with other apps. In iOS 15 and later, AVKit provides PiP support for video-calling apps
which enables you to deliver a familiar video-calling experience that behaves like FaceTime.
Important
In iOS 16 and later, you can use the camera in Picture in Picture mode by enabling a capture
session’s isMultitaskingCameraAccessEnabled property. Apps that have a deployment
target earlier than iOS 16 require the com.apple.developer.avfoundation
.multitasking-camera-access entitlement to use the camera in PiP mode.
Providing PiP support begins by choosing a source view to display inside the video-call view
controller. You need to add a UIView to AVPictureInPictureVideoCallViewController
so use AVCaptureVideoPreviewLayer or AVSampleBufferDisplayLayer depending on
your need. In iOS 18 and later, you may also use MTKView as your source view. Video-calling app
need to display the remote view, so use AVSampleBufferDisplayLayer to do so.
Overview
Create a source view
AVKit / Adopting Picture in Picture for video calls
Article
Adopting Picture in Picture for video calls
Add multitasking capability to your video-call apps by using Picture in Picture
(PiP).


## Page 13

To display your source view, create a AVPictureInPictureVideoCallViewController and
add your source as a subview.
Use isPictureInPictureSupported() to determine whether the current device supports P
playback. If PiP isn’t supported on the current device, attempting to initialize a PiP controller
returns nil.
Before you create an AVPictureInPictureController, you need to create an AVPictureI
PictureController.ContentSource that represents the source of the content the system
displays. A content source requires a video-call view controller, and a source view that contains th
content you associate with the video call.
Important
Avoid unintentionally starting PiP by setting the content source on your PiP controller to nil or
by releasing your PiP controller, when the active call ends.
After creating a content source, use it to initialize AVPictureInPictureController. By
default, PiP starts when a user moves to the background if your source view is full-screen, or you
set canStartPictureInPictureAutomaticallyFromInline to true. If your app is in the
foreground, you can start PiP by calling startPictureInPicture().
Create a video-call controller
Create a PiP controller using a content source


## Page 14

The system uses the source view to determine the source frame for the PiP animation, and the
restore target for either when the user returns to the app or PiP stops.
Note
The PiP window doesn’t receive touch events when you use AVPictureInPictureVideo
CallViewController, so you can’t customize the window’s user interface by adding
buttons.
When you use PiP, you respond to life-cycle events by observing AVPictureInPicture
ControllerDelegate. This allows you to handle your app’s user interface based on the PiP
state, along with observing for potential errors.
The system interrupts your capture session when the system or user stashes PiP, so observe was
InterruptedNotification for AVCaptureSession.InterruptionReason.video
DeviceNotAvailableInBackground to handle the interruption.
When your app is in PiP mode, it can’t assume control of the camera. For example, Camera.app
assumes control of the camera when it’s opened, and the system returns camera control when
Camera.app finishes with it. You observe wasInterruptedNotification for AVCapture
Session.InterruptionReason.videoDeviceInUseByAnotherClient to handle the
interruption.
Adopting Picture in Picture Playback in tvOS
Add advanced multitasking capabilities to your video apps by using Picture in Picture playba
in tvOS.
Adopting Picture in Picture in a Standard Player
Add Picture in Picture (PiP) playback to your app using a player view controller.
Adopting Picture in Picture in a Custom Player
Observe PiP life cycle events
See Also
Picture in Picture


## Page 15

Add controls to your custom player user interface to invoke Picture in Picture (PiP) playback
Accessing the camera while multitasking on iPad
Operate the camera in Split View, Slide Over, Picture in Picture, and Stage Manager modes.
class AVPictureInPictureController
A controller that responds to user-initiated Picture in Picture playback of video in a floating,
resizable window.


## Page 16

Camera access on iPad is normally limited to apps running in full-screen mode. If your app enters
multitasking mode, such as Split View or Stage Manager, the system disables the camera by
default. In iPadOS 16 and later, your app can enable using the camera while multitasking.
Related Sessions from WWDC22
Session 110429: Discover advancements in iOS camera capture: Depth, focus, and
multitasking
Multitasking modes enable people to work with multiple apps at the same time. There are four
kinds:
Split View mode accommodates two different apps, or two windows from the same app, by
splitting the screen into resizable views.
Slide Over mode lets users work on an app that slides in front of any open apps.
Picture in Picture mode displays a draggable window over an app.
Stage Manager lets users resize windows and see multiple overlapping windows in a single view
group apps for specific tasks or projects, and drag windows between iPad and an externally
connected display.
When you enable multitasking camera access, your app can run alongside other foreground apps
and it no longer receives AVCaptureSession.InterruptionReason.videoDeviceNot
AvailableWithMultipleForegroundApps as an interruption reason.
Overview
AVKit / Accessing the camera while multitasking on iPad
Article
Accessing the camera while multitasking
on iPad
Operate the camera in Split View, Slide Over, Picture in Picture, and Stage Manage
modes.


## Page 17

When operating the camera capture system, using the multitasking feature introduces the
possibility of performance degradation because of other apps consuming resources like memory,
CPU, and GPU. Increased device temperature and power usage can lead to frame drops or poor
capture quality.
Important
Enabling multitasking camera access isn’t recommended if your app uses resource-intensive
capabilities such as 4K video capture, or Apple ProRAW or Deep Fusion image capture. Even if
your app doesn’t use resource-intensive capabilities, you should test it alongside other
resource-intensive apps and with Stage Manager to determine if there are performance issues.
For information about Split View and Slide Over modes, see Use multitasking on your iPad. For
information about Stage Manager on iPad, see Move, resize, and organize windows with Stage
Manager on iPad.
Set up a capture session to enable your app to capture photos or videos. See Setting up a captur
session for more information. You can configure a capture session to allow use of the camera whi
multitasking if the current environment supports it. To determine if a capture session supports thi
feature, query its isMultitaskingCameraAccessSupported. If this value is true, you can
enable multitasking camera access by setting isMultitaskingCameraAccessEnabled to
true, as the example below shows:
Enabling your app to use the camera while multitasking extends to Picture in Picture mode for
video calls using AVKit. See Adopting Picture in Picture for video calls to learn more.
Enable camera access while multitasking


## Page 18

While multitasking, after an app finishes recording a video with AVCaptureMovieFileOutput 
AVAssetWriter, the system displays an alert one time only to inform the user about the potenti
for lower-quality videos.
Important
Apps that have a deployment target earlier than iOS 16 require the com.apple.developer
.avfoundation.multitasking-camera-access entitlement to enable accessing the
camera while multitasking.
When you enable multitasking camera access, your app doesn’t need to run in full-screen mode t
use the camera. When it does run in full-screen mode, the camera continues to function in Slide
Over mode and when the system presents a Picture in Picture window over your app. If you want 
also run your app in Split View or Slide Over mode, follow these steps:
1. Select your app target in Xcode’s project editor.
2. Click the General tab.
3. Deselect the “Requires full screen” checkbox.
Make your app resilient to increasing system pressure by monitoring the systemPressureStat
property on AVCaptureDevice, and take action to reduce the impact. When the pressure
reaches excessive levels, the capture system shuts down and emits an wasInterrupted
Notification notification.
Apps can reduce their footprint on the system by lowering the frame rate or requesting lower-
resolution, binned, or non-HDR formats. The following code, from the sample app AVMultiCamPiP
Capturing from Multiple Cameras, shows how to reduce the capture frame rate:
Configure your app for Split View or Slide Over mode
Respond to system pressure


## Page 19

The system only allows one app to use the device’s camera at a time. Prepare your app to respon
when another app starts using the camera. For example, if your app is running in Stage Manager
and another app utilizes the camera, the system suspends your app’s use of the camera until the
other app finishes. When the system interrupts your app’s use of the camera, it notifies your app 
you can update your user interface.
To enable the system to notify you when your app’s camera access changes, observe the
notifications wasInterruptedNotification and interruptionEndedNotification, as
the example below shows:
Handle camera use interruptions


## Page 20

The notification object’s user information dictionary contains the reason for an interruption.
Determining the reason lets you configure your user interface as your camera access changes. U
AVCaptureSessionInterruptionReasonKey to look up the value, as the example below
shows:
See Also


## Page 21

Adopting Picture in Picture Playback in tvOS
Add advanced multitasking capabilities to your video apps by using Picture in Picture playba
in tvOS.
Adopting Picture in Picture in a Standard Player
Add Picture in Picture (PiP) playback to your app using a player view controller.
Adopting Picture in Picture in a Custom Player
Add controls to your custom player user interface to invoke Picture in Picture (PiP) playback
Adopting Picture in Picture for video calls
Add multitasking capability to your video-call apps by using Picture in Picture (PiP).
class AVPictureInPictureController
A controller that responds to user-initiated Picture in Picture playback of video in a floating,
resizable window.
Picture in Picture


## Page 22

Adopting Picture in Picture in a Custom Player
Adopting Picture in Picture for video calls
To use Picture in Picture, you need to configure your app to support background audio playback.
See Configuring your app for media playback for more details.
Before presenting a user interface to start Picture in Picture, call the isPictureInPicture
Supported() method to determine if the current device supports the feature, and check the is
PictureInPicturePossible property value to determine whether PiP is possible in the curre
context.
Important
The framework doesn’t support subclassing AVPictureInPictureController.
Mentioned in
Overview
Topics
AVKit / AVPictureInPictureController
Class
AVPictureInPictureController
A controller that responds to user-initiated Picture in Picture playback of video in 
floating, resizable window.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 23

init(contentSource: AVPictureInPictureController.ContentSource)
Creates a Picture in Picture controller with a content source.
convenience init?(playerLayer: AVPlayerLayer)
Creates a Picture in Picture controller with a player layer.
var contentSource: AVPictureInPictureController.ContentSource?
The source of the controller’s content.
class ContentSource
An object that represents the source of the content to present in Picture in Picture.
var playerLayer: AVPlayerLayer
The layer that displays the video content.
var requiresLinearPlayback: Bool
A Boolean value that determines whether the controller allows the user to skip media conten
var delegate: (any AVPictureInPictureControllerDelegate)?
A delegate object for a Picture in Picture controller.
protocol AVPictureInPictureControllerDelegate
A protocol to adopt to respond to Picture in Picture events.
class func isPictureInPictureSupported() -> Bool
Returns a Boolean value that indicates whether the current device supports Picture in Pictur
Creating a Controller
Configuring the Content Source
Accessing the Player Layer
Configuring Playback Behavior
Accessing the Delegate Object
Accessing Picture in Picture State


## Page 24

var isPictureInPicturePossible: Bool
A Boolean value that indicates whether Picture in Picture playback is currently possible.
var isPictureInPictureActive: Bool
A Boolean value that indicates whether the Picture in Picture window is onscreen.
var isPictureInPictureSuspended: Bool
A Boolean value that indicates whether the system suspends the controller’s Picture in Pictu
window.
var canStopPictureInPicture: Bool
A Boolean value that indicates whether Picture in Picture is active and is able to stop.
var canStartPictureInPictureAutomaticallyFromInline: Bool
A Boolean value that indicates whether Picture in Picture starts automatically when the
controller embeds its content inline and the app transitions to the background.
func startPictureInPicture()
Starts Picture in Picture, if possible.
func stopPictureInPicture()
Stops Picture in Picture, if active.
class var pictureInPictureButtonStartImage: UIImage
A system-default template image for the button that starts Picture in Picture in your app.
class var pictureInPictureButtonStopImage: UIImage
A system-default template image for the button that stops Picture in Picture in your app.
class func pictureInPictureButtonStartImage(compatibleWith: UITrait
Collection?) -> UIImage
Returns a system-default template image that’s compatible with a trait collection for the
button that starts Picture in Picture in your app.
class func pictureInPictureButtonStopImage(compatibleWith: UITrait
Collection?) -> UIImage
Returns a system-default template image that’s compatible with a trait collection for the
button that stops Picture in Picture in your app.
Controlling Picture in Picture Playback
Retrieving Picture in Picture Template Images


## Page 25

func invalidatePlaybackState()
Invalidates the controller’s current playback state and fetches the updated state from the
sample buffer playback delegate object.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Adopting Picture in Picture Playback in tvOS
Add advanced multitasking capabilities to your video apps by using Picture in Picture playba
in tvOS.
Adopting Picture in Picture in a Standard Player
Add Picture in Picture (PiP) playback to your app using a player view controller.
Adopting Picture in Picture in a Custom Player
Add controls to your custom player user interface to invoke Picture in Picture (PiP) playback
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Picture in Picture


## Page 26

Adopting Picture in Picture for video calls
Add multitasking capability to your video-call apps by using Picture in Picture (PiP).
Accessing the camera while multitasking on iPad
Operate the camera in Split View, Slide Over, Picture in Picture, and Stage Manager modes.


