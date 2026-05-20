# 002_Adopting Picture in Picture in a Custom Player.pdf

## Page 1

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


## Page 2

Use key-value observing (KVO) on the controller’s canStopPictureInPicture property to
display the appropriate affordances and provide the correct behavior in your playback UI. If fals
display a start PiP affordance. If true, your app stops your custom playback UI and displays UI
affordances to swap if you’re creating a tvOS app. For more information about KVO, see Using Ke
Value Observing in Swift.
Create an instance of AVPictureInPictureController to control PiP playback in your app.
Before attempting to create the controller instance, verify that the current hardware supports PiP
playback by calling the isPictureInPictureSupported() method.
Create the PiP Controller


## Page 3

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


## Page 4

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


## Page 5

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


