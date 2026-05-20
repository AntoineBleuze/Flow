# 000_Playing immersive media with AVKit.pdf

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


