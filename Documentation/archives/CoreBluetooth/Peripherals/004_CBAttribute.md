# 004_CBAttribute.pdf

## Page 1

Concrete subclasses of CBAttribute (and their mutable counterparts) represent the services a
peripheral offers, the characteristics of those services, and the descriptors attached to those
characteristics. The concrete subclasses are:
CBService
CBCharacteristic
CBDescriptor
var uuid: CBUUID
The Bluetooth-specific UUID of the attribute.
Overview
Topics
Identifying an Attribute
Relationships
Core Bluetooth / CBAttribute
Class
CBAttribute
A representation of common aspects of services offered by a peripheral.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

NSObject
CBCharacteristic, CBDescriptor, CBService
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBPeripheral
A remote peripheral device.
protocol CBPeripheralDelegate
A protocol that provides updates on the use of a peripheral’s services.
class CBPeripheralManager
An object that manages and advertises peripheral services exposed by this app.
protocol CBPeripheralManagerDelegate
A protocol that provides updates for local peripheral state and interactions with remote cent
devices.
struct CBAttributePermissions
Values that represent the read, write, and encryption permissions for a characteristic’s value
Inherits From
Inherited By
Conforms To
See Also
Peripherals


