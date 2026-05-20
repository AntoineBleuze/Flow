# 002_AppExtensionConfiguration.pdf

## Page 1

Building an app extension to support a host app
Adopt this protocol in a custom type, and use that type to finalize the XPC connection to the host
app. The host app tries to create an XPC connection to your app extension shortly after launching
it. The system directs that connection request to the code in your configuration object. Use your
code to provide the host with the information it needs to communicate with your app extension.
This protocol supports app extensions that don’t offer any custom UI. If your app extension
provides custom UI, instead use the AppExtensionSceneConfiguration type from
ExtensionKit.
func accept(connection: NSXPCConnection) -> Bool
Mentioned in
Overview
Topics
Accepting a connection to the host app
ExtensionFoundation / AppExtensionConfiguration
Protocol
AppExtensionConfiguration
An interface you use to configure the XPC connection in your app extension.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.1+
watchOS 9.0+


## Page 2

Returns a Boolean value that indicates whether you accept an incoming connection request
from the host app.
Required
Sendable, SendableMetatype
ConnectionHandler
Building an app extension to support a host app
Create an app extension to perform tasks in a separate process from a host app.
protocol AppExtension
An interface you use to declare the content, structure, and behavior of an app extension.
struct ConnectionHandler
A type that contains a custom closure that handles incoming XPC connections.
Relationships
Inherits From
Conforming Types
See Also
App-extension setup


