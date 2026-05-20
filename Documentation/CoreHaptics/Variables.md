# Variables.pdf

## Page 1

Set a true value for this key to loop the contents of an audio file.
The default value is false.
let CHHapticAudioResourceKeyUseVolumeEnvelope: String
A key for a Boolean value that indicates whether audio file playback fades in and out using a
envelope.
typealias CHHapticAudioResourceKey
A type alias for a key that identifies the playback behavior of an audio resource.
Discussion
See Also
Audio Resource Keys
Core Haptics / CHHapticAudioResourceKeyLoopEnabled
Global Variable
CHHapticAudioResourceKeyLoopEnabled
A key for a Boolean value that indicates whether to loop audio playback.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Fading, or ramping, the volume of an audio resource can prevent clicks during playback. It’s also
useful in cases where the app modulates the envelope to use different attack and release times.
The default value is true.
let CHHapticAudioResourceKeyLoopEnabled: String
A key for a Boolean value that indicates whether to loop audio playback.
typealias CHHapticAudioResourceKey
A type alias for a key that identifies the playback behavior of an audio resource.
Discussion
See Also
Audio Resource Keys
Core Haptics / CHHapticAudioResourceKeyUseVolumeEnvelope
Global Variable
CHHapticAudioResourceKeyUseVolume
Envelope
A key for a Boolean value that indicates whether audio file playback fades in and
out using an envelope.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


