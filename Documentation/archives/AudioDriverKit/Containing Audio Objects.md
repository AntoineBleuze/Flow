# Containing Audio Objects.pdf

## Page 1

Along with containing other audio objects, IOUserAudioBox publishes identifying information
about itself and allows you to enable or disable the box. When disabled, the box’s contents aren’t
available.
Create
Allocates and initializes an instance of the audio box class.
init
Initializes an instance of the audio box class.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
Overview
Topics
Creating an Audio Box
Freeing an Audio Box
AudioDriverKit / IOUserAudioBox
Class
IOUserAudioBox
A container for other audio objects, typically audio devices and audio clock
devices.
DriverKit 21.0+


## Page 2

free
Frees the audio box.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
GetUID
Returns the UID of the audio box.
AddDevice
Adds an audio device to the audio box.
RemoveDevice
Removes an audio device from the audio box.
IOUserAudioDevice
An audio clock device object that handles the configurations for running I/O.
AddClockDevice
Adds an audio clock device to the audio box.
RemoveClockDevice
Adds an audio clock device to the audio box.
IOUserAudioClockDevice
An audio clock device object, used to synchronize and perform I/O.
Getting Information About the Class
Identifying the Box
Managing Box Contents
Managing Protection State


## Page 3

SetIsProtected
Sets a Boolean value that indicates if the box requires authentication before use.
IsProtected
Returns a Boolean value that indicates if the box requires authentication before use.
HandleChangeAcquireBox
Informs the box of a change to its acquisition state.
SetIsAcquired
Set the box’s acquisition state.
IsAcquired
Returns a Boolean value that indicates the box’s acquisition state.
SetIsAcquirable
Set the box’s acquirability state.
IsAcquirable
Returns a Boolean value that indicates the box’s acquirabilty state.
SetAcquisitionFailure
Sets the error code to return when box acquisition fails.
GetAcquisitionFailure
Returns the error code for use when box acquisition fails.
SetHasAudio
Sets a Boolean value that indicates the box’s audio support.
HasAudio
Returns a Boolean value that indicates the box’s audio support.
SetHasVideo
Sets a Boolean value that indicates the box’s video support.
HasVideo
Returns a Boolean value that indicates the box’s video support.
Managing Acquirability
Determining Media Support


## Page 4

SetHasMIDI
Sets a Boolean value that indicates the box’s MIDI support.
HasMIDI
Returns a Boolean value that indicates the box’s MIDI support.
SetTransportType
Sets the box’s transport type.
GetTransportType
Returns the box’s transport type.
IOUserAudioTransportType
The type of transport to deliver audio.
IOUserAudioObject
Working with Transport Types
Relationships
Inherits From


