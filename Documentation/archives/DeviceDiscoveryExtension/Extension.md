# Extension.pdf

## Page 1

Your extension adopts this protocol as the primary entry and exit points for device discovery.
The system calls your extension’s startDiscovery(session:) when AVRoutePickerView
displays so your extension can include a specific third-party device in the picker. When the picker
UI dismisses or the user selects a device, the system calls your extension’s stop
Discovery(session:) implementation to instruct it to perform any cleanup.
func startDiscovery(session: DDDiscoverySession)
Begins the extension’s device discovery process.
Required
func stopDiscovery(session: DDDiscoverySession)
Ends the extension’s device discovery process.
Required
Overview
Topics
Controlling discovery
DeviceDiscoveryExtension / DDDiscoveryExtension
Protocol
DDDiscoveryExtension
A specification that enables the framework to start and stop the extension’s
discovery process.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst
macOS
visionOS


## Page 2

func didReceiveEvent(DDDeviceEvent)
Provides a device event from the system to the extension.
Required Default implementation provided.
AppExtension
class DDDiscoverySession
An object that relays device discovery events from the extension to the system.
class DDDiscoveryExtensionConfiguration
An object that manages the extension’s communication with the framework.
protocol DDDiscoveryExtensionConfigurationProtocol
A specification that provides a communication channel between the extension and the
framework.
Observing state changes
Relationships
Inherits From
See Also
Extension


## Page 3

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


## Page 4

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


## Page 5

Your app’s primary extension class provides a property of this type. Create the instance by calling
init(discoveryExtension:) with the argument set to self.
init(discoveryExtension: T)
Creates an extension configuration with a reference to a specific extension.
AppExtensionConfiguration
DDDiscoveryExtensionConfigurationProtocol
Overview
Topics
Creating an extension configuration
Relationships
Conforms To
DeviceDiscoveryExtension / DDDiscoveryExtensionConfiguration
Class
DDDiscoveryExtensionConfiguration
An object that manages the extension’s communication with the framework.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 6

Sendable
SendableMetatype
protocol DDDiscoveryExtension
A specification that enables the framework to start and stop the extension’s discovery
process.
class DDDiscoverySession
An object that relays device discovery events from the extension to the system.
protocol DDDiscoveryExtensionConfigurationProtocol
A specification that provides a communication channel between the extension and the
framework.
See Also
Extension


## Page 7

The DDDiscoveryExtensionConfiguration class adopts this protocol. For an example, see
Appex.swift in Discovering a third-party media-streaming device.
AppExtensionConfiguration, Sendable, SendableMetatype
DDDiscoveryExtensionConfiguration
Overview
Relationships
Inherits From
Conforming Types
See Also
DeviceDiscoveryExtension / DDDiscoveryExtensionConfigurationProtocol
Protocol
DDDiscoveryExtensionConfiguration
Protocol
A specification that provides a communication channel between the extension an
the framework.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst
macOS
visionOS


## Page 8

protocol DDDiscoveryExtension
A specification that enables the framework to start and stop the extension’s discovery
process.
class DDDiscoverySession
An object that relays device discovery events from the extension to the system.
class DDDiscoveryExtensionConfiguration
An object that manages the extension’s communication with the framework.
Extension


