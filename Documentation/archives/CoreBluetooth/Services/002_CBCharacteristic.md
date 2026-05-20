# 002_CBCharacteristic.pdf

## Page 1

CBCharacteristic and its subclass CBMutableCharacteristic represent further
information about a peripheral’s service. In particular, CBCharacteristic objects represent the
characteristics of a remote peripheral’s service. A characteristic contains a single value and any
number of descriptors describing that value. The properties of a characteristic determine how yo
can use a characteristic’s value, and how you access the descriptors.
var service: CBService?
The service to which this characteristic belongs.
var value: Data?
The value of the characteristic.
var descriptors: [CBDescriptor]?
Overview
Topics
Identifying a Characteristic
Accessing Characteristic Data
Core Bluetooth / CBCharacteristic
Class
CBCharacteristic
A characteristic of a remote peripheral’s service.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

A list of the descriptors discovered in this characteristic.
var properties: CBCharacteristicProperties
The properties of the characteristic.
struct CBCharacteristicProperties
Values that represent the possible properties of a characteristic.
var isNotifying: Bool
A Boolean value that indicates whether the characteristic is currently notifying a subscribed
central of its value.
var isBroadcasted: Bool
A Boolean value that indicates whether the characteristic the service broadcasts this
characteristic.
CBAttribute
CBMutableCharacteristic
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Inherited By
Conforms To
See Also


## Page 3

class CBService
A collection of data and associated behaviors that accomplish a function or feature of a
device.
class CBMutableService
A service with writeable property values.
class CBMutableCharacteristic
A characteristic of a local peripheral’s service.
class CBDescriptor
An object that provides further information about a remote peripheral’s characteristic.
class CBMutableDescriptor
An object that provides additional information about a local peripheral’s characteristic.
Services


