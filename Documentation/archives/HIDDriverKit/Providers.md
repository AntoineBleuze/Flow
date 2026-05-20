# Providers.pdf

## Page 1

Type
Boolean
com.apple.developer.driverkit.family.hid.eventservice
A Boolean value that indicates whether the driver provides a HID-related event service to the
system.
DriverKit Family virtual HID
An entitlement that lets an app create and manage virtual HID devices.
Key: com.apple.developer.driverkit.family.hid.virtual.device
com.apple.developer.driverkit.transport.hid
A Boolean value that indicates whether the driver communicates with human interface
devices.
com.apple.developer.hid.virtual.device
Details
See Also
Human Interface Device Drivers
Bundle Resources / Entitlements / com.apple.developer.driverkit.family.hid.device
Property List Key
com.apple.developer.driverkit.family.hid
.device
A Boolean value that indicates whether the driver provides a HID-related service t
the system.
macOS 10.15+


## Page 2

A Boolean value that indicates whether the driver creates a virtual HID device.


## Page 3

An IOHIDInterface object represents a specific interface of the HID device. Typically, you don
create IOHIDInterface objects directly. Instead, you specify that your driver relies on an
IOHIDInterface as its provider, and the system creates the interface object for you during the
matching process.
To use a HID interface object directly, call Open to create a new session between the interface an
your custom driver. When calling that method, you specify an OSAction object to execute each
time a new report is ready to process. When a new report arrives, the IOHIDInterface object
parses the device’s report data, puts the data into a set of IOHIDElement objects, and notifies
your action object. Use your action object’s ReportAvailable method to parse the element
objects and dispatch events.
init
Handles the basic initialization of the interface.
free
Overview
Topics
Running the Interface
HIDDriverKit / IOHIDInterface
Class
IOHIDInterface
A provider object for a HID device’s interface.
DriverKit
macOS


## Page 4

Open
Opens a session to the device and begins the delivery of input reports.
Close
Closes the interface and stops the delivery of input reports.
ReportAvailable
Notifies the interface that an updated report is available from the HID device.
AddReportToPool
Adds a memory descriptor to the report pool.
processReport
Parses the contents of the specified report and updates the interface’s elements.
GetReport
Retrieves a new input report from the HID device.
SetReport
Sends a report to the HID device.
getElements
Returns the array of elements that the interface uses to store parsed report data.
commitElements
Gets or sets the contents of the interface’s stored elements.
Managing the Session
Getting and Setting Input Reports
Accessing the Elements of a Report
Relationships
Inherits From


## Page 5

IOService
com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
system.
IOUserUSBHostHIDDevice
A provider object for USB devices that support HID interactions.
IOUserHIDDevice
A provider object for devices that support interactions with users.
IOHIDDevice
An object containing the low-level behavior for all HID device providers.
See Also
Providers


## Page 6

An IOUserUSBHostHIDDevice object is a fully functional provider object that represents a USB
based HID device. Typically, you don’t create IOUserUSBHostHIDDevice objects directly.
Instead, you specify that your driver relies on an IOUserUSBHostHIDDevice as its provider, an
the system creates the interface object for you during the matching process.
When implementing a custom driver, use this provider object to manage the connection to the
underlying device. Specifically, use it to get reports from the device and to manage the device’s
configuration. For example, use the object to configure the USB device’s idle policy.
Subclass IOUserUSBHostHIDDevice only when you want to customize the interactions with th
USB device. For example, you might use a custom subclass to initialize the USB device in a
particular way or support a custom transport mechanism. You can also use a custom subclass to
perform additional processing on the report data.
When you subclass IOUserUSBHostHIDDevice, update the IOKitPersonalities key of yo
driver extension’s Info.plist file with information to match your driver to appropriate hardware
For this class, always include the keys and values in the following table.
Key
Discussion
IOClass
The value AppleUserHIDDevice.
Overview
Specify the Driver’s Personality Information
HIDDriverKit / IOUserUSBHostHIDDevice
Class
IOUserUSBHostHIDDevice
A provider object for USB devices that support HID interactions.
DriverKit
macOS


## Page 7

Key
Discussion
IOProviderClass
The provider class information. For a USB-based HID device, specify
IOUSBHostInterface.
IOUserClass
The name of your custom subclass.
CFBundle
Identifier
The bundle identifier of your driver.
You may add other keys to assist with the matching process. For example, you might include the
VendorID, ProductID, PrimaryUsagePage, and PrimaryUsage keys to match against
specific USB devices and HID usage types. The USB specification defines which keys to include
when matching your driver to a USB device. For information about the specific key combinations,
see Universal Serial Bus Common Class Specification at https://www.usb.org.
init
Handles the basic initialization of the event service.
Start
Starts the current device service and associates it with the specified provider object.
handleStart
Performs any custom initialization associated with starting the device service.
Stop
Stops the device service associated with the specified provider.
free
Performs any final cleanup for the service.
newDeviceDescription
Creates and returns a new dictionary that describes the HID device.
Topics
Running the Service
Getting the Device Description


## Page 8

newReportDescriptor
Returns the data in the HID device’s report descriptor.
getReport
Gets a report from the HID device.
getReport
Gets a report from the HID device.
setReport
Sends a report to the HID device.
initInputReport
Starts reading the input report from the device.
CompleteInputReport
Processes the results of an asynchronous request for an input report.
scheduleInputReportRetry
Retries a previous request for an input report.
cancelInputReportRetry
Cancels a retry attempt for an input report request.
TimerOccurred
Handles timeout-related actions when retrying input report requests.
setProtocol
Sets the active protocol to use for communicating with the USB device.
setIdle
Sets the device’s idle time.
setIdlePolicy
Sets the amount of idle time that must pass before suspending the device.
setProperty
Managing Device Reports
Configuring the Device


## Page 9

Updates the specified property on the corresponding kernel object.
reset
Resets the USB device.
USBIdlePolicyType
Constants that specify whether to apply the idle policy to an interface or pipe.
initPipes
getHIDDescriptorInfo
CompleteZLP
copyStringAtIndex
CompleteOutputReport
CompleteOutputRequest
getAction
isBulkPipeSupported
returnAction
IOUserHIDDevice
Configuring Private Settings
Instance Methods
Relationships
Inherits From
See Also
Providers


## Page 10

com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
system.
IOHIDInterface
A provider object for a HID device’s interface.
IOUserHIDDevice
A provider object for devices that support interactions with users.
IOHIDDevice
An object containing the low-level behavior for all HID device providers.


## Page 11

An IOUserHIDDevice represents a low-level interface for managing your HID device’s hardware
Subclass IOUserHIDDevice when you need to initialize your hardware or set up its transport
layer in a specific way. This class provides only basic information about the device, and you are
responsible for managing most interactions.
Note
Subclass IOUserUSBHostHIDDevice, instead of this class, when you want to customize
Apple’s default implementation for USB-based HID devices.
When you subclass IOUserHIDDevice, update the IOKitPersonalities key of your driver
extension’s Info.plist file with information to match your driver to appropriate hardware. For
this class, always include the keys and values in the following table.
Key
Discussion
IOClass
The value AppleUserHIDDevice.
Overview
Specify the Driver’s Personality Information
HIDDriverKit / IOUserHIDDevice
Class
IOUserHIDDevice
A provider object for devices that support interactions with users.
DriverKit
macOS


## Page 12

Key
Discussion
IOProviderClass
The provider class information. For a USB-based HID device, specify
IOUSBHostInterface.
IOUserClass
The name of your custom subclass.
CFBundle
Identifier
The bundle identifier of your driver.
You may add other keys to assist with the matching process. For example, you might include the
VendorID, ProductID, PrimaryUsagePage, and PrimaryUsage keys to match against
specific USB devices and HID usage types. The USB specification defines which keys to include
when matching your driver to a USB device. For information about the specific key combinations,
see Universal Serial Bus Common Class Specification at https://www.usb.org.
handleStart
Performs any custom initialization associated with starting the device service.
Start
Starts the device service and associates it with the specified provider object.
newDeviceDescription
Creates and returns a new dictionary that describes the HID device.
newReportDescriptor
Returns the data in the HID device’s report descriptor.
Topics
Running the Service
Getting the Device Description
Managing Device Reports
Relationships


## Page 13

IOHIDDevice
IOUserUSBHostHIDDevice
com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
system.
IOHIDInterface
A provider object for a HID device’s interface.
IOUserUSBHostHIDDevice
A provider object for USB devices that support HID interactions.
IOHIDDevice
An object containing the low-level behavior for all HID device providers.
Inherits From
Inherited By
See Also
Providers


## Page 14

IOHIDDevice is the abstract base class for provider objects that represent a human interface
device. This class defines the basic interface that subclasses use to manage reports. Don’t create
instances of this class directly. Instead, subclass IOUserHIDDevice or IOUserUSBHost
HIDDevice to define the behavior of your custom device provider.
handleReport
Handles an asynchronous report received from the HID device.
getReport
Gets a report from the HID device.
setReport
Sends a report to the HID device.
CompleteReport
Completes all async requests made when getting or setting a report.
Overview
Topics
Processing Device Reports
HIDDriverKit / IOHIDDevice
Class
IOHIDDevice
An object containing the low-level behavior for all HID device providers.
DriverKit
macOS


## Page 15

Report Options
The enumerated report options.
setProperty
Updates the specified property on the corresponding kernel object.
IOService
IOUserHIDDevice
com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
system.
IOHIDInterface
A provider object for a HID device’s interface.
IOUserUSBHostHIDDevice
A provider object for USB devices that support HID interactions.
IOUserHIDDevice
A provider object for devices that support interactions with users.
Setting Device Properties
Relationships
Inherits From
Inherited By
See Also
Providers


## Page 16



