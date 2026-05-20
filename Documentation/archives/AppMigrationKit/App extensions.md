# App extensions.pdf

## Page 1

During migration, the system calls your extension to collect and export its data to the receiving
device. On import, the system calls your app extension just after app installation, but before the
app is actually launchable.
The protocols specific to import and export operations extend this type, such as Resources
ExportingWithOptions and ResourcesImporting. For your app extension to successfully
export or import data in response to a system call, it needs to conform to one or more of these
child protocols.
var appContainer: MigrationDataContainer
The data container of the containing app.
Required Default implementation provided.
struct MigrationDataContainer
An object describing an app’s data container
Overview
Topics
Accessing migration data
AppMigrationKit / AppMigrationExtension
Protocol
AppMigrationExtension
An app extension you extend to participate in data export and import.
iOS 26.0+
iPadOS 26.0+


## Page 2

AppExtension, Sendable, SendableMetatype
ResourcesExporting, ResourcesExportingWithOptions, ResourcesImporting
com.apple.developer.app-migration.data-container-access
An entitlement required for app extensions to perform a one-time transfer of on-device data
to or from another platform.
Relationships
Inherits From
Inherited By
See Also
App extensions


## Page 3

Name
App Identifier for OS Data Transfer
Type
Array of strings
Use this entitlement with the app extension that implements the AppMigrationExtension
protocol from the AppMigrationKit framework.
The value of this entitlement is an array of strings. Populate this value with a one-item array
containing the bundle identifier of the extension’s containing app. No other values are valid.
Details
Discussion
Bundle Resources / Entitlements / com.apple.developer.app-migration.data-container-access
Property List Key
com.apple.developer.app-migration.data-
container-access
An entitlement required for app extensions to perform a one-time transfer of on-
device data to or from another platform.
iOS 26.1+
iPadOS 26.1+


