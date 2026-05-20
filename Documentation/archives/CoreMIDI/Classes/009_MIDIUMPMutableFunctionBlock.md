# 009_MIDIUMPMutableFunctionBlock.pdf

## Page 1

init?(name: String, direction: MIDIUMPFunctionBlockDirection, firstGrou
: MIDIUMPGroupNumber, totalGroupsSpanned: MIDIUInteger7, maxSys
Ex8Streams: MIDIUInteger7, midi1Info: MIDIUMPFunctionBlockMIDI1Info, ui
Hint: MIDIUMPFunctionBlockUIHint, isEnabled: Bool)
var umpEndpoint: MIDIUMPMutableEndpoint?
func reconfigure(firstGroup: MIDIUMPGroupNumber, direction:
MIDIUMPFunctionBlockDirection, MIDI1Info: MIDIUMPFunctionBlockMIDI1Info
UIHint: MIDIUMPFunctionBlockUIHint) throws
func setEnabled(Bool) throws
func setName(String) throws
Topics
Initializers
Instance Properties
Instance Methods
Relationships
Core MIDI / MIDIUMPMutableFunctionBlock
Class
MIDIUMPMutableFunctionBlock
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 2

MIDIUMPFunctionBlock
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


