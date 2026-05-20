# 000_IOUSBHostObject.pdf

## Page 1

struct IOUSBHostObjectInitOptions
Options for initializing the host object.
typealias IOUSBHostInterestHandler
The callback that handles underlying service-state changes.
var ioService: io_service_t
A reference to the kernel object.
var queue: dispatch_queue_t
The queue for servicing input/output requests.
func destroy()
Removes underlying allocations and connections from the USB host object.
Parsing USB Descriptors
Topics
Managing the Object Life Cycle
Retrieving Base Class Descriptors
IOUSBHost / IOUSBHostObject
Class
IOUSBHostObject
This class provides basic functionality for sending device requests and retrieving
descriptors.
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

Extract information from various USB descriptors using helper methods.
func ioData(withCapacity: Int) throws -> NSMutableData
Allocates a buffer for input/output requests.
func IOUSBHostDeviceRequestType(tIOUSBDeviceRequestDirectionValue, t
IOUSBDeviceRequestTypeValue, tIOUSBDeviceRequestRecipientValue) -> UInt
Creates the request type field of a device request.
let IOUSBHostDefaultControlCompletionTimeout: TimeInterval
The default completion timeout for input/output requests.
typealias IOUSBHostCompletionHandler
The completion handler for asynchronous control, bulk, and interrupt transfers.
enum IOUSBHostAbortOption
Options for aborting pending input/output requests.
var deviceAddress: Int
The device’s bus address.
var capabilityDescriptors: UnsafePointer<IOUSBBOSDescriptor>?
var deviceDescriptor: UnsafePointer<IOUSBDeviceDescriptor>?
Creating I/O Buffers
Sending Device Requests
Enqueueing Device Requests
Aborting Device Requests
Getting Host Information
Instance Properties
Instance Methods


## Page 3

func configurationDescriptor(with: Int) throws -> UnsafePointer<
IOUSBConfigurationDescriptor>
func configurationDescriptor(withConfigurationValue: Int) throws ->
UnsafePointer<IOUSBConfigurationDescriptor>
func destroy(options: IOUSBHostObjectDestroyOptions)
class IOUSBHostDevice
The class that claims and configures devices, retrieves descriptors, and sends device
requests.
class IOUSBHostInterface
The class for accessing USB-related services.
NSObject
IOUSBHostDevice, IOUSBHostInterface
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Related Documentation
Relationships
Inherits From
Inherited By
Conforms To
See Also


## Page 4

class IOUSBHostIOSource
This class provides basic functionality for deriving pipe and stream classes.
Base Classes


