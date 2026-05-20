# 001_AudioHardwareBox.pdf

## Page 1

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


## Page 2

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


## Page 3

Sendable, SendableMetatype


