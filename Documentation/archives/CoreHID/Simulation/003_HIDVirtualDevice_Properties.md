# 003_HIDVirtualDevice_Properties.pdf

## Page 1

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


## Page 2

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


## Page 3

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


