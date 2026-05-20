# 002_HIDDeviceManager_DeviceMatchingCriteria.pdf

## Page 1

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


## Page 2

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


## Page 3

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


