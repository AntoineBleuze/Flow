# 000_fs_errorForCocoaError____.pdf

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


