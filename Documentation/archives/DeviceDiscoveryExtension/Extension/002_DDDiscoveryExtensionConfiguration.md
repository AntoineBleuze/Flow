# 002_DDDiscoveryExtensionConfiguration.pdf

## Page 1

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


## Page 2

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


