# Function Drivers.pdf

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


## Page 4

The client creates pipe objects using copyPipe(withAddress:).
typealias IOUSBHostCompletionHandler
The completion handler for asynchronous control, bulk, and interrupt transfers.
let IOUSBHostDefaultControlCompletionTimeout: TimeInterval
The default completion timeout for input/output requests.
func enqueueIORequest(with: NSMutableData?, completionTimeout: Time
Interval, completionHandler: ((IOReturn, Int) -> Void)?) throws
Enqueues an input/output request on the pipe.
func clearStall() throws
Clears the halt condition of the pipe.
Overview
Topics
Sending Bulk and Interrupt I/O
IOUSBHost / IOUSBHostPipe
Class
IOUSBHostPipe
The class that sends control, bulk, interrupt, and isochronous input/output
requests for function drivers, and manages stream capabilities.
Mac Catalyst 14.0+
macOS 10.15+


## Page 5

typealias IOUSBHostIsochronousCompletionHandler
A completion handler for asynchronous isochronous transfers.
typealias IOUSBHostTime
The absolute time.
struct IOUSBHostIsochronousFrame
A structure that represents a single frame in an isochronous transfer.
func enqueueIORequest(with: NSMutableData, frameList: UnsafeMutable
Pointer<IOUSBHostIsochronousFrame>, frameListCount: Int, firstFrame
Number: UInt64, completionHandler: ((IOReturn, UnsafeMutablePointer<
IOUSBHostIsochronousFrame>) -> Void)?) throws
Enqueues a request on an isochronous endpoint.
func sendIORequest(with: NSMutableData, frameList: UnsafeMutablePointer
IOUSBHostIsochronousFrame>, frameListCount: Int, firstFrameNumber:
UInt64) throws
Sends a request on an isochronous endpoint.
func IOUSBHostDeviceRequestType(tIOUSBDeviceRequestDirectionValue, t
IOUSBDeviceRequestTypeValue, tIOUSBDeviceRequestRecipientValue) -> UInt
Creates the request type field of a device request.
let IOUSBHostDefaultControlCompletionTimeout: TimeInterval
The default completion timeout for input/output requests.
typealias IOUSBHostCompletionHandler
The completion handler for asynchronous control, bulk, and interrupt transfers.
struct IOUSBHostIOSourceDescriptors
The descriptors for a single endpoint.
func adjust(with: UnsafePointer<IOUSBHostIOSourceDescriptors>) throws
Adjusts the behavior of periodic endpoints to consume a different amount of bus bandwidth
Sending Isochronous I/O
Sending Control Requests
Managing Periodic Bandwidth


## Page 6

var descriptors: UnsafePointer<IOUSBHostIOSourceDescriptors>
A property that retrieves the current endpoint descriptors controlling the endpoint.
var originalDescriptors: UnsafePointer<IOUSBHostIOSourceDescriptors>
A property that retrieves the original endpoint descriptors from the pipe at the point of
creation.
func setIdleTimeout(TimeInterval) throws
Sets the desired idle suspend timeout for the interface.
var idleTimeout: TimeInterval
A property that retrieves the current idle suspend timeout.
func enableStreams() throws
Enables streams for the pipe.
func copyStream(withStreamID: Int) throws -> IOUSBHostStream
Returns the stream for a stream ID.
func disableStreams() throws
Disables streams for the pipe.
func enqueueIORequest(with: NSMutableData, transactionList: Unsafe
MutablePointer<IOUSBHostIsochronousTransaction>, transactionListCount:
Int, firstFrameNumber: UInt64, options: IOUSBHostIsochronousTransfer
Options, completionHandler: ((IOReturn, UnsafeMutablePointer<IOUSBHost
IsochronousTransaction>) -> Void)?) throws
func sendIORequest(with: NSMutableData, transactionList: UnsafeMutable
Pointer<IOUSBHostIsochronousTransaction>, transactionListCount: Int,
firstFrameNumber: UInt64, options: IOUSBHostIsochronousTransferOptions)
throws
Enabling Power Savings
Managing Streams
Instance Methods


## Page 7

IOUSBHostIOSource
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IOUSBHostInterface
The class for accessing USB-related services.
class IOUSBHostStream
The class responsible for sending stream data for function drivers.
Relationships
Inherits From
Conforms To
See Also
Function Drivers


## Page 8

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


## Page 9

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


## Page 10

The class that sends control, bulk, interrupt, and isochronous input/output requests for
function drivers, and manages stream capabilities.


