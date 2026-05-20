# 001_AppExtension.pdf

## Page 1

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


## Page 2

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


## Page 3

Building an app extension to support a host app
Create an app extension to perform tasks in a separate process from a host app.
protocol AppExtensionConfiguration
An interface you use to configure the XPC connection in your app extension.
struct ConnectionHandler
A type that contains a custom closure that handles incoming XPC connections.
See Also
App-extension setup


