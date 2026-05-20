# 002_DDErrorHandler.pdf

## Page 1

inError
A reference that the framework assigns an error object when the operation fails. When the
operation succeeds, the value may be nil or DDError.Code.success.
struct DDError
An error that the framework reports.
enum Code
Codes that identify errors that can occur during the framework’s use.
typealias DDErrorOutType
A type for framework functions that return error references.
let DDErrorDomain: String
Parameters
See Also
Errors
DeviceDiscoveryExtension / DDErrorHandler
Type Alias
DDErrorHandler
A function that executes code you provide when an operation returns an error or
completes successfully.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 2

A unique error domain for the framework.


