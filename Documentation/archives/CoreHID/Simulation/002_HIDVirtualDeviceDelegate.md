# 002_HIDVirtualDeviceDelegate.pdf

## Page 1

Creating virtual devices
A delegate must be created and provided to activate(delegate:) during activation of a virtu
HID device. This delegate receives notifications intended for the device, such as a get report
request from a client. One delegate can be used for many devices.
func hidVirtualDevice(HIDVirtualDevice, receivedSetReportRequestOfType:
HIDReportType, id: HIDReportID?, data: Data) async throws
A notification that a set report request has been received from the system.
Required
func hidVirtualDevice(HIDVirtualDevice, receivedGetReportRequestOfType:
HIDReportType, id: HIDReportID?, maxSize: Int) async throws -> Data
Mentioned in
Overview
Topics
Receive notifications for a device
Core HID / HIDVirtualDeviceDelegate
Protocol
HIDVirtualDeviceDelegate
The delegate to receive notifications for a virtual HID device.
macOS 15.0+


## Page 2

A notification that a get report request has been received from the system.
Required
Sendable, SendableMetatype
Creating virtual devices
Use and interact with a virtual human interface device for testing and development.
actor HIDVirtualDevice
A virtual service to emulate a HID device connected to the system.
struct Properties
The properties for a virtual HID device.
Relationships
Inherits From
See Also
Simulation


