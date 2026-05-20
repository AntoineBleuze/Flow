# 004_AudioHardwareDevice.pdf

## Page 1

init(id: AudioObjectID)
var actualSampleRate: Double
A Double that indicates the current actual sample rate of the device as measured by its
timestamps.
var bufferFrameSize: Int
An Int whose value indicates the number of frames in the IO buffers.
var bufferFrameSizeRange: AudioValueRange
An AudioValueRange indicating the minimum and maximum values, inclusive, for
bufferFrameSize.
var canBeDefaultInputDevice: Bool
A Bool where true indicates that the device is a possible selection for default input device.
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareDevice
Class
AudioHardwareDevice
Instances of the AudioHardwareDevice class encapsulate individual audio device
An audio device serves as the basic unit of IO. AudioHardwareDevice provides
properties and methods to access and manipulate a device’s state and run IO.
Mac Catalyst
macOS 15.0+


## Page 2

var canBeDefaultOutputDevice: Bool
A Bool where true indicates that the device is a possible selection for default output device.
var canBeDefaultSoundEffectsDevice: Bool
A Bool where true indicates that the device is a possible selection for default sound effects
device.
var clock: AudioHardwareClock
The AudioHardwareClock that is currently serving as the main time base of the device.
var configurationApplication: String
A String that contains the bundle ID for an application that provides a GUI for configuring the
device. By default, the value of this property is the bundle ID for Audio MIDI Setup.
var currentTime: AudioTimeStamp
An AudioTimeStamp containing the current time from the device.
var hogModePID: pid_t
A pid_t indicating the process that currently owns exclusive access to the device or a value o
-1 indicating that the device is currently available to all processes.
var icon: URL?
A URL that directs to an image file that can be used to represent the device visually.
var inputSafetyOffset: Int
An Int whose value indicates the number of frames behind the current hardware position tha
is safe to do IO.
var inputStreamConfiguration: [AudioBuffer]
This property returns the stream configuration of the device in an array of AudioBuffers (with
the buffer data set to nil) which describes the list of streams and the number of channels in
each stream. This corresponds to what will be passed into the IOProc.
var ioCycleUsage: Float
A Float whose range is from 0 to 1. This value indicates how much of the client portion of the
IO cycle the process will use.
var isHidden: Bool
A Bool where true indicates that the device is not included in the normal list of devices
provided by the system nor can it be the default device. Hidden devices can only be obtaine
from the system by UID.
var isProcessInputMuted: Bool


## Page 3

A Bool where true indicates that the current process’s input audio will be zeroed out by the
system.
var isProcessOutputMuted: Bool
A Bool where true indicates that the current process’s output audio will be zeroed out by the
system.
var isRunningInAProcess: Bool
A Bool where true indicates that the device is running in at least one process on the system
and false means that it isn’t running at all.
var largestVariableBufferFrameSize: Int
An Int that indicates the largest buffer that will be passed and bufferFrameSize if
usesVariableBufferFrameSizes is true.
var modelUID: String
A String that contains a persistent identifier for the model of a device. The identifier is unique
such that the identifier from two devices are equal if and only if the two devices are the exac
same model from the same manufacturer. Further, the identifier has to be the same no matte
on what machine the device appears.
var outputSafetyOffset: Int
An Int whose value indicates the number for frames ahead of the current hardware position
that is safe to do IO.
var outputStreamConfiguration: [AudioBuffer]
This property returns the stream configuration of the device in an array of AudioBuffers (with
the buffer data set to nil) which describes the list of streams and the number of channels in
each stream. This corresponds to what will be passed into the IOProc.
var preferredInputChannelsForStereo: [UInt32]
An array of two UInt32s, the first for the left channel, the second for the right channel, that
indicate the channel numbers to use for stereo input IO on the device.
var preferredOutputChannelsForStereo: [UInt32]
An array of two UInt32s, the first for the left channel, the second for the right channel, that
indicate the channel numbers to use for stereo output IO on the device.
var relatedDevices: [AudioHardwareDevice]
An array of AudioHardwareDevices for devices related to the device. For IOAudio-based
devices, devices are related if they share the same IOAudioDevice object.
var streams: [AudioHardwareStream]
An array of AudioHardwareStreams that represent the IO streams of the device.


## Page 4

var usesVariableBufferFrameSizes: Bool
A Bool where true indicates that the sizes of the buffers passed to an IOProc will vary by a
small amount.
var workgroup: WorkGroup
A WorkGroup that represents the thread workgroup the device’s IO thread belongs to.
func nearestStartTime(atTime: AudioTimeStamp, withFlags: UInt32) throws
-> AudioTimeStamp
Query the device to get a time equal to or later than the given time that is the best time to
start IO.
func setBufferFrameSize(Int) throws
Set the bufferFrameSize property.
func setClock(AudioHardwareClock) throws
Set the clock property.
func setIOCycleUsage(Float) throws
Set the ioCycleUsage property.
func setIsProcessInputMuted(Bool) throws
Set the isProcessInputMuted property.
func setIsProcessOutputMuted(Bool) throws
Set the isProcessOutputMuted property.
func setPreferredInputChannelsForStereo([UInt32]) throws
Set the preferredInputChannelsForStereo property.
func setPreferredOutputChannelsForStereo([UInt32]) throws
Set the preferredOutputChannelsForStereo property.
func start(IOProcID: AudioDeviceIOProcID?) throws
Starts IO for the given AudioDeviceIOProcID.
func start(at: AudioTimeStamp, flags: UInt32, IOProcID: AudioDevice
IOProcID?) throws -> AudioTimeStamp?
Starts IO for the given AudioDeviceIOProcID and aligns the IO cycle of the device with the
given time.
Instance Methods


## Page 5

func stop(IOProcID: AudioDeviceIOProcID?) throws
Stops IO for the given AudioDeviceIOProcID.
func toggleHogMode() throws -> pid_t
Toggle exclusive access to the device for the current process. If another process owns
exclusive access, that remains unchanged. If the current process owns exclusive access, it is
released and made available to all processes again. If no process has exclusive access, this
process gains ownership of exclusive access.
func translateTime(AudioTimeStamp) throws -> AudioTimeStamp
Translates the time in the device’s time base from one representation to another. Note that t
device has to be running
AudioHardwareClock
AudioHardwareAggregateDevice
Sendable, SendableMetatype
Relationships
Inherits From
Inherited By
Conforms To


