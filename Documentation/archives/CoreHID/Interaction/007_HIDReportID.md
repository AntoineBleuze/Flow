# 007_HIDReportID.pdf

## Page 1

Communicating with human interface devices
Report IDs are defined to be 1 byte in the HID specification, and can help identify the reports
received from or sent to a device. Report IDs are optional. If a descriptor only has one report, a
report ID is unnecessary. A report ID of 0 is invalid.
For more details, see Human Interface Devices (HID) Specifications and Tools.
init?(rawValue: UInt8)
Creates a HID report ID.
Mentioned in
Overview
Topics
Initializers
Instance Properties
Core HID / HIDReportID
Structure
HIDReportID
A type to represent the report IDs of HID reports.
macOS 15.0+


## Page 2

var rawValue: HIDReportID.RawValue
The raw value of the report ID.
static let allReports: ClosedRange<HIDReportID>
A convenient definition that represents every possible report ID.
Comparable
Copyable
CustomStringConvertible
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Communicating with human interface devices
Interact with and obtain data from devices such as keyboards and mice.
actor HIDDeviceClient
A client of a physical or virtual HID compatible peripheral.
struct HIDElement
A representation of an item from a report descriptor for a HID device.
struct HIDElementCollection
A collection of items from a report descriptor for a HID device.
Type Properties
Relationships
Conforms To
See Also
Interaction


## Page 3

struct Value
Data associated with a HID element.
protocol HIDElementUpdate
A base protocol for element update types.
enum HIDReportType
Types for HID reports.
enum HIDUsage
A type to represent HID usage pages.
enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


