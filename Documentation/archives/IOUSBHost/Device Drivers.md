# Device Drivers.pdf

## Page 1

This class enables management of the device state, including sending control requests to the
default endpoint 0, configuring the device, and resetting the device. The interest handler also
allows monitoring of the device state. The client creates the class and initializes it with initWith
IOService:options:queue:error:interestHandler:.
Note
To prevent other drivers from changing the state of your device, maintain an IOUSBHost
Device object until you no longer need control over the device.
var configurationDescriptor: UnsafePointer<IOUSBConfigurationDescriptor
>?
The currently selected configuration descriptor.
Overview
Topics
Retrieving Device Descriptors
IOUSBHost / IOUSBHostDevice
Class
IOUSBHostDevice
The class that claims and configures devices, retrieves descriptors, and sends
device requests.
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

func reset() throws
Terminates the device and attempts to re-enumerate it.
IOUSBHostObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Resetting the Device
Relationships
Inherits From
Conforms To


