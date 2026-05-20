# 008_MIDIUMPMutableEndpoint.pdf

## Page 1

init?(name: String, deviceInfo: MIDI2DeviceInfo, productInstanceID:
String, midiProtocol: MIDIProtocolID, destinationCallback: MIDIReceive
Block)
var isEnabled: Bool
var mutableFunctionBlocks: [MIDIUMPMutableFunctionBlock]
func registerFunctionBlocks([MIDIUMPMutableFunctionBlock], markAsStatic
Bool) throws
func setEnabled(Bool) throws
func setName(String) throws
Topics
Initializers
Instance Properties
Instance Methods
Relationships
Core MIDI / MIDIUMPMutableEndpoint
Class
MIDIUMPMutableEndpoint
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 2

MIDIUMPEndpoint
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


