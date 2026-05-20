# 002_IOUSBHostStream.pdf

## Page 1

The copyStream(withStreamID:) method creates stream objects.
typealias IOUSBHostCompletionHandler
The completion handler for asynchronous control, bulk, and interrupt transfers.
func enqueueIORequest(with: NSMutableData?, completionHandler: ((
IOReturn, Int) -> Void)?) throws
Enqueues an input/output request on the stream.
func abort(with: IOUSBHostAbortOption) throws
Aborts pending input/output requests.
func abort() throws
Aborts pending input/output requests synchronously.
Overview
Topics
Sending I/O
IOUSBHost / IOUSBHostStream
Class
IOUSBHostStream
The class responsible for sending stream data for function drivers.
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

var hostPipe: IOUSBHostPipe
The pipe that creates the stream.
var streamID: Int
The ID for the stream.
IOUSBHostIOSource
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostInterface
The class for accessing USB-related services.
class IOUSBHostPipe
Getting the Pipe Object
Getting the Stream ID
Relationships
Inherits From
Conforms To
See Also
Function Drivers


## Page 3

The class that sends control, bulk, interrupt, and isochronous input/output requests for
function drivers, and manages stream capabilities.


