# 003_Anchoring sound to a window or volume.pdf

## Page 1

Many audio playback APIs have a property to configure their 3D spatial rendering using the
SpatialAudioExperience type HeadTrackedSpatialAudio. This article shows how to tak
advantage of HeadTrackedSpatialAudio to place each sound at the center of its intended
UIScene in your multiwindow or multivolume application.
Placing a sound on a specific UIScene requires knowledge of the target scene’s persistent
Identifier. In a SwiftUI application, that means adding both a UIApplicationDelegate an
UISceneDelegate to your SwiftUI App:
Overview
Get the scene’s identifier
Audio Toolbox / Anchoring sound to a window or volume
Article
Anchoring sound to a window or volume
Provide unique app experiences by attaching sounds to windows and volumes in
3D space.


## Page 2

The following code makes the identifier for each UIScene accessible from any SwiftUI View usin
your UISceneDelegate as an EnvironmentObject:


## Page 3

With a UIScene identifier in-hand, configure each sound using a HeadTrackedSpatialAudio
structure.
Anchor the sound to the scene


## Page 4

Besides just AVAudioPlayer, you can also use SpatialAudioExperience types with the
other playback APIs listed below.
Configure the spatial audio experience of your system and alert sounds using:
AudioServicesPlaySystemSound(_:spatialExperience:)
AudioServicesPlayAlertSound(_:spatialExperience:)
Configure the spatial audio experience of audio-only playback APIs using the intendedSpatial
Experience property on:
AVAudioPlayer
AVAudioOutputNode
AUAudioUnit
CHHapticEngine
Setting a scene identifier on playback APIs that have video content isn’t always necessary as thei
sound automatically anchors to its visual counterpart. However, if there is no video or if you prefe
something besides the automatic behavior, configure the spatial audio experience of these
playback APIs using the intendedSpatialAudioExperience property on:
AVPlayer
AVSampleBufferRenderSynchronizer
Audio Queue Services
Connect to audio hardware and manage the recording or playback process.
Audio Services
Spatialize system and alert sounds
Spatialize audio-only playback APIs
Spatialize audio playback APIs that also have video
See Also
Playback and Recording


## Page 5

Play short sounds or trigger a vibration effect on iOS devices with the appropriate hardware.
Music Player
Create and play a sequence of tracks, and manage aspects of playback in response to
standard events.


