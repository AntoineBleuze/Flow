# Classes.pdf

## Page 1

var controllerInterface: IOUSBHostControllerInterface
var controllerState: IOUSBHostCIControllerState
func enqueueUpdatedFrame(UInt64, timestamp: UInt64) throws
func inspectCommand(UnsafePointer<IOUSBHostCIMessage>) throws
func respond(toCommand: UnsafePointer<IOUSBHostCIMessage>, status:
IOUSBHostCIMessageStatus) throws
func respond(toCommand: UnsafePointer<IOUSBHostCIMessage>, status:
IOUSBHostCIMessageStatus, frame: UInt64, timestamp: UInt64) throws
Topics
Instance Properties
Instance Methods
Relationships
Inherits From
IOUSBHost / IOUSBHostCIControllerStateMachine
Class
IOUSBHostCIControllerStateMachine
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostCIDeviceStateMachine
class IOUSBHostCIEndpointStateMachine
class IOUSBHostCIPortStateMachine
class IOUSBHostControllerInterface
Conforms To
See Also
Classes


## Page 3

var completeRoute: Int
var controllerInterface: IOUSBHostControllerInterface
var deviceAddress: Int
var deviceState: IOUSBHostCIDeviceState
func inspectCommand(UnsafePointer<IOUSBHostCIMessage>) throws
func respond(toCommand: UnsafePointer<IOUSBHostCIMessage>, status:
IOUSBHostCIMessageStatus) throws
func respond(toCommand: UnsafePointer<IOUSBHostCIMessage>, status:
IOUSBHostCIMessageStatus, deviceAddress: Int) throws
Topics
Instance Properties
Instance Methods
Relationships
IOUSBHost / IOUSBHostCIDeviceStateMachine
Class
IOUSBHostCIDeviceStateMachine
Mac Catalyst 14.0+
macOS 10.15+


## Page 4

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostCIControllerStateMachine
class IOUSBHostCIEndpointStateMachine
class IOUSBHostCIPortStateMachine
class IOUSBHostControllerInterface
Inherits From
Conforms To
See Also
Classes


## Page 5

var controllerInterface: IOUSBHostControllerInterface
var currentTransferMessage: UnsafePointer<IOUSBHostCIMessage>
var deviceAddress: Int
var endpointAddress: Int
var endpointState: IOUSBHostCIEndpointState
func enqueueTransferCompletion(for: UnsafePointer<IOUSBHostCIMessage>,
status: IOUSBHostCIMessageStatus, transferLength: Int) throws
func inspectCommand(UnsafePointer<IOUSBHostCIMessage>) throws
func processDoorbell(IOUSBHostCIDoorbell) throws
func respond(toCommand: UnsafePointer<IOUSBHostCIMessage>, status:
IOUSBHostCIMessageStatus) throws
Topics
Instance Properties
Instance Methods
IOUSBHost / IOUSBHostCIEndpointStateMachine
Class
IOUSBHostCIEndpointStateMachine
Mac Catalyst 14.0+
macOS 10.15+


## Page 6

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostCIControllerStateMachine
class IOUSBHostCIDeviceStateMachine
class IOUSBHostCIPortStateMachine
class IOUSBHostControllerInterface
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 7

var connected: Bool
var controllerInterface: IOUSBHostControllerInterface
var linkState: IOUSBHostCILinkState
var overcurrent: Bool
var portNumber: Int
var portState: IOUSBHostCIPortState
var portStatus: IOUSBHostCIPortStatus
var powered: Bool
var speed: IOUSBHostCIDeviceSpeed
func inspectCommand(UnsafePointer<IOUSBHostCIMessage>) throws
func respond(toCommand: UnsafePointer<IOUSBHostCIMessage>, status:
IOUSBHostCIMessageStatus) throws
Topics
Instance Properties
Instance Methods
IOUSBHost / IOUSBHostCIPortStateMachine
Class
IOUSBHostCIPortStateMachine
Mac Catalyst 14.0+
macOS 10.15+


## Page 8

func updateLinkState(IOUSBHostCILinkState, speed: IOUSBHostCIDeviceSpee
, inhibitLinkStateChange: Bool) throws
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostCIControllerStateMachine
class IOUSBHostCIDeviceStateMachine
class IOUSBHostCIEndpointStateMachine
class IOUSBHostControllerInterface
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 9

var capabilities: UnsafePointer<IOUSBHostCIMessage>
var controllerStateMachine: IOUSBHostCIControllerStateMachine
var interruptRateHz: Int
var queue: dispatch_queue_t
var uuid: UUID
func capabilities(forPort: Int) -> UnsafePointer<IOUSBHostCIMessage>
func description(for: UnsafePointer<IOUSBHostCIMessage>) -> String
func destroy()
func enqueueInterrupt(UnsafePointer<IOUSBHostCIMessage>) throws
func enqueueInterrupt(UnsafePointer<IOUSBHostCIMessage>, expedite: Bool
throws
func enqueueInterrupts(UnsafePointer<IOUSBHostCIMessage>, count: Int)
throws
Topics
Instance Properties
Instance Methods
IOUSBHost / IOUSBHostControllerInterface
Class
IOUSBHostControllerInterface
Mac Catalyst 14.0+
macOS 10.15+


## Page 10

func enqueueInterrupts(UnsafePointer<IOUSBHostCIMessage>, count: Int,
expedite: Bool) throws
func getPortStateMachine(forCommand: UnsafePointer<IOUSBHostCIMessage>,
error: NSErrorPointer) -> IOUSBHostCIPortStateMachine
func getPortStateMachine(forPort: Int, error: NSErrorPointer) ->
IOUSBHostCIPortStateMachine
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostCIControllerStateMachine
class IOUSBHostCIDeviceStateMachine
class IOUSBHostCIEndpointStateMachine
class IOUSBHostCIPortStateMachine
Relationships
Inherits From
Conforms To
See Also
Classes


