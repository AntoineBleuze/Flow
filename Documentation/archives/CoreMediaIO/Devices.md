# Devices.pdf

## Page 1

Creating a camera extension with Core Media I/O
A device provides one or more streams of media data to a CMIOExtensionProvider.
convenience init(localizedName: String, deviceID: UUID, source: any
CMIOExtensionDeviceSource)
Creates an extension device.
init(localizedName: String, deviceID: UUID, legacyDeviceID: String?,
source: any CMIOExtensionDeviceSource)
Creates an extension device with an optional legacy device identifier.
Mentioned in
Overview
Topics
Creating a Device
Core Media I/O / CMIOExtensionDevice
Class
CMIOExtensionDevice
An object that represents a physical or virtual device.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

var localizedName: String
A localized name for a device.
var deviceID: UUID
A universally unique device identifier value.
var legacyDeviceID: String
A legacy device identifier.
var streams: [CMIOExtensionStream]
An array of media streams attached to this device.
func addStream(CMIOExtensionStream) throws
Adds a stream to a device.
func removeStream(CMIOExtensionStream) throws
Removes a stream from the device.
var source: (any CMIOExtensionDeviceSource)?
A source object for a device.
func notifyPropertiesChanged([CMIOExtensionProperty : CMIOExtension
PropertyState<AnyObject>])
Notifies clients of property changes.
Identifying a Device
Managing Streams
Accessing the Device Source
Posting Property Changes
Relationships
Inherits From


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol CMIOExtensionDeviceSource
A protocol for objects that act as device sources.
class CMIOExtensionDeviceProperties
An object that defines the properties of a device.
Conforms To
See Also
Devices


## Page 4

Create a class that adopts this protocol to configure device properties.
var availableProperties: Set<CMIOExtensionProperty>
A set of available properties that a device provides.
Required
func deviceProperties(forProperties: Set<CMIOExtensionProperty>) throws
-> CMIOExtensionDeviceProperties
Retrieves the state of device properties.
Required
func setDeviceProperties(CMIOExtensionDeviceProperties) throws
Sets the state of device properties.
Required
Overview
Topics
Managing Properties
Core Media I/O / CMIOExtensionDeviceSource
Protocol
CMIOExtensionDeviceSource
A protocol for objects that act as device sources.
Mac Catalyst 15.4+
macOS 12.3+


## Page 5

NSObjectProtocol
class CMIOExtensionDevice
An object that represents a physical or virtual device.
class CMIOExtensionDeviceProperties
An object that defines the properties of a device.
Relationships
Inherits From
See Also
Devices


## Page 6

Create an instance of this object to manage the device’s property state.
init(dictionary: [CMIOExtensionProperty : CMIOExtensionPropertyState<An
Object>])
Creates a properties object with a dictionary of property states.
var model: String?
A device model string.
var linkedCoreAudioDeviceUID: String?
A universal identifier of the audio device linked to this device.
var transportType: Int?
Overview
Topics
Creating Device Properties
Configuring Device Properties
Core Media I/O / CMIOExtensionDeviceProperties
Class
CMIOExtensionDeviceProperties
An object that defines the properties of a device.
Mac Catalyst 15.4+
macOS 12.3+


## Page 7

The transport type of the device, such as USB or HDMI.
var suspended: Bool?
A Boolean value that indicates whether the device is in a suspended state.
func setPropertyState(CMIOExtensionPropertyState<AnyObject>?, for
Property: CMIOExtensionProperty)
Sets the value of a device property.
var propertiesDictionary: [CMIOExtensionProperty : CMIOExtensionPropert
State<AnyObject>]
A dictionary of properties for a device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CMIOExtensionDevice
An object that represents a physical or virtual device.
protocol CMIOExtensionDeviceSource
Relationships
Inherits From
Conforms To
See Also
Devices


## Page 8

A protocol for objects that act as device sources.


