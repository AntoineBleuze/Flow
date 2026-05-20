# Classes.pdf

## Page 1

init(id: AudioObjectID)
var activeSubdevices: [AudioHardwareClock]
An array of AudioHardwareClocks for all the active subdevices in the aggregate device.
var activeSubtaps: [AudioHardwareTap]
An array of AudioHardwareTaps for all the active subtaps in the aggregate device.
var clockSource: AudioHardwareObject?
The device, clock, or tap that is currently serving as the time base of the aggregate device.
var composition: [String : Any]
A Dictionary that describes the composition of the aggregate device. The keys for this
CFDicitionary are defined in the AudioAggregateDevice Constants section of AudioHardware
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareAggregateDevice
Class
AudioHardwareAggregateDevice
Instances of the AudioHardwareAggregateDevice class encapsulate a single aud
aggregate device, which is a virtual device that combines the input and output
streams of multiple real devices or taps. It also synchonizes the clocks of its
subdevices and subtaps when running IO to ensure streams are aligned.
Mac Catalyst
macOS 15.0+


## Page 2

var subdevices: [AudioHardwareClock]
An array of AudioHardwareClocks representing all the devices and clocks, active or inactive,
contained in the aggregate device. The order of the items in the array is significant and is
used to determine the order of the streams of the aggregate device.
var subtaps: [AudioHardwareTap]
An array of AudioHardwareTaps for all the subtaps contained in the aggregate device.
func setClockSource(AudioHardwareObject) throws
Set the clockSource property.
func setComposition([String : Any]) throws
Set the composition property.
func setSubdevices([AudioHardwareClock]) throws
Set the subdevices property.
func setSubtaps([AudioHardwareTap]) throws
Set the subtaps property.
AudioHardwareDevice
Sendable, SendableMetatype
Instance Methods
Relationships
Inherits From
Conforms To


## Page 3

init(id: AudioObjectID)
var clocks: [AudioHardwareClock]
An array of AudioHardwareClocks that represent all the clock objects that came out of the
given box. Note that until a box is enabled, this list will be empty.
var devices: [AudioHardwareDevice]
An array of AudioHardwareDevices that represent all the device objects that came out of the
given box. Note that until a box is enabled, this list will be empty.
var enabled: Bool
A Bool where a value of true indicates that the box’s contents are available to the system.
var hasAudio: Bool
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareBox
Class
AudioHardwareBox
Instances of the AudioHardwareBox class encapsulate a single audio box, which i
a container for other objects (typically device objects). A box publishes identifying
information about itself and can be enabled or disabled. A box’s contents are only
available to the system when the box is enabled.
Mac Catalyst
macOS 15.0+


## Page 4

A Bool where a value of true indicates that the box supports audio.
var hasMIDI: Bool
A Bool where a value of true indicates that the box supports MIDI.
var hasVideo: Bool
A Bool where a value of true indicates that the box supports video.
var isProtected: Bool
A Bool where a value of true indicates that the box requires authentication to use.
var transportType: UInt32
A UInt32 whose value indicates how the box is connected to the system. Constants for some
of the values for this property can be found in the enum in the AudioDevice Constants sectio
of AudioHardwareBase.h
var uid: String
A String that contains a persistent identifier for the box object. A box’s UID is persistent acro
boots. The content of the UID string is a black box and may contain information that is uniqu
to a particular instance of an box’s hardware or unique to the CPU. Therefore they are not
suitable for passing between CPUs or for identifying similar models of hardware.
func disable() throws
Make the box’s contents unavailable to the system.
func enable() throws
Make the box’s contents available to the system.
AudioHardwareObject
Instance Methods
Relationships
Inherits From
Conforms To


## Page 5

Sendable, SendableMetatype


## Page 6

init(id: AudioObjectID)
var availableNominalSampleRates: [AudioValueRange]
An array of AudioValueRange structs that indicates the valid ranges for the nominal sample
rate of the device.
var clockDomain: UInt32
A UInt32 whose value indicates the clock domain to which this object belongs. Clocks and
devices that have the same value for this property are able to be synchronized in hardware.
var controls: [AudioHardwareControl]
An array of AudioHardwareControls that represent the controls of the device.
var inputLatency: Int
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareClock
Class
AudioHardwareClock
Instances of the AudioHardwareClock class encapsulate individual audio clocks.
All audio devices inherit from the audio clock class, which provides several base
properties and contains a list of control objects. Clock objects can be used as a
time source when run in an aggregate device, but contain no IO streams.
Mac Catalyst
macOS 15.0+


## Page 7

An Int containing the number of frames of input latency in the clock.
var isAlive: Bool
A Bool where a value of true indicates the device is ready and available and false indicates th
device is unusable and will most likely go away shortly.
var isRunning: Bool
A Bool where a value of false indicates the device is not providing timestamps and a value of
true means that it is.
var nominalSampleRate: Double
A Double that indicates the current nominal sample rate of the device.
var outputLatency: Int
An Int containing the number of frames of output latency in the clock.
var transportType: UInt32
A UInt32 whose value indicates how the object is connected to the CPU. Constants for some
of the values for this property can be found in the enum in the AudioDevice Constants sectio
of AudioHardwareBase.h.
var uid: String
A String that contains a persistent identifier for the clock device. A clock’s UID is persistent
across boots. The content of the UID string is a black box and may contain information that i
unique to a particular instance of an clock’s hardware or unique to the CPU. Therefore they a
not suitable for passing between CPUs or for identifying similar models of hardware.
func setNominalSampleRate(Double) throws
Set the nominalSampleRate property.
AudioHardwareObject
Instance Methods
Relationships
Inherits From
Inherited By


## Page 8

AudioHardwareDevice
Sendable, SendableMetatype
Conforms To


## Page 9



## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

init(id: AudioObjectID)
var baseClassID: AudioClassID
An AudioClassID that identifies the class from which the class of the AudioObject is derived.
This value must always be one of the standard classes.
var classID: AudioClassID
An AudioClassID that identifies the class of the AudioObject.
var creatorBundleID: String
A String that contains the bundle ID of the plug-in that instantiated the object.
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareObject
Class
AudioHardwareObject
The audio HAL provides an abstraction through which applications can access
audio hardware. To do this, the HAL provides a small set of audio objects that
provide access to the various pieces of the system. Audio objects all have a set of
properties that describe and manipulate their state. AudioHardwareObject is a
base class for all other audio objects. As such, all classes inherit this set of
properties.
Mac Catalyst
macOS 15.0+


## Page 16

var delegates: [any PropertyListenerDelegate]
An array of PropertyListenerDelegates used to notify property changes.
var firmwareVersion: String
A String that contains the human readable firmware version for the object.
let id: AudioObjectID
A UInt32 that provides a handle on a specific AudioObject.
var isIdentifying: Bool
A Bool where a value of true indicates that the object’s hardware is drawing attention to itsel
typically by flashing or lighting up its front panel display. A value of false indicates that this
function is turned off. This makes it easy for a user to associate the physical hardware with it
representation in an application. Typically, this property is only supported by
AudioHardwareDevices and AudioHardwareBoxes.
var manufacturer: String
A String that contains the human readable name of the manufacturer of the hardware the
object is a part of.
var modelName: String
A String that contains the human readable model name of the object. The model name differ
from name in that two objects of the same model will have the same value for this property
but may have different values for name.
var name: String
A String that contains the human readable name of the object.
var ownedObjects: [AudioHardwareObject]
An array of AudioHardwareObjects that represent all the objects owned by this object.
var owner: AudioHardwareObject?
An AudioHardwareObject that identifies this object’s owner. Note that all
AudioHardwareObject are owned by some other AudioHardwareObject. The only exception i
the AudioSystemObject, for which the value of this property is nil.
var serialNumber: String
A String that contains the human readable serial number for the object.
func addListener(forProperties: [AudioObjectPropertyAddress], dispatch
Queue: dispatch_queue_t?) throws
Instance Methods


## Page 17

Registers for notifications to be received on the property listener delegates when the given
properties change.
func hasProperty(address: AudioObjectPropertyAddress) -> Bool
Queries an AudioHardwareObject about whether or not it has the given property.
func isPropertySettable(address: AudioObjectPropertyAddress) throws ->
Bool
Queries an AudioHardwareObject about whether or not the given property can be set using
setPropertyValue.
func propertyData(address: AudioObjectPropertyAddress, qualifier: Data?
throws -> Data
Queries an AudioHardwareObject to get the data of the given property.
func propertyDataSize(address: AudioObjectPropertyAddress, qualifier:
Data?) throws -> Int
Queries an AudioHardwareObject to find the size of the data for the given property.
func removeListener(forProperties: [AudioObjectPropertyAddress],
dispatchQueue: dispatch_queue_t?) throws
Unregisters for receiving notifications when the given properties change.
func setCreatorBundleID(String) throws
Set the creatorBundleID property.
func setIsIdentifying(Bool) throws
Set the isIdentifying property.
func setName(String) throws
Set the name property.
func setPropertyData(address: AudioObjectPropertyAddress, qualifier:
Data?, data: Data) throws
Tells an AudioObject to change the value of the given property using the provided data.
func setPropertyData(address: AudioObjectPropertyAddress, qualifier:
Data?, data: inout Data) async throws
Tells an AudioObject to change the value of the given property using the provided data.
Relationships


## Page 18

AudioHardwareBox
AudioHardwareClock
AudioHardwareControl
AudioHardwarePlugin
AudioHardwareProcess
AudioHardwareStream
AudioHardwareSystem
AudioHardwareTap
Sendable, SendableMetatype
Inherited By
Conforms To


## Page 19

init(id: AudioObjectID)
var boxes: [AudioHardwareBox]
An array of AudioHardwareBoxes that represent all the box objects currently provided by the
plugin.
var bundleID: String
A String that contains the bundle identifier for the plugin.
var clocks: [AudioHardwareClock]
An array of AudioHardwareClocks that represent all the clock objects currently provided by
the plugin.
var devices: [AudioHardwareDevice]
Topics
Initializers
Instance Properties
Core Audio / AudioHardwarePlugin
Class
AudioHardwarePlugin
Instances of the AudioHardwarePlugin class encapsulate a single audio HAL
plugin, which is a CFBundle loaded by the HAL as a driver to implement device-
specific properties and routines.
Mac Catalyst
macOS 15.0+


## Page 20

An array of AudioHardwareDevices that represent all the devices currently provided by the
plugin.
func box(forUID: String) throws -> AudioHardwareBox?
func clock(forUID: String) throws -> AudioHardwareClock?
func device(forUID: String) throws -> AudioHardwareDevice?
AudioHardwareObject
Sendable, SendableMetatype
Instance Methods
Relationships
Inherits From
Conforms To


## Page 21

init(id: AudioObjectID)
var bundleID: String?
A String that contains the bundle ID of the process.
var devices: [AudioHardwareDevice]
An array of AudioHardwareDevices that represent the devices currently used by the process
for output.
var isRunning: Bool
A Bool where a value of true indicates that there is audio IO in progress in the process.
var isRunningInput: Bool
A Bool where a value of true indicates that the process is running IO and there is at least one
active input stream.
var isRunningOutput: Bool
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareProcess
Class
AudioHardwareProcess
Instances of the AudioHardwareProcess class encapsulate a single audio process
which contains information about a client process connected to the HAL.
Mac Catalyst
macOS 15.0+


## Page 22

A Bool where a value of true indicates that the process is running IO and there is at least one
active output stream.
var pid: pid_t
A pid_t indicating the process ID associated with the process.
AudioHardwareObject
Sendable, SendableMetatype
Relationships
Inherits From
Conforms To


## Page 23

init(id: AudioObjectID)
var availablePhysicalFormats: [AudioStreamRangedDescription]
An array of AudioStreamRangedDescriptions that describe the available data formats for the
stream. The physical format refers to the data format in which the hardware for the owning
device performs its IO transactions.
var availableVirtualFormats: [AudioStreamRangedDescription]
An array of AudioStreamRangedDescriptions that describe the available data formats for the
stream. The virtual format refers to the data format in which all IOProcs for the owning devic
will perform IO transactions.
var direction: AudioHardwareDirection
An AudioHardwareDirection indicating whether this is an input or output stream.
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareStream
Class
AudioHardwareStream
Instances of the AudioHardwareStream class encapsulate a single audio stream,
which represents a single buffer of data for transferring across the user/kernel
boundary. As such, AudioStreams are the gatekeepers of format information. Each
has its own format and list of available formats.
Mac Catalyst
macOS 15.0+


## Page 24

var isActive: Bool
A Bool where a value of true indicates that the stream is enabled for IO.
var latency: Int
An Int containing the number of frames of latency in the stream.
var physicalFormat: AudioStreamBasicDescription
An AudioStreamBasicDescription that describes the current data format for the stream. The
physical format refers to the data format in which the hardware for the owning device
performs its IO transactions.
var startingChannel: Int
An Int that specifies the first element in the owning device that corresponds to element one 
this stream.
var terminalType: UInt32
A UInt32 whose value describes the general kind of functionality attached to the stream.
Constants for some of the values for this property can be found in the enum in the
AudioStream Constants section of AudioHardwareBase.h.
var virtualFormat: AudioStreamBasicDescription
An AudioStreamBasicDescription that describes the current data format for the stream. The
virtual format refers to the data format in which all IOProcs for the owning device will perform
IO transactions.
func setIsActive(Bool) throws
Set the isActive property.
func setPhysicalFormat(AudioStreamBasicDescription) throws
Set the physicalFormat property.
func setVirtualFormat(AudioStreamBasicDescription) throws
Set the virtualFormat property.
Instance Methods
Relationships
Inherits From


## Page 25

AudioHardwareObject
Sendable, SendableMetatype
Conforms To


## Page 26

init(id: AudioObjectID)
var allowsHogMode: Bool
A Bool where true indicates that this process wants the HAL to automatically take hog mode
and false indicates that the HAL should not automatically take hog mode on behalf of the
process.
var allowsSleeping: Bool
A Bool where true indicates that the process will allow the CPU to idle sleep even if there is
audio IO in progress. Fasle indicates that the CPU will not be allowed to idle sleep.
var allowsUnloading: Bool
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareSystem
Class
AudioHardwareSystem
The audio objects in the HAL are arranged in a containment hierarchy. The root of
the hierarchy is the one and only instance of the system class. The properties of
the AudioHardwareSystem describe the process global settings such as the
various default devices. The system object also contains all the devices that are
available.
Mac Catalyst
macOS 15.0+


## Page 27

A Bool where true indicates that this process wants the HAL to unload itself after a period of
inactivity where there are no IOProcs and no listeners registered with any object.
var boxes: [AudioHardwareBox]
An array of AudioHardwareBoxes that represent all the box objects on the system.
var clocks: [AudioHardwareClock]
An array of AudioHardwareClocks that represent all the clock objects on the system.
var defaultInputDevice: AudioHardwareDevice?
The default input audio device on the system, or nil if there is no default input device.
var defaultOutputDevice: AudioHardwareDevice?
The default output audio device on the system, or nil if there is no default output device.
var defaultSoundEffectsDevice: AudioHardwareDevice?
The default sounds effects audio device on the system, or nil if there is no default sound
effects device.
var devices: [AudioHardwareDevice]
An array of the AudioHardwareDevices that represent all the devices currently available to th
system.
var isInitializingOrExiting: Bool
A Bool where true indicates the HAL is either in the midst of initializing or in the midst of
exiting the process.
var isProcessInputMuted: Bool
A Bool where true indicates that all data coming into the process for all devices will be silent
value of false indicates that input data will be received normally.
var plugins: [AudioHardwarePlugin]
An array of AudioHardwarePlugins that represent all the plugin objects on the system.
var powerHint: AudioHardwarePowerHint
An AudioHardwarePowerHint enum which allows a process to indicate how aggressive the
system can be with optimizations that save power. The default value is none.
var processes: [AudioHardwareProcess]
An array of AudioHardwareProcesses that represent the Process objects for all client
processes currently connected to the system.
var shouldMixStereoToMono: Bool
A Bool where a value of true indicates that devices should mix stereo signals down to mono.


## Page 28

var taps: [AudioHardwareTap]
An array of AudioHardwareTaps that represent all the tap objects on the system.
func box(forUID: String) throws -> AudioHardwareBox?
func clock(forUID: String) throws -> AudioHardwareClock?
func destroyAggregateDevice(AudioHardwareAggregateDevice) throws
Destroys the aggregate device represented by the given AudioHardwareAggregateDevice.
func destroyProcessTap(AudioHardwareTap) throws
Destroys the given tap.
func device(forUID: String) throws -> AudioHardwareDevice?
func makeAggregateDevice(description: [String : Any]) throws -> Audio
HardwareAggregateDevice?
Creates a new aggregate device using the provided description.
func makeProcessTap(description: CATapDescription) throws -> Audio
HardwareTap?
Creates a new tap using the provided description.
func plugin(forBundleID: String) throws -> AudioHardwarePlugin?
func process(for: pid_t) throws -> AudioHardwareProcess?
func setAllowsHogMode(Bool) throws
Set the allowsHogMode property.
func setAllowsSleeping(Bool) throws
Set the allowsSleeping property.
func setAllowsUnloading(Bool) throws
Set the allowsUnloading property.
func setDefaultInputDevice(AudioHardwareDevice) throws
Set the defaultInputDevice property.
func setDefaultOutputDevice(AudioHardwareDevice) throws
Set the defaultOutputDevice property.
func setDefaultSoundEffectsDevice(AudioHardwareDevice) throws
Instance Methods


## Page 29

Set the defaultSoundEffectsDevice property.
func setIsProcessInputMuted(Bool) throws
Set the isProcessInputMuted property.
func setPowerHint(AudioHardwarePowerHint) throws
Set the powerHint property.
func setShouldMixStereoToMono(Bool) throws
Set the shouldMixStereoToMono property.
func tap(forUID: String) throws -> AudioHardwareTap?
func unload() throws
Terminates all IO on all devices within the process and releases all resources capable of bein
released. This essentially returns the HAL to its uninitialized state.
static let shared: AudioHardwareSystem
The shared instance of the AudioHardwareSystem class.
AudioHardwareObject
Sendable, SendableMetatype
Type Properties
Relationships
Inherits From
Conforms To


## Page 30

init(id: AudioObjectID)
var description: CATapDescription
The CATapDescription that describes the configuration of this tap.
var format: AudioStreamBasicDescription
An AudioStreamBasicDescription that describes the current data format for the tap. This is t
format of the data that will be accessible in any aggregate device that contains the tap.
var uid: String
A String that contains a persistent identifier for the tap. A tap’s UID persists until the tap is
destroyed.
Topics
Initializers
Instance Properties
Instance Methods
Core Audio / AudioHardwareTap
Class
AudioHardwareTap
Instances of the AudioHardwareTap class encapsulate a single audio tap, which
can capture outgoing audio from a process or group of processes, and be used as
an input stream source in an aggregate device.
macOS 15.0+


## Page 31

func setDescription(CATapDescription) throws
Set the description property.
AudioHardwareObject
Sendable, SendableMetatype
Relationships
Inherits From
Conforms To


## Page 32

This class describes a tap object that contains an input stream. The input stream is a mix of all of
the specified processes output audio.
init()
convenience init(excludingProcesses: [AudioObjectID], deviceUID: String
stream: UInt)
convenience init(monoGlobalTapButExcludeProcesses: [AudioObjectID])
convenience init(monoMixdownOfProcesses: [AudioObjectID])
convenience init(processes: [AudioObjectID], deviceUID: String, stream:
UInt)
convenience init(stereoGlobalTapButExcludeProcesses: [AudioObjectID])
convenience init(stereoMixdownOfProcesses: [AudioObjectID])
Overview
Topics
Initializers
Instance Properties
Core Audio / CATapDescription
Class
CATapDescription
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+


## Page 33

var bundleIDs: [String]
var deviceUID: String?
var isExclusive: Bool
var isMixdown: Bool
var isMono: Bool
var isPrivate: Bool
var isProcessRestoreEnabled: Bool
var muteBehavior: CATapMuteBehavior
var name: String
var processes: [AudioObjectID]
var stream: UInt?
var uuid: UUID
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To


