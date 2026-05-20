# Interaction.pdf

## Page 1

To communicate with a human interface device (HID), you must identify and match it using a set o
matching critiera. When you match the device, you become its client and can query its properties
and capabilities.
Note
Interacting with certain HIDs, such as keyboards, require user approval. Ensure that you grant
permission to access the device to use it.
To locate the device you’re interested in, specify a set of matching criteria using HIDDevice
Manager.DeviceMatchingCriteria. The following code uses this method to discover the
Magic Keyboard with Numeric Keypad product:
Create a HIDDeviceManager and provide the criteria to monitorNotifications(matching
Criteria:). Notifications arrive immediately for connected devices, and later when newly
connected matching devices appear. monitorNotifications returns an asynchronous stream
that you iterate over. The loop awaits and releases the current Task until a notification comes in.
Overview
Locate the device of interest
Core HID / Communicating with human interface devices
Article
Communicating with human interface
devices
Interact with and obtain data from devices such as keyboards and mice.


## Page 2

To specify matching criteria using additional properties, see init(primaryUsage:device
Usages:vendorID:productID:transport:product:manufacturer:modelNumber:
versionNumber:serialNumber:uniqueID:locationID:localizationCode:isBuilt
In:extraProperties:).
Create a HIDDeviceClient and pass in the device reference to start communication with the
device. Verify that you’re communicating with the correct device by checking the usage with
primaryUsage, the transport with transport, and the product name with product.
Communicate with the device


## Page 3

Obtain the device’s input report using dispatchGetReportRequest(type:id:timeout:).
Specify HIDReportType.input for the type, and provide the appropriate HIDReportID. This
method initiates a get report request to the device over Bluetooth and returns the device’s
response.
Monitor the device for input reports or other notifications by calling monitor
Notifications(reportIDsToMonitor:elementsToMonitor:):


## Page 4

Raw reports provide detailed information about data going to and from the device; however, this
can generate more detail than you need. Instead, use HIDElement to obtain specific information
from a device.
For the keyboard in this example, the input report contains the report ID, status of the modifier
keys, the currently pressed keys, vendor defined data and padding. To obtain just the state of the
Shift key, obtain the corresponding element.
With leftShiftKey, monitor HIDDeviceClient.Notification.element
Updates(values:) for any changes using HIDElement.Value. Values also arrive as a byte
stream in bytes, but are interpretable as integers using extensions such as integerValue(as
TypeTruncatingIfNeeded:). Because the Shift key state is 1 bit, treat it as a UInt8.
Use HIDElement with get and set reports through updateElements(_:timeout:). This take
HIDElement from HIDDeviceClient.RequestElementUpdate and HIDDeviceClient
.ProvideElementUpdate, then issues get and set reports with the raw report data in the
background.
The following example creates a unit test for the keyboard. It turns off the Caps Lock LED, queries
the state of the left Shift key, turns on the Caps Lock LED, then queries the state of the left Shift


## Page 5

key again to determine if toggling the LED alters the state of the left Shift key.
actor HIDDeviceClient
A client of a physical or virtual HID compatible peripheral.
See Also
Interaction


## Page 6

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
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

The localization codes that some HID devices declare to specify conformance to a certain
format or language.


## Page 13

Communicating with human interface devices
A HIDElement is an abstraction for the data in a HID report, and represents one item of data tha
could be sent or received in a report for a specific device. For example, for a mouse with a report
descriptor that declares a report with 1 byte of data for each an X and a Y coordinate, there would
be an element for the data associated with the X coordinate. If this element was monitored by a
HIDDeviceClient, when an input report was received with an update to the X coordinate, a
notification with the updated data would be sent to HIDDeviceClient.Notification
.elementUpdates(values:).
Elements are only received by requesting the elements for a specific device through a client’s
elements property.
See the HID specification for more details: https://www.usb.org/hid.
Mentioned in
Overview
Topics
Structures
Core HID / HIDElement
Structure
HIDElement
A representation of an item from a report descriptor for a HID device.
macOS 15.0+


## Page 14

struct Value
Data associated with a HID element.
var client: HIDDeviceClient
The client for the device with which this element is associated.
var logicalMaximum: Int64?
The logical maximum for this element’s data.
var logicalMinimum: Int64?
The logical minimum for this element’s data.
var parentCollection: HIDElementCollection
The HIDElementCollection that contains this element.
var physicalMaximum: Int64?
The physical maximum for this element’s data.
var physicalMinimum: Int64?
The physical minimum for this element’s data.
var reportID: HIDReportID?
The report ID for the report that contains this element.
var reportSize: UInt32
The size in bits of the data for this element.
var type: HIDReportType
The type of this element.
var unit: UInt32?
The HID specification compliant unit code for this element.
var unitExponent: Int8?
The calculated exponent for this element.
var usage: HIDUsage
The HID specification compliant usage for this element.
Instance Properties


## Page 15

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
Relationships
Conforms To
See Also
Interaction


## Page 16

enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

Communicating with human interface devices
Elements can have data associated with them. This data could be received as an update from the
device to indicate user interaction, or could be provided to the device to alter functionality, such a
turning on an LED. As the data for an element could be constantly changing, values should be see
as a snapshot of the element’s data at a specific time, and not valid at any other times.
Element values can be received by a HIDDeviceClient using HIDDeviceClient
.Notification.elementUpdates(values:) after the device issues an input report, or
requested from the device by providing a HIDDeviceClient.RequestElementUpdate to
updateElements(_:timeout:). Element values can be sent to a device by providing a
HIDDeviceClient.ProvideElementUpdate to updateElements(_:timeout:).
Mentioned in
Overview
Topics
Create a HID element from a value
Core HID / HIDElement / HIDElement.Value
Structure
HIDElement.Value
Data associated with a HID element.
macOS 15.0+


## Page 21

init(element: HIDElement, fromBytes: Data, timestamp: SuspendingClock.
Instant)
Creates a value for an HID element.
init?<FloatingPointType>(element: HIDElement, fromPhysicalValue:
FloatingPointType, timestamp: SuspendingClock.Instant)
Creates a HID element value from a physical value.
init?<IntegerType>(element: HIDElement, fromLogicalValueTruncatingIf
Needed: IntegerType, timestamp: SuspendingClock.Instant)
Creates a HID element value from a logical value.
init<IntegerType>(element: HIDElement, fromIntegerTruncatingIfNeeded:
IntegerType, timestamp: SuspendingClock.Instant)
Creates an HID element value from an integer.
var element: HIDElement
The HIDElement associated with this value.
var bytes: Data
The data as an array of bytes.
func integerValue<IntegerType>(asTypeTruncatingIfNeeded: IntegerType
.Type) -> IntegerType
The raw value of the data cast as an integer type, with no transformations applied.
func logicalValue<IntegerType>(asTypeTruncatingIfNeeded: IntegerType
.Type) -> IntegerType?
The raw value of the data cast as an integer type and bound by the HIDElement’s logical
minimum and logical maximum values.
func physicalValue<IntegerType, FloatingType>(fromTypeTruncatingIfNeede
: IntegerType.Type, as: FloatingType.Type) -> FloatingType?
The logical value of the data, shifted and scaled by the HIDElement’s physical minimum,
physical maximum and exponent.
var timestamp: SuspendingClock.Instant
The time that this data was received by the system.
Get element data and values


## Page 22

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
struct HIDElementCollection
A collection of items from a report descriptor for a HID device.
protocol HIDElementUpdate
A base protocol for element update types.
enum HIDReportType
Types for HID reports.
struct HIDReportID
A type to represent the report IDs of HID reports.
enum HIDUsage
A type to represent HID usage pages.
Relationships
Conforms To
See Also
Interaction


## Page 23

enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


## Page 24

Not intended to be used directly, see HIDDeviceClient.ProvideElementUpdate and
HIDDeviceClient.RequestElementUpdate.
Equatable
Hashable
Sendable
SendableMetatype
HIDDeviceClient.ProvideElementUpdate, 
HIDDeviceClient.RequestElementUpdate
Overview
Relationships
Inherits From
Conforming Types
Core HID / HIDElementUpdate
Protocol
HIDElementUpdate
A base protocol for element update types.
macOS 15.0+


## Page 25

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
See Also
Interaction


## Page 26

For more details, see Human Interface Devices (HID) Specifications and Tools.
case feature
A feature report is bidirectional configuration data, typically used to alter device or software
functionality.
case input
An input report is data dispatched from the device to the system, typically sent in response t
human interaction with one of the device controls.
case output
An output report is data sent from the system to the device, typically used to set a device
control.
Overview
Topics
Enumeration Cases
Core HID / HIDReportType
Enumeration
HIDReportType
Types for HID reports.
macOS 15.0+


## Page 27

Copyable
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
struct HIDElementCollection
A collection of items from a report descriptor for a HID device.
struct Value
Data associated with a HID element.
protocol HIDElementUpdate
A base protocol for element update types.
struct HIDReportID
A type to represent the report IDs of HID reports.
enum HIDUsage
A type to represent HID usage pages.
Relationships
Conforms To
See Also
Interaction


## Page 28

enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.


## Page 29

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


## Page 30

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


## Page 31

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


## Page 32

A HID usage page combines with a HID usage to specify the intended functionality for the
associated item. Associated items can be descriptors, devices, reports, report data, elements, etc
Currently unsupported cases can be used as HIDUsage.generic(_:_:), but may be added as
supported cases later.
For more details, see Human Interface Devices (HID) Specifications and Tools.
case arcade(HIDUsage.ArcadeUsage?)
case auxiliaryDisplay(HIDUsage.AuxiliaryDisplayUsage?)
case barcodeScanner(HIDUsage.BarcodeScannerUsage?)
case batterySystem(HIDUsage.BatterySystemUsage?)
case brailleDisplay(HIDUsage.BrailleDisplayUsage?)
case button(UInt16?)
Overview
Topics
Enumeration Cases
Core HID / HIDUsage
Enumeration
HIDUsage
A type to represent HID usage pages.
macOS 15.0+


## Page 33

case cameraControl(HIDUsage.CameraControlUsage?)
case consumer(HIDUsage.ConsumerUsage?)
case digitizers(HIDUsage.DigitizersUsage?)
case eyeAndHeadTrackers(HIDUsage.EyeAndHeadTrackersUsage?)
case fidoAlliance(HIDUsage.FIDOAllianceUsage?)
case gameControls(HIDUsage.GameControlsUsage?)
case generic(UInt16, UInt16?)
case genericDesktop(HIDUsage.GenericDesktopUsage?)
case genericDeviceControls(HIDUsage.GenericDeviceControlsUsage?)
case haptics(HIDUsage.HapticsUsage?)
case keyboardOrKeypad(HIDUsage.KeyboardOrKeypadUsage?)
case led(HIDUsage.LEDUsage?)
case lightingAndIllumination(HIDUsage.LightingAndIlluminationUsage?)
case magneticStripeReader(HIDUsage.MagneticStripeReaderUsage?)
case medicalInstrument(HIDUsage.MedicalInstrumentUsage?)
case monitor(HIDUsage.MonitorUsage?)
case monitorEnumerated(UInt16?)
case ordinal(UInt16?)
case physicalInputDevice(HIDUsage.PhysicalInputDeviceUsage?)
case power(HIDUsage.PowerUsage?)
case scales(HIDUsage.ScalesUsage?)
case sensors(HIDUsage.SensorsUsage?)
case simulationControls(HIDUsage.SimulationControlsUsage?)
case soc(HIDUsage.SOCUsage?)
case sportControls(HIDUsage.SportControlsUsage?)
case telephonyDevice(HIDUsage.TelephonyDeviceUsage?)
case vesaVirtualControls(HIDUsage.VESAVirtualControlsUsage?)
case vrControls(HIDUsage.VRControlsUsage?)


## Page 34

init(page: UInt16, usage: UInt16?)
Creates a HID usage page from raw page and usage values.
var page: UInt16
The usage page value.
var usage: UInt16?
The usage value.
enum ArcadeUsage
enum AuxiliaryDisplayUsage
enum BarcodeScannerUsage
enum BatterySystemUsage
enum BrailleDisplayUsage
enum ButtonUsage
enum CameraControlUsage
enum ConsumerUsage
enum DigitizersUsage
enum EyeAndHeadTrackersUsage
enum FIDOAllianceUsage
enum GameControlsUsage
enum GenericDesktopUsage
enum GenericDeviceControlsUsage
enum HapticsUsage
enum KeyboardOrKeypadUsage
Initializers
Instance Properties
Enumerations


## Page 35

enum LEDUsage
enum LightingAndIlluminationUsage
enum MagneticStripeReaderUsage
enum MedicalInstrumentUsage
enum MonitorEnumeratedUsage
enum MonitorUsage
enum OrdinalUsage
enum PhysicalInputDeviceUsage
enum PowerUsage
enum SOCUsage
enum ScalesUsage
enum SensorsUsage
enum SimulationControlsUsage
enum SportControlsUsage
enum TelephonyDeviceUsage
enum VESAVirtualControlsUsage
enum VRControlsUsage
Copyable
CustomStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 36

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
A base protocol for element update types.
enum HIDReportType
Types for HID reports.
struct HIDReportID
A type to represent the report IDs of HID reports.
enum HIDDeviceError
Errors that the framework can throw.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.
See Also
Interaction


## Page 37

case aborted
The request was aborted.
case badArgument
The request contains an inappropriate argument.
case busy
The device is busy.
case deviceError
There was an error with the device that couldn’t be further determined.
case exclusiveAccess
Another client posesses exclusive access to this device.
case ioError
An input/output error occurred between the host and the device.
case messageTooLarge
The data provided to a function was too large for the device to handle.
Topics
Enumeration Cases
Core HID / HIDDeviceError
Enumeration
HIDDeviceError
Errors that the framework can throw.
macOS 15.0+


## Page 38

case noPower
The device isn’t powered.
case noResources
The device doesn’t have the resources required to handle this request.
case notPermitted
The client isn’t permitted to make this request with the provided arguments.
case notPrivileged
The client doesn’t have the privileges required to make this request.
case notReady
The device isn’t ready for this request.
case notResponding
The device isn’t responding.
case timeout
The request timed out.
case unknown(Int32)
A catch-all for uncommon errors.
case unsupported
The request with the provided arguments isn’t supported.
Equatable
Error
LocalizedError
Sendable
SendableMetatype
Relationships
Conforms To
See Also


## Page 39

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
A base protocol for element update types.
enum HIDReportType
Types for HID reports.
struct HIDReportID
A type to represent the report IDs of HID reports.
enum HIDUsage
A type to represent HID usage pages.
enum HIDDeviceTransport
Common transport types that transmit data to or from a HID device.
enum HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to a certain
format or language.
Interaction


## Page 40

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


## Page 41

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


## Page 42

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


## Page 43

This maps to the optional bCountryCode value in the HID descriptor.
For more details, see Human Interface Devices (HID) Specifications and Tools.
case arabic
This maps to Arabic in the HID specification.
case belgium
This maps to Belgian in the HID specification.
case canada
This maps to Canadian-bilingual in the HID specification.
case canadaFrench
This maps to Canadian-French in the HID specification.
Overview
Topics
Enumeration Cases
Core HID / HIDDeviceLocalizationCode
Enumeration
HIDDeviceLocalizationCode
The localization codes that some HID devices declare to specify conformance to 
certain format or language.
macOS 15.0+


## Page 44

case chineseZhuyin
This maps to Taiwan in the HID specification.
case czechia
This maps to Czech Republic in the HID specification.
case denmark
This maps to Danish in the HID specification.
case finland
This maps to Finnish in the HID specification.
case france
This maps to France in the HID specification.
case germany
This maps to German in the HID specification.
case greece
This maps to Greek in the HID specification.
case hebrew
This maps to Hebrew in the HID specification.
case hungary
This maps to Hungary in the HID specification.
case italy
This maps to Italian in the HID specification.
case japan
This maps to Japan (Katakana) in the HID specification.
case korea
This maps to Korean in the HID specification.
case latinAmerica
This maps to Latin America in the HID specification.
case netherlands
This maps to Netherlands/Dutch in the HID specification.
case norway


## Page 45

This maps to Norwegian in the HID specification.
case persian
This maps to Persian (Farsi) in the HID specification.
case poland
This maps to Poland in the HID specification.
case portugal
This maps to Portuguese in the HID specification.
case russia
This maps to Russia in the HID specification.
case slovakia
This maps to Slovakia in the HID specification.
case spain
This maps to Spanish in the HID specification.
case sweden
This maps to Swedish in the HID specification.
case switzerland
This maps to Switzerland in the HID specification.
case switzerlandFrench
This maps to Swiss/French in the HID specification.
case switzerlandGerman
This maps to Swiss/German in the HID specification.
case turkeyQWERTY
This maps to Turkish-Q in the HID specification.
case turkeyStandard
This maps to Turkish-F in the HID specification.
case unitedKingdom
This maps to UK in the HID specification.
case unitedStates
This maps to US in the HID specification.


## Page 46

case unitedStatesISO
This maps to International (ISO) in the HID specification.
case unsupported
This maps to Not Supported in the HID specification.
case yugoslavia
This maps to Yugoslavia in the HID specification.
Copyable
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
struct HIDElementCollection
A collection of items from a report descriptor for a HID device.
struct Value
Data associated with a HID element.
Relationships
Conforms To
See Also
Interaction


## Page 47

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


