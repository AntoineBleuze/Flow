# 003_CMIOExtensionProviderSource.pdf

## Page 1

Create a class that adopts this protocol to configure provider properties and manage its client
connections.
func connect(to: CMIOExtensionClient) throws
Connects a client to a source’s provider.
Required
func disconnect(from: CMIOExtensionClient)
Disconnects a client from a source’s provider.
Required
var availableProperties: Set<CMIOExtensionProperty>
A set of available properties for a provider.
Overview
Topics
Managing Connections
Configuring Properties
Core Media I/O / CMIOExtensionProviderSource
Protocol
CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

Required
func providerProperties(forProperties: Set<CMIOExtensionProperty>)
throws -> CMIOExtensionProviderProperties
Gets the state of provider properties.
Required
func setProviderProperties(CMIOExtensionProviderProperties) throws
Set the state of provider properties.
Required
NSObjectProtocol
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
class CMIOExtensionProvider
An object that manages device connections for a provider.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
Relationships
Inherits From
See Also
Providers


