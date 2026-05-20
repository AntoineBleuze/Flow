# 002_CMIOExtensionDeviceProperties.pdf

## Page 1

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


## Page 2

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


## Page 3

A protocol for objects that act as device sources.


