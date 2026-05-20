# Services.pdf

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


## Page 4

The CBMutableService class adds write access to all of the properties in the CBService clas
it inherits from. You use this class to create a service or an included service on a local peripheral
device (represented by a CBPeripheralManager object). After creating a service, you can add
to the peripheral’s local database using the add(_:) method of the CBPeripheralManager
class. After you add a service to the peripheral’s local database, Core Bluetooth caches the servic
and you can no longer make changes to it.
init(type: CBUUID, primary: Bool)
Creates a newly initialized mutable service specified by UUID and service type.
var characteristics: [CBCharacteristic]?
A list of characteristics of a service.
Overview
Topics
Creating a Mutable Service
Managing a Mutable Service
Core Bluetooth / CBMutableService
Class
CBMutableService
A service with writeable property values.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 5

var includedServices: [CBService]?
A list of included services.
CBService
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBService
A collection of data and associated behaviors that accomplish a function or feature of a
device.
class CBCharacteristic
A characteristic of a remote peripheral’s service.
class CBMutableCharacteristic
A characteristic of a local peripheral’s service.
class CBDescriptor
An object that provides further information about a remote peripheral’s characteristic.
class CBMutableDescriptor
Relationships
Inherits From
Conforms To
See Also
Services


## Page 6

An object that provides additional information about a local peripheral’s characteristic.


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

CBMutableCharacteristic objects represent the characteristics of a local peripheral’s servic
This class adds write access to many of the properties in the CBCharacteristic class, which i
inherits from.
You use this class to create a characteristic and to set its properties and permissions as desired.
After you create and add a characteristic to a local service, you can publish it (and the service) to
the peripheral’s local database with the add(_:) method of the CBPeripheralManager class.
After you publish a characteristic, Core Bluetooth caches the characteristic and you can’t make
changes to it.
init(type: CBUUID, properties: CBCharacteristicProperties, value: Data?
permissions: CBAttributePermissions)
Creates a mutable characteristic with specified permissions, properties, and value.
Overview
Topics
Creating a Mutable Characteristic
Managing a Mutable Characteristic
Core Bluetooth / CBMutableCharacteristic
Class
CBMutableCharacteristic
A characteristic of a local peripheral’s service.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 11

var value: Data?
The value of the characteristic.
var descriptors: [CBDescriptor]?
An array of the characteristic’s descriptors.
var properties: CBCharacteristicProperties
The properties of the characteristic.
var permissions: CBAttributePermissions
The permissions of the characteristic value.
struct CBAttributePermissions
Values that represent the read, write, and encryption permissions for a characteristic’s value
var subscribedCentrals: [CBCentral]?
A list of centrals that are currently subscribed to the characteristic’s value.
CBCharacteristic
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To
See Also
Services


## Page 12

class CBService
A collection of data and associated behaviors that accomplish a function or feature of a
device.
class CBMutableService
A service with writeable property values.
class CBCharacteristic
A characteristic of a remote peripheral’s service.
class CBDescriptor
An object that provides further information about a remote peripheral’s characteristic.
class CBMutableDescriptor
An object that provides additional information about a local peripheral’s characteristic.


## Page 13

CBDescriptor and its subclass CBMutableDescriptor represent a descriptor of a periphera
characteristic. In partcular, CBDescriptor objects represent the descriptors of a remote
peripheral’s characteristic. Descriptors provide further information about a characteristic’s value.
For example, they may describe the value in human-readable form and describe how to format th
value for presentation purposes. Characteristic descriptors also indicate whether a characteristic
value indicates or notifies a client (a central) when the value of the characteristic changes.
CBUUID details six predefined descriptors and their corresponding value types. CBDescriptor
lists the predefined descriptors and the CBUUID constants that represent them.
Descriptor type
Descriptor constant
Characteristic extended
properties
CBUUIDCharacteristicExtendedProperties
String
Characteristic user description
CBUUIDCharacteristicUserDescriptionString
Client characteristic
configuration
CBUUIDClientCharacteristicConfiguration
String
Server characteristic
configuration
CBUUIDServerCharacteristicConfiguration
String
Overview
Core Bluetooth / CBDescriptor
Class
CBDescriptor
An object that provides further information about a remote peripheral’s
characteristic.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 14

Descriptor type
Descriptor constant
Characteristic format
CBUUIDCharacteristicFormatString
Characteristic aggregate format
CBUUIDCharacteristicAggregateFormatString
var characteristic: CBCharacteristic?
The characteristic to which this descriptor belongs.
var value: Any?
The value of the descriptor.
CBAttribute
CBMutableDescriptor
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Identifying a Descriptor
Accessing Descriptor Data
Relationships
Inherits From
Inherited By
Conforms To


## Page 15

class CBService
A collection of data and associated behaviors that accomplish a function or feature of a
device.
class CBMutableService
A service with writeable property values.
class CBCharacteristic
A characteristic of a remote peripheral’s service.
class CBMutableCharacteristic
A characteristic of a local peripheral’s service.
class CBMutableDescriptor
An object that provides additional information about a local peripheral’s characteristic.
See Also
Services


## Page 16

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


## Page 17

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


## Page 18



