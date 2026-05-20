# 005_DDDevice_Protocol.pdf

## Page 1

The device (DDDevice) protocol property is of this type.
case dial
A protocol for client devices that stream media to a TV or set-top box.
case invalid
A default value for a device protocol.
init?(rawValue: Int)
Overview
Topics
Indicating a device protocol
Initializers
Relationships
DeviceDiscoveryExtension / DDDevice / DDDevice.Protocol
Enumeration
DDDevice.Protocol
An identifier for the manner in which an app interacts with a device.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

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
enum DDDeviceState
A state that represents the level of user interaction with the device.
func DDDeviceCategoryToString(DDDevice.Category) -> String
Returns human-readable text for the specified identifier that describes a device’s category.
func DDDeviceStateToString(DDDeviceState) -> String
Returns human-readable text for the specified identifier that describes a device’s status.
func DDDeviceProtocolToString(DDDevice.Protocol) -> String
Returns human-readable text for the specified protocol identifier.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.
Conforms To
See Also
Device information


