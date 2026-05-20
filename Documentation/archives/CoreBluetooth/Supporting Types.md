# Supporting Types.pdf

## Page 1

var state: CBManagerState
The current state of the manager.
enum CBManagerState
The possible states of a Core Bluetooth manager.
class var authorization: CBManagerAuthorization
The current authorization status for using Bluetooth.
enum CBManagerAuthorization
The current authorization state of a Core Bluetooth manager.
var authorization: CBManagerAuthorization
The current authorization status for using Bluetooth.
Topics
Accessing the Manager’s Properties
Determining Authorization State
Deprecated Properties
Core Bluetooth / CBManager
Class
CBManager
The abstract base class that manages central and peripheral objects.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 10.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

Deprecated
NSObject
CBCentralManager, CBPeripheralManager
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBATTRequest
A request that uses the Attribute Protocol (ATT).
class CBPeer
An object that represents a remote device.
class CBUUID
A universally unique identifier, as defined by Bluetooth standards.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Supporting Types


## Page 3

The CBATTRequest class represents Attribute Protocol (ATT) read and write requests from
remote central devices (represented by CBCentral objects). Remote centrals use these ATT
requests to read and write characteristic values on local peripherals (represented by
CBPeripheralManager objects). Local peripherals, on the other hand, use the properties of
CBATTRequest objects to respond to the read and write requests appropriately, using the
respond(to:withResult:) method of the CBPeripheralManager class.
var central: CBCentral
The remote central device that originated the request.
var characteristic: CBCharacteristic
The characteristic to read or write the value of.
var value: Data?
The data that the central reads from or writes to the peripheral.
Overview
Topics
Requesting to Read and Write Characteristic Values
Core Bluetooth / CBATTRequest
Class
CBATTRequest
A request that uses the Attribute Protocol (ATT).
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 4

var offset: Int
The zero-based index of the first byte for the read or write request.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBManager
The abstract base class that manages central and peripheral objects.
class CBPeer
An object that represents a remote device.
class CBUUID
A universally unique identifier, as defined by Bluetooth standards.
Relationships
Inherits From
Conforms To
See Also
Supporting Types


## Page 5

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


## Page 6

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


## Page 7

Instances of the CBUUID class represent the 128-bit universally unique identifiers (UUIDs) of
attributes used in Bluetooth low energy communication, such as a peripheral’s services,
characteristics, and descriptors. This class provides a number of factory methods for dealing with
long UUIDs when developing your app. For example, instead of passing around the string
representation of a 128-bit Bluetooth low energy attribute in your code, you can create a CBUUID
object that represents it, and pass that around instead.
The Bluetooth Special Interest Group (SIG) publishes a list of commonly-used UUIDs, many of
which are 16- or 32-bits for convenience. The CBUUID class provides methods that automatically
transform these predefined shorter UUIDs into their 128-bit equivalent UUIDs. When you create a
CBUUID object from a predefined 16- or 32-bit UUID, Core Bluetooth pre-fills the rest of the 128-
bit UUID with the Bluetooth base UUID, as defined in the Bluetooth 4.0 specification, Volume 3, Pa
F, Section 3.2.1.
In addition to providing methods for creating CBUUID objects, this class defines constants that
represent the UUIDs of the Bluetooth-defined characteristic descriptors, as defined in the
Bluetooth 4.0 specification, Volume 3, Part G, Section 3.3.3.
Overview
Topics
Creating New CBUUID Objects
Core Bluetooth / CBUUID
Class
CBUUID
A universally unique identifier, as defined by Bluetooth standards.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 8

init(string: String)
Creates a Core Bluetooth UUID object from a 16-, 32-, or 128-bit UUID string.
init(data: Data)
Creates a Core Bluetooth UUID object from a 16-, 32-, or 128-bit UUID data container.
init(cfuuid: CFUUID)
Creates a Core Bluetooth UUID object from a Core Foundation UUID object.
Deprecated
init(nsuuid: UUID)
Creates a Core Bluetooth UUID object from a Foundation UUID object.
var data: Data
The data of the UUID.
var uuidString: String
The UUID represented as a string.
Characteristic Descriptors
Values that represent the UUIDs of the characteristic descriptors.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Inspecting CBUUID Properties
UUID Constants
Relationships
Inherits From
Conforms To


## Page 9

Hashable
NSCopying
NSObjectProtocol
class CBManager
The abstract base class that manages central and peripheral objects.
class CBATTRequest
A request that uses the Attribute Protocol (ATT).
class CBPeer
An object that represents a remote device.
See Also
Supporting Types


