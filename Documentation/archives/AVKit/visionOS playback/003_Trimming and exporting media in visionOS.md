# 003_Trimming and exporting media in visionOS.pdf

## Page 1

You use AVPlayerViewController to present the system video-player interface in your
visionOS app. In addition to its primary role, AVPlayerViewController can also provide a
media-trimming experience similar to the interface of QuickTime Player in macOS, like that below.
When you enable this feature, people can specify a segment of the media timeline for display. Thi
article describes how to adopt this feature in your app, and shows how to use AVFoundation to
export the trimmed result.
Overview
AVKit / Trimming and exporting media in visionOS
Article
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing
media.


## Page 2

Apps typically provide a user-interface element to put the player view controller into trimming
mode. Because the player doesn’t support trimming certain media, such as HTTP Live Streaming 
protected content, apps observe the state of the canBeginTrimming property to update the
enabled state of their user interface accordingly. For example, the following code observes the
state of the canBeginTrimming property and updates the state of a published property, which
sets the appropriate enabled state in the UI:
After you determine that the player view controller supports editing the current media’s timeline,
call the player’s beginTrimming(completionHandler:) method to enable its trimming
interface. Call this method from an asynchronous context:
Determine whether the media supports trimming
Enable the trimming user interface


## Page 3

This method returns a Boolean value that indicates whether the user pinched the Done button or
the Cancel button. Pinching the Done button causes the view controller to update the values of th
player item’s reversePlaybackEndTime and forwardPlaybackEndTime properties to matc
the trimmed selection.
A convenient way to export your trimmed selection is to use AVAssetExportSession. This
object provides a simple preset-based approach to transcode media in various formats. Create an
instance of an export session by passing it the player item’s asset and an export preset.
Additionally, configure its output URL and file type:
To export only the portion of the asset that matches your trimmed selection, create a CMTime
Range based on the reverse and forward playback end times of the current player item:
Export the trimmed media selection


## Page 4

Finally, begin the export operation to begin asynchronously transcoding the media to the output
URL:
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
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


