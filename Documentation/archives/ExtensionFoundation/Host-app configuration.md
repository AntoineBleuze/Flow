# Host-app configuration.pdf

## Page 1

At runtime, apps rely on the system to provide the list of app extensions available for them to use
The system starts by looking for app extensions that support the host app’s extension points. It
then determines which of those app extensions are enabled and ready to use. For security, the
system disables app extensions that ship outside of the host app by default. The owner of the
device can also disable app extensions using system-provided interfaces.
For each available app extension, the system provides an AppExtensionIdentity structure fo
you to launch that extension. This identity structure contains the name of the app extension, the
name of the supported extension point, and the host app’s bundle identifier.
To retrieve the available app extensions for your app, create a AppExtensionPoint.Monitor
type. A monitor provides two ways to access the available app extensions:
The identities property contains a snapshot of the app extensions currently available for yo
to use.
The state property contains the list of available app extensions and the number of disabled a
unapproved app extensions.
To configure a monitor, initialize the AppExtensionPoint.Monitor type with one of your app’
extension points. To monitor additional extension points from the same instance, call the addApp
ExtensionPoint(_:) method. The creation of a monitor is an asynchronous operation. During
creation, the system finds and validates the list of available app extensions. As soon as this proce
finishes, the system returns the initialized type to your code. As a result, you can fetch the list of
app extensions immediately upon receiving the type, as shown in the following example:
Overview
Retrieve the current list of available app extensions
ExtensionFoundation / Discovering app extensions from your app
Article
Discovering app extensions from your app
Find the app extensions that match your host app’s extension points and are
available to use.


## Page 2

The ExtensionKit framework contains a view controller that shows all of the known app extensions
for your app, including ones that are disabled. Present this view controller from your interface to
give people a way to enable and disable app extensions. For information about how to show this
interface, see Displaying the app extensions available to your app.
If your app supports app extensions from external developers, the list of available app extensions
can change as someone installs or removes apps on their device. At app installation time, the
system records the presence of its app extensions and associates them with the matching host
app. The system similarly updates its records when someone removes an app. If your app is
running when these changes occur, the system reports those changes to any active monitors.
To detect changes to app extensions, use the Observation framework to track changes to the
identities or state properties of your monitor. Both properties support observation, which y
can use to create an AsyncSequence of updates. The following code creates such a sequence f
the identities property, and then monitors that sequence asynchronously. As updates arrive,
the task runs and delivers the new set of AppExtensionIdentity structures to the update
variable.
In addition to reporting the installation or removal of app extensions on the system, a monitor also
reports changes to the status of an existing app extension. The identities and state
properties contain only the app extensions that are installed and currently enabled. If someone
enables or disables one of those app extensions, the monitor updates those lists to reflect the
change.
Detect changes to the list of available app extensions


## Page 3

struct AppExtensionProcess
A type the host app creates to launch and manage an app extension.
struct AppExtensionIdentity
A type that uniquely identifies an app extension on the system.
See Also
Host-app configuration


## Page 4

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


## Page 5

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


## Page 6

A type that uniquely identifies an app extension on the system.


## Page 7

Discovering app extensions from your app
Use this type to identify an app extension on the system and connect to it. You don’t create this
type directly. Instead, you use the AppExtensionPoint.Monitor type to retrieve instances of
this type for the available app extensions.
var bundleIdentifier: String
The bundle identifier of the app extension.
var extensionPointIdentifier: String
The extension point of your host app that the app extension supports.
var localizedName: String
Mentioned in
Overview
Topics
Identifying the process
ExtensionFoundation / AppExtensionIdentity
Structure
AppExtensionIdentity
A type that uniquely identifies an app extension on the system.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 13.0+
tvOS 26.0+
visionOS 1.1+
watchOS 26.0+


## Page 8

The localized, human-readable name of the app extension.
func hash(into: inout Hasher)
Hashes the essential components of the extension by feeding them into the given hash
function.
static func == (AppExtensionIdentity, AppExtensionIdentity) -> Bool
Returns a Boolean value that indicates whether two identities are equal.
struct Availability
An object that contains information about available extensions.
Deprecated
static var availabilityUpdates: AsyncStream<AppExtensionIdentity.
Availability>
Deprecated
static func matching(appExtensionPointIDs: String...) throws -> App
ExtensionIdentity.Identities
The asynchronous sequence of extension identities which target the specified extension poi
identifiers.
Deprecated
struct Identities
An asynchronous sequence that returns the enabled extensions that match provided
constraints.
Deprecated
Equatable
Hashable
Identifiable
Comparing app extensions
Deprecated
Relationships
Conforms To


## Page 9

Sendable
SendableMetatype
Discovering app extensions from your app
Find the app extensions that match your host app’s extension points and are available to use
struct AppExtensionProcess
A type the host app creates to launch and manage an app extension.
See Also
Host-app configuration


