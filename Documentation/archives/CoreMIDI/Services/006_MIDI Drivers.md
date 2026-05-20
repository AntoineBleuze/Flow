# 006_MIDI Drivers.pdf

## Page 1

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


## Page 2

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


## Page 3

MIDI Thru Connection
Create play-through connections between sources and destinations.
MIDI Networking
Create and manage devices connected over a local network.
MIDI Capability Inquiry
Provide support for bidirectional discovery and configuration of devices.


