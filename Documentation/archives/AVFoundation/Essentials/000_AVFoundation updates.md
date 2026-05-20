# 000_AVFoundation updates.pdf

## Page 1

Browse notable changes in AVFoundation.
Preserve HDR data when generating images with AVAssetImageGenerator by setting the
value of its dynamicRangePolicy property to match the source video.
Export media asynchronously using the export(to:as:isolation:) method of AVAsset
ExportSession. You can monitor the progress of an export by calling the states(update
Interval:) method and awaiting its results.
Determine whether an AVURLAsset decodes its data using a Media Extension by inspecting it
mediaExtensionProperties property.
Show your camera app on the Lock Screen by adopting the LockedCameraCapture framework
Capture photos in constant color by configuring a photo output’s isConstantColorEnable
property.
Continue background audio playback while performing audio and video capture by enabling a
capture session’s configuresApplicationAudioSessionToMixWithOthers property.
Pause and resume video recording in iOS when using AVCaptureFileOutput.
Overview
June 2024
Assets
Camera
Updates / AVFoundation updates
Article
AVFoundation updates
Learn about important changes to AVFoundation.


## Page 2

Support enhanced video stabilization using AVCaptureVideoStabilizationMode
.cinematicExtendedEnhanced.
Configure a capture device to automatically adjust its frame rate based on lighting conditions b
enabling its isAutoVideoFrameRateEnabled property.
Configure a capture device to replace background content in macOS by enabling its is
BackgroundReplacementEnabled property.
Build playback apps using the latest Swift Concurrency features due to enhanced Sendable
adoption throughout the playback APIs.
Capture performance and playback metrics using AVMetrics.
Receive rendered captions for the currently playing media using AVPlayerItemRendered
LegibleOutput.
Simplify handling of interstitial content by using AVPlayerItemIntegratedTimeline.
Send Common Media Client Data (CMCD) as HTTP headers by enabling the new sendsCommo
MediaClientDataAsHTTPHeaders property on AVAssetResourceLoader.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Playback
See Also
Technology updates


## Page 3

Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
Background Tasks updates
Learn about important changes in Background Tasks.


