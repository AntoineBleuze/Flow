# Articles.pdf

## Page 1

typealias MIDISetupRef
A type that represents the global state of the MIDI system, that contains lists of the devices
and serial port owners.
func MIDIDeviceAddEntity(MIDIDeviceRef, CFString, Bool, Int, Int, Unsaf
MutablePointer<MIDIEntityRef>) -> OSStatus
Specifies one of the entities that make up a device.
Topics
Managing System Setup
Managing MIDI Devices
Core MIDI / Deprecated Symbols
API Collection
Deprecated Symbols
Review unsupported symbols and their replacements.


## Page 2

case other
A MIDI object with an undefined type.
case device
A MIDI device.
case entity
A MIDI entity.
case source
A MIDI source.
case destination
A MIDI destination.
case externalDevice
An external device.
case externalEntity
An external entity.
See Also
Object Types
Core MIDI / kMIDIObjectType_ExternalMask
Global Variable
kMIDIObjectType_ExternalMask
A bit mask indicating that a device is external.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 3

case externalSource
An external source.
case externalDestination
An external destination.


