# 001_DDDevice_Category.pdf

## Page 1

The device (DDDevice) category property is of this type.
Each value in this enumeration determines a different icon that the picker UI (AVRoutePicker
View) displays, which helps the user visually confirm that their selection corresponds to the devi
they intend to stream media to.
case desktopComputer
An icon that depicts a desktop computer.
case hifiSpeaker
An icon that depicts a high-fidelity speaker.
case hifiSpeakerMultiple
An icon that depicts multiple high-fidelity speakers.
case laptopComputer
Overview
Topics
Choosing an icon for the device picker
DeviceDiscoveryExtension / DDDevice / DDDevice.Category
Enumeration
DDDevice.Category
An option that determines the icon for the device in the picker UI.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

An icon that depicts a laptop computer.
case tv
An icon that depicts a television.
case tvWithMediaBox
An icon that depicts a TV with a set-top box.
case accessorySetup
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class DDDevice
An object that describes a discovered device of interest.
enum DDDeviceState
A state that represents the level of user interaction with the device.
Enumeration Cases
Initializers
Relationships
Conforms To
See Also
Device information


## Page 3

func DDDeviceCategoryToString(DDDevice.Category) -> String
Returns human-readable text for the specified identifier that describes a device’s category.
func DDDeviceStateToString(DDDeviceState) -> String
Returns human-readable text for the specified identifier that describes a device’s status.
enum Protocol
An identifier for the manner in which an app interacts with a device.
func DDDeviceProtocolToString(DDDevice.Protocol) -> String
Returns human-readable text for the specified protocol identifier.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


