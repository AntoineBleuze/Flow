# Protocols.pdf

## Page 1

func connectionComplete(IOBluetoothDevice!, status: IOReturn)
Required
func remoteNameRequestComplete(IOBluetoothDevice!, status: IOReturn)
Required
func sdpQueryComplete(IOBluetoothDevice!, status: IOReturn)
Required
protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
Topics
Instance Methods
See Also
Protocols
IOBluetooth / IOBluetoothDeviceAsyncCallbacks
Protocol
IOBluetoothDeviceAsyncCallbacks
macOS


## Page 2

protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothL2CAPChannelDelegate
protocol IOBluetoothRFCOMMChannelDelegate


## Page 3

func deviceInquiryComplete(IOBluetoothDeviceInquiry!, error: IOReturn,
aborted: Bool)
func deviceInquiryDeviceFound(IOBluetoothDeviceInquiry!, device:
IOBluetoothDevice!)
func deviceInquiryDeviceNameUpdated(IOBluetoothDeviceInquiry!, device:
IOBluetoothDevice!, devicesRemaining: UInt32)
func deviceInquiryStarted(IOBluetoothDeviceInquiry!)
func deviceInquiryUpdatingDeviceNamesStarted(IOBluetoothDeviceInquiry!,
devicesRemaining: UInt32)
Topics
Instance Methods
Relationships
IOBluetooth / IOBluetoothDeviceInquiryDelegate
Protocol
IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the
IOBluetoothDeviceInquiry object. All methods are optional, but it is highly
recommended you implement them all. Do NOT invoke remote name requests on
found IOBluetoothDevice objects unless the inquiry object has been stopped.
Doing so may deadlock your process.
macOS


## Page 4

NSObjectProtocol
protocol IOBluetoothDeviceAsyncCallbacks
protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothL2CAPChannelDelegate
protocol IOBluetoothRFCOMMChannelDelegate
Inherits From
See Also
Protocols


## Page 5

func devicePairingConnected(Any!)
func devicePairingConnecting(Any!)
func devicePairingFinished(Any!, error: IOReturn)
func devicePairingPINCodeRequest(Any!)
func devicePairingStarted(Any!)
func devicePairingUserConfirmationRequest(Any!, numericValue: Bluetooth
NumericValue)
func devicePairingUserPasskeyNotification(Any!, passkey: Bluetooth
Passkey)
func deviceSimplePairingComplete(Any!, status: BluetoothHCIEventStatus)
Topics
Instance Methods
Relationships
Inherits From
IOBluetooth / IOBluetoothDevicePairDelegate
Protocol
IOBluetoothDevicePairDelegate
macOS


## Page 6

NSObjectProtocol
protocol IOBluetoothDeviceAsyncCallbacks
protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothL2CAPChannelDelegate
protocol IOBluetoothRFCOMMChannelDelegate
See Also
Protocols


## Page 7

func handsFree(IOBluetoothHandsFreeAudioGateway!, hangup: NSNumber!)
Tells the delegate the connected Bluetooth hands-free phone or headset is sending a hang-
up signal.
func handsFree(IOBluetoothHandsFreeAudioGateway!, redial: NSNumber!)
Tells the delegate the connected Bluetooth hands-free phone or headset is redialing the last
phone number.
protocol IOBluetoothDeviceAsyncCallbacks
Topics
Receiving Status Change Information
See Also
Protocols
IOBluetooth / IOBluetoothHandsFreeAudioGatewayDelegate
Protocol
IOBluetoothHandsFreeAudioGateway
Delegate
A set of optional methods for receiving information about status changes for a
connected Bluetooth hands-free phone or headset.
macOS


## Page 8

protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothL2CAPChannelDelegate
protocol IOBluetoothRFCOMMChannelDelegate


## Page 9

func handsFree(IOBluetoothHandsFree!, connected: NSNumber!)
func handsFree(IOBluetoothHandsFree!, disconnected: NSNumber!)
func handsFree(IOBluetoothHandsFree!, scoConnectionClosed: NSNumber!)
func handsFree(IOBluetoothHandsFree!, scoConnectionOpened: NSNumber!)
NSObjectProtocol
IOBluetoothHandsFreeDeviceDelegate
Topics
Instance Methods
Relationships
Inherits From
Inherited By
IOBluetooth / IOBluetoothHandsFreeDelegate
Protocol
IOBluetoothHandsFreeDelegate
macOS


## Page 10

protocol IOBluetoothDeviceAsyncCallbacks
protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothL2CAPChannelDelegate
protocol IOBluetoothRFCOMMChannelDelegate
See Also
Protocols


## Page 11

func handsFree(IOBluetoothHandsFreeDevice!, callSetupMode: NSNumber!)
Tells the delegate the call setup indicator of the connected Bluetooth hands-free phone or
headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, isCallActive: NSNumber!)
Tells the delegate the active call indicator of the connected Bluetooth hands-free phone or
headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, isServiceAvailable: NSNumbe
!)
Tells the delegate the service level indicator of the connected Bluetooth hands-free phone o
headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, signalStrength: NSNumber!)
Tells the delegate the call setup signal strength indicator of the connected Bluetooth hands-
free phone or headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, callHoldState: NSNumber!)
Topics
Receiving Status Indicator Changes
IOBluetooth / IOBluetoothHandsFreeDeviceDelegate
Protocol
IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information
about a connected Bluetooth hands-free phone or headset.
macOS


## Page 12

Tells the delegate the call held indicator of the connected Bluetooth hands-free phone or
headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, isRoaming: NSNumber!)
Tells the delegate the roaming indicator of the connected Bluetooth hands-free phone or
headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, batteryCharge: NSNumber!)
Tells the delegate the battery level indicator of the connected Bluetooth hands-free phone o
headset has changed.
func handsFree(IOBluetoothHandsFreeDevice!, incomingCallFrom: String!)
Tells the delegate there’s an incoming call on the connected Bluetooth hands-free phone or
headset.
func handsFree(IOBluetoothHandsFreeDevice!, currentCall: [AnyHashable :
Any]!)
Sends the delegate information about the current call.
Current Call Information Constants
Get information about a phone call on a hands-free Bluetooth device.
func handsFree(IOBluetoothHandsFreeDevice!, incomingSMS: [AnyHashable :
Any]!)
Tells the delegate there’s an incoming text message.
SMS Dictionary Key Constants
Read the parts of an SMS message.
func handsFree(IOBluetoothHandsFreeDevice!, subscriberNumber: String!)
Tells the delegate the subscriber number of a call.
func handsFree(IOBluetoothHandsFreeDevice!, ringAttempt: NSNumber!)
Tells the delegate the phone is ringing.
Receiving Call Status
Receiving SMS Information
Receiving Other Information


## Page 13

func handsFree(IOBluetoothHandsFreeDevice!, unhandledResultCode: String
!)
Tells the delegate the phone sent an unknown code.
IOBluetoothHandsFreeDelegate, NSObjectProtocol
protocol IOBluetoothDeviceAsyncCallbacks
protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothL2CAPChannelDelegate
protocol IOBluetoothRFCOMMChannelDelegate
Relationships
Inherits From
See Also
Protocols


## Page 14

func l2capChannelClosed(IOBluetoothL2CAPChannel!)
func l2capChannelData(IOBluetoothL2CAPChannel!, data: UnsafeMutableRaw
Pointer!, length: Int)
func l2capChannelOpenComplete(IOBluetoothL2CAPChannel!, status: IORetur
)
func l2capChannelQueueSpaceAvailable(IOBluetoothL2CAPChannel!)
func l2capChannelReconfigured(IOBluetoothL2CAPChannel!)
func l2capChannelWriteComplete(IOBluetoothL2CAPChannel!, refcon: Unsafe
MutableRawPointer!, status: IOReturn)
protocol IOBluetoothDeviceAsyncCallbacks
Topics
Instance Methods
See Also
Protocols
IOBluetooth / IOBluetoothL2CAPChannelDelegate
Protocol
IOBluetoothL2CAPChannelDelegate
macOS


## Page 15

protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothRFCOMMChannelDelegate


## Page 16

func rfcommChannelClosed(IOBluetoothRFCOMMChannel!)
func rfcommChannelControlSignalsChanged(IOBluetoothRFCOMMChannel!)
func rfcommChannelData(IOBluetoothRFCOMMChannel!, data: UnsafeMutableRa
Pointer!, length: Int)
func rfcommChannelFlowControlChanged(IOBluetoothRFCOMMChannel!)
func rfcommChannelOpenComplete(IOBluetoothRFCOMMChannel!, status:
IOReturn)
func rfcommChannelQueueSpaceAvailable(IOBluetoothRFCOMMChannel!)
func rfcommChannelWriteComplete(IOBluetoothRFCOMMChannel!, refcon:
UnsafeMutableRawPointer!, status: IOReturn)
func rfcommChannelWriteComplete(IOBluetoothRFCOMMChannel!, refcon:
UnsafeMutableRawPointer!, status: IOReturn, bytesWritten: Int)
Topics
Instance Methods
Relationships
IOBluetooth / IOBluetoothRFCOMMChannelDelegate
Protocol
IOBluetoothRFCOMMChannelDelegate
macOS


## Page 17

IOBluetoothOBEXSession
protocol IOBluetoothDeviceAsyncCallbacks
protocol IOBluetoothDeviceInquiryDelegate
This category on NSObject describes the delegate methods for the IOBluetoothDeviceInquir
object. All methods are optional, but it is highly recommended you implement them all. Do
NOT invoke remote name requests on found IOBluetoothDevice objects unless the inquiry
object has been stopped. Doing so may deadlock your process.
protocol IOBluetoothDevicePairDelegate
protocol IOBluetoothHandsFreeAudioGatewayDelegate
A set of optional methods for receiving information about status changes for a connected
Bluetooth hands-free phone or headset.
protocol IOBluetoothHandsFreeDelegate
protocol IOBluetoothHandsFreeDeviceDelegate
A set of optional methods for receiving status change updates and information about a
connected Bluetooth hands-free phone or headset.
protocol IOBluetoothL2CAPChannelDelegate
Conforming Types
See Also
Protocols


