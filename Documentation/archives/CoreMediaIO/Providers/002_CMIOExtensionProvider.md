# 002_CMIOExtensionProvider.pdf

## Page 1

Creating a camera extension with Core Media I/O
An extension provider manages device connections and provides the start
Service(provider:) class method that you call to bootstrap the service.
init(source: any CMIOExtensionProviderSource, clientQueue: dispatch
_queue_t?)
Creates an extension provider with the specified source and dispatch queue.
var clientQueue: dispatch_queue_t
Mentioned in
Overview
Topics
Creating a Provider
Inspecting a Provider
Core Media I/O / CMIOExtensionProvider
Class
CMIOExtensionProvider
An object that manages device connections for a provider.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

The dispatch queue on which the system performs client operations.
var source: (any CMIOExtensionProviderSource)?
The source for the provider.
class func startService(provider: CMIOExtensionProvider)
Starts the system extension.
var devices: [CMIOExtensionDevice]
An array of connected devices.
func addDevice(CMIOExtensionDevice) throws
Adds a device to a provider.
func removeDevice(CMIOExtensionDevice) throws
Removes a device from a provider.
var connectedClients: [CMIOExtensionClient]
An array of connected clients.
func notifyPropertiesChanged([CMIOExtensionProperty : CMIOExtension
PropertyState<AnyObject>])
Notifies connected clients of device property changes.
class func ignoreSIGTERM()
class func stopService(provider: CMIOExtensionProvider)
Starting a Provider
Managing Devices
Managing Clients
Type Methods
Relationships


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
Inherits From
Conforms To
See Also
Providers


