# 002_DDDeviceState.pdf

## Page 1

The device (DDDevice) state property is of this type.
case invalid
A state that indicates the device is invalid or that the user disapproves of the device.
case activating
A state that indicates when the user selects the device in the picker UI.
case activated
A state that indicates when the user authorizes the device and the app connects to the
device.
case authorized
A state that indicates when the user authorizes the device.
case invalidating
Overview
Topics
Communicating a device’s status
DeviceDiscoveryExtension / DDDeviceState
Enumeration
DDDeviceState
A state that represents the level of user interaction with the device.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

A state that indicates that the device is soon to be invalid.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class DDDevice
An object that describes a discovered device of interest.
enum Category
An option that determines the icon for the device in the picker UI.
func DDDeviceCategoryToString(DDDevice.Category) -> String
Returns human-readable text for the specified identifier that describes a device’s category.
func DDDeviceStateToString(DDDeviceState) -> String
Returns human-readable text for the specified identifier that describes a device’s status.
enum Protocol
An identifier for the manner in which an app interacts with a device.
func DDDeviceProtocolToString(DDDevice.Protocol) -> String
Initializers
Relationships
Conforms To
See Also
Device information


## Page 3

Returns human-readable text for the specified protocol identifier.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


