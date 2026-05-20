# App extensions.pdf

## Page 1

func accept(sessionRequest: AccessoryTransportSession.Request) ->
AccessoryTransportSession.Request.Decision
Handles a new session request for the accessory, in response to a call from the framework.
Required
struct Decision
An opaque type returned from the incoming session handler of an event listener.
AppExtension
Topics
Interacting with a session
Relationships
Inherits From
AccessoryTransportExte… / AccessoryTransportAppExtension
Protocol
AccessoryTransportAppExtension
A protocol that defines the behavior of the app extension and how it handles
requests.
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+


## Page 2

protocol AccessoryTransportExtensionConfiguration
An interface you use to configure and manage communication between the extension and th
host process.
See Also
App extensions


## Page 3

AppExtensionConfiguration, Sendable, SendableMetatype
protocol AccessoryTransportAppExtension
A protocol that defines the behavior of the app extension and how it handles requests.
Relationships
Inherits From
See Also
App extensions
AccessoryTransportExte… / AccessoryTransportExtensionConfiguration
Protocol
AccessoryTransportExtension
Configuration
An interface you use to configure and manage communication between the
extension and the host process.
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+


