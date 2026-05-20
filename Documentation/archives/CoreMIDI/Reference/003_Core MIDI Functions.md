# 003_Core MIDI Functions.pdf

## Page 1

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


## Page 2

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


## Page 3

Core MIDI Structures
Core MIDI Enumerations
Core MIDI Constants
Core MIDI Data Types
Core MIDI Macros
Reference


