# 002_AppExtensionIdentity.pdf

## Page 1

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


## Page 2

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


## Page 3

Sendable
SendableMetatype
Discovering app extensions from your app
Find the app extensions that match your host app’s extension points and are available to use
struct AppExtensionProcess
A type the host app creates to launch and manage an app extension.
See Also
Host-app configuration


