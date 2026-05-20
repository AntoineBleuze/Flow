# 001_IOUSBHostDevicePropertyKey.pdf

## Page 1

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


## Page 2

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


