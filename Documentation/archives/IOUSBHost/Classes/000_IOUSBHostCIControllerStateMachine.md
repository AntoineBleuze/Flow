# 000_IOUSBHostCIControllerStateMachine.pdf

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


