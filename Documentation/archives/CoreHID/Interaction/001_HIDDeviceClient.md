# 001_HIDDeviceClient.pdf

## Page 1

Communicating with human interface devices
Creating virtual devices
A human interface device (HID) is a computer peripheral intended to provide direction to the
system from human input. The specification is a broad, industry-wide standard, maintained by the
USB Implementers Forum. For more details, see Human Interface Devices (HID) Specifications an
Tools.
A HIDDeviceClient is a connection to one HID device on the system. It’s created using a
HIDDeviceClient.DeviceReference, received from a HIDDeviceManager. A HIDDevice
Client.DeviceReference is a simple reference to a specific HID device. The HID peripheral
can be a USB device like a wired mouse, a Bluetooth device like a wireless keyboard, an onboard
sensor like an accelerometer, or even a software based, virtual peripheral created using
HIDVirtualDevice.
A HIDDeviceClient receives device notifications, such as input HID reports that are dispatche
from the device in response to human input (like a keyboard key press) in monitor
Notifications(reportIDsToMonitor:elementsToMonitor:). It sends get and set
reports to the device to retrieve information or configure device functionality using dispatchSe
ReportRequest(type:id:data:timeout:). dispatchGetReportRequest(type:id:
timeout:). It monitors or updates specific pieces of the HID report using HIDElement.
Mentioned in
Overview
Core HID / HIDDeviceClient
Class
HIDDeviceClient
A client of a physical or virtual HID compatible peripheral.
macOS 15.0+


## Page 2

init?(deviceReference: HIDDeviceClient.DeviceReference)
Creates a client for a HID device.
struct DeviceReference
A reference to a HID device on the system.
let deviceReference: HIDDeviceClient.DeviceReference
The reference to the HID device used to create the HID client device.
let descriptor: Data
The HID specification compliant report descriptor for the associated HID device.
let deviceUsages: [HIDUsage]
A convenient list of all the usages that the device supports.
var isBuiltIn: Bool
A Boolean value that determines whether the device is built-in to the system or an external
peripheral.
var localizationCode: HIDDeviceLocalizationCode
A location code that specifies the HID compliant localization code, if there is one.
var locationID: UInt64?
The location ID for the device, if there is one.
var manufacturer: String?
The manufacturer of the device, if known.
var modelNumber: String?
The model number for the device, if known.
let primaryUsage: HIDUsage
The HID specification compliant usage for the device.
Topics
Create a device client
Get device information


## Page 3

var product: String?
The product name for the device, if known.
let productID: UInt32
The product ID for the device.
var serialNumber: String?
The serial number of the device, if known.
var transport: HIDDeviceTransport?
The data transport for the device.
var uniqueID: String?
A unique ID for the device, if there is one.
let vendorID: UInt32
The vendor ID for the device.
var versionNumber: UInt64?
The version of the device, if known.
var elements: [HIDElement]
All HID elements associated with the device.
func dispatchGetReportRequest(type: HIDReportType, id: HIDReportID?,
timeout: Duration?) async throws -> Data
Send a get report request to the device over the transport.
func dispatchSetReportRequest(type: HIDReportType, id: HIDReportID?,
data: Data, timeout: Duration?) async throws
Send a set report request to the device over the transport.
func seizeDevice() throws
Attempt to obtain the device so that this client is the only active client.
func monitorNotifications(reportIDsToMonitor: [ClosedRange<HIDReportID
>], elementsToMonitor: [HIDElement]) -> AsyncThrowingStream<HIDDevice
Client.Notification, any Error>
Interact with the device
Monitor device notifications


## Page 4

Creates an asynchronous that receives notifications about the associated device.
enum Notification
Notifications for a HID device.
func updateElements([any HIDElementUpdate], timeout: Duration?) async -
HIDDeviceClient.HIDElementUpdateResult
Provide new update values for, or request current values from, lists of elements.
struct RequestElementUpdate
A request to pull the current value from a list of HID elements
struct ProvideElementUpdate
A structure that provides values for a list of HID elements.
struct HIDElementUpdateResult
A class to hold the results of an element update.
struct UnsafeProperty
A wrapper around an object to facilitate working with subscripts.
subscript(String) -> HIDDeviceClient.UnsafeProperty?
Get or set a property from the device.
Actor
Copyable
CustomStringConvertible
Equatable
Hashable
Update element values
Structures
Subscripts
Relationships
Conforms To


## Page 5

Sendable
SendableMetatype
Communicating with human interface devices
Interact with and obtain data from devices such as keyboards and mice.
struct HIDElement
A representation of an item from a report descriptor for a HID device.
struct HIDElementCollection
A collection of items from a report descriptor for a HID device.
struct Value
Data associated with a HID element.
protocol HIDElementUpdate
A base protocol for element update types.
enum HIDReportType
Types for HID reports.
struct HIDReportID
A type to represent the report IDs of HID reports.
enum HIDUsage
A type to represent HID usage pages.
enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
See Also
Interaction


## Page 6

The localization codes that some HID devices declare to specify conformance to a certain
format or language.


