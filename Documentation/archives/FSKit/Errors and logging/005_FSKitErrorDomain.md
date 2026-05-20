# 005_FSKitErrorDomain.pdf

## Page 1

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


## Page 2

A code that indicates a specific FSKit error.


