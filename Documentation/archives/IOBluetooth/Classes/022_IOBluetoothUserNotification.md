# 022_IOBluetoothUserNotification.pdf

## Page 1

When registering for various notifications in the system, an IOBluetoothUserNotification object is
returned. To unregister from the notification, call -unregister on the IOBluetoothUserNotification
object. Once -unregister is called, the object will no longer be valid.
func unregister()
Called to unregister the target notification.
NSObject
Overview
Topics
Instance Methods
Relationships
Inherits From
IOBluetooth / IOBluetoothUserNotification
Class
IOBluetoothUserNotification
Represents a registered notification.
macOS


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOBluetoothDevice
An instance of IOBluetoothDevice represents a single remote Bluetooth device.
class IOBluetoothDeviceInquiry
Object representing a device inquiry that finds Bluetooth devices in-range of the computer,
and (optionally) retrieves name information for them.
class IOBluetoothDevicePair
An instance of IOBluetoothDevicePair represents a pairing attempt to a remote Bluetooth
device.
class IOBluetoothDeviceRef
An object that represents a Bluetooth I/O device.
class IOBluetoothHandsFree
Hands free profile class.
class IOBluetoothHandsFreeAudioGateway
An object that sends data to a connected Bluetooth hands-free phone or headset and
processes commands from it.
class IOBluetoothHandsFreeDevice
An object you use to manage phone calls on a connected Bluetooth hands-free phone or
headset.
class IOBluetoothHostController
Conforms To
See Also
Classes


## Page 3

This class is a representation of a Bluetooth Host Controller Interface that is present on the
local computer (either plugged in externally or available internally).
class IOBluetoothL2CAPChannel
An instance of IOBluetoothL2CAPChannel represents a single open L2CAP channel.
class IOBluetoothL2CAPChannelRef
class IOBluetoothOBEXSession
An OBEX Session with a Bluetooth RFCOMM channel as the transport.
class IOBluetoothObject
class IOBluetoothObjectRef
class IOBluetoothRFCOMMChannel
An instance of this class represents an RFCOMM channel as defined by the Bluetooth SDP
spec..
class IOBluetoothRFCOMMChannelRef


