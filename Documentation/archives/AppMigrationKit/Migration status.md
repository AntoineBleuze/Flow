# Migration status.pdf

## Page 1

After the first time the app launches, check this type’s static variable importStatus to determin
whether a migration took place and, if so, whether it succeeded. To determine the status, check t
see if importStatus is non-nil and that its value is MigrationStatus.success. After a
successful migration, notify the person using the app that migration succeeded, and call the stati
method clearImportStatus().
static var importStatus: MigrationStatus?
A property to indicate the status of import from another device into the app.
static func clearImportStatus()
Sets the import status to a nil value to prevent further notification.
case success
Overview
Topics
Accessing the import status
Examining migration statuses
AppMigrationKit / MigrationStatus
Enumeration
MigrationStatus
A type the containing app uses to determine the status of a completed import.
iOS 26.0+
iPadOS 26.0+


## Page 2

The migration completed successfully.
case failure(any Error)
The migration failed with an error.


