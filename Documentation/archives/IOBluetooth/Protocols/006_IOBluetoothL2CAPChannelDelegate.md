# 006_IOBluetoothL2CAPChannelDelegate.pdf

## Page 1

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


## Page 2

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


