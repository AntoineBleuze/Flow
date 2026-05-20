# 000_Creating virtual devices.pdf

## Page 1

A virtual human interface device (HID) is a software implementation of a hardware device. The
system treats the device as any other external peripheral. HIDVirtualDevice models a virtual
device and you communicate with it using HIDDeviceClient. Use a virtual device to transport
data back and forth between other apps without the need for a connected device.
Define the details of a HIDVirtualDevice by passing a set of HIDVirtualDevice
.Properties during creation. You must pass descriptor and vendorID, and specify
additional properties using init(descriptor:vendorID:productID:transport:
product:manufacturer:modelNumber:versionNumber:serialNumber:uniqueID:
locationID:localizationCode:extraProperties:).
The following creates a HIDVirtualDevice that acts as a keyboard:
The virtual device adopts the HIDVirtualDeviceDelegate protocol to process report reques
Clients on the system send set reports and receive get reports to and from this virtual device usin
dispatchSetReportRequest(type:id:data:timeout:) and dispatchGetReport
Request(type:id:timeout:):
Overview
Core HID / Creating virtual devices
Article
Creating virtual devices
Use and interact with a virtual human interface device for testing and
development.


## Page 2

The virtual device can also dispatch input reports to clients. This is similar to a keyboard
dispatching data when a key is pressed.
actor HIDVirtualDevice
A virtual service to emulate a HID device connected to the system.
protocol HIDVirtualDeviceDelegate
The delegate to receive notifications for a virtual HID device.
struct Properties
The properties for a virtual HID device.
See Also
Simulation


