# 001_IOUSBHostIOSource.pdf

## Page 1

Don’t create objects of this class or use this class as a subclass. Instead, use copyPipe(with
Address:) and copyStream(withStreamID:) when creating an IOUSBHostIOSource.
var deviceAddress: Int
The device’s bus address.
var endpointAddress: Int
The pipe or stream’s endpoint address.
var hostInterface: IOUSBHostInterface
The interface for the input/output source.
class IOUSBHostPipe
Overview
Topics
Obtaining Device Information
Related Documentation
IOUSBHost / IOUSBHostIOSource
Class
IOUSBHostIOSource
This class provides basic functionality for deriving pipe and stream classes.
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

The class that sends control, bulk, interrupt, and isochronous input/output requests for
function drivers, and manages stream capabilities.
class IOUSBHostStream
The class responsible for sending stream data for function drivers.
NSObject
IOUSBHostPipe, IOUSBHostStream
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostObject
This class provides basic functionality for sending device requests and retrieving descriptors
Relationships
Inherits From
Inherited By
Conforms To
See Also
Base Classes


