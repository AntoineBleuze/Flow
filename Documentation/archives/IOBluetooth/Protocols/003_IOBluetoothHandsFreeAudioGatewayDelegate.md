# 003_IOBluetoothHandsFreeAudioGatewayDelegate.pdf

## Page 1

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


## Page 2

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


