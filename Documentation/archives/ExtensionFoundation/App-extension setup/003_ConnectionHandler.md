# 003_ConnectionHandler.pdf

## Page 1

Building an app extension to support a host app
This type manages a closure in your app extension that accepts incoming XPC connections from 
host app. Create an instance of this structure and initialize it with a closure for the type of XPC
connection the host app uses with app extensions. Assign the instance you created to the
configuration property of your custom AppExtension type. When the host app tries to ope
a connection, the system runs your closure to accept that connection.
Use this type to establish connections with either the Foundation or XPC framework.
init(onConnection: (NSXPCConnection) -> Bool)
Initializes the connection handler with a closure that accepts a Foundation XPC object.
Mentioned in
Overview
Topics
Initializing the connection handler
ExtensionFoundation / ConnectionHandler
Structure
ConnectionHandler
A type that contains a custom closure that handles incoming XPC connections.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 1.1+


## Page 2

init(onSessionRequest: (XPCListener.IncomingSessionRequest) ->
XPCListener.IncomingSessionRequest.Decision)
Initializes the connection handler with a closure that accepts an XPC session.
AppExtensionConfiguration, Sendable, SendableMetatype
Building an app extension to support a host app
Create an app extension to perform tasks in a separate process from a host app.
protocol AppExtension
An interface you use to declare the content, structure, and behavior of an app extension.
protocol AppExtensionConfiguration
An interface you use to configure the XPC connection in your app extension.
Relationships
Conforms To
See Also
App-extension setup


