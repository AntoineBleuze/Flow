# 001_HIDVirtualDevice.pdf

## Page 1

Creating virtual devices
A HID device is a computer peripheral intended to provide direction to the system from human
input. The specification is a broad, industry-wide standard maintained by the USB Implementers
Forum.
A HIDVirtualDevice is an object that emulates a HID device connected to the system, withou
the need for a physical device. Such a tool can be used by an app to emulate a keyboard and
dispatch HID reports to the system using dispatchInputReport(data:timestamp:) that
signify key strokes, and could be received by a HIDDeviceClientlistening for such activity in
other apps. The virtual device can also receive requests from the system using its HIDVirtual
DeviceDelegate.
init?(properties: HIDVirtualDevice.Properties)
Mentioned in
Overview
Topics
Create a HID virtual device
Core HID / HIDVirtualDevice
Class
HIDVirtualDevice
A virtual service to emulate a HID device connected to the system.
macOS 15.0+


## Page 2

Creates a virtual HID device.
let deviceReference: HIDDeviceClient.DeviceReference
The reference to the virtual HID device.
func activate(delegate: any HIDVirtualDeviceDelegate)
Activate a newly created virtual device to begin receiving notifications and enable
functionality.
func dispatchInputReport(data: Data, timestamp: SuspendingClock.Instant
async throws
Dispatch an input report to the system.
struct Properties
The properties for a virtual HID device.
var hidDevice: IOHIDUserDevice?
Actor
Copyable
CustomStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
Dispatch input reports
Structures
Instance Properties
Relationships
Conforms To


## Page 3

Creating virtual devices
Use and interact with a virtual human interface device for testing and development.
protocol HIDVirtualDeviceDelegate
The delegate to receive notifications for a virtual HID device.
struct Properties
The properties for a virtual HID device.
See Also
Simulation


