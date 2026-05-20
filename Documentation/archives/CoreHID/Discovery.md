# Discovery.pdf

## Page 1

To interact with a human interface device (HID), you must identify what devices are available on
your system. The hidutil command is a human interface device utility that you can use to prob
a Mac for HID devices, monitor HID events, and to obtain device reports. Run hidutil list in
Terminal (/Applications/Utilities) to receive a list of HID devices. The Devices portion o
the output is relevant for discovering available human interface devices.
Overview
Core HID / Discovering HID devices from Terminal
Article
Discovering HID devices from Terminal
Identify devices connected to your Mac from the command line.


## Page 2

There are multiple entries with similar product names. Some products register as multiple devices
to segment functionality that you match and interact with individually. For example, a device may
have a keyboard and trackpad in the same form factor, but declare them as two separate
components.
The UsagePage column contains the usage page, which is a category of broad functionality. In th
above output, the usage page is either 1 or 65280. According to HID Usage Tables for Universal
Serial Bus (USB), 65280 (0xFF00) is a vendor-defined page and is reserved for the vendor to
use as they see fit; therefore, ignore any entries with this page. Usage page 1 is the Generic
Desktop page. Because both a keyboard and a mouse are Generic Desktop devices, you must
further refine the search by examining the usage value.
Values in the Usage column relate to a category of specific functionality. In the output above, item
with a usage page of 1 have a usage value of 2 or 6, defined as a mouse or keyboard, respectivel
according to HID Usage Tables for Universal Serial Bus (USB).
actor HIDDeviceManager
A helper for discovering human interface devices (HID) connected to the system.
struct DeviceMatchingCriteria
Matching criteria used to filter HID devices.
See Also
Discovery


## Page 3

Communicating with human interface devices
Use this class to specify matching criteria to filter all of the discoverable devices connected to the
system into devices of interest. This is the main method of receiving a HIDDeviceClient
.DeviceReference used to create a HIDDeviceClient.
Matching criteria are specified by creating HIDDeviceManager.DeviceMatchingCriteria
and passing them to monitorNotifications(matchingCriteria:). References to device
that match the criteria are received using HIDDeviceManager.Notification.device
Matched(_:) notifications.
init()
Creates a matching service for HID devices.
Mentioned in
Overview
Topics
Create a device manager
Core HID / HIDDeviceManager
Class
HIDDeviceManager
A helper for discovering human interface devices (HID) connected to the system.
macOS 15.0+


## Page 4

func monitorNotifications(matchingCriteria: [HIDDeviceManager.Device
MatchingCriteria]) -> AsyncThrowingStream<HIDDeviceManager.Notification
any Error>
Creates an asynchronous stream that receives notifications for devices of interest.
enum Notification
Notifications for HID devices.
struct DeviceMatchingCriteria
Matching criteria used to filter HID devices.
Actor
Copyable
Equatable
Hashable
Sendable
SendableMetatype
Discovering HID devices from Terminal
Identify devices connected to your Mac from the command line.
struct DeviceMatchingCriteria
Monitor device notifications
Structures
Relationships
Conforms To
See Also
Discovery


## Page 5

Matching criteria used to filter HID devices.


## Page 6

Communicating with human interface devices
Use this class to filter the HID devices on the system using common properties, such as
HIDUsage. All matching parameters are specified using init(primaryUsage:deviceUsages
vendorID:productID:transport:product:manufacturer:modelNumber:version
Number:serialNumber:uniqueID:locationID:localizationCode:isBuiltIn:extr
Properties:).
Uncommon criteria not available as properties can be specified in the extraProperties
parameter of init.
Mentioned in
Overview
Topics
Initializers
Core HID / HIDDeviceManager / HIDDeviceManager.DeviceMatchingCriteria
Structure
HIDDeviceManager.DeviceMatching
Criteria
Matching criteria used to filter HID devices.
macOS 15.0+


## Page 7

init(primaryUsage: HIDUsage?, deviceUsages: [HIDUsage]?, vendorID:
UInt32?, productID: UInt32?, transport: HIDDeviceTransport?, product:
String?, manufacturer: String?, modelNumber: String?, versionNumber:
UInt64?, serialNumber: String?, uniqueID: String?, locationID: UInt64?,
localizationCode: HIDDeviceLocalizationCode?, isBuiltIn: Bool?, extra
Properties: Dictionary<String, AnyObject>?)
Creates one set of matching criteria for HID devices.
var deviceUsages: [HIDUsage]?
A list of usages supported by the device.
var isBuiltIn: Bool?
A Boolean value that indicates whether the device is built-in to the system or external.
var localizationCode: HIDDeviceLocalizationCode?
A localization code that specifies the HID compliant localization code.
var locationID: UInt64?
The location ID for the device.
var manufacturer: String?
The manufacturer of the device.
var modelNumber: String?
The model number for the device.
var primaryUsage: HIDUsage?
The HID specification compliant usage for the device.
var product: String?
The product name for the device.
var productID: UInt32?
The product ID for the device.
var serialNumber: String?
The serial number of the device.
var transport: HIDDeviceTransport?
The data transport for the device.
Instance Properties


## Page 8

var uniqueID: String?
A unique ID for the device.
var vendorID: UInt32?
The vendor ID for the device.
var versionNumber: UInt64?
The version of the device.
Sendable, SendableMetatype
Discovering HID devices from Terminal
Identify devices connected to your Mac from the command line.
actor HIDDeviceManager
A helper for discovering human interface devices (HID) connected to the system.
Relationships
Conforms To
See Also
Discovery


