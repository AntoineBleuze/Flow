# 001_IOUSBHostPipe.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


