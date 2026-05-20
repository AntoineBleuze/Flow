# 000_MIDI Services.pdf

## Page 1

MIDI drivers own and control physical MIDI devices, which include hardware such as USB
interfaces, MIDI keyboards, and so on. A MIDI device may have multiple logically distinct
subcomponents. For example, one device may contain a MIDI synthesizer and a pair of MIDI ports
both addressable over a USB port. Each element of a device is a MIDI entity.
A MIDI entity can have any number of MIDI endpoints, each of which is a source or destination of 
16-channel MIDI stream. Grouping a device’s endpoints into entities provides the system enough
information for an app to make reasonable default assumptions about how to communicate
bidirectionally with each entity, as is necessary in MIDI librarian apps.
Core MIDI attaches a collection of properties to each object it manages. Object properties can be
Dynamic characteristics of a device, such as MIDI receive channel and system-exclusive (SysE
IDs.
Determined by user preference; for example, choice of icon, and whether or not the device
appears in lists of possible controllers.
Static properties that you can’t look up in a database using the device’s manufacturer and mod
name.
The Core MIDI framework uses interprocess communication (IPC) to communicate with a server
process, the MIDI server. The server process in turn loads the MIDI driver and manages all
communication with it.
Overview
Topics
Core MIDI / MIDI Services
API Collection
MIDI Services
Communicate with hardware using Universal MIDI Packets.


## Page 2

func MIDIObjectFindByUniqueID(MIDIUniqueID, UnsafeMutablePointer<
MIDIObjectRef>?, UnsafeMutablePointer<MIDIObjectType>?) -> OSStatus
Locates a device, entity, or endpoint by its unique identifier.
typealias MIDIObjectRef
The common base class for many of the framework’s objects.
MIDI Object Properties
Configure the properties of MIDI objects.
Incorporating MIDI 2 into your apps
Add precision and improve musical control for your MIDI apps.
func MIDIClientCreate(CFString, MIDINotifyProc?, UnsafeMutableRawPointe
?, UnsafeMutablePointer<MIDIClientRef>) -> OSStatus
Creates a MIDI client.
func MIDIClientCreateWithBlock(CFString, UnsafeMutablePointer<MIDIClien
Ref>, MIDINotifyBlock?) -> OSStatus
Creates a MIDI client with a callback block.
func MIDIClientDispose(MIDIClientRef) -> OSStatus
Disposes of a MIDI client.
typealias MIDIClientRef
An object that maintains per-client state.
func MIDIGetNumberOfDevices() -> Int
Returns the number of devices in the system.
func MIDIGetDevice(Int) -> MIDIDeviceRef
Returns a device from the system.
func MIDIGetNumberOfExternalDevices() -> Int
Returns the number of external MIDI devices in the system.
MIDI object configuration
Client management
Device lookup


## Page 3

func MIDIGetExternalDevice(Int) -> MIDIDeviceRef
Returns one of the external devices in the system.
func MIDIDeviceGetNumberOfEntities(MIDIDeviceRef) -> Int
Returns the number of entities in a device.
func MIDIDeviceGetEntity(MIDIDeviceRef, Int) -> MIDIEntityRef
Returns the device’s entity at a specific index.
typealias MIDIDeviceRef
A MIDI device that contains entities.
func MIDIEntityGetDevice(MIDIEntityRef, UnsafeMutablePointer<MIDIDevice
Ref>?) -> OSStatus
Returns an entity’s device.
func MIDIEntityGetNumberOfSources(MIDIEntityRef) -> Int
Returns the number of sources in an entity.
func MIDIEntityGetSource(MIDIEntityRef, Int) -> MIDIEndpointRef
Returns one of an entity’s sources.
func MIDIEntityGetNumberOfDestinations(MIDIEntityRef) -> Int
Returns the number of destinations in an entity.
func MIDIEntityGetDestination(MIDIEntityRef, Int) -> MIDIEndpointRef
Returns one of an entity’s destinations.
typealias MIDIEntityRef
An entity that a device owns and that contains endpoints.
func MIDIInputPortCreateWithProtocol(MIDIClientRef, CFString,
MIDIProtocolID, UnsafeMutablePointer<MIDIPortRef>, MIDIReceiveBlock) ->
OSStatus
Creates an input port through which the client may receive incoming MIDI messages from an
MIDI source.
Entity lookup
Port management


## Page 4

func MIDIOutputPortCreate(MIDIClientRef, CFString, UnsafeMutablePointer
MIDIPortRef>) -> OSStatus
Creates an output port through which a client sends outgoing MIDI messages to any MIDI
destination.
func MIDIPortDispose(MIDIPortRef) -> OSStatus
Disposes of a MIDI port.
func MIDIPortConnectSource(MIDIPortRef, MIDIEndpointRef, UnsafeMutable
RawPointer?) -> OSStatus
Makes a connection from a source to a client input port.
func MIDIPortDisconnectSource(MIDIPortRef, MIDIEndpointRef) -> OSStatus
Closes a previously established source-to-input port connection.
typealias MIDIPortRef
A MIDI connection that a client maintains.
typealias MIDIReceiveBlock
A block receiving MIDI input that includes the incoming messages and a refCon to identify th
source.
func MIDIEndpointDispose(MIDIEndpointRef) -> OSStatus
Disposes of a virtual source or destination.
func MIDIEndpointGetEntity(MIDIEndpointRef, UnsafeMutablePointer<
MIDIEntityRef>?) -> OSStatus
Returns an endpoint’s entity.
func MIDIEndpointGetRefCons(MIDIEndpointRef, UnsafeMutablePointer<Unsaf
MutableRawPointer>?, UnsafeMutablePointer<UnsafeMutableRawPointer>?) ->
OSStatus
Returns contextual data assigned to an endpoint.
func MIDIEndpointSetRefCons(MIDIEndpointRef, UnsafeMutableRawPointer?,
UnsafeMutableRawPointer?) -> OSStatus
Sets contextual data on an endpoint.
func MIDISourceCreateWithProtocol(MIDIClientRef, CFString, MIDIProtocol
ID, UnsafeMutablePointer<MIDIEndpointRef>) -> OSStatus
Creates a virtual source in a client.
Endpoint management


## Page 5

func MIDIGetSource(Int) -> MIDIEndpointRef
Returns a source in the system.
func MIDIGetNumberOfSources() -> Int
Returns the number of sources in the system.
func MIDIDestinationCreateWithProtocol(MIDIClientRef, CFString,
MIDIProtocolID, UnsafeMutablePointer<MIDIEndpointRef>, MIDIReceiveBlock
-> OSStatus
Creates a virtual destination in a client.
func MIDIGetDestination(Int) -> MIDIEndpointRef
Returns a destination in the system.
func MIDIGetNumberOfDestinations() -> Int
Returns the number of destinations in the system.
typealias MIDIEndpointRef
A MIDI source or destination an entity owns.
func MIDIEventListInit(UnsafeMutablePointer<MIDIEventList>, MIDIProtoco
ID) -> UnsafeMutablePointer<MIDIEventPacket>
Initializes an event list.
func MIDIEventListAdd(UnsafeMutablePointer<MIDIEventList>, Int, Unsafe
MutablePointer<MIDIEventPacket>, MIDITimeStamp, Int, UnsafePointer<
UInt32>) -> UnsafeMutablePointer<MIDIEventPacket>
Adds an event to an event list.
func MIDIEventPacketNext(UnsafePointer<MIDIEventPacket>) -> Unsafe
MutablePointer<MIDIEventPacket>
Advances a packet pointer to the next packet in memory, if the packet is part of an event list
func MIDISendEventList(MIDIPortRef, MIDIEndpointRef, UnsafePointer<
MIDIEventList>) -> OSStatus
Sends MIDI events to a destination.
func MIDIReceivedEventList(MIDIEndpointRef, UnsafePointer<MIDIEventList
>) -> OSStatus
Distributes incoming MIDI events from a source to its connected client input ports.
Event list management


## Page 6

struct MIDIEventList
A variable-length list of MIDI event packets.
struct MIDIEventPacket
A series of simultaneous MIDI events in Universal MIDI Packets (UMP) format.
struct UnsafeMutableMIDIEventListPointer
struct UnsafeMutableMIDIEventPacketPointer
func MIDIPacketNext(UnsafePointer<MIDIPacket>) -> UnsafeMutablePointer<
MIDIPacket>
Advances a MIDI packet pointer to the next packet in a package list.
struct MIDIPacket
A collection of simultaneous MIDI events.
struct MIDIPacketList
A list of MIDI events the system sends to or receives from an endpoint.
typealias MIDITimeStamp
The time on the host clock when the event occurred.
struct UnsafeMutableMIDIPacketListPointer
struct UnsafeMutableMIDIPacketPointer
struct MIDISysexSendRequest
A request to asynchronously send a single system-exclusive (SysEx) event to a destination.
struct MIDISysexSendRequestUMP
A request to asynchronously send a single universal MIDI packet (UMP) system-exclusive
(SysEx) event to a destination.
func MIDIFlushOutput(MIDIEndpointRef) -> OSStatus
Cancels all pending events that were previously scheduled to send.
func MIDIRestart() -> OSStatus
Stops and restarts MIDI I/O.
Packet list management
I/O management


## Page 7

struct MIDIIOErrorNotification
A general I/O error notification.
MIDI Services Errors
Error codes for Core MIDI operations XX.
Deprecated Symbols
Review unsupported symbols and their replacements.
MIDI System Setup
Configure the global MIDI system.
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.
MIDI Messages
Create and configure messages.
MIDI Thru Connection
Create play-through connections between sources and destinations.
MIDI Networking
Create and manage devices connected over a local network.
MIDI Drivers
Create driver plug-ins.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.
Errors
Deprecated
See Also
Services


## Page 8



