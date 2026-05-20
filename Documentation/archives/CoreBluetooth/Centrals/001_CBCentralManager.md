# 001_CBCentralManager.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


