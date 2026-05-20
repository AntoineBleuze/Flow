# HID Usage Tables.pdf

## Page 1

Usage Pages
The types of behaviors that a HID device may support.
Undefined Usage
A constant that indicates a device’s usage doesn’t correspond to one of the defined behavio
types.
Generic Desktop
Usages related to generic desktop devices, such as mice, joysticks, and keyboards.
Simulations
Usages related to devices that simulate airplane or vehicle controls.
Virtual Reality
Usages related to virtual reality controllers, such as motion trackers for a user’s hand or hea
Sports
Usages for sports-related equipment, such as golf clubs or exercise machines.
Games
Usages for game controllers.
Topics
Essentials
Interaction Types
Devices
HIDDriverKit / HID Usage Tables
HID Usage Tables
Identify the types of data that HID devices can report to your driver.


## Page 2

Generic Device Controls
Usages associated with generic types of device information, such as battery level.
Keyboard or Keypad
Usages related to keyboard and keypad devices.
LEDs
Usages related to the LEDs and other indicators on the device.
Buttons
Usages for devices that contain user-selectable controls.
Ordinals
Usages for custom-defined behaviors on a device.
Telephony
Usages for telephony devices, including telephone keypads and answering machines.
Consumer
Usages for app-specific controls on consumer devices, such as clocks, TVs, and audio
equipment.
Digitizer
Usages for digitizer devices, such as styluses and touch screens.
Physical Interface Device
Usages for devices with actuators or other physical interfaces.
Alphanumeric Display
Usages for alphanumeric displays on consumer devices.
Haptics
FIDO
Braille Device
Sensors
Usages for device sensors, including biometric and electrical sensors.
Bar Code Scanner
Usages for devices that scan bar codes.
Input and Text


## Page 3

Weighing Device
Usages for scales and other devices that measure weights.
Magnetic Stripe Reader
Usages for magnetic striper readers.
Camera Control
Usages for digital cameras.
Power Devices
Usages for devices that measure or track power, such as universal power supplies or
chargers.
Battery System
Usages for devices that manage a battery.
Match Criteria
Specify the criteria that the system uses to match your driver to a device.
Power
See Also
HID Usage Tables


## Page 4

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


## Page 5

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


## Page 6

Identify the types of data that HID devices can report to your driver.


