# 000_IOUserAudioClockDevice.pdf

## Page 1

Create
Allocates and initializes an instance of the audio clock device class.
init
Initializes an instance of the audio clock device class.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
free
Frees the clock device.
GetClassID
Gets the audio class identifier of the object.
Topics
Creating a Clock Device
Freeing a Clock Device
Getting Information About the Class
AudioDriverKit / IOUserAudioClockDevice
Class
IOUserAudioClockDevice
An audio clock device object, used to synchronize and perform I/O.
DriverKit 21.0+


## Page 2

GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
StartIO
Tells the clock device to start I/O.
StopIO
Tells the clock device to stop I/O.
IOUserAudioStartStopFlags
Values that indicate I/O starts or stops.
PerformDeviceConfigurationChange
Tells the clock device to handle a configuration change.
AbortDeviceConfigurationChange
Tells the clock device to stop handling a configuration change.
HandleChangeSampleRate
Tells the clock device the sample rate is changing.
GetUID
Gets the unique identifier of the clock device.
SetClockDomain
Sets the clock domain value of the clock device.
Performing I/O
Supporting Device Configuration Changes
Supporting Sample Rate Changes
Identifying the Clock Device
Working with Clock Domain


## Page 3

GetClockDomain
Gets the clock domain value of the clock device.
SetSampleRate
Sets the sample rate for the clock device.
GetSampleRate
Gets the sample rate of the clock device.
SetAvailableSampleRates
Sets the available sample rates for the clock device.
GetAvailableSampleRates
Gets the available sample rates of the clock device.
GetNumberAvailableSampleRates
Gets the number of available sample rates of the clock device.
GetSupportsPrewarming
Returns a Boolean value that indicates clock device’s support for prewarming.
SetZeroTimeStampPeriod
Sets the zero time stamp of the clock device.
GetZeroTimestampPeriod
Gets the zero time stamp of the clock device.
SetOutputLatency
Sets the output latency of the clock device.
GetOutputLatency
Gets the output latency of the clock device.
SetInputLatency
Sets the input latency of the clock device.
GetInputLatency
Get the input latency of the clock device.
Working with Sample Rates
Working with Timing and Latency


## Page 4

GetDeviceIsRunning
Gets a Boolean value that indicates whether the device is running.
SetDeviceIsAlive
Sets a Boolean value to represent whether the device is alive.
GetDeviceIsAlive
Gets a Boolean value that represents whether the device is alive.
SetIsHidden
Sets a Boolean value to indicate whether the device is hidden.
GetIsHidden
Gets a Boolean value that indicates whether the device is hidden.
SetClockAlgorithm
Sets the clock algorithm of the clock device.
GetClockAlgorithm
Gets the clock algorithm of the clock device.
IOUserAudioClockAlgorithm
Values that describe clock-smoothing algorithms.
SetClockIsStable
Sets a Boolean value to represent the clock’s stability.
GetClockIsStable
Gets a Boolean value that represents the clock’s stability.
SetTransportType
Sets the transport type of the clock device.
GetTransportType
Gets the transport type of the clock device.
Working with Clock Device State
Working with Clock Device Behavior
Working with Transport Type


## Page 5

IOUserAudioTransportType
The type of transport to deliver audio.
RequestDeviceConfigurationChange
Instructs the host to initiate a configuration change operation.
AddControl
Adds a control to the clock device.
RemoveControl
Removes a control from the clock device.
IOUserAudioControl
The base class for audio control objects.
UpdateCurrentZeroTimestamp
Updates the current timestamp value.
GetCurrentZeroTimestamp
Gets the current zero timestamp value.
GetCurrentClientSampleTime
Gets the current sample time in the ring buffer that the client has written to or read from.
GetDeviceTransportState
SetWantsControlsRestored
Communicating with the Host
Managing Audio Controls
Accessing Timestamps
Accessing Client Status Information
Instance Methods


## Page 6

IOUserAudioObject
IOUserAudioDevice
IOUserAudioDevice
An audio clock device object that handles the configurations for running I/O.
Relationships
Inherits From
Inherited By
See Also
Working with Audio Devices


