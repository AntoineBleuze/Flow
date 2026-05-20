# Audio.pdf

## Page 1

Handling audio interruptions
Observe audio session notifications to ensure that your app responds appropriately to
interruptions.
Responding to audio route changes
Observe audio session notifications to ensure that your app responds appropriately to route
changes.
Capturing stereo audio from built-In microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your
app.
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.
class AVAudioPlayer
An object that plays audio data from a file or buffer.
Topics
System audio
Basic playback and recording
AVFoundation / Audio playback, recording, and processing
Audio playback, recording, and processing
Play, record, and process audio; configure your app’s system audio behavior.


## Page 2

class AVAudioRecorder
An object that records audio data to a file.
class AVMIDIPlayer
An object that plays MIDI data through a system sound module.
Audio Engine
Perform advanced real-time and offline audio processing, implement 3D spatialization, and
work with MIDI and samplers.
Speech synthesis
Configure voices to speak strings of text.
Advanced audio processing
See Also
Audio


## Page 3

The Speech Synthesis framework manages voice and speech synthesis, and requires two primary
tasks:
Create an AVSpeechUtterance instance that contains the text to speak. Optionally, configure
speech parameters, such as voice and rate, for each utterance.
Pass the utterance to an AVSpeechSynthesizer instance to produce spoken audio.
Overview
AVFoundation / Speech synthesis
Speech synthesis
Configure voices to speak strings of text.


## Page 4

Optionally, use the speech synthesizer instance to control or respond to ongoing speech; for
example, assign its delegate to receive speech event notifications.
Note
Speech generation occurs on device and isn’t sent to a server for processing.
class AVSpeechUtterance
An object that encapsulates the text for speech synthesis and parameters that affect the
speech.
class AVSpeechSynthesisVoice
A distinct voice for use in speech synthesis.
class AVSpeechSynthesizer
An object that produces synthesized speech from text utterances and enables monitoring or
controlling of ongoing speech.
class AVSpeechSynthesisProviderAudioUnit
An object that generates speech from text.
Audio playback, recording, and processing
Play, record, and process audio; configure your app’s system audio behavior.
Topics
Spoken text attributes
Speech synthesis controls
Speech synthesis audio unit
See Also
Audio


## Page 5



