# 003_DDDiscoveryExtensionConfigurationProtocol.pdf

## Page 1

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


## Page 2

protocol DDDiscoveryExtension
A specification that enables the framework to start and stop the extension’s discovery
process.
class DDDiscoverySession
An object that relays device discovery events from the extension to the system.
class DDDiscoveryExtensionConfiguration
An object that manages the extension’s communication with the framework.
Extension


