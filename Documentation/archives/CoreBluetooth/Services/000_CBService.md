# 000_CBService.pdf

## Page 1

CBService objects represent services of a remote peripheral. Services are either primary or
secondary and may contain multiple characteristics or included services (references to other
services).
var peripheral: CBPeripheral?
The peripheral to which this service belongs.
var isPrimary: Bool
A Boolean value that indicates whether the type of service is primary or secondary.
var characteristics: [CBCharacteristic]?
A list of characteristics discovered in this service.
Overview
Topics
Identifying a Service
Accessing Service Data
Core Bluetooth / CBService
Class
CBService
A collection of data and associated behaviors that accomplish a function or featu
of a device.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

var includedServices: [CBService]?
A list of included services discovered in this service.
CBAttribute
CBMutableService
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBMutableService
A service with writeable property values.
class CBCharacteristic
A characteristic of a remote peripheral’s service.
class CBMutableCharacteristic
A characteristic of a local peripheral’s service.
class CBDescriptor
Relationships
Inherits From
Inherited By
Conforms To
See Also
Services


## Page 3

An object that provides further information about a remote peripheral’s characteristic.
class CBMutableDescriptor
An object that provides additional information about a local peripheral’s characteristic.


