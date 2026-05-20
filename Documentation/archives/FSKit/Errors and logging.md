# Errors and logging.pdf

## Page 1

func fs_errorForMachError(Int32) -> any Error
Creates an error object for the given Mach error code.
func fs_errorForPOSIXError(Int32) -> any Error
Creates an error object for the given POSIX error code.
struct FSError
An error encountered when performing an FSKit operation.
enum Code
A code that indicates a specific FSKit error.
let FSKitErrorDomain: String
An error domain for FSKit errors.
See Also
Errors and logging
FSKit / fs_errorForCocoaError(_:)
Function
fs_errorForCocoaError(_:)
Creates an error object for the given Cocoa error code.
macOS 15.4+


## Page 2

func fs_errorForCocoaError(Int32) -> any Error
Creates an error object for the given Cocoa error code.
func fs_errorForPOSIXError(Int32) -> any Error
Creates an error object for the given POSIX error code.
struct FSError
An error encountered when performing an FSKit operation.
enum Code
A code that indicates a specific FSKit error.
let FSKitErrorDomain: String
An error domain for FSKit errors.
See Also
Errors and logging
FSKit / fs_errorForMachError(_:)
Function
fs_errorForMachError(_:)
Creates an error object for the given Mach error code.
macOS 15.4+


## Page 3

func fs_errorForCocoaError(Int32) -> any Error
Creates an error object for the given Cocoa error code.
func fs_errorForMachError(Int32) -> any Error
Creates an error object for the given Mach error code.
struct FSError
An error encountered when performing an FSKit operation.
enum Code
A code that indicates a specific FSKit error.
let FSKitErrorDomain: String
An error domain for FSKit errors.
See Also
Errors and logging
FSKit / fs_errorForPOSIXError(_:)
Function
fs_errorForPOSIXError(_:)
Creates an error object for the given POSIX error code.
macOS 15.4+


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

See NSError for more information on error domains.
func fs_errorForCocoaError(Int32) -> any Error
Creates an error object for the given Cocoa error code.
func fs_errorForMachError(Int32) -> any Error
Creates an error object for the given Mach error code.
func fs_errorForPOSIXError(Int32) -> any Error
Creates an error object for the given POSIX error code.
struct FSError
An error encountered when performing an FSKit operation.
enum Code
Discussion
See Also
Errors and logging
FSKit / FSKitErrorDomain
Global Variable
FSKitErrorDomain
An error domain for FSKit errors.
macOS 15.4+


## Page 9

A code that indicates a specific FSKit error.


