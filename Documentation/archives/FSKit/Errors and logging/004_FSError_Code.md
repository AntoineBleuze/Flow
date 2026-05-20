# 004_FSError_Code.pdf

## Page 1

case invalidDirectoryCookie
While enumerating a directory, the given cookie didn’t resolve to a valid directory entry.
case moduleLoadFailed
The module failed to load.
case resourceDamaged
The resource is damaged.
case resourceUnrecognized
FSKit didn’t recognize the resource, and probing failed to find a match.
case resourceUnusable
FSKit recognizes the resource, but the resource isn’t usable.
case statusOperationInProgress
An operation is in progress.
case statusOperationPaused
An operation is paused.
Topics
Identifying errors
FSKit / FSError / FSError.Code
Enumeration
FSError.Code
A code that indicates a specific FSKit error.
macOS 15.4+


## Page 2

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
func fs_errorForCocoaError(Int32) -> any Error
Creates an error object for the given Cocoa error code.
func fs_errorForMachError(Int32) -> any Error
Creates an error object for the given Mach error code.
func fs_errorForPOSIXError(Int32) -> any Error
Creates an error object for the given POSIX error code.
struct FSError
An error encountered when performing an FSKit operation.
let FSKitErrorDomain: String
An error domain for FSKit errors.
Working with raw values
Relationships
Conforms To
See Also
Errors and logging


