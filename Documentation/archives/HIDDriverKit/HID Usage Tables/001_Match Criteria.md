# 001_Match Criteria.pdf

## Page 1

When the system detects a new device, it looks for drivers that match the device’s features and
capabilities. You specify the features and capabilities that your driver supports using the IOKit
Personalities key of your driver’s Info.plist file. The IOKitPersonalities key contain
the array of driver personality dictionaries, the keys of which correspond to device-specific
attributes. For example, you might specify the HID usage types that your driver supports.
The keys below are constants defined in the IOHIDDeviceKeys.h header file of HIDDriverKit. T
match against a specific key, include the value of the key in the personality dictionary. For exampl
to match against kIOHIDPrimaryUsageKey, include the PrimaryUsage string in your Info
.plist file.
kIOHIDTransportKey
A key for specifying the transport mechanism of the device.
kIOHIDVendorIDKey
A key for specifying the vendor ID of the device.
kIOHIDProductIDKey
A key for specifying the product identifier of the device.
kIOHIDVersionNumberKey
A key for specifying the version number of the device.
Overview
Topics
Manufacturer Keys
HIDDriverKit / Match Criteria
Match Criteria
Specify the criteria that the system uses to match your driver to a device.


## Page 2

kIOHIDManufacturerKey
A key that specifies the manufacturer of the device.
kIOHIDProductKey
A key that describes the product.
kIOHIDSerialNumberKey
A key that specifies the device's serial number.
kIOHIDCountryCodeKey
A key that specifies the country code or region of the device.
kIOHIDLocationIDKey
A key that specifies the location ID of the device.
kIOHIDDeviceUsageKey
A key that specifies a usage type of the device.
kIOHIDDeviceUsagePageKey
A key that specifies a usage page of the device.
kIOHIDDeviceUsagePairsKey
A key that contains the top-level usages of the device.
kIOHIDPrimaryUsageKey
A key that specifies the primary usage type of the device.
kIOHIDPrimaryUsagePageKey
A key that specifies the primary usage page of the device.
HID Usage Tables
Location Keys
Usage Keys
See Also
HID Usage Tables


## Page 3

Identify the types of data that HID devices can report to your driver.


