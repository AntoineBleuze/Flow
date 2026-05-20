# 001_DDDiscoverySession.pdf

## Page 1

The system passes the extension an instance of this class when it attempts to discover a device.
Device discovery starts when an app displays AVRoutePickerView and the system calls the
extension’s startDiscovery(session:) implementation.
func report(DDDeviceEvent)
Reports an event to the system.
NSObject
Overview
Topics
Providing an event to the system
Relationships
Inherits From
DeviceDiscoveryExtension / DDDiscoverySession
Class
DDDiscoverySession
An object that relays device discovery events from the extension to the system.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol DDDiscoveryExtension
A specification that enables the framework to start and stop the extension’s discovery
process.
class DDDiscoveryExtensionConfiguration
An object that manages the extension’s communication with the framework.
protocol DDDiscoveryExtensionConfigurationProtocol
A specification that provides a communication channel between the extension and the
framework.
Conforms To
See Also
Extension


