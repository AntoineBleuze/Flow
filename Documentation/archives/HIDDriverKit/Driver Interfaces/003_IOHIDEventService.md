# 003_IOHIDEventService.pdf

## Page 1

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


## Page 2

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


## Page 3

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


