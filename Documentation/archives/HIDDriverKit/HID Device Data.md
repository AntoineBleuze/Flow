# HID Device Data.pdf

## Page 1

An IOHIDElement object contains details about a particular aspect of a HID-related input report
After receiving an input report from a HID device, IOUserHIDEventService and
IOHIDInterface objects divide the report details into IOHIDElement objects for easier
management. You use these element objects to obtain details about the report, such as the curre
value reported by the device, how that value is meant to be used, and the minimum and maximum
values. For example, a report from a mouse usually contains separate elements for the mouse’s x
and y positions.
You don’t create IOHIDElement objects directly. Instead, use the getElements method of you
IOUserHIDEventService or IOHIDInterface object to fetch the elements associated with
the latest report. Each time you call that method, the corresponding object updates the element
data using the most recent report.
getUsagePage
getUsage
Overview
Topics
Getting an Element’s Usage Information
HIDDriverKit / IOHIDElement
Class
IOHIDElement
An object that contains parsed information from a HID input report.
DriverKit
macOS


## Page 2

getValue
Gets the logical value that the device reported.
getDataValue
Gets the data value.
getScaledValue
Returns a scaled version of the logical value.
getScaledFixedValue
Returns a fixed number that represents the scaled version of the element’s logical value.
setValue
Sets the value of the element.
setDataValue
Sets the data value of the element.
getUnit
Returns the units that you use to interpret the element’s value.
getUnitExponent
Returns the exponent that you use to interpret the element’s value.
IOHIDValueOptions
A type for specifying value-related options.
Value Options
Options for how to retrieve an element’s values.
IOHIDValueScaleType
The type of scaling to use for an element’s value.
Value Scale Types
The different types of scaling that you can perform on element values.
getLogicalMin
Accessing the Element’s Value
Getting Minimum and Maximum Values


## Page 3

getLogicalMax
getPhysicalMin
getPhysicalMax
getTimeStamp
getType
getCollectionType
getChildElements
getParentElement
IOHIDElementType
The types of HID elements that you can examine.
IOHIDElementCollectionType
Constants that indicate the types of relationships that exist between two or more elements.
getReportID
getReportCount
getReportSize
IOHIDReportType
Describes the different types of HID reports.
getCookie
IOHIDElementCookie
A type that an element uses to distinguish itself from other elements.
Getting the Element’s Timestamp
Managing the Element Hierarchy
Getting Report Information
Identifying the Element
Getting the Element Flags


## Page 4

getFlags
IOHIDElementFlags
HID Element Flags
commit
Commits the element value to and from the device.
IOHIDElementCommitDirection
The commit direction for an HID element.
conformsTo
OSContainer
IOHIDDigitizerCollection
A collection of elements that contain digitizer-related data.
com.apple.developer.hid.virtual.device
A Boolean value that indicates whether the driver creates a virtual HID device.
Low-Level Information
Understand the underlying structures that support HID drivers.
Committing Changes to Elements
Instance Methods
Relationships
Inherits From
See Also
HID Device Data


## Page 5



## Page 6

withType
initWithType
free
IOHIDDigitizerCollectionType
getX
getY
getZ
setX
setY
setZ
Topics
Creating a Digitizer Collection
Accessing the Coordinates
Managing the Collection Elements
HIDDriverKit / IOHIDDigitizerCollection
Class
IOHIDDigitizerCollection
A collection of elements that contain digitizer-related data.
DriverKit
macOS


## Page 7

getParentCollection
addElement
getElements
getTouch
setTouch
getType
getInRange
setInRange
OSContainer
IOHIDElement
An object that contains parsed information from a HID input report.
com.apple.developer.hid.virtual.device
A Boolean value that indicates whether the driver creates a virtual HID device.
Low-Level Information
Accessing Touch Data
Getting the Collection Attributes
Relationships
Inherits From
See Also
HID Device Data


## Page 8

Understand the underlying structures that support HID drivers.


## Page 9

Type
Boolean
com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
system.
com.apple.developer.driverkit.family.hid.eventservice
A Boolean value that indicates whether the driver provides a HID-related event service to the
system.
DriverKit Family virtual HID
An entitlement that lets an app create and manage virtual HID devices.
Key: com.apple.developer.driverkit.family.hid.virtual.device
com.apple.developer.driverkit.transport.hid
Details
See Also
Human Interface Device Drivers
Bundle Resources / Entitlements / com.apple.developer.hid.virtual.device
Property List Key
com.apple.developer.hid.virtual.device
A Boolean value that indicates whether the driver creates a virtual HID device.
macOS 10.15+


## Page 10

A Boolean value that indicates whether the driver communicates with human interface
devices.


## Page 11

IOHIDCompletionAction
A function to call when a report operation completes.
IOHIDCompletion
A structure specifying the action to perform when a set/get report completes.
HIDReportCommandType
The type of the report command for a DriverKit driver.
HIDActionType
HIDDriverKitVersionNumber
The project version number for HIDDriverKit.
HIDDriverKitVersionString
The project version string for HIDDriverKit.
Topics
Internal Structures
Version Information
See Also
HIDDriverKit / Low-Level Information
API Collection
Low-Level Information
Understand the underlying structures that support HID drivers.


## Page 12

IOHIDElement
An object that contains parsed information from a HID input report.
IOHIDDigitizerCollection
A collection of elements that contain digitizer-related data.
com.apple.developer.hid.virtual.device
A Boolean value that indicates whether the driver creates a virtual HID device.
HID Device Data


