# App-extension setup.pdf

## Page 1

An app extension extends the features of the host app it supports, and runs code in a separate
process. You can develop an app extension together with your app, or develop app extensions
separately to support a different app. The host app provides the interface your app extension mu
implement, and both the app and app extension adopt the ExtensionFoundation framework to
manage interactions.
In an app extension, the ExtensionFoundation framework provides the code for running the main
event loop and accepting XPC connections. When you create an app extension in Xcode, the
generic extension template provides most of the code you need to get started. With that template
you add code to establish communications with the host app, and to implement the expected
features.
Note
The host app provides the SDK that you adopt when implementing your app extension. This
SDK includes any API to adopt, the version of XPC to use, and any other requirements for the
host app’s extension points.
An app extension is a bundle that ships inside an existing app, so you must already have an Xcode
project with an app before adding an app extension to it. When writing app extensions for one of
your apps, or for another app on the App Store, start your app extension from the Generic
Extension target type. The following steps walk you through the process of adding this target type
to your existing Xcode project:
Overview
Create your app extension target
ExtensionFoundation / Building an app extension to support a host app
Article
Building an app extension to support a
host app
Create an app extension to perform tasks in a separate process from a host app.


## Page 2

1. Open your Xcode project.
2. Select File > New > Target.
3. Choose the appropriate platform.
4. In the app extension section of the panel, select Generic Extension.
5. Click Next.
6. Provide a name for the extension.
7. Set the extension type to Non-UI Extension.
8. Select your app from the Embed in Application field.
9. Click Finish to create the target.
The Generic Extension target template provides the initial code your app extension needs to run.
Specifically, it contains a customization of the AppExtension type that is the entry point for you
app extension’s code. You don’t override this type’s existing behavior, but you do augment it with
details about your app extension. For example, you provide it with an AppExtension
Configuration object, which creates the XPC connection between your app extension and the
host app.
Each time you create an app extension, you target one of the extension points of the associated
host app. Extension points are features or capabilities for which the host app supports app
extensions. For example, an image-editing app might define an extension point to support custom
image filters. In your app extension code, you programmatically specify the extension point you
support using a binding. At runtime, the system uses your binding information to match your app
extension to the host app on a person’s device.
To create a binding in your app extension code, add a variable with the AppExtensionPoint ty
to your existing AppExtension structure. Set the contents of this variable to a closure with an
AppExtensionPoint.Identifier type, which specifies the name of the extension point and
the host app’s bundle identifier. Precede the definition of this variable with the AppExtension
Point.Bind property wrapper to tell the compiler that this variable contains your binding details
The following example shows a binding to an app with the extension point name HostApp
Feature:
Bind your app extension to an appropriate extension point


## Page 3

At build time, you use the compiler to generate the actual binding information the system needs.
Add a user-defined build setting to your app extension target in Xcode, and set its name to EX
_ENABLE_EXTENSION_POINT_GENERATION and its value to YES. When this setting is present,
the compiler extracts the details from your binding code and puts the relevant details in your app
extension’s information property list. When someone installs the app containing your app
extension, the system reads the keys from this property list and uses them to match your app
extension to its host app.
Note
When creating new app extensions, always place binding information in your code. If you have
an older app extension, the system still recognizes keys you added manually to your app’s
information property list.
Apart from adopting the host app’s required API, an app extension’s only requirement is to establi
a communications channel with that app. After launching an app extension, the host app is
responsible for initiating an XPC connection to that extension. Accept this connection in your app
extension code to start communication with the host.
To accept an incoming XPC connection request, create a custom type that adopts the App
ExtensionConfiguration protocol and initialize your AppExtension type with it. When the
host app initiates an XPC connection, the system redirects the request to the code you provide in
this type. Use that code to configure the XPC connection details and call the connection’s
resume() method. The following code shows an implementation of the protocol’s
accept(connection:) method, which is where you put your connection code. In the code, the
app extension configures the connection with a local object and the interface that both it and the
host app recognize.
Configure the XPC connection to the host app


## Page 4

If the host app uses the XPC framework for communication, establish a connection using a
ConnectionHandler structure instead of a custom configuration type. The XPC framework is a
lower-level version of the Foundation API that offers better options for communicating with
hardened app extensions. The host app might require the use of this framework, especially if its
extension point includes the AppExtensionPoint.EnhancedSecurity attribute.
The following code shows the configuration of a text translation app extension that uses the XPC
framework. The app extension’s configuration property returns a ConnectionHandler type to
process incoming requests. The provided closure creates a custom object to handle incoming
requests and return a response. The app extension defines the translate() method to genera
the translation for a host-provided string.


## Page 5

For more information about using XPC for communicating between processes, see the XPC
framework and the XPC types in the Foundation framework.
protocol AppExtension
An interface you use to declare the content, structure, and behavior of an app extension.
protocol AppExtensionConfiguration
An interface you use to configure the XPC connection in your app extension.
struct ConnectionHandler
A type that contains a custom closure that handles incoming XPC connections.
See Also
App-extension setup


## Page 6

Building an app extension to support a host app
This type provides the entry point for an app extension, and every app extension must have a
concrete type that adopts it. When a host app launches an app extension, the system looks for an
object that adopts this protocol. The protocol provides default implementations of the code
required to run the app extension.
When adopting this protocol, implement the configuration property and provide a type capab
of establishing an XPC connection to the host app. If your app extension sends only data to the
host app, and doesn’t provide a UI, provide a type that implements the AppExtension
Configuration protocol. If your extension provides UI elements for the host app to display,
instead provide an instance of the AppExtensionSceneConfiguration type.
Mentioned in
Overview
Topics
Creating an app extension
ExtensionFoundation / AppExtension
Protocol
AppExtension
An interface you use to declare the content, structure, and behavior of an app
extension.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.1+
watchOS 9.0+


## Page 7

init()
Initializes the app extension and prepares it to run.
Required
var configuration: Self.Configuration
The configuration details for this app extension.
Required
associatedtype Configuration : AppExtensionConfiguration
A type that manages configuration data for an app extension.
Required
static func main() throws
The main entry point for an app extension that doesn’t present any UI.
static func main() throws
The main entry point for an app extension that doesn’t present any UI.
var extensionPoint: AppExtensionPoint
Required Default implementation provided.
typealias Bind
typealias Identifier
typealias Implementing
AppExtension Implementations
Configuring the app extension
Running the main event loop
Instance Properties
Type Aliases
Default Implementations


## Page 8

Building an app extension to support a host app
Create an app extension to perform tasks in a separate process from a host app.
protocol AppExtensionConfiguration
An interface you use to configure the XPC connection in your app extension.
struct ConnectionHandler
A type that contains a custom closure that handles incoming XPC connections.
See Also
App-extension setup


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


