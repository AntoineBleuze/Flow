# 000_CMIOExtensionDevice.pdf

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


