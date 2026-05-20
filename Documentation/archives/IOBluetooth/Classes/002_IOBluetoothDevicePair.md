# 002_IOBluetoothDevicePair.pdf

## Page 1

Use the IOBluetoothDevicePair object to attempt to pair with any Bluetooth device. Once -start is
invoked on it, progress is returned to the delegate via the messages defined below. This object
enables you to pair with devices within your application without having to use the standard panels
provided by the IOBluetoothUI framework, allowing you to write custom UI to select devices, and
still handle the ability to perform device pairings.
Of note is that this object MAY attempt to perform two low-level pairings, depending on the type 
device you are attempting to pair. This is inconsequential to your code, however, as it occurs
automatically and does not change the messaging.
Once started, the pairing can be stopped. This will set the delegate to nil and then attempt to
disconnect from the device if already connected.
convenience init!(device: IOBluetoothDevice!)
Creates an autorelease IOBluetoothDevicePair object with a device as the pairing target.
Overview
Topics
Initializers
IOBluetooth / IOBluetoothDevicePair
Class
IOBluetoothDevicePair
An instance of IOBluetoothDevicePair represents a pairing attempt to a remote
Bluetooth device.
macOS


## Page 2

var delegate: AnyObject!
func device() -> IOBluetoothDevice!
Get the IOBluetoothDevice being used by the object.
func replyPINCode(Int, pinCode: UnsafeMutablePointer<BluetoothPINCode>!
This is the required reply to the devicePairingPINCodeRequest delegate message. Set the PI
code to use during pairing if required.
func replyUserConfirmation(Bool)
This is the required reply to the devicePairingUserConfirmationRequest delegate message.
func setDevice(IOBluetoothDevice!)
Set the device object to pair with. It is retained by the object.
func start() -> IOReturn
Kicks off the pairing with the device.
func stop()
Stops the current pairing. Removes the delegate and disconnects if device was connected.
NSObject
CBCentralManagerDelegate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Instance Properties
Instance Methods
Relationships
Inherits From
Conforms To


## Page 3

Hashable
NSObjectProtocol
class IOBluetoothDevice
An instance of IOBluetoothDevice represents a single remote Bluetooth device.
class IOBluetoothDeviceInquiry
Object representing a device inquiry that finds Bluetooth devices in-range of the computer,
and (optionally) retrieves name information for them.
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
This class is a representation of a Bluetooth Host Controller Interface that is present on the
local computer (either plugged in externally or available internally).
class IOBluetoothL2CAPChannel
An instance of IOBluetoothL2CAPChannel represents a single open L2CAP channel.
class IOBluetoothL2CAPChannelRef
class IOBluetoothOBEXSession
An OBEX Session with a Bluetooth RFCOMM channel as the transport.
class IOBluetoothObject
See Also
Classes


## Page 4

class IOBluetoothObjectRef
class IOBluetoothRFCOMMChannel
An instance of this class represents an RFCOMM channel as defined by the Bluetooth SDP
spec..
class IOBluetoothRFCOMMChannelRef
class IOBluetoothSDPDataElement
An instance of this class represents a single SDP data element as defined by the Bluetooth
SDP spec.


