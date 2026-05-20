# Device information.pdf

## Page 1

The extension creates an instance of this class for a discovered device of interest and passes it to
the system for display in the device picker UI (AVRoutePickerView).
The extension discovers devices through either Core Bluetooth or the local network (that is, using
Bonjour).
For device discovery extensions of third-party media receivers, an instance of this class
corresponds to the media receiver of interest.
The extension reports the status of discovered devices to the system using the report(_:)
function, and it receives status updates about the device from the system by implementing did
ReceiveEvent(_:).
init(displayName: String, category: DDDevice.Category, protocolType:
UTType, identifier: String)
Creates an object that describes a discovered device.
Overview
Topics
Initializing a device
DeviceDiscoveryExtension / DDDevice
Class
DDDevice
An object that describes a discovered device of interest.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 2

var displayName: String
A name for the device to display to the user.
var identifier: String
A unique identifier for the device.
var category: DDDevice.Category
An option that determies the icon that the picker UI displays for the device.
enum Category
An option that determines the icon for the device in the picker UI.
var `protocol`: DDDevice.Protocol
The manner in which the system applies your app’s device discovery extension.
enum Protocol
An identifier for the manner in which an app interacts with a device.
var protocolType: UTType
A custom universal type that describes the device’s manner of communication with the
extension.
var bluetoothIdentifier: UUID?
An identifier to communicate with the device through Bluetooth wireless technology.
var networkEndpoint: NWEndpoint?
An object that describes a local-network device.
var state: DDDeviceState
A state that represents the level of user interaction with the device.
var txtRecord: NWTXTRecord?
A dictionary of metadata for the device that the extension communicates with over the local
network.
Identifying the device
Indicating the protocol
Setting the device state


## Page 3

var url: URL
A resource locator for the simple service discovery protocol.
var supportsGrouping: Bool
A Boolean value that indicates whether to group the device with others in the AirPlay UI.
var mediaContentTitle: String?
A title for the current media that the device plays.
var mediaContentSubtitle: String?
A subtitle for the current media that the device plays.
var mediaPlaybackState: DDDevice.MediaPlaybackState
A playback status for the device’s current media.
enum MediaPlaybackState
States that indicate the status of a device’s media playback.
var deviceSupports: DDDeviceSupports
var displayImageName: String?
var ssid: String?
var wifiAwareModelName: String?
Device’s Wi-Fi Aware model name.
var wifiAwareServiceName: String?
Device’s Wi-Fi Aware’s service name.
var wifiAwareServiceRole: DDDevice.WiFiAwareServiceRole
Device’s Wi-Fi Aware’s service. Default is DDDeviceWiFiAwareServiceRoleSubscribe
var wifiAwareVendorName: String?
Device’s Wi-Fi Aware vendor name.
Communicating device content and playback status
Instance Properties
Enumerations


## Page 4

enum WiFiAwareServiceRole
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
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
Relationships
Inherits From
Conforms To
See Also
Device information


## Page 5

Returns human-readable text for the specified protocol identifier.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

Returns human-readable text for the specified protocol identifier.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


## Page 12

inValue
A category identifier to convert to text.
A textual value for the specified category.
Your extension can use this function for logging.
class DDDevice
An object that describes a discovered device of interest.
Parameters
Return Value
Discussion
See Also
Device information
DeviceDiscoveryExtension / DDDeviceCategoryToString(_:)
Function
DDDeviceCategoryToString(_:)
Returns human-readable text for the specified identifier that describes a device’s
category.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 13

enum Category
An option that determines the icon for the device in the picker UI.
enum DDDeviceState
A state that represents the level of user interaction with the device.
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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

inValue
A device-protocol identifier to convert to text.
A textual value for the specified device protocol.
Your extension can use this function for logging.
class DDDevice
An object that describes a discovered device of interest.
enum Category
Parameters
Return Value
Discussion
See Also
Device information
DeviceDiscoveryExtension / DDDeviceProtocolToString(_:)
Function
DDDeviceProtocolToString(_:)
Returns human-readable text for the specified protocol identifier.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 19

An option that determines the icon for the device in the picker UI.
enum DDDeviceState
A state that represents the level of user interaction with the device.
func DDDeviceCategoryToString(DDDevice.Category) -> String
Returns human-readable text for the specified identifier that describes a device’s category.
func DDDeviceStateToString(DDDeviceState) -> String
Returns human-readable text for the specified identifier that describes a device’s status.
enum Protocol
An identifier for the manner in which an app interacts with a device.
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.
func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


## Page 20

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


## Page 21

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


## Page 22

func DDDeviceMediaPlaybackStateToString(DDDevice.MediaPlaybackState) ->
String
Returns human-readable text for the specified media playback state.


## Page 23

inValue
A media playback state to convert to text.
A textual value for the specified device protocol.
Your extension can use this function for logging.
class DDDevice
An object that describes a discovered device of interest.
Parameters
Return Value
Discussion
See Also
Device information
DeviceDiscoveryExtension / DDDeviceMediaPlaybackStateToString(_:)
Function
DDDeviceMediaPlaybackStateToString(_:
Returns human-readable text for the specified media playback state.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 24

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
struct DDDeviceProtocolString
String values for the manner in which an app interacts with a device.


