# 001_IOUserAudioDevice.pdf

## Page 1

The IOUserAudioDevice class subclasses IOUserAudioClockDevice and can contain
IOUserAudioStream instances that perform I/O for the audio device.
Create
Allocates and initializes an instance of the audio device class.
init
Initializes an instance of the audio device class.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
free
Overview
Topics
Creating an Audio Device
Freeing an Audio Device
AudioDriverKit / IOUserAudioDevice
Class
IOUserAudioDevice
An audio clock device object that handles the configurations for running I/O.
DriverKit 21.0+


## Page 2

Frees the audio device.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
StartIO
Tells the device to start I/O.
StopIO
Tells the device to stop I/O.
IOUserAudioStartStopFlags
Values that indicate I/O starts or stops.
PerformDeviceConfigurationChange
Tells the device to handle a configuration change.
AbortDeviceConfigurationChange
Tells the device to stop handling a configuration change.
HandleChangeSampleRate
Tells the device the sample rate is changing.
DeviceSampleRateChanged
Updates stream formats, in response to the owning audio device changing its sample rate.
Getting Information About the Class
Performing I/O
Supporting Device Configuration Changes
Supporting Sample Rate Changes


## Page 3

AddStream
Adds an audio stream to the device.
RemoveStream
Removes an audio stream from the device.
IOUserAudioStream
An audio object that performs I/O for an audio device.
SetCanBeDefaultInputDevice
Sets a Boolean value that indicates if this device can be the host’s default input device.
CanBeDefaultInputDevice
Returns a Boolean value that indicates if this device can be the host’s default input device.
SetCanBeDefaultOutputDevice
Sets a Boolean value that indicates if this device can be the host’s default output device.
CanBeDefaultOutputDevice
Returns a Boolean value that indicates if this device can be the host’s default output device.
SetCanBeDefaultSystemOutputDevice
Sets a Boolean value that indicates if this device can be the system’s default output device.
CanBeDefaultSystemOutputDevice
Returns a Boolean value that indicates if this device can be the system’s default output
device.
SetInputSafetyOffset
Specifies the input safety offset of the device.
GetInputSafetyOffset
Returns the input safety offset of the device.
SetOutputSafetyOffset
Working with Audio Streams
Working with Default Device Behavior
Working with Safety Offset Behvaior


## Page 4

Specifies the output safety offset of the device.
GetOutputSafetyOffset
Returns the output safety offset of the device.
SetPreferredChannelsForStereo
Sets the channel indices for the prefered stereo pair.
GetPreferredChannelsForStereo
Returns the channel indices for the prefered stereo pair.
SetPreferredInputChannelLayout
Sets the input channel layout, using an array of audio channel label values.
SetPreferredOutputChannelLayout
Sets the output channel layout, using an array of audio channel label values.
IOUserAudioChannelLabel
Constants to set the preferred channel layout on an audio device.
GetCurrentClientIOTime
SetIOOperationHandler
SetWantsStreamFormatsRestored
IOUserAudioClockDevice
Working with Channel Layouts
Instance Methods
Relationships
Inherits From
See Also


## Page 5

IOUserAudioClockDevice
An audio clock device object, used to synchronize and perform I/O.
Working with Audio Devices


