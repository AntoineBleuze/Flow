# 001_AVAudioRecorder.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


