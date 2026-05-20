# 009_AudioHardwareSystem.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


