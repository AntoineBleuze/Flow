# 002_CBPeer.pdf

## Page 1

The CBPeer class is an abstract base class that defines common behavior for objects representin
remote devices. You typically don’t create instances of either CBPeer or its concrete subclasses.
Instead, the system creates them for you during the process of peer discovery.
Your app takes the role of either a central (by creating an instance of CBCentralManager) or a
peripheral (by creating an instance of CBPeripheralManager), and interacts through the
manager with remote devices in the opposite role. During the process of peer discovery, where a
central device scans for peripherals advertising services, the system creates objects from the
concrete subclasses of CBPeer to represent discovered remote devices. The concrete subclasse
of CBPeer are CBPeripheral and CBCentral.
var identifier: UUID
The UUID associated with the peer.
Overview
Topics
Identifying a Peer
Core Bluetooth / CBPeer
Class
CBPeer
An object that represents a remote device.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

NSObject
CBCentral, CBPeripheral
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class CBManager
The abstract base class that manages central and peripheral objects.
class CBATTRequest
A request that uses the Attribute Protocol (ATT).
class CBUUID
A universally unique identifier, as defined by Bluetooth standards.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Supporting Types


