# 000_AppMigrationExtension.pdf

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


