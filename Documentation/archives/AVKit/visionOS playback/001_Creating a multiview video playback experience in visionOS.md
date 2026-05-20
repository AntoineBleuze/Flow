# 001_Creating a multiview video playback experience in visionOS.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

When designing your content selection view, follow the Human Interface Guidelines to create an
intuitive experience. This sample code project uses a UIHostingController class to provide a
SwiftUI view as the content selection view controller.
To provide visual context, it’s important to show an image that represents each video. Depending
on your app, this may be a generated thumbnail or a graphic unique to each video. For informatio


## Page 5

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


## Page 6

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


## Page 7

TransitionContext:) delegate method to update your state and view hierarchy for complete
transitions. The system calls these delegate methods for changes that your content selection view
and the AVMultiviewManager trigger.
Set the newly selected embedded video


## Page 8

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


## Page 9

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


