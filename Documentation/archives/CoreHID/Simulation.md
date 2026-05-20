# Simulation.pdf

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


## Page 3

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


## Page 4

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


## Page 5

Creating virtual devices
Use and interact with a virtual human interface device for testing and development.
protocol HIDVirtualDeviceDelegate
The delegate to receive notifications for a virtual HID device.
struct Properties
The properties for a virtual HID device.
See Also
Simulation


## Page 6

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


## Page 7

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


## Page 8

Creating virtual devices
A virtual device has many properties, required and optional, that determine or alter its functionalit
Use this class to provide these properties during the creation of a virtual device.
Uncommon properties that aren’t available can be specified in the extraProperties paramete
of init(descriptor:vendorID:productID:transport:product:manufacturer:
modelNumber:versionNumber:serialNumber:uniqueID:locationID:localization
Code:extraProperties:).
Mentioned in
Overview
Topics
Initializers
Core HID / HIDVirtualDevice / HIDVirtualDevice.Properties
Structure
HIDVirtualDevice.Properties
The properties for a virtual HID device.
macOS 15.0+


## Page 9

init(descriptor: Data, vendorID: UInt32, productID: UInt32?, transport:
HIDDeviceTransport?, product: String?, manufacturer: String?, model
Number: String?, versionNumber: UInt64?, serialNumber: String?, uniqueI
: String?, locationID: UInt64?, localizationCode: HIDDeviceLocalization
Code?, extraProperties: Dictionary<String, AnyObject>?)
Creates a set of properties for a virtual device.
let descriptor: Data
The HID specification compliant report descriptor for the virtual device.
let localizationCode: HIDDeviceLocalizationCode?
A device localization code that specifies the HID compliant localization code.
let locationID: UInt64?
The location ID for the device.
let manufacturer: String?
The manufacturer of the device.
let modelNumber: String?
The model number for the device.
let product: String?
The product name for the device.
let productID: UInt32?
The product ID for the device.
let serialNumber: String?
The serial number for the device.
let transport: HIDDeviceTransport?
The data transport for the device.
let uniqueID: String?
A unique ID for the device.
let vendorID: UInt32
The vendor ID for the device.
let versionNumber: UInt64?
Instance Properties


## Page 10

The version of the device.
Sendable, SendableMetatype
Creating virtual devices
Use and interact with a virtual human interface device for testing and development.
actor HIDVirtualDevice
A virtual service to emulate a HID device connected to the system.
protocol HIDVirtualDeviceDelegate
The delegate to receive notifications for a virtual HID device.
Relationships
Conforms To
See Also
Simulation


