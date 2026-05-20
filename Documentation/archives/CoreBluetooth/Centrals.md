# Centrals.pdf

## Page 1

The CBCentral class represents remote central devices (or centrals) that have connected to an
app implementing the peripheral role on a local device. Remote centrals use universally unique
identifiers (UUIDs), represented by NSUUID objects, to identify themselves.
var maximumUpdateValueLength: Int
The maximum amount of data, in bytes, that the central can receive in a single notification o
indication.
CBPeer
Overview
Topics
Identifying a Remote Central
Relationships
Inherits From
Core Bluetooth / CBCentral
Class
CBCentral
A remote device connected to a local app, which is acting as a peripheral.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class CBCentralManager
An object that scans for, discovers, connects to, and manages peripherals.
protocol CBCentralManagerDelegate
A protocol that provides updates for the discovery and management of peripheral devices.
Conforms To
See Also
Centrals


## Page 3

CBCentralManager objects manage discovered or connected remote peripheral devices
(represented by CBPeripheral objects), including scanning for, discovering, and connecting to
advertising peripherals.
Before calling the CBCentralManager methods, set the state of the central manager object to
powered on, as indicated by the CBCentralManagerState.poweredOn constant. This state
indicates that the central device (your iPhone or iPad, for instance) supports Bluetooth low energy
and that Bluetooth is on and available for use.
convenience init()
Initializes the central manager without a delegate.
convenience init(delegate: (any CBCentralManagerDelegate)?, queue:
dispatch_queue_t?)
Initializes the central manager with a specified delegate and dispatch queue.
Overview
Topics
Initializing a Central Manager
Core Bluetooth / CBCentralManager
Class
CBCentralManager
An object that scans for, discovers, connects to, and manages peripherals.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 4

init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t
?, options: [String : Any]?)
Initializes the central manager with specified delegate, dispatch queue, and initialization
options.
Central Manager Initialization Options
Keys used to pass options when initializing a central manager.
Central Manager State Restoration Options
Keys used to pass state restoration options to the central manager initializer.
func connect(CBPeripheral, options: [String : Any]?)
Establishes a local connection to a peripheral.
Peripheral Connection Options
Keys used to pass options when connecting to a peripheral.
func cancelPeripheralConnection(CBPeripheral)
Cancels an active or pending local connection to a peripheral.
func retrieveConnectedPeripherals(withServices: [CBUUID]) -> [
CBPeripheral]
Returns a list of the peripherals connected to the system whose services match a given set o
criteria.
func retrievePeripherals(withIdentifiers: [UUID]) -> [CBPeripheral]
Returns a list of known peripherals by their identifiers.
func scanForPeripherals(withServices: [CBUUID]?, options: [String : Any
]?)
Scans for peripherals that are advertising services.
Peripheral Scanning Options
Keys used to pass options when scanning for peripherals.
Establishing or Canceling Connections with Peripherals
Retrieving Lists of Peripherals
Scanning or Stopping Scans of Peripherals


## Page 5

func stopScan()
Asks the central manager to stop scanning for peripherals.
var isScanning: Bool
A Boolean value that indicates whether the central is currently scanning.
class func supports(CBCentralManager.Feature) -> Bool
Returns a Boolean that indicates whether the device supports a specific set of features.
struct Feature
An option set of device-specific features.
var delegate: (any CBCentralManagerDelegate)?
The delegate object that you want to receive central manager events.
func registerForConnectionEvents(options: [CBConnectionEventMatching
Option : Any]?)
Register for an event notification when the central manager makes a connection matching th
given options.
Peripheral Connection Options
Keys used to pass options when connecting to a peripheral.
enum CBConnectionEvent
A change to the connection state of a peer.
struct CBConnectionEventMatchingOption
A set of options to use when registering for connection events.
enum CBCentralManagerState
Values that represent the current state of a central manager object.
Inspecting Feature Support
Monitoring Properties
Receiving Connection Events
Deprecated


## Page 6

Deprecated
CBManager
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CBCentral
A remote device connected to a local app, which is acting as a peripheral.
protocol CBCentralManagerDelegate
A protocol that provides updates for the discovery and management of peripheral devices.
Relationships
Inherits From
Conforms To
See Also
Centrals


## Page 7

The CBCentralManagerDelegate protocol defines the methods that a delegate of a
CBCentralManager object must adopt. The optional methods of the protocol allow the delegat
to monitor the discovery, connectivity, and retrieval of peripheral devices. The only required
method is centralManagerDidUpdateState(_:); the central manager calls this when its
state updates, thereby indicating the availability of the central manager.
func centralManager(CBCentralManager, didConnect: CBPeripheral)
Tells the delegate that the central manager connected to a peripheral.
func centralManager(CBCentralManager, didDisconnectPeripheral:
CBPeripheral, error: (any Error)?)
Tells the delegate that the central manager disconnected from a peripheral.
func centralManager(CBCentralManager, didFailToConnect: CBPeripheral,
error: (any Error)?)
Overview
Topics
Monitoring Connections with Peripherals
Core Bluetooth / CBCentralManagerDelegate
Protocol
CBCentralManagerDelegate
A protocol that provides updates for the discovery and management of periphera
devices.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 8

Tells the delegate the central manager failed to create a connection with a peripheral.
func centralManager(CBCentralManager, connectionEventDidOccur:
CBConnectionEvent, for: CBPeripheral)
Tells the delegate that a connection event occurred which matches the registered options.
func centralManager(CBCentralManager, didDiscover: CBPeripheral,
advertisementData: [String : Any], rssi: NSNumber)
Tells the delegate the central manager discovered a peripheral while scanning for devices.
Advertisement Data Retrieval Keys
Keys used to specify items in a dictionary of peripheral advertisement data.
func centralManagerDidUpdateState(CBCentralManager)
Tells the delegate the central manager’s state updated.
Required
func centralManager(CBCentralManager, willRestoreState: [String : Any])
Tells the delegate the system is about to restore the central manager, as part of relaunching
the app into the background.
func centralManager(CBCentralManager, didUpdateANCSAuthorizationFor:
CBPeripheral)
Tells the delegate the authorization status changed for a ANCS-requiring connected
peripheral.
func centralManager(CBCentralManager, didDisconnectPeripheral:
CBPeripheral, timestamp: CFAbsoluteTime, isReconnecting: Bool, error:
(any Error)?)
Discovering and Retrieving Peripherals
Monitoring the Central Manager’s State
Monitoring the Central Manager’s Authorization
Instance Methods
Relationships


## Page 9

NSObjectProtocol
class CBCentral
A remote device connected to a local app, which is acting as a peripheral.
class CBCentralManager
An object that scans for, discovers, connects to, and manages peripherals.
Inherits From
See Also
Centrals


