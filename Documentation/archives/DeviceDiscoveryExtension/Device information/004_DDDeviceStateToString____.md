# 004_DDDeviceStateToString____.pdf

## Page 1

inValue
A state identifier to convert to text.
A textual value for the specified device state.
Your extension can use this function for logging.
class DDDevice
An object that describes a discovered device of interest.
Parameters
Return Value
Discussion
See Also
Device information
DeviceDiscoveryExtension / DDDeviceStateToString(_:)
Function
DDDeviceStateToString(_:)
Returns human-readable text for the specified identifier that describes a device’s
status.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 2

enum Category
An option that determines the icon for the device in the picker UI.
enum DDDeviceState
A state that represents the level of user interaction with the device.
func DDDeviceCategoryToString(DDDevice.Category) -> String
Returns human-readable text for the specified identifier that describes a device’s category.
enum Protocol
An identifier for the manner in which an app interacts with a device.
func DDDeviceProtocolToString(DDDevice.Protocol) -> String
Returns human-readable text for the specified protocol identifier.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


