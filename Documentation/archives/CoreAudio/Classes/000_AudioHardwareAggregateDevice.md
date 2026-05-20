# 000_AudioHardwareAggregateDevice.pdf

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


