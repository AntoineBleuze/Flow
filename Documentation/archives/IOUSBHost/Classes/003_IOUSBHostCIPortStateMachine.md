# 003_IOUSBHostCIPortStateMachine.pdf

## Page 1

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


## Page 2

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


