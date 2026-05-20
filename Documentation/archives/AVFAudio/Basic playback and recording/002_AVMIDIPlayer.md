# 002_AVMIDIPlayer.pdf

## Page 1

For more information about preparing your app to play audio, see Configuring your app for media
playback.
Important
For more advanced MIDI playback capabilities, like playing MIDI data through an external
synthesizer or sampler, use AVAudioEngine instead.
init(contentsOf: URL, soundBankURL: URL?) throws
Creates a player to play a MIDI file with the specified soundbank.
init(data: Data, soundBankURL: URL?) throws
Creates a player to play MIDI data with the specified soundbank.
Overview
Topics
Creating a MIDI player
AVFAudio / AVMIDIPlayer
Class
AVMIDIPlayer
An object that plays MIDI data through a system sound module.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+


## Page 2

func prepareToPlay()
Prepares the player to play the sequence by prerolling all events.
func play((() -> Void)?)
Plays the MIDI sequence.
typealias AVMIDIPlayerCompletionHandler
A callback the system invokes when MIDI playback completes.
func stop()
Stops playing the sequence.
var isPlaying: Bool
A Boolean value that indicates whether the sequence is playing.
var rate: Float
The playback rate of the player.
var currentPosition: TimeInterval
The current playback position, in seconds.
var duration: TimeInterval
The duration, in seconds, of the currently loaded file.
NSObject
Controlling playback
Configuring playback settings
Accessing player timing
Relationships
Inherits From
Conforms To


## Page 3

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class AVAudioPlayer
An object that plays audio data from a file or buffer.
class AVAudioRecorder
An object that records audio data to a file.
See Also
Basic playback and recording


