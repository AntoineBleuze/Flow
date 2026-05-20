# 001_IOUSBHostCIDeviceStateMachine.pdf

## Page 1

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


## Page 2

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


