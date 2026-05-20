# 004_MIDI Thru Connection.pdf

## Page 1

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


## Page 2

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


## Page 3

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


