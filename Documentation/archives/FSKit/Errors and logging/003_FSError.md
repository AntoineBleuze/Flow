# 003_FSError.pdf

## Page 1

static var invalidDirectoryCookie: FSError.Code
static var moduleLoadFailed: FSError.Code
static var resourceDamaged: FSError.Code
static var resourceUnrecognized: FSError.Code
static var resourceUnusable: FSError.Code
static var statusOperationInProgress: FSError.Code
static var statusOperationPaused: FSError.Code
static var errorDomain: String
Topics
Identifying errors
Identifying the error domain
Relationships
FSKit / FSError
Structure
FSError
An error encountered when performing an FSKit operation.
macOS 15.4+


## Page 2

CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
func fs_errorForCocoaError(Int32) -> any Error
Creates an error object for the given Cocoa error code.
func fs_errorForMachError(Int32) -> any Error
Creates an error object for the given Mach error code.
func fs_errorForPOSIXError(Int32) -> any Error
Creates an error object for the given POSIX error code.
enum Code
A code that indicates a specific FSKit error.
let FSKitErrorDomain: String
An error domain for FSKit errors.
Conforms To
See Also
Errors and logging


