# 002_AudioHardwareClock.pdf

## Page 1

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


## Page 2

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


## Page 3

AudioHardwareDevice
Sendable, SendableMetatype
Conforms To


