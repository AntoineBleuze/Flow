# Peripherals.pdf

## Page 1

The CBPeripheral class represents remote peripheral devices that your app discovers with a
central manager (an instance of CBCentralManager). Peripherals use universally unique
identifiers (UUIDs), represented by NSUUID objects, to identify themselves. Peripherals may
contain one or more services or provide useful information about their connected signal strength.
You use this class to discover, explore, and interact with the services available on a remote
peripheral that supports Bluetooth low energy. A service encapsulates the way part of the device
behaves. For example, one service of a heart rate monitor may be to expose heart rate data from 
sensor. Services themselves contain of characteristics or included services (references to other
services). Characteristics provide further details about a peripheral’s service. For example, the
heart rate service may contain multiple characteristics. One characteristic could describe the
intended body location of the device’s heart rate sensor, and another characteristic could transm
the heart rate measurement data. Finally, characteristics contain any number of descriptors that
provide more information about the characteristic’s value, such as a human-readable description
and a way to format the value.
Overview
Topics
Identifying a Peripheral
Core Bluetooth / CBPeripheral
Class
CBPeripheral
A remote peripheral device.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

var name: String?
The name of the peripheral.
var delegate: (any CBPeripheralDelegate)?
The delegate object specified to receive peripheral events.
func discoverServices([CBUUID]?)
Discovers the specified services of the peripheral.
func discoverIncludedServices([CBUUID]?, for: CBService)
Discovers the specified included services of a previously-discovered service.
var services: [CBService]?
A list of a peripheral’s discovered services.
func discoverCharacteristics([CBUUID]?, for: CBService)
Discovers the specified characteristics of a service.
func discoverDescriptors(for: CBCharacteristic)
Discovers the descriptors of a characteristic.
func readValue(for: CBCharacteristic)
Retrieves the value of a specified characteristic.
func readValue(for: CBDescriptor)
Retrieves the value of a specified characteristic descriptor.
func writeValue(Data, for: CBCharacteristic, type: CBCharacteristicWrit
Type)
Writes the value of a characteristic.
func writeValue(Data, for: CBDescriptor)
Writes the value of a characteristic descriptor.
Discovering Services
Discovering Characteristics and Descriptors
Reading Characteristic and Descriptor Values
Writing Characteristic and Descriptor Values


## Page 3

func maximumWriteValueLength(for: CBCharacteristicWriteType) -> Int
The maximum amount of data, in bytes, you can send to a characteristic in a single write typ
enum CBCharacteristicWriteType
Values representing the possible write types to a characteristic’s value.
func setNotifyValue(Bool, for: CBCharacteristic)
Sets notifications or indications for the value of a specified characteristic.
var state: CBPeripheralState
The connection state of the peripheral.
enum CBPeripheralState
Values representing the connection state of a peripheral.
var canSendWriteWithoutResponse: Bool
A Boolean value that indicates whether the remote device can send a write without a
response.
func readRSSI()
Retrieves the current RSSI value for the peripheral while connected to the central manager.
var rssi: NSNumber?
The Received Signal Strength Indicator (RSSI), in decibels, of the peripheral.
Deprecated
func openL2CAPChannel(CBL2CAPPSM)
Attempts to open an L2CAP channel to the peripheral using the supplied Protocol/Service
Multiplexer (PSM).
class CBL2CAPChannel
A live L2CAP connection to a remote device.
Setting Notifications for a Characteristic’s Value
Monitoring a Peripheral’s Connection State
Accessing a Peripheral’s Signal Strength
Working with L2CAP Channels


## Page 4

typealias CBL2CAPPSM
The type of PSM identifiers.
var ancsAuthorized: Bool
A Boolean value that indicates if the remote device has authorization to receive data over
ANCS protocol.
CBPeer
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
protocol CBPeripheralDelegate
A protocol that provides updates on the use of a peripheral’s services.
class CBPeripheralManager
An object that manages and advertises peripheral services exposed by this app.
protocol CBPeripheralManagerDelegate
Working with Apple Notification Center Service (ANCS)
Relationships
Inherits From
Conforms To
See Also
Peripherals


## Page 5

A protocol that provides updates for local peripheral state and interactions with remote cent
devices.
class CBAttribute
A representation of common aspects of services offered by a peripheral.
struct CBAttributePermissions
Values that represent the read, write, and encryption permissions for a characteristic’s value


## Page 6

The delegate of a CBPeripheral object must adopt the CBPeripheralDelegate protocol. T
delegate uses this protocol’s methods to monitor the discovery, exploration, and interaction of a
remote peripheral’s services and properties. This protocol doesn’t have any required methods.
func peripheral(CBPeripheral, didDiscoverServices: (any Error)?)
Tells the delegate that peripheral service discovery succeeded.
func peripheral(CBPeripheral, didDiscoverIncludedServicesFor: CBService
error: (any Error)?)
Tells the delegate that discovering included services within the indicated service completed.
func peripheral(CBPeripheral, didDiscoverCharacteristicsFor: CBService,
error: (any Error)?)
Overview
Topics
Discovering Services
Discovering Characteristics and their Descriptors
Core Bluetooth / CBPeripheralDelegate
Protocol
CBPeripheralDelegate
A protocol that provides updates on the use of a peripheral’s services.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 7

Tells the delegate that the peripheral found characteristics for a service.
func peripheral(CBPeripheral, didDiscoverDescriptorsFor:
CBCharacteristic, error: (any Error)?)
Tells the delegate that the peripheral found descriptors for a characteristic.
func peripheral(CBPeripheral, didUpdateValueFor: CBCharacteristic, erro
: (any Error)?)
Tells the delegate that retrieving the specified characteristic’s value succeeded, or that the
characteristic’s value changed.
func peripheral(CBPeripheral, didUpdateValueFor: CBDescriptor, error:
(any Error)?)
Tells the delegate that retrieving a specified characteristic descriptor’s value succeeded.
func peripheral(CBPeripheral, didWriteValueFor: CBCharacteristic, error
(any Error)?)
Tells the delegate that the peripheral successfully set a value for the characteristic.
func peripheral(CBPeripheral, didWriteValueFor: CBDescriptor, error:
(any Error)?)
Tells the delegate that the peripheral successfully set a value for the descriptor.
func peripheralIsReady(toSendWriteWithoutResponse: CBPeripheral)
Tells the delegate that a peripheral is again ready to send characteristic updates.
func peripheral(CBPeripheral, didUpdateNotificationStateFor:
CBCharacteristic, error: (any Error)?)
Tells the delegate that the peripheral received a request to start or stop providing notificatio
for a specified characteristic’s value.
func peripheral(CBPeripheral, didReadRSSI: NSNumber, error: (any Error
)?)
Retrieving Characteristic and Descriptor Values
Writing Characteristic and Descriptor Values
Managing Notifications for a Characteristic’s Value
Retrieving a Peripheral’s RSSI Data


## Page 8

Tells the delegate that retrieving the value of the peripheral’s current Received Signal Streng
Indicator (RSSI) succeeded.
func peripheralDidUpdateRSSI(CBPeripheral, error: (any Error)?)
Tells the delegate that retrieving the value of the peripheral’s current Received Signal Streng
Indicator (RSSI) succeeded.
Deprecated
func peripheralDidUpdateName(CBPeripheral)
Tells the delegate that a peripheral’s name changed.
func peripheral(CBPeripheral, didModifyServices: [CBService])
Tells the delegate that a peripheral’s services changed.
func peripheral(CBPeripheral, didOpen: CBL2CAPChannel?, error: (any
Error)?)
Delivers the result of an attempt to open an L2CAP channel.
NSObjectProtocol
class CBPeripheral
A remote peripheral device.
class CBPeripheralManager
Monitoring Changes to a Peripheral’s Name or Services
Monitoring L2CAP Channels
Relationships
Inherits From
See Also
Peripherals


## Page 9

An object that manages and advertises peripheral services exposed by this app.
protocol CBPeripheralManagerDelegate
A protocol that provides updates for local peripheral state and interactions with remote cent
devices.
class CBAttribute
A representation of common aspects of services offered by a peripheral.
struct CBAttributePermissions
Values that represent the read, write, and encryption permissions for a characteristic’s value


## Page 10

Core Bluetooth uses CBPeripheralManager objects to manage published services within the
local peripheral’s Generic Attribute Profile (GATT) database and to advertise these services to
central devices (represented by CBCentral objects). While a service is in the database, any
connected central can see and connect to it. That said, if your app hasn’t specified the
bluetooth-peripheral background mode, the contents of its services become disabled whe
it’s in the background or in a suspended state. In this scenario, any remote central trying to acces
the service’s characteristic value or characteristic descriptors receives an error.
Before you call CBPeripheralManager methods, the peripheral manager object must be in the
powered-on state, as indicated by the CBPeripheralManagerState.poweredOn. This state
indicates that the device (your iPhone or iPad, for instance) supports Bluetooth low energy and th
its Bluetooth is on and available for use.
In watchOS, tvOS, and visionOS, you can’t advertise services using a CBPeripheralManager
object because support for doing so is unavailable.
convenience init()
Overview
Topics
Initializing a Peripheral Manager
Core Bluetooth / CBPeripheralManager
Class
CBPeripheralManager
An object that manages and advertises peripheral services exposed by this app.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 11

Initializes the peripheral manager without a delegate.
convenience init(delegate: (any CBPeripheralManagerDelegate)?, queue:
dispatch_queue_t?)
Initializes the peripheral manager with a specified delegate and dispatch queue.
init(delegate: (any CBPeripheralManagerDelegate)?, queue: dispatch_queu
_t?, options: [String : Any]?)
Initializes the peripheral manager with a specified delegate, dispatch queue, and initialization
options.
var delegate: (any CBPeripheralManagerDelegate)?
The delegate object specified to receive peripheral events.
Peripheral Manager Initialization Options
Keys used to specify options when creating a peripheral manager.
class func authorizationStatus() -> CBPeripheralManagerAuthorization
Status
Returns the app’s authorization status for sharing data while in the background.
Deprecated
enum CBPeripheralManagerAuthorizationStatus
Values representing the current authorization state of the peripheral manager.
Deprecated
enum CBPeripheralManagerState
Values that represent the current state of the peripheral manager.
Deprecated
func add(CBMutableService)
Publishes a service and any of its associated characteristics and characteristic descriptors t
the local GATT database.
func remove(CBMutableService)
Removes a specified published service from the local GATT database.
func removeAllServices()
Monitoring the State of a Peripheral Manager
Adding and Removing Services


## Page 12

Removes all published services from the local GATT database.
func startAdvertising([String : Any]?)
Advertises peripheral manager data.
Advertising Data
func stopAdvertising()
Stops advertising peripheral manager data.
var isAdvertising: Bool
A Boolean value that indicates whether the peripheral is advertising data.
func updateValue(Data, for: CBMutableCharacteristic, onSubscribed
Centrals: [CBCentral]?) -> Bool
Send an updated characteristic value to one or more subscribed centrals, using a notificatio
or indication.
func respond(to: CBATTRequest, withResult: CBATTError.Code)
Responds to a read or write request from a connected central.
func setDesiredConnectionLatency(CBPeripheralManagerConnectionLatency,
for: CBCentral)
Sets the desired connection latency for an existing connection to a central device.
enum CBPeripheralManagerConnectionLatency
Values representing the connection latency of the peripheral manager.
func publishL2CAPChannel(withEncryption: Bool)
Creates a listener for incoming L2CAP channel connections.
Managing Advertising
Sending Updates of a Characteristic’s Value
Responding to Read and Write Requests
Setting Connection Latency
Using L2CAP Channels


## Page 13

func unpublishL2CAPChannel(CBL2CAPPSM)
Removes a published service from the local system.
CBManager
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
protocol CBPeripheralManagerDelegate
A protocol that provides updates for local peripheral state and interactions with remote cent
devices.
class CBAttribute
A representation of common aspects of services offered by a peripheral.
struct CBAttributePermissions
Relationships
Inherits From
Conforms To
See Also
Peripherals


## Page 14

Values that represent the read, write, and encryption permissions for a characteristic’s value


## Page 15

The delegate of a CBPeripheralManager object must adopt the CBPeripheralManager
Delegate protocol, which consists of numerous optional methods and one required method. The
delegate uses the protocol’s optional methods to verify publishing and advertising, and to monito
read, write, and subscription requests from remote central devices.
The protocol’s required one method, peripheralManagerDidUpdateState(_:), which Core
Bluetooth calls whenever the peripheral manager’s state updates to indicate whether the periphe
manager is available.
func peripheralManagerDidUpdateState(CBPeripheralManager)
Tells the delegate the peripheral manager’s state updated.
Required
func peripheralManager(CBPeripheralManager, willRestoreState: [String :
Any])
Overview
Topics
Monitoring Changes to the Peripheral Manager’s State
Core Bluetooth / CBPeripheralManagerDelegate
Protocol
CBPeripheralManagerDelegate
A protocol that provides updates for local peripheral state and interactions with
remote central devices.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 16

Tells the delegate the system is about to restore the peripheral manager.
Peripheral Manager State Restoration Options
Keys used to specify options when restoring the state of a peripheral manager.
func peripheralManager(CBPeripheralManager, didAdd: CBService, error:
(any Error)?)
Tells the delegate the peripheral manager published a service to the local GATT database.
func peripheralManagerDidStartAdvertising(CBPeripheralManager, error:
(any Error)?)
Tells the delegate the peripheral manager started advertising the local peripheral device’s
data.
func peripheralManager(CBPeripheralManager, central: CBCentral, did
SubscribeTo: CBCharacteristic)
Tells the delegate that a remote central device subscribed to a characteristic’s value.
func peripheralManager(CBPeripheralManager, central: CBCentral, did
UnsubscribeFrom: CBCharacteristic)
Tells the delegate that a remote central device unsubscribed from a characteristic’s value.
func peripheralManagerIsReady(toUpdateSubscribers: CBPeripheralManager)
Tells the delegate that a local peripheral device is ready to send characteristic value updates
func peripheralManager(CBPeripheralManager, didReceiveRead: CBATTReques
)
Tells the delegate that a local peripheral received an Attribute Protocol (ATT) read request fo
a characteristic with a dynamic value.
func peripheralManager(CBPeripheralManager, didReceiveWrite: [
CBATTRequest])
Adding Services
Advertising Peripheral Data
Monitoring Subscriptions to Characteristic Values
Receiving Read and Write Requests


## Page 17

Tells the delegate that a local peripheral device received an Attribute Protocol (ATT) write
request for a characteristic with a dynamic value.
func peripheralManager(CBPeripheralManager, didPublishL2CAPChannel:
CBL2CAPPSM, error: (any Error)?)
Tells the delegate that the peripheral manager created a listener for incoming L2CAP channe
connections.
func peripheralManager(CBPeripheralManager, didUnpublishL2CAPChannel:
CBL2CAPPSM, error: (any Error)?)
Tells the delegate that the peripheral manager removed a published service from the local
system.
func peripheralManager(CBPeripheralManager, didOpen: CBL2CAPChannel?,
error: (any Error)?)
Tells the delegate that the peripheral manager opened an L2CAP channel.
NSObjectProtocol
class CBPeripheral
A remote peripheral device.
protocol CBPeripheralDelegate
A protocol that provides updates on the use of a peripheral’s services.
class CBPeripheralManager
An object that manages and advertises peripheral services exposed by this app.
Using L2CAP Channels
Relationships
Inherits From
See Also
Peripherals


## Page 18

class CBAttribute
A representation of common aspects of services offered by a peripheral.
struct CBAttributePermissions
Values that represent the read, write, and encryption permissions for a characteristic’s value


## Page 19

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


## Page 20

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


## Page 21

When you initialize a new mutable characteristic, you set the read, write, and encryption
permissions for the characteristic’s value. Setting the read and write permissions for a
characteristic’s value is different from specifying the read and write properties for a characteristic
value. When you specify the read and write properties, the client (a central) inspects the read and
write permissions of the characteristic’s value. When you specify the read and write permissions
for a characteristic’s value, you set the permissions for the server (the peripheral) to allow the typ
of read or write specified by the characteristic’s properties. Therefore, when you initialize a mutab
characteristic, you need to specify read or write properties and their corresponding permissions.
If you want to enforce encryption requirements for reads and writes on a characteristic’s value, yo
must specify the relevant permission (readEncryptionRequired or writeEncryption
Required). You may set more than one permission for a characteristic’s value.
init(rawValue: UInt)
Creates a permissions instance from the provided raw value.
Overview
Topics
Creating a Permissions Instance
Core Bluetooth / CBAttributePermissions
Structure
CBAttributePermissions
Values that represent the read, write, and encryption permissions for a
characteristic’s value.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 22

static var readable: CBAttributePermissions
A permission that indicates a peripheral can read the attribute’s value.
static var writeable: CBAttributePermissions
A permission that indicates a peripheral can write the attribute’s value.
static var readEncryptionRequired: CBAttributePermissions
A permission that indicates only trusted devices can read the attribute’s value.
static var writeEncryptionRequired: CBAttributePermissions
A permission that indicates only trusted devices can write the attribute’s value.
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
class CBPeripheral
A remote peripheral device.
protocol CBPeripheralDelegate
A protocol that provides updates on the use of a peripheral’s services.
Permissions
Relationships
Conforms To
See Also
Peripherals


## Page 23

class CBPeripheralManager
An object that manages and advertises peripheral services exposed by this app.
protocol CBPeripheralManagerDelegate
A protocol that provides updates for local peripheral state and interactions with remote cent
devices.
class CBAttribute
A representation of common aspects of services offered by a peripheral.


