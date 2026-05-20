# 005_CBMutableDescriptor.pdf

## Page 1

You use the CBMutableDescriptor class to create a local characteristic descriptor. After you
create a descriptor and associate it with a local characteristic, you can publish it to the peripheral
local database using the add(_:) method of the CBPeripheralManager class. This also
publishes the characteristic and local service to which the descriptor belongs. After you publish a
local descriptor, Core Bluetooth caches the descriptor and you can no longer make changes to it.
CBUUID details predefined descriptor types and their corresponding value types. That said, only
two of these are currently supported when creating local, mutable descriptors: the characteristic
user description descriptor and the characteristic format descriptor. CBUUID declares these as th
constants CBUUIDCharacteristicUserDescriptionString and CBUUIDCharacteristi
FormatString, respectively. The system automatically creates the extended properties
descriptor and the client configuration descriptor, depending on the properties of the characteris
to which the descriptor belongs.
init(type: CBUUID, value: Any?)
Overview
Topics
Creating a Mutable Descriptor
Core Bluetooth / CBMutableDescriptor
Class
CBMutableDescriptor
An object that provides additional information about a local peripheral’s
characteristic.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

Creates a mutable descriptor with a specified value.
CBDescriptor
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBService
A collection of data and associated behaviors that accomplish a function or feature of a
device.
class CBMutableService
A service with writeable property values.
class CBCharacteristic
A characteristic of a remote peripheral’s service.
class CBMutableCharacteristic
A characteristic of a local peripheral’s service.
class CBDescriptor
An object that provides further information about a remote peripheral’s characteristic.
Relationships
Inherits From
Conforms To
See Also
Services


## Page 3



