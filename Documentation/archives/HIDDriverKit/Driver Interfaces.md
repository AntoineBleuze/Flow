# Driver Interfaces.pdf

## Page 1

Type
Boolean
com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
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
Bundle Resources / Entitlements / com.apple.developer.driverkit.family.hid.eventservice
Property List Key
com.apple.developer.driverkit.family.hid
.eventservice
A Boolean value that indicates whether the driver provides a HID-related event
service to the system.
macOS 10.15+


## Page 2

A Boolean value that indicates whether the driver creates a virtual HID device.


## Page 3

An IOUserHIDEventDriver object is a fully functional driver that handles many common types
of HID events. This driver parses incoming reports and uses the information to dispatch many typ
of events to the system. Apple provides this driver object as a default implementation for devices
that conform to the HID specifications and don’t include any custom information that requires a
special driver.
You can subclass IOUserHIDEventDriver and add support for other types of events.
Alternatively, you can subclass IOUserHIDEventService and customize how your event servic
processes the report data.
When you subclass IOUserHIDEventDriver, update the IOKitPersonalities key of your
driver extension’s Info.plist file with information to match your driver to appropriate hardware
For this class, always include the keys and values in the following table.
Key
Discussion
IOClass
The value AppleUserHIDEventService.
Overview
Specify the Driver’s Personality Information
HIDDriverKit / IOUserHIDEventDriver
Class
IOUserHIDEventDriver
A complete driver object that dispatches keyboard, digitizer, scrolling, and pointer
events originating from a HID device.
DriverKit
macOS


## Page 4

Key
Discussion
IOProviderClass
The provider class information. For HID interfaces, specify
IOHIDInterface.
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
Starts the current event driver and associates it with the specified provider object.
free
Performs any final cleanup for the service.
parseElements
Parses the specified array of elements.
parsePointerElement
Parses an element to see if it supports pointer usages.
parseDigitizerElement
Parses an element to see if it supports digitizer usages.
parseKeyboardElement
Topics
Running the Driver
Parsing the Element Hierarchy


## Page 5

Parses an element to see if it contains keyboard-related information.
parseScrollElement
Parses an element to see if it supports scroll usages.
parseLEDElement
Parses an element to see if it supports LED usages.
handleReport
Processes the information in a new device report and dispatches any relevant events in
response.
handleKeyboardReport
Iterates through keyboard elements and dispatches them if the element value has been
updated.
handleRelativePointerReport
Iterates through relative pointer elements and dispatches them if the element value has been
updated.
handleAbsolutePointerReport
Iterates through absolute pointer elements and dispatches them if the element value has bee
updated.
handleScrollReport
Iterates through scroll elements and dispatches them if the element value has been updated
handleDigitizerReport
Processes the digitizer elements and dispatches events for any updated values.
createEventForDigitizerCollection
Creates a HID event object that represents a digitizer collection.
SetLED
Sets the state of an LED on the device.
Handling New Data Reports
Configuring LED Lights
Configuring Private Properties


## Page 6

setAccelerationProperties
setSurfaceDimensions
setTipThreshold
SetProperties
calibrateCenteredPreferredStateElement
calibrateJustifiedPreferredStateElement
checkGameControllerElement
copyKeyboardEvent
getButtonStateFromElements
handleCopyMatchingEvent
handleGameControllerReport
handleProximityReport
parseElement
parseGameControllerElement
parseProximityElement
parseRemainingElement
parseRemainingElements
postProcessElements
postProcessElements_internal
processDigitizerElements
processGameControllerElements
setDigitizerProperties
setGameControllerProperties
setKeyboardProperties
setLEDProperties
setRelativeProperties
Instance Methods


## Page 7

setScrollProperties
IOUserHIDEventService
com.apple.developer.driverkit.family.hid.eventservice
A Boolean value that indicates whether the driver provides a HID-related event service to the
system.
IOUserHIDEventService
A service that parses HID report data into elements that you can use to dispatch events.
IOHIDEventService
The base class for implementing a device or operating system service that dispatches event
to the system.
Relationships
Inherits From
See Also
Driver Interfaces


## Page 8

Subclass IOUserHIDEventService when you want to process incoming data from a HID devic
before dispatching it to the system. An event service collects the report from a device, parses it
into individual data elements, and dispatches events based on the information in those elements.
Create a custom event service when you need to synthesize custom event data, or when you nee
to process the existing data before dispatching the corresponding events.
To implement a custom event service, override the handleReport method and use it to iterate
over the report contents and dispatch any relevant events. To get the report data, call the get
Elements method each time a new report arrives. (Also call that method in your service’s Start
method to create the elements initially.) The method returns a set of IOHIDElement objects that
contain a parsed version of the report data. Each time you call the method, the system updates th
elements to incorporate the data from the latest report.
When you subclass IOUserHIDEventService, update the IOKitPersonalities key of you
driver extension’s Info.plist file with information to match your driver to appropriate hardware
For this class, always include the keys and values in the following table.
Overview
Specify the Driver’s Personality Information
HIDDriverKit / IOUserHIDEventService
Class
IOUserHIDEventService
A service that parses HID report data into elements that you can use to dispatch
events.
DriverKit
macOS


## Page 9

Key
Discussion
IOClass
The value AppleUserHIDEventService.
IOProviderClass
The provider class information. For HID interfaces, specify
IOHIDInterface.
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
Starts the current event service and associates it with the specified provider object.
handleStart
Performs additional initialization during the startup of the event service.
Stop
Stops the event service associated with the specified provider.
free
Performs any final cleanup for the service.
getElements
Returns an array of elements that contain the parsed data from the HID device’s report.
Topics
Running the Service
Responding to Input Reports


## Page 10

handleReport
Converts an incoming device report into dispatchable events.
ReportAvailable
Notifies the event service that an updated report is available from the HID device.
dispatchDigitizerStylusEvent
Dispatches a digitizer stylus event to the system.
dispatchDigitizerTouchEvent
Dispatches a digitizer touch event to the system.
conformsTo
Returns a Boolean value that indicates whether the service conforms to the specified HID
usage and page information.
createReportPool
dispatchEvent
Dispatches a HID event to the system.
SetLEDState
SetProperties
dispatchExtendedGameControllerEvent
dispatchExtendedGameControllerEventWithOptionalButtons
dispatchStandardGameControllerEvent
processReport
Dispatching Events to the System
Checking the Supported Usage
Performing Private Tasks
Instance Methods


## Page 11

IOHIDEventService
IOUserHIDEventDriver
com.apple.developer.driverkit.family.hid.eventservice
A Boolean value that indicates whether the driver provides a HID-related event service to the
system.
IOUserHIDEventDriver
A complete driver object that dispatches keyboard, digitizer, scrolling, and pointer events
originating from a HID device.
IOHIDEventService
The base class for implementing a device or operating system service that dispatches event
to the system.
Relationships
Inherits From
Inherited By
See Also
Driver Interfaces


## Page 12

An IOHIDEventService object receives data from a device and generates events for the
operating system to handle. Typically, you implement an event service by subclassing IOUser
HIDEventService, but you may also subclass IOHIDEventService directly if you want to
parse input reports yourself. In both cases, use the methods of this class to send events to the
operating system, which dispatches those events to relevant apps.
dispatchKeyboardEvent
Dispatches a keyboard-related event to the system.
dispatchRelativePointerEvent
Dispatches a relative pointer event to the system.
dispatchAbsolutePointerEvent
Dispatches an absolute pointer event to the system.
Overview
Topics
Dispatching Events
HIDDriverKit / IOHIDEventService
Class
IOHIDEventService
The base class for implementing a device or operating system service that
dispatches events to the system.
DriverKit
macOS


## Page 13

dispatchDigitizerStylusEvent
Dispatches a digitizer stylus event to the system.
dispatchDigitizerTouchEvent
Dispatches a digitizer touch event to the system.
dispatchRelativeScrollWheelEvent
Dispatches a relative scroll wheel event to the system.
dispatchEvent
Dispatches a HID event to the system.
IOHIDKeyboardEventOptions
Options that you use to dispatch keyboard events.
IOHIDPointerEventOptions
Options that you use to dispatch pointer-related events.
IOHIDScrollEventOptions
Options that you use to dispatch scrolling-related events.
SetLED
Configures the on/off state for an LED on the device.
SetLEDState
SetProperties
Start
Stop
free
handleCopyMatchingEvent
init
Configuring the LED Lights
Instance Methods


## Page 14

IOService
IOUserHIDEventService
com.apple.developer.driverkit.family.hid.eventservice
A Boolean value that indicates whether the driver provides a HID-related event service to the
system.
IOUserHIDEventDriver
A complete driver object that dispatches keyboard, digitizer, scrolling, and pointer events
originating from a HID device.
IOUserHIDEventService
A service that parses HID report data into elements that you can use to dispatch events.
Relationships
Inherits From
Inherited By
See Also
Driver Interfaces


