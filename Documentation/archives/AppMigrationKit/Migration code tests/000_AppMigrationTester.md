# 000_AppMigrationTester.pdf

## Page 1

Use this type in unit tests that your containing app hosts. Calling the tester from your unit tests
allows you to communicate with your app migration extension to valdiate your migration code.
In your tests, create an instance of AppMigrationTester, then access its exportControlle
and importController properties to exercise export and import functionality, respectively.
Warning
Use AppMigrationTester only in unit tests, not in production code. The tester doesn’t
operate in a production environment.
init(platform: MigrationPlatform) async throws
Creates a tester instance for migrating to or from the specified platform.
Overview
Topics
Creating a tester instance
Testing export
AppMigrationKit / AppMigrationTester
Class
AppMigrationTester
A test-only type your app uses to test app migration extensions.
iOS 26.0+
iPadOS 26.0+


## Page 2

var exportController: AppMigrationTester.AppExportController
An instance of the controller object you use to test your export code.
class AppExportController
A class you use to test your extension’s export code.
var importController: AppMigrationTester.AppImportController
An instance of the controller object you use to test your import code.
class AppImportController
A class you use to test your extension’s import code.
struct DeviceToDeviceExportProperties
Properties that describe the result of a device-to-device export.
struct ResourcesExportResult
The result of exporting resources to another device.
Actor, Sendable, SendableMetatype
Testing import
Supporting types
Relationships
Conforms To


