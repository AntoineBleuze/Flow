# 007_DDDeviceProtocolString.pdf

## Page 1

When an app creates a device discovery extension to stream content to a third-party media
receiver, the protocol is Discovery and Launch (DIAL), as designated by the DDDevice.Protoco
.dial option.
init(rawValue: String)
Creates a string for the manner in which an app interacts with a device.
static let dial: DDDeviceProtocolString
A human-readable string for the Discovery and Launch protocol.
static let invalid: DDDeviceProtocolString
Discussion
Topics
Creating a device protocol string
Specifying a device protocol string
DeviceDiscoveryExtension / DDDeviceProtocolString
Structure
DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

A human-readable string for the default device protocol.
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
enum Protocol
An identifier for the manner in which an app interacts with a device.
func DDDeviceProtocolToString(DDDevice.Protocol) -> String
Returns human-readable text for the specified protocol identifier.
Relationships
Conforms To
See Also
Device information


## Page 3

func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


