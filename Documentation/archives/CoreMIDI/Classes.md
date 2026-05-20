# Classes.pdf

## Page 1

init(manufacturerID: MIDI2DeviceManufacturer, family: MIDIUInteger14,
modelNumber: MIDIUInteger14, revisionLevel: MIDI2DeviceRevisionLevel)
var family: MIDIUInteger14
var manufacturerID: MIDI2DeviceManufacturer
var modelNumber: MIDIUInteger14
var revisionLevel: MIDI2DeviceRevisionLevel
NSObject
Topics
Initializers
Instance Properties
Relationships
Inherits From
Core MIDI / MIDI2DeviceInfo
Class
MIDI2DeviceInfo
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Conforms To


## Page 3

var deviceInfo: MIDI2DeviceInfo
var deviceType: MIDICIDeviceType
var maxPropertyExchangeRequests: Int
var maxSysExSize: Int
var muid: MIDICIMUID
var profiles: [MIDIUMPCIProfile]
var supportsProcessInquiry: Bool
var supportsProfileConfiguration: Bool
var supportsPropertyExchange: Bool
var supportsProtocolNegotiation: Bool
Topics
Instance Properties
Relationships
Core MIDI / MIDICIDevice
Class
MIDICIDevice
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 4

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


## Page 5

struct DictionaryKey
var discoveredCIDevices: [MIDICIDevice]
class let deviceWasAddedNotification: NSNotification.Name
class let deviceWasRemovedNotification: NSNotification.Name
class let profileWasRemovedNotification: NSNotification.Name
class let profileWasUpdatedNotification: NSNotification.Name
class var shared: MIDICIDeviceManager
Topics
Type Aliases
Instance Properties
Type Properties
Relationships
Core MIDI / MIDICIDeviceManager
Class
MIDICIDeviceManager
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 6

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


## Page 7

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


## Page 8

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


## Page 9

var enabledChannelCount: MIDIUInteger14
var firstChannel: MIDIChannelNumber
var groupOffset: MIDIUMPGroupNumber
var isEnabled: Bool
var name: String
var profileID: MIDICIProfileID
var profileType: MIDICIProfileType
var totalChannelCount: MIDIUInteger14
func setProfileState(Bool, enabledChannelCount: MIDIUInteger14) throws
Topics
Instance Properties
Instance Methods
Relationships
Core MIDI / MIDIUMPCIProfile
Class
MIDIUMPCIProfile
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 10

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


## Page 11

var deviceInfo: MIDI2DeviceInfo
var endpointType: MIDIUMPCIObjectBackingType
var functionBlocks: [MIDIUMPFunctionBlock]
var hasJRTSReceiveCapability: Bool
var hasJRTSTransmitCapability: Bool
var hasStaticFunctionBlocks: Bool
var midiDestination: MIDIEndpointRef
var midiProtocol: MIDIProtocolID
var midiSource: MIDIEndpointRef
var name: String
var productInstanceID: String
var supportedMIDIProtocols: MIDIUMPProtocolOptions
Topics
Instance Properties
Core MIDI / MIDIUMPEndpoint
Class
MIDIUMPEndpoint
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 12

NSObject
MIDIUMPMutableEndpoint
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Inherited By
Conforms To


## Page 13

var umpEndpoints: [MIDIUMPEndpoint]
class var shared: MIDIUMPEndpointManager
struct DictionaryKey
class let endpointWasAddedNotification: NSNotification.Name
class let endpointWasRemovedNotification: NSNotification.Name
class let endpointWasUpdatedNotification: NSNotification.Name
class let functionBlockWasUpdatedNotification: NSNotification.Name
Topics
Instance Properties
Type Properties
Constants
Relationships
Core MIDI / MIDIUMPEndpointManager
Class
MIDIUMPEndpointManager
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 14

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


## Page 15

var direction: MIDIUMPFunctionBlockDirection
var firstGroup: MIDIUMPGroupNumber
var functionBlockID: MIDIUMPFunctionBlockID
var isEnabled: Bool
var maxSysEx8Streams: UInt8
var midi1Info: MIDIUMPFunctionBlockMIDI1Info
var midiCIDevice: MIDICIDevice?
var name: String
var totalGroupsSpanned: MIDIUInteger7
var uiHint: MIDIUMPFunctionBlockUIHint
var umpEndpoint: MIDIUMPEndpoint?
Topics
Instance Properties
Relationships
Core MIDI / MIDIUMPFunctionBlock
Class
MIDIUMPFunctionBlock
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 16

NSObject
MIDIUMPMutableFunctionBlock
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Inherited By
Conforms To


## Page 17

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


## Page 18

MIDIUMPEndpoint
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


## Page 19

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


## Page 20

MIDIUMPFunctionBlock
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


