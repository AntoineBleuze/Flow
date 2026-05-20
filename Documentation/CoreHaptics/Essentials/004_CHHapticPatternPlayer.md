# 004_CHHapticPatternPlayer.pdf

## Page 1

Playing a single-tap haptic pattern
Create instances of a pattern player through a CHHapticEngine object by calling a factory
method such as makePlayer(with:). When you ask a pattern player to play a haptic pattern,
the player submits those commands to the haptic engine on your behalf.
Use the advanced pattern player, CHHapticAdvancedPatternPlayer, when your haptic
pattern needs to change during playback, or when you’d like to sync your haptic with a custom
audio track. The advanced player allows your app to dynamically change haptic characteristics
such as intensity and sharpness through dynamic parameters and parameter curves, capabilities
not found in the standard player.
func start(atTime: TimeInterval) throws
Mentioned in
Overview
Topics
Starting and Stopping Playback
Core Haptics / CHHapticPatternPlayer
Protocol
CHHapticPatternPlayer
A protocol that defines a standard pattern player capable of playing haptic
patterns with fixed parameters.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 2

Starts playing the pattern at the specified time.
Required
func stop(atTime: TimeInterval) throws
Stops playing the pattern at the specified time.
Required
func cancel() throws
Stops the pattern player immediately and returns the specified error.
Required
func sendParameters([CHHapticDynamicParameter], atTime: TimeInterval)
throws
Sends an array of haptic parameters, starting at the specified time.
Required
func scheduleParameterCurve(CHHapticParameterCurve, atTime: TimeInterva
) throws
Schedules a parameter curve to begin transitioning a parameter at a certain time.
Required
var isMuted: Bool
A Boolean value that indicates whether to silences all haptic and audio output from the playe
Required
NSObjectProtocol
CHHapticAdvancedPatternPlayer
Sending Parameters to a Haptic
Silencing Haptic Playback
Relationships
Inherits From
Inherited By


## Page 3

Preparing your app to play haptics
Set up your app to play haptics.
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
class CHHapticEngine
An object that represents the connection to the haptic server.
class CHHapticPattern
An object representing a haptic waveform.
protocol CHHapticAdvancedPatternPlayer
A protocol that defines an advanced pattern player capable of looping, seeking, pausing, and
resuming haptic playback.
See Also
Essentials


