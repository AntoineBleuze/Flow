# 000_IOUSBHostInterface.pdf

## Page 1

Use this class to create pipes, retrieve descriptors, send device requests, and enable power
savings. Create an instance of the class with initWithIOService:options:queue:error:
interestHandler:.
var configurationDescriptor: UnsafePointer<IOUSBConfigurationDescriptor
The configuration descriptor for the interface.
var interfaceDescriptor: UnsafePointer<IOUSBInterfaceDescriptor>
The descriptor for the interface.
func selectAlternateSetting(Int) throws
Selects an alternative setting for the interface.
Overview
Topics
Retrieving Function Descriptors
Managing Pipes
IOUSBHost / IOUSBHostInterface
Class
IOUSBHostInterface
The class for accessing USB-related services.
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

func copyPipe(withAddress: Int) throws -> IOUSBHostPipe
Copies a pipe for a specific endpoint address.
var idleTimeout: TimeInterval
The current idle suspend timeout.
func setIdleTimeout(TimeInterval) throws
Sets the desired idle suspend timeout for the interface.
IOUSBHostObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostPipe
The class that sends control, bulk, interrupt, and isochronous input/output requests for
function drivers, and manages stream capabilities.
class IOUSBHostStream
Enabling Power Savings
Relationships
Inherits From
Conforms To
See Also
Function Drivers


## Page 3

The class responsible for sending stream data for function drivers.


