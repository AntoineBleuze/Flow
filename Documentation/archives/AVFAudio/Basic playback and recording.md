# Basic playback and recording.pdf

## Page 1

Routing audio to specific devices in multidevice sessions
Use an audio player to:
Play audio of any duration from a file or buffer
Control the volume, panning, rate, and looping behavior of the played audio
Access playback-level metering data
Play multiple sounds simultaneously by synchronizing the playback of multiple players
For more information about preparing your app to play audio, see Configuring your app for media
playback.
Important
For more advanced playback capabilities, like playing streaming or positional audio, use
AVAudioEngine instead.
Mentioned in
Overview
AVFAudio / AVAudioPlayer
Class
AVAudioPlayer
An object that plays audio data from a file or buffer.
iOS 2.2+
iPadOS 2.2+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

init(contentsOf: URL) throws
Creates a player to play audio from a file.
init(contentsOf: URL, fileTypeHint: String?) throws
Creates a player to play audio from a file of a particular type.
init(data: Data) throws
Creates a player to play in-memory audio data.
init(data: Data, fileTypeHint: String?) throws
Creates a player to play in-memory audio data of a particular type.
func prepareToPlay() -> Bool
Prepares the player for audio playback.
func play() -> Bool
Plays audio asynchronously.
func play(atTime: TimeInterval) -> Bool
Plays audio asynchronously, starting at a specified point in the audio output device’s timeline
func pause()
Pauses audio playback.
func stop()
Stops playback and undoes the setup the system requires for playback.
var isPlaying: Bool
A Boolean value that indicates whether the player is currently playing audio.
var volume: Float
The audio player’s volume relative to other audio output.
Topics
Creating an audio player
Controlling playback
Configuring playback settings


## Page 3

func setVolume(Float, fadeDuration: TimeInterval)
Changes the audio player’s volume over a duration of time.
var pan: Float
The audio player’s stereo pan position.
var enableRate: Bool
A Boolean value that indicates whether you can adjust the playback rate of the audio player.
var rate: Float
The audio player’s playback rate.
var numberOfLoops: Int
The number of times the audio repeats playback.
var currentTime: TimeInterval
The current playback time, in seconds, within the audio timeline.
var duration: TimeInterval
The total duration, in seconds, of the player’s audio.
var intendedSpatialExperience: any SpatialAudioExperience
The intended spatial experience for this player.
var numberOfChannels: Int
The number of audio channels in the player’s audio.
var channelAssignments: [AVAudioSessionChannelDescription]?
An array of channel descriptions for the audio player.
var isMeteringEnabled: Bool
A Boolean value that indicates whether the player is able to generate audio-level metering
data.
Accessing player timing
Configuring the Spatial Audio experience
Managing audio channels
Managing audio-level metering


## Page 4

func updateMeters()
Refreshes the average and peak power values for all channels of an audio player.
func averagePower(forChannel: Int) -> Float
Returns the average power, in decibels full-scale (dBFS), for an audio channel.
func peakPower(forChannel: Int) -> Float
Returns the peak power, in decibels full-scale (dBFS), for an audio channel.
var delegate: (any AVAudioPlayerDelegate)?
The delegate object for the audio player.
protocol AVAudioPlayerDelegate
A protocol that defines the methods to respond to audio playback events and decoding erro
var url: URL?
The URL of the audio file.
var data: Data?
The audio data associated with the player.
var format: AVAudioFormat
The format of the player’s audio data.
var settings: [String : Any]
A dictionary that provides information about the player’s audio data.
var currentDevice: String?
The unique identifier of the current audio player.
var deviceCurrentTime: TimeInterval
The time value, in seconds, of the audio output device’s clock.
Responding to player events
Inspecting the audio data
Accessing device information


## Page 5

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class AVAudioRecorder
An object that records audio data to a file.
class AVMIDIPlayer
An object that plays MIDI data through a system sound module.
Relationships
Inherits From
Conforms To
See Also
Basic playback and recording


## Page 6

Routing audio to specific devices in multidevice sessions
Use an audio recorder to:
Record audio from the system’s active input device
Record for a specified duration or until the user stops recording
Pause and resume a recording
Access recording-level metering data
To record audio in iOS or tvOS, configure your audio session to use the record or playAnd
Record category.
Important
For more advanced recording capabilities, like applying signal processing to recorded audio,
use AVAudioEngine instead.
Mentioned in
Overview
AVFAudio / AVAudioRecorder
Class
AVAudioRecorder
An object that records audio data to a file.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 17.0+
visionOS 1.0+
watchOS 4.0+


## Page 7

init(url: URL, settings: [String : Any]) throws
Creates an audio recorder with settings.
init(url: URL, format: AVAudioFormat) throws
Creates an audio recorder with an audio format.
func prepareToRecord() -> Bool
Creates an audio file and prepares the system for recording.
func record() -> Bool
Starts or resumes audio recording.
func record(atTime: TimeInterval) -> Bool
Records audio starting at a specific time.
func record(forDuration: TimeInterval) -> Bool
Records audio for the indicated duration of time.
func record(atTime: TimeInterval, forDuration: TimeInterval) -> Bool
Records audio starting at a specific time for the indicated duration.
func pause()
Pauses an audio recording.
func stop()
Stops recording and closes the audio file.
var isRecording: Bool
A Boolean value that indicates whether the audio recorder is recording.
func deleteRecording() -> Bool
Deletes a recorded audio file.
Topics
Creating an audio recorder
Controlling recording
Accessing recorder timing


## Page 8

var currentTime: TimeInterval
The time, in seconds, since the beginning of the recording.
var deviceCurrentTime: TimeInterval
The time, in seconds, of the host audio device.
var channelAssignments: [AVAudioSessionChannelDescription]?
An array of channel descriptions associated with the audio recorder.
var isMeteringEnabled: Bool
A Boolean value that indicates whether you’ve enabled the recorder to generate audio-level
metering data.
func updateMeters()
Refreshes the average and peak power values for all channels of an audio recorder.
func averagePower(forChannel: Int) -> Float
Returns the average power, in decibels full-scale (dBFS), for an audio channel.
func peakPower(forChannel: Int) -> Float
Returns the peak power, in decibels full-scale (dBFS), for an audio channel.
var delegate: (any AVAudioRecorderDelegate)?
The delegate object for the audio recorder.
protocol AVAudioRecorderDelegate
A protocol that defines the methods to respond to audio recording events and encoding
errors.
var url: URL
The URL to which the recorder writes its data.
var format: AVAudioFormat
Managing audio channels
Managing audio-level metering
Responding to recorder events
Inspecting the audio data


## Page 9

The format of the recorded audio.
var settings: [String : Any]
The settings that describe the format of the recorded audio.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class AVAudioPlayer
An object that plays audio data from a file or buffer.
class AVMIDIPlayer
An object that plays MIDI data through a system sound module.
Relationships
Inherits From
Conforms To
See Also
Basic playback and recording


## Page 10

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


## Page 11

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


## Page 12

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


