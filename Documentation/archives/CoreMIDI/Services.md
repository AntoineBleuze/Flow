# Services.pdf

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



## Page 9

The primary clients of this API are apps that present a user interface to configure the global MIDI
system, and MIDI drivers that dynamically modify the system state as users connect and
disconnect hardware.
func MIDISetupAddDevice(MIDIDeviceRef) -> OSStatus
Adds a driver-owned MIDI device to the current MIDI setup.
func MIDISetupRemoveDevice(MIDIDeviceRef) -> OSStatus
Removes a driver-owned MIDI device from the current MIDI setup.
func MIDIExternalDeviceCreate(CFString, CFString, CFString, Unsafe
MutablePointer<MIDIDeviceRef>) -> OSStatus
Creates an external MIDI device.
func MIDISetupAddExternalDevice(MIDIDeviceRef) -> OSStatus
Adds an external MIDI device to the current MIDI setup.
func MIDISetupRemoveExternalDevice(MIDIDeviceRef) -> OSStatus
Overview
Topics
Managing Devices
Managing External Devices
Core MIDI / MIDI System Setup
API Collection
MIDI System Setup
Configure the global MIDI system.


## Page 10

Removes an external MIDI device from the current MIDI setup.
func MIDIDeviceNewEntity(MIDIDeviceRef, CFString, MIDIProtocolID, Bool,
Int, Int, UnsafeMutablePointer<MIDIEntityRef>) -> OSStatus
Adds a new entity to a device.
func MIDIDeviceRemoveEntity(MIDIDeviceRef, MIDIEntityRef) -> OSStatus
Removes an entity from a device.
func MIDIEntityAddOrRemoveEndpoints(MIDIEntityRef, Int, Int) -> OSStatu
Adds or removes an entity’s endpoints.
Deprecated Symbols
Review unsupported symbols and their replacements.
MIDI Services
Communicate with hardware using Universal MIDI Packets.
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.
MIDI Messages
Create and configure messages.
MIDI Thru Connection
Create play-through connections between sources and destinations.
MIDI Networking
Create and manage devices connected over a local network.
MIDI Drivers
Managing Entities
Deprecated
See Also
Services


## Page 11

Create driver plug-ins.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.


## Page 12

In macOS 13 or later and iOS 16 or later, the system automatically reconnects Bluetooth Low
Energy (BLE) MIDI peripherals when powered on, if the device supports pairing. Previously, it was
necessary to use Audio MIDI Setup to establish BLE MIDI connections.
For devices that don’t support pairing, Core MIDI can enable Core Bluetooth connections for
input/output (I/O).
This API enables connection of BLE MIDI peripherals that don’t support pairing using Core
Bluetooth with the following steps:
1. Scan for and connect to a BLE MIDI peripheral.
2. Confirm the peripheral has a BLE MIDI service.
3. Confirm the BLE MIDI service on the peripheral has a MIDI I/O characteristic for the MIDI servic
Once a BLE MIDI peripheral connects — and you confirm that it possess both the BLE MIDI servic
and BLE MIDI I/O characteristic — call MIDIBluetoothDriverActivateAllConnections()
to have Core MIDI enable I/O on those connections.
To disconnect a peripheral, obtain the CBUUID of the peripheral and call MIDIBluetoothDrive
Disconnect(_:).
func MIDIBluetoothDriverActivateAllConnections() -> OSStatus
Overview
Topics
Managing Device Connections
Core MIDI / MIDI Bluetooth
API Collection
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.


## Page 13

Promote all active Bluetooth connections into an online MIDI device capable of input and
output.
func MIDIBluetoothDriverDisconnect(CFString) -> OSStatus
Disconnect the Bluetooth MIDI driver from a Bluetooth Low Energy MIDI peripheral.
MIDI Services
Communicate with hardware using Universal MIDI Packets.
MIDI System Setup
Configure the global MIDI system.
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
See Also
Services


## Page 14

func MIDI1UPNoteOn(UInt8, UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPNoteOff(UInt8, UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPPitchBend(UInt8, UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPControlChange(UInt8, UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPSystemCommon(UInt8, UInt8, UInt8, UInt8) -> MIDIMessage_32
func MIDI1UPChannelVoiceMessage(UInt8, UInt8, UInt8, UInt8, UInt8) ->
MIDIMessage_32
func MIDIMessageTypeForUPWord(UInt32) -> MIDIMessageType
func MIDI2ChannelVoiceMessage(UInt8, UInt8, UInt8, UInt16, UInt32) ->
MIDIMessage_64
func MIDI2NoteOn(UInt8, UInt8, UInt8, UInt8, UInt16, UInt16) ->
MIDIMessage_64
func MIDI2NoteOff(UInt8, UInt8, UInt8, UInt8, UInt16, UInt16) ->
MIDIMessage_64
func MIDI2ControlChange(UInt8, UInt8, UInt8, UInt32) -> MIDIMessage_64
Topics
MIDI 1.0 Messages
MIDI 2.0 Messages
Core MIDI / MIDI Messages
API Collection
MIDI Messages
Create and configure messages.


## Page 15

func MIDI2ProgramChange(UInt8, UInt8, Bool, UInt8, UInt8, UInt8) ->
MIDIMessage_64
func MIDI2PitchBend(UInt8, UInt8, UInt32) -> MIDIMessage_64
func MIDI2PerNotePitchBend(UInt8, UInt8, UInt8, UInt32) -> MIDIMessage
_64
func MIDI2ChannelPressure(UInt8, UInt8, UInt32) -> MIDIMessage_64
func MIDI2PolyPressure(UInt8, UInt8, UInt8, UInt32) -> MIDIMessage_64
func MIDI2AssignableControl(UInt8, UInt8, UInt8, UInt8, UInt32) ->
MIDIMessage_64
func MIDI2RelRegisteredControl(UInt8, UInt8, UInt8, UInt8, UInt32) ->
MIDIMessage_64
func MIDI2AssignablePNC(UInt8, UInt8, UInt8, UInt8, UInt32) ->
MIDIMessage_64
func MIDI2RegisteredPNC(UInt8, UInt8, UInt8, UInt8, UInt32) ->
MIDIMessage_64
func MIDI2RelAssignableControl(UInt8, UInt8, UInt8, UInt8, UInt32) ->
MIDIMessage_64
func MIDI2RegisteredControl(UInt8, UInt8, UInt8, UInt8, UInt32) ->
MIDIMessage_64
func MIDI2PerNoteManagment(UInt8, UInt8, UInt8, Bool, Bool) ->
MIDIMessage_64
enum MIDICVStatus
MIDI status types.
enum MIDIProtocolID
Specifies a MIDI protocol variant.
enum MIDISysExStatus
MIDI System Exclusive (SysEx) types.
enum MIDISystemStatus
MIDI System status types.
struct MIDIMessage_128
Common


## Page 16

A 128-bit MIDI message.
struct MIDIMessage_96
A 96-bit MIDI message.
struct MIDIMessage_64
A 64-bit MIDI message.
typealias MIDIMessage_32
A 32-bit MIDI message.
enum MIDIMessageType
Supported MIDI message types.
MIDI Services
Communicate with hardware using Universal MIDI Packets.
MIDI System Setup
Configure the global MIDI system.
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.
MIDI Thru Connection
Create play-through connections between sources and destinations.
MIDI Networking
Create and manage devices connected over a local network.
MIDI Drivers
Create driver plug-ins.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.
See Also
Services


## Page 17

Use play-through connections, instead of performing MIDI Thru operations, to reduce the overhea
of moving MIDI messages between the server and the client. This API provides a simple interface 
perform a variety of transformations.
func MIDIThruConnectionFind(CFString, UnsafeMutablePointer<Unmanaged<
CFData>>) -> OSStatus
Finds the persistent thru connections for the specified client.
func MIDIThruConnectionCreate(CFString?, CFData, UnsafeMutablePointer<
MIDIThruConnectionRef>) -> OSStatus
Creates a MIDI thru connection.
func MIDIThruConnectionDispose(MIDIThruConnectionRef) -> OSStatus
Disposes a MIDI thru connection.
typealias MIDIThruConnectionRef
An opaque reference to a play-through connection.
Overview
Topics
Finding Connections
Managing Connections
Core MIDI / MIDI Thru Connection
API Collection
MIDI Thru Connection
Create play-through connections between sources and destinations.


## Page 18

struct MIDIThruConnectionEndpoint
A source or destination in a MIDI thru connection.
Endpoint Configuration
Values that define the supported endpoint configurations.
struct MIDIThruConnectionParams
A set of MIDI routings and transformations.
func MIDIThruConnectionParamsSize(UnsafePointer<MIDIThruConnectionParam
>) -> Int
Returns the size of a MIDI thru connection parameters object.
func MIDIThruConnectionParamsInitialize(UnsafeMutablePointer<MIDIThru
ConnectionParams>)
Initializes a parameters object with its default values.
func MIDIThruConnectionGetParams(MIDIThruConnectionRef, UnsafeMutable
Pointer<Unmanaged<CFData>>) -> OSStatus
Returns the thru connection’s parameters.
func MIDIThruConnectionSetParams(MIDIThruConnectionRef, CFData) ->
OSStatus
Updates a thru connection’s parameters.
struct MIDIValueMap
A custom lookup table to transform MIDI 7-bit values, as contained in note numbers,
velocities, control values, and so on.
struct MIDIControlTransform
A structure that describes the transformation of MIDI control change events.
struct MIDITransform
The transformation of a single type of MIDI event.
enum MIDITransformType
Values that specify the type of MIDI transformation.
Configuring Parameters
Transforming Values


## Page 19

enum MIDITransformControlType
A set of values that indicate how to interpret control numbers.
MIDI Services
Communicate with hardware using Universal MIDI Packets.
MIDI System Setup
Configure the global MIDI system.
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.
MIDI Messages
Create and configure messages.
MIDI Networking
Create and manage devices connected over a local network.
MIDI Drivers
Create driver plug-ins.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.
See Also
Services


## Page 20

class MIDINetworkHost
An object that represents the host’s network address.
class MIDINetworkConnection
An object that connects a session to a host.
class MIDINetworkSession
An object that represents a pairing of a source and destination.
MIDI Services
Communicate with hardware using Universal MIDI Packets.
MIDI System Setup
Configure the global MIDI system.
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.
Topics
Networking
See Also
Services
Core MIDI / MIDI Networking
API Collection
MIDI Networking
Create and manage devices connected over a local network.


## Page 21

MIDI Messages
Create and configure messages.
MIDI Thru Connection
Create play-through connections between sources and destinations.
MIDI Drivers
Create driver plug-ins.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.


## Page 22

func MIDIDeviceCreate(MIDIDriverRef?, CFString, CFString, CFString,
UnsafeMutablePointer<MIDIDeviceRef>) -> OSStatus
Creates a new device object that corresponds to the available hardware.
func MIDIDeviceDispose(MIDIDeviceRef) -> OSStatus
Disposes of a MIDI device.
typealias MIDIDeviceRef
A MIDI device that contains entities.
func MIDIDeviceListGetNumberOfDevices(MIDIDeviceListRef) -> Int
Retrieves the number of devices in a device list.
func MIDIDeviceListGetDevice(MIDIDeviceListRef, Int) -> MIDIDeviceRef
Retrieves a MIDI device from a device list.
func MIDIDeviceListAddDevice(MIDIDeviceListRef, MIDIDeviceRef) ->
OSStatus
Adds the specified device to the device list.
func MIDIDeviceListDispose(MIDIDeviceListRef) -> OSStatus
Disposes of a device list, but not its devices.
Topics
Managing Device Lifecyle
Managing Device Lists
Core MIDI / MIDI Drivers
API Collection
MIDI Drivers
Create driver plug-ins.


## Page 23

typealias MIDIDeviceListRef
A list of MIDI devices.
func MIDIGetDriverDeviceList(MIDIDriverRef) -> MIDIDeviceListRef
Returns the list of driver-created devices in the current MIDI setup.
func MIDIDriverEnableMonitoring(MIDIDriverRef, Bool) -> OSStatus
Enables monitoring of all outgoing MIDI packets.
func MIDIGetDriverIORunLoop() -> Unmanaged<CFRunLoop>
Returns the server’s driver I/O thread.
let kMIDIDriverPropertyUsesSerial: CFString
A value that indicates whether the driver uses serial ports and is eligible to have serial ports
assigned to it.
struct MIDIDriverInterface
The interface to a MIDI driver.
typealias MIDIDriverRef
A MIDI driver object.
MIDI Services
Communicate with hardware using Universal MIDI Packets.
MIDI System Setup
Configure the global MIDI system.
MIDI Bluetooth
Connect to Bluetooth Low Energy MIDI peripherals.
MIDI Messages
Create and configure messages.
Inspecting a Driver
See Also
Services


## Page 24

MIDI Thru Connection
Create play-through connections between sources and destinations.
MIDI Networking
Create and manage devices connected over a local network.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.


## Page 25

MIDI Capability Inquiry (MIDI-CI) uses bidirectional communication to enable devices to exchange
information about their capabilities and automatically configure themselves to work together. MID
CI discovers and configures devices using the following means:
Profile configuration. Profiles define a standard set of rules for how devices respond to MIDI
messages. For example, devices that support a piano profile respond to messages common to 
piano, such as note on and off, velocity, and pedaling.
Property exchange. Devices can use a set of System Exclusive (SysEx) messages to find and
control various properties of other devices.
Protocol negotiation. MIDI 2.0 devices can select between using the MIDI 1.0 or 2.0 protocols,
falling back to 1.0 when not supported by other devices.
MIDI-CI defines two roles in the communication between devices: initiator and responder. Client
processes acting as the initiator use the MIDICISession API, which allows for profile and
property configuration of the associated responder. Client processes that advertise their own
profile and property capabilities use the MIDICIResponder API, which sends responder-
originated messages to initiators.
class MIDICIDiscoveryManager
A singleton object that performs systemwide MIDI-CI discovery.
Overview
Topics
Capability Inquiry
Core MIDI / MIDI Capability Inquiry
API Collection
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.


## Page 26

Deprecated
class MIDICISession
An object that represents a MIDI-CI session.
Deprecated
class MIDICIProfile
A mapping of MIDI messages to specific sounds and synthesis behaviors, such as General
MIDI, a drawbar organ, and so on.
class MIDICIProfileState
An object that provides the enabled and disabled profiles for a MIDI channel or port on a
device.
class MIDICIResponder
An object that responds to MIDI-CI inquiries from an initiator on behalf of a MIDI client, and
handles profile and property exchange operations.
Deprecated
MIDI Services
Communicate with hardware using Universal MIDI Packets.
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
See Also
Services


## Page 27

MIDI Drivers
Create driver plug-ins.


