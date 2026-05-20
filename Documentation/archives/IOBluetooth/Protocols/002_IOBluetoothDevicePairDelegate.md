# 002_IOBluetoothDevicePairDelegate.pdf

## Page 1

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


## Page 2

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


