# IOServicePlane Properties.pdf

## Page 1

static let alternateSetting: IOUSBHostInterfacePropertyKey
The USB interface’s current alternative setting value.
init(rawValue: String)
Creates the structure.
Equatable
Hashable
RawRepresentable
Sendable
Topics
Properties
Initializing the Structure
Relationships
Conforms To
IOUSBHost / IOUSBHostInterfacePropertyKey
Structure
IOUSBHostInterfacePropertyKey
Properties of a USB interface that describe its state.
Mac Catalyst 14.0+
macOS 10.15+


## Page 2

SendableMetatype
struct IOUSBHostDevicePropertyKey
Properties of a USB device that describe its state.
struct IOUSBHostMatchingPropertyKey
Properties for implementing the matching service.
typealias IOUSBHostPropertyKey
Properties that the USB host device and interface classes share.
See Also
IOServicePlane Properties


## Page 3

static let currentConfiguration: IOUSBHostDevicePropertyKey
The device’s current configuration value.
static let containerID: IOUSBHostDevicePropertyKey
The device’s container ID.
static let serialNumberString: IOUSBHostDevicePropertyKey
The device’s serial number as a string.
static let vendorString: IOUSBHostDevicePropertyKey
The device’s vendor name.
typealias IOUSBHostPropertyKey
Properties that the USB host device and interface classes share.
init(rawValue: String)
Topics
Properties
Initializing the Properties
IOUSBHost / IOUSBHostDevicePropertyKey
Structure
IOUSBHostDevicePropertyKey
Properties of a USB device that describe its state.
Mac Catalyst 14.0+
macOS 10.15+


## Page 4

Creates the structure.
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct IOUSBHostInterfacePropertyKey
Properties of a USB interface that describe its state.
struct IOUSBHostMatchingPropertyKey
Properties for implementing the matching service.
typealias IOUSBHostPropertyKey
Properties that the USB host device and interface classes share.
Relationships
Conforms To
See Also
IOServicePlane Properties


## Page 5

static let vendorID: IOUSBHostMatchingPropertyKey
The matching property for the device’s vendor ID.
static let productID: IOUSBHostMatchingPropertyKey
The matching property for the device’s product ID.
static let deviceReleaseNumber: IOUSBHostMatchingPropertyKey
The matching property for the device’s release number.
static let configurationValue: IOUSBHostMatchingPropertyKey
The matching property for the device’s current configuration value.
static let speed: IOUSBHostMatchingPropertyKey
The matching property for the device’s enumeration speed.
static let productIDArray: IOUSBHostMatchingPropertyKey
The matching property on a list of product IDs.
static let productIDMask: IOUSBHostMatchingPropertyKey
The matching property on a mask of product IDs.
Topics
Device Properties
IOUSBHost / IOUSBHostMatchingPropertyKey
Structure
IOUSBHostMatchingPropertyKey
Properties for implementing the matching service.
Mac Catalyst 14.0+
macOS 10.15+


## Page 6

static let interfaceNumber: IOUSBHostMatchingPropertyKey
The matching property for the device’s interface number.
static let interfaceClass: IOUSBHostMatchingPropertyKey
The matching property for the interface’s class ID.
static let interfaceSubClass: IOUSBHostMatchingPropertyKey
The matching property for the interface’s subclass ID.
static let interfaceProtocol: IOUSBHostMatchingPropertyKey
The matching property for the interface’s protocol.
static let deviceProtocol: IOUSBHostMatchingPropertyKey
The matching property for the device’s protocol.
static let deviceClass: IOUSBHostMatchingPropertyKey
The matching property for the device’s class.
static let deviceSubClass: IOUSBHostMatchingPropertyKey
The matching property for the device’s subclass.
init(rawValue: String)
Creates the structure.
Equatable
Hashable
RawRepresentable
Sendable
Interface Properties
Protocol and Class Properties
Initializing the Structure
Relationships
Conforms To


## Page 7

SendableMetatype
struct IOUSBHostInterfacePropertyKey
Properties of a USB interface that describe its state.
struct IOUSBHostDevicePropertyKey
Properties of a USB device that describe its state.
typealias IOUSBHostPropertyKey
Properties that the USB host device and interface classes share.
See Also
IOServicePlane Properties


## Page 8

IOUSBHost / IOUSBHostPropertyKey
Type Alias
IOUSBHostPropertyKey
Properties that the USB host device and interface classes share.
Mac Catalyst 14.0+
macOS 10.15+


## Page 9

let IOUSBHostPropertyKeyLocationID: String
The location ID of the USB host device.
struct IOUSBHostInterfacePropertyKey
Properties of a USB interface that describe its state.
struct IOUSBHostDevicePropertyKey
Properties of a USB device that describe its state.
struct IOUSBHostMatchingPropertyKey
Properties for implementing the matching service.
Topics
Properties
See Also
IOServicePlane Properties


