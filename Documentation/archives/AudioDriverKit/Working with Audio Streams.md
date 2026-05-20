# Working with Audio Streams.pdf

## Page 1

IOUserAudioStream allocates memory descriptors that the host uses for running I/O. An
IOUserAudioDevice uses an IOUserAudioStream instance to perform I/O. Changes to the
device that owns a stream may update formats on the underlying stream, which you handle by
overriding HandleChangeCurrentStreamFormat and HandleChangeStreamIsActive.
Create
Allocates and initializes an instance of the audio stream class.
init
Initializes an instance of the audio stream class.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
Overview
Topics
Creating an Audio Stream
Freeing an Audio Stream
AudioDriverKit / IOUserAudioStream
Class
IOUserAudioStream
An audio object that performs I/O for an audio device.
DriverKit 21.0+


## Page 2

free
Frees the audio stream.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
StartIO
Tells the stream to start I/O.
StopIO
Tells the stream to stop I/O.
IOUserAudioStartStopFlags
Values that indicate I/O starts or stops.
SetCurrentStreamFormat
Sets the current stream format to a given audio stream basic description.
GetCurrentStreamFormat
Returns the current stream format, as an audio stream basic description.
SetAvailableStreamFormats
Sets the available stream formats to an array of audio stream basic descriptions.
GetAvailableStreamFormats
Returns the available stream formats as an array of audio stream basic descriptions.
GetNumberAvailableStreamFormats
Returns the number of available stream formats.
Getting Information About the Class
Performing I/O
Working with Stream Formats


## Page 3

IOUserAudioStreamBasicDescription
A structure that encapsulates all of the information for describing the basic format propertie
of a stream of audio data.
GetStreamDirection
Gets the direction of the stream: input or output.
IOUserAudioStreamDirection
A type representing the direction of audio flow.
SetStreamIsActive
Sets a Boolean value that indicates whether the stream is active and doing I/O.
GetStreamIsActive
Gets a value that indicates whether the stream is active and doing I/O.
SetTerminalType
Sets the terminal type of the stream.
GetTerminalType
Gets the terminal type of the stream.
IOUserAudioStreamTerminalType
Constants that describe the terminal type of an audio stream.
GetIOMemoryDescriptor
Gets the memory descriptor the stream uses for I/O.
SetIOMemoryDescriptor
Sets the memory descriptor the stream uses for I/O.
HandleChangeCurrentStreamFormat
Tells the stream the format is changing.
HandleChangeStreamIsActive
Working with Stream Terminals
Working with Memory Descriptors
Managing Stream Changes


## Page 4

Tells the stream the activity state is changing.
DeviceSampleRateChanged
Updates stream formats, in response to the owning audio device changing its sample rate.
GetLatency
GetStartingChannel
SetLatency
SetStartingChannel
IOUserAudioObject
Instance Methods
Relationships
Inherits From


