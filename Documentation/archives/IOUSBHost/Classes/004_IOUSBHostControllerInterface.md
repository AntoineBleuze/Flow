# 004_IOUSBHostControllerInterface.pdf

## Page 1

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


## Page 2

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


