# 001_com_apple_developer_app-migration_data-container-access.pdf

## Page 1

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


