# Reference.pdf

## Page 1

struct MIDI2DeviceManufacturer
struct MIDI2DeviceRevisionLevel
struct MIDICIProfileID
struct MIDICIProfileIDManufacturerSpecific
struct MIDICIProfileIDStandard
struct MIDIUniversalMessage
Core MIDI Enumerations
Core MIDI Constants
Core MIDI Functions
Core MIDI Data Types
Core MIDI Macros
Topics
Structures
See Also
Reference
Core MIDI / Core MIDI Structures
API Collection
Core MIDI Structures


## Page 2

var kMIDIInvalidUniqueID: MIDIUniqueID
An invalid identifier.
struct MIDICICategoryOptions
enum MIDICIDeviceType
enum MIDICIManagementMessageType
enum MIDICIProcessInquiryMessageType
enum MIDICIProfileMessageType
enum MIDICIProfileType
enum MIDICIPropertyExchangeMessageType
enum MIDINetworkConnectionPolicy
enum MIDINoteAttribute
struct MIDIPerNoteManagementOptions
struct MIDIProgramChangeOptions
enum MIDIUMPCIObjectBackingType
enum MIDIUMPFunctionBlockDirection
enum MIDIUMPFunctionBlockMIDI1Info
enum MIDIUMPFunctionBlockUIHint
Topics
Enumerations
Core MIDI / Core MIDI Enumerations
API Collection
Core MIDI Enumerations


## Page 3

struct MIDIUMPProtocolOptions
enum MIDIUtilityStatus
enum UMPStreamMessageFormat
enum UMPStreamMessageStatus
Core MIDI Structures
Core MIDI Constants
Core MIDI Functions
Core MIDI Data Types
Core MIDI Macros
See Also
Reference


## Page 4

let kMIDI1UPMaxSysexSize: UInt8
let kMIDIDeviceIDFunctionBlock: MIDICIDeviceID
let kMIDIDeviceIDUMPGroup: MIDICIDeviceID
let kMIDIPropertyAssociatedEndpoint: CFString
let kMIDIPropertyUMPActiveGroupBitmap: CFString
let kMIDIPropertyUMPCanTransmitGroupless: CFString
let kMIDIUInteger14Max: MIDIUInteger14
let kMIDIUInteger28Max: MIDIUInteger28
let kMIDIUInteger2Max: MIDIUInteger2
let kMIDIUInteger4Max: MIDIUInteger4
let kMIDIUInteger7Max: MIDIUInteger7
Core MIDI Structures
Topics
Constants
See Also
Reference
Core MIDI / Core MIDI Constants
API Collection
Core MIDI Constants


## Page 5

Core MIDI Enumerations
Core MIDI Functions
Core MIDI Data Types
Core MIDI Macros


## Page 6

func MIDI1UPChannelPressure(UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPPolyPressure(UInt8, UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPProgramChange(UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPSysEx(UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt
, UInt8) -> MIDIMessage_64
func MIDI1UPSysExArray(UInt8, UInt8, UnsafePointer<UInt8>!, Unsafe
Pointer<UInt8>!) -> MIDIMessage_64
func MIDI2EndOfClipMessage() -> MIDIMessage_128
func MIDI2EndpointDeviceIdentityNotificationMessage(MIDIUInteger7,
MIDIUInteger7, MIDIUInteger7, MIDIUInteger14, MIDIUInteger14,
MIDIUInteger28) -> MIDIMessage_128
func MIDI2EndpointDiscoveryMessage(UInt8, UInt8, Bool, Bool, Bool, Bool
Bool) -> MIDIMessage_128
func MIDI2EndpointInfoNotificationMessage(UInt8, UInt8, Bool, UInt8,
Bool, Bool, Bool, Bool) -> MIDIMessage_128
func MIDI2EndpointNameNotificationMessage(UMPStreamMessageFormat, Unsaf
Pointer<CChar>!, Int) -> MIDIMessage_128
func MIDI2EndpointProductInstanceIDNotificationMessage(UMPStreamMessage
Format, UnsafePointer<CChar>!, Int) -> MIDIMessage_128
Topics
Functions
Core MIDI / Core MIDI Functions
API Collection
Core MIDI Functions


## Page 7

func MIDI2FlexDataMessage(MIDIUInteger4, MIDIUInteger2, MIDIUInteger2,
MIDIUInteger4, UInt8, UInt8, UInt32, UInt32, UInt32) -> MIDIMessage_128
func MIDI2FunctionBlockDiscoveryMessage(UInt8, Bool, Bool) ->
MIDIMessage_128
func MIDI2FunctionBlockInfoNotificationMessage(Bool, MIDIUInteger7,
MIDIUMPFunctionBlockUIHint, MIDIUMPFunctionBlockMIDI1Info,
MIDIUMPFunctionBlockDirection, UInt8, UInt8, UInt8, UInt8) ->
MIDIMessage_128
func MIDI2FunctionBlockNameNotificationMessage(UMPStreamMessageFormat,
UInt8, UnsafePointer<CChar>!, Int) -> MIDIMessage_128
func MIDI2StartOfClipMessage() -> MIDIMessage_128
func MIDI2StreamConfigurationNotificationMessage(UInt8, Bool, Bool) ->
MIDIMessage_128
func MIDI2StreamConfigurationRequestMessage(UInt8, Bool, Bool) ->
MIDIMessage_128
func MIDI2StreamMessage(UMPStreamMessageFormat, UMPStreamMessageStatus,
UInt16, UInt32, UInt32, UInt32) -> MIDIMessage_128
func MIDI2StreamMessageFromData(UMPStreamMessageFormat, UMPStreamMessag
Status, UnsafePointer<UInt8>!, Int) -> MIDIMessage_128
func MIDIDeltaClockstampTicksPerQuarterNoteMessage(UInt16) ->
MIDIMessage_32
func MIDIDeviceAddEntity(MIDIDeviceRef, CFString, Bool, Int, Int, Unsaf
MutablePointer<MIDIEntityRef>) -> OSStatus
Specifies one of the entities that make up a device.
func MIDIEventListForEachEvent(UnsafePointer<MIDIEventList>!, MIDIEvent
Visitor!, UnsafeMutableRawPointer!)
func MIDIJitterReductionClockMessage(UInt16) -> MIDIMessage_32
func MIDIJitterReductionTimestampMessage(UInt16) -> MIDIMessage_32
func MIDINoOpMessage() -> MIDIMessage_32
func MIDITicksSinceLastEventMessage(UInt32) -> MIDIMessage_32
See Also


## Page 8

Core MIDI Structures
Core MIDI Enumerations
Core MIDI Constants
Core MIDI Data Types
Core MIDI Macros
Reference


## Page 9

typealias MIDICIDeviceID
struct DictionaryKey
typealias MIDICIMUID
struct MIDICIPropertyExchangeRequestID
typealias MIDIEventVisitor
typealias MIDIUInteger14
typealias MIDIUInteger2
typealias MIDIUInteger28
typealias MIDIUInteger4
typealias MIDIUInteger7
struct DictionaryKey
typealias MIDIUMPFunctionBlockID
typealias MIDIUMPGroupNumber
typealias MIDICIDiscoveryResponseBlock
A block the system calls when a MIDI-CI node discovery request completes.
Deprecated
typealias MIDICISessionDisconnectBlock
Topics
Data Types
Core MIDI / Core MIDI Data Types
API Collection
Core MIDI Data Types


## Page 10

A block the system calls when a MIDI-CI session disconnects.
Deprecated
typealias MIDIChannelNumber
typealias MIDISetupRef
A type that represents the global state of the MIDI system, that contains lists of the devices
and serial port owners.
Core MIDI Structures
Core MIDI Enumerations
Core MIDI Constants
Core MIDI Functions
Core MIDI Macros
See Also
Reference


## Page 11

static var badRequestID: MIDICIPropertyExchangeRequestID
static let endpointObject: MIDIUMPEndpointManager.DictionaryKey
static let functionBlockObject: MIDIUMPEndpointManager.DictionaryKey
Core MIDI Structures
Core MIDI Enumerations
Core MIDI Constants
Core MIDI Functions
Core MIDI Data Types
Topics
Macros
See Also
Reference
Core MIDI / Core MIDI Macros
API Collection
Core MIDI Macros


