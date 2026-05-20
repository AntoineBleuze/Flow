# 002_IOUSBHostCIEndpointStateMachine.pdf

## Page 1

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


## Page 2

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


