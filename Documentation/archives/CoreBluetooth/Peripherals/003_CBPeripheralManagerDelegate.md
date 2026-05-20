# 003_CBPeripheralManagerDelegate.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

class CBAttribute
A representation of common aspects of services offered by a peripheral.
struct CBAttributePermissions
Values that represent the read, write, and encryption permissions for a characteristic’s value


