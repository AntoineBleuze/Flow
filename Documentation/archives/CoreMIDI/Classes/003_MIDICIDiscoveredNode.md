# 003_MIDICIDiscoveredNode.pdf

## Page 1

Deprecated
No longer supported for CoreMIDI
var destination: MIDIEntityRef
The node’s MIDI destination.
var deviceInfo: MIDICIDeviceInfo
The available MIDI-CI device information.
var supportsProfiles: Bool
A Boolean value that indicates whether this node supports MIDI-CI profiles.
var supportsProperties: Bool
A Boolean value that indicates whether this node supports MIDI-CI properties.
Topics
Inspecting a Node
Core MIDI / MIDICIDiscoveredNode Deprecated
Class
MIDICIDiscoveredNode Deprecated
A discovered MIDI-CI node that represents a MIDI source and destination that
respond to capability inquiries.
iOS 14.0–18.0 Deprecated
iPadOS 14.0–18.0 Deprecated
Mac Catalyst 14.0–18.0 Deprecated
macOS 11.0–15.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

var maximumSysExSize: NSNumber
The maximum size of a System Exclusive (SysEx) message this node supports.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
typealias MIDICIDiscoveryResponseBlock
A block the system calls when a MIDI-CI node discovery request completes.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Handling Callbacks


