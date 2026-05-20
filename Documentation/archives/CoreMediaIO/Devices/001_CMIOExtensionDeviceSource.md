# 001_CMIOExtensionDeviceSource.pdf

## Page 1

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


## Page 2

NSObjectProtocol
class CMIOExtensionDevice
An object that represents a physical or virtual device.
class CMIOExtensionDeviceProperties
An object that defines the properties of a device.
Relationships
Inherits From
See Also
Devices


