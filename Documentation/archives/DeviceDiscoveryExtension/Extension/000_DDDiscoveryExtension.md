# 000_DDDiscoveryExtension.pdf

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


