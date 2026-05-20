# 007_IOBluetoothHostController.pdf

## Page 1

This object can be used to ask a Bluetooth HCI for certain pieces of information, and be used to
make it perform certain functions.
var delegate: AnyObject!
var powerState: BluetoothHCIPowerState
Gets the controller power state
func addressAsString() -> String!
Convience routine to get the HCI controller’s Bluetooth address as an NSString object.
func classOfDevice() -> BluetoothClassOfDevice
Overview
Topics
Instance Properties
Instance Methods
IOBluetooth / IOBluetoothHostController
Class
IOBluetoothHostController
This class is a representation of a Bluetooth Host Controller Interface that is
present on the local computer (either plugged in externally or available internally)
macOS


## Page 2

Gets the current class of device value.
func nameAsString() -> String!
Gets the “friendly” name of HCI controller.
func setClassOfDevice(BluetoothClassOfDevice, forTimeInterval: Time
Interval) -> IOReturn
Sets the current class of device value, for the specified amount of time. Note that the time
interval must be set and valid. The range of acceptable values is 30-120 seconds. Anything
above or below will be rounded up, or down, as appropriate.
class func `default`() -> Self!
Gets the default HCI controller object.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOBluetoothDevice
Type Methods
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 3

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
class IOBluetoothSDPDataElement
An instance of this class represents a single SDP data element as defined by the Bluetooth
SDP spec.


## Page 4



