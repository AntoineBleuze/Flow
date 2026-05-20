# 001_AppExtensionProcess.pdf

## Page 1

Adding support for app extensions to your app
Create this type from your host app when you want to communicate with an available app
extension. This type creates a new process, and runs the app extension’s startup code in that
process. After startup, establish an XPC connection to the app extension’s process using the
methods of this type. Use that XPC connection to communicate with the app extension.
When creating an instance of this type, you specify which app extension to launch using an App
ExtensionIdentity type. If the app extension is already running, creating the AppExtension
Process type configures it with the already running process. If the app extension isn’t yet runnin
creating this type forks a new process and runs the app extension’s startup code in it. In both
cases, you receive an instance of this structure only after the app extension is running and ready
for you to establish an XPC connection.
Maintain a reference to this structure for as long as you need to communicate with the app
extension. When you no longer need the app extension, call the invalidate method to release
your app’s reference to the process. If the app extension process exits for any reason, the system
calls the onInterruption handler you provided at configuration time.
Mentioned in
Overview
ExtensionFoundation / AppExtensionProcess
Structure
AppExtensionProcess
A type the host app creates to launch and manage an app extension.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 13.0+
tvOS 26.0+
visionOS 1.1+
watchOS 26.0+


## Page 2

init(configuration: AppExtensionProcess.Configuration) throws
Finds an existing process for the specified app extension or creates a new one synchronous
init(configuration: AppExtensionProcess.Configuration) async throws
Finds an existing process for the specified app extension or creates a new one
asynchronously.
struct Configuration
A structure that holds the identity of an app extension and process-related details.
func makeXPCConnection() throws -> NSXPCConnection
Connect to the app extension process using the XPC types of the Foundation framework.
func makeXPCSession() throws -> XPCSession
Connect to the app extension process using an XPC session.
func invalidate()
Invalidates the host app’s connection to the app extension process.
Discovering app extensions from your app
Find the app extensions that match your host app’s extension points and are available to use
struct AppExtensionIdentity
Topics
Creating the app-extension process
Connecting to the app extension
Invalidating the app-extension connection
See Also
Host-app configuration


## Page 3

A type that uniquely identifies an app extension on the system.


