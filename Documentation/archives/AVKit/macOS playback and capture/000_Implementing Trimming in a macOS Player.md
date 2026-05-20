# 000_Implementing Trimming in a macOS Player.pdf

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


