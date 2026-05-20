# 010_HIDDeviceTransport.pdf

## Page 1

If a device declares an uncommon transport, the HIDDeviceTransport.unknown(_:) case is
used with the associated raw string value.
case aid
case airPlay
case bluetooth
case bluetoothAACP
case bluetoothLowEnergy
case fifo
case i2c
case iap
Overview
Topics
Enumeration Cases
Core HID / HIDDeviceTransport
Enumeration
HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
macOS 15.0+


## Page 2

case inductiveInBand
case serial
case spi
case spu
case unknown(String)
case usb
case virtual
Equatable, Sendable, SendableMetatype
Communicating with human interface devices
Interact with and obtain data from devices such as keyboards and mice.
actor HIDDeviceClient
A client of a physical or virtual HID compatible peripheral.
struct HIDElement
A representation of an item from a report descriptor for a HID device.
struct HIDElementCollection
A collection of items from a report descriptor for a HID device.
struct Value
Data associated with a HID element.
protocol HIDElementUpdate
Relationships
Conforms To
See Also
Interaction


## Page 3

A base protocol for element update types.
enum HIDReportType
Types for HID reports.
struct HIDReportID
A type to represent the report IDs of HID reports.
enum HIDUsage
A type to represent HID usage pages.
enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


