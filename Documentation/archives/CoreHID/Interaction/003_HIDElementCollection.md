# 003_HIDElementCollection.pdf

## Page 1

Collections are a defined part of the HID specification to specify how groupings of data relate to
each other, and provide an overall structure for the organization of device functionality.
See the HID specification for more details: https://www.usb.org/hid.
var childCollections: [HIDElementCollection]
The collections contained by this collection, if there are any.
var childElements: [HIDElement]
The elements contained by this collection, if there are any.
var client: HIDDeviceClient
The client for the device with which this collection is associated.
var parentCollection: HIDElementCollection?
The collection that contains this collection, if there is one.
Overview
Topics
Instance Properties
Core HID / HIDElementCollection
Structure
HIDElementCollection
A collection of items from a report descriptor for a HID device.
macOS 15.0+


## Page 2

var type: HIDElementCollection.CollectionType
The type of this collection.
var usage: HIDUsage
The HID specification compliant usage for this collection.
enum CollectionType
Types of HIDElementCollections.
Copyable
CustomStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
Communicating with human interface devices
Interact with and obtain data from devices such as keyboards and mice.
actor HIDDeviceClient
A client of a physical or virtual HID compatible peripheral.
struct HIDElement
A representation of an item from a report descriptor for a HID device.
struct Value
Enumerations
Relationships
Conforms To
See Also
Interaction


## Page 3

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
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


