# 005_CHHapticAdvancedPatternPlayer.pdf

## Page 1

Playing a single-tap haptic pattern
Create instances of this pattern player through a CHHapticEngine object by calling a factory
method such as makeAdvancedPlayer(with:). When you ask an advanced pattern player to
play, pause, or resume a haptic pattern, the player submits those commands to the haptic engine
on your behalf.
Unlike CHHapticPatternPlayer, the advanced pattern player supports looping of haptic and
audio patterns, by setting loopEnabled. The advanced pattern player can also call a block when
the player finishes, through its completionHandler property.
var loopEnabled: Bool
A Boolean that determines whether the haptic repeats itself on completion.
Mentioned in
Overview
Topics
Setting Playback Properties
Core Haptics / CHHapticAdvancedPatternPlayer
Protocol
CHHapticAdvancedPatternPlayer
A protocol that defines an advanced pattern player capable of looping, seeking,
pausing, and resuming haptic playback.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 2

Required
var loopEnd: TimeInterval
The time at which to end looping haptic playback.
Required
var playbackRate: Float
The playback rate of the haptic player.
Required
var completionHandler: CHHapticAdvancedPatternPlayerCompletionHandler
A completion block that runs after the haptic finishes playing.
Required
typealias CHHapticAdvancedPatternPlayerCompletionHandler
A typealias for the completion handler to run after a haptic finishes playback.
func pause(atTime: TimeInterval) throws
Pauses the haptic player during playback.
Required
func resume(atTime: TimeInterval) throws
Resumes playing a paused haptic.
Required
func seek(toOffset: TimeInterval) throws
Jumps to the specified offset time in playing the haptic.
Required
var isMuted: Bool
A Boolean value that indicates whether to silences all haptic and audio output from the playe
Required
Controlling Playback
Silencing Haptic Playback
Relationships


## Page 3

CHHapticPatternPlayer, NSObjectProtocol
Preparing your app to play haptics
Set up your app to play haptics.
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
class CHHapticEngine
An object that represents the connection to the haptic server.
class CHHapticPattern
An object representing a haptic waveform.
protocol CHHapticPatternPlayer
A protocol that defines a standard pattern player capable of playing haptic patterns with fixe
parameters.
Inherits From
See Also
Essentials


