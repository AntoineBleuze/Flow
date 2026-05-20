# Network Diagnostics.pdf

## Page 1

Equatable, Hashable
enum CFNetDiagnosticStatusValues
Constants for diagnostic status values.
Deprecated
func CFNetDiagnosticCopyNetworkStatusPassively(CFNetDiagnostic, Unsafe
MutablePointer<Unmanaged<CFString>?>?) -> CFNetDiagnosticStatus
Gets a network status value.
Deprecated
func CFNetDiagnosticCreateWithStreams(CFAllocator?, CFReadStream?,
CFWriteStream?) -> Unmanaged<CFNetDiagnostic>
Relationships
Conforms To
See Also
Network Diagnostics
CFNetwork / CFNetDiagnostic
Class
CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

Creates a network diagnostic object from a pair of CFStreams.
Deprecated
func CFNetDiagnosticCreateWithURL(CFAllocator, CFURL) -> Unmanaged<CFNe
Diagnostic>
Creates a CFNetDiagnosticRef from a CFURLRef.
Deprecated
func CFNetDiagnosticDiagnoseProblemInteractively(CFNetDiagnostic) ->
CFNetDiagnosticStatus
Opens a Network Diagnostics window.
Deprecated
func CFNetDiagnosticSetName(CFNetDiagnostic, CFString)
Overrides the displayed application name.
Deprecated


## Page 3

Diagnostic status values are returned by CFNetDiagnosticDiagnoseProblem
Interactively(_:) and CFNetDiagnosticCopyNetworkStatusPassively(_:_:).
case noErr
No error occurred but there is no status.
case err
An error occurred that prevented the call from completing.
case connectionUp
The connection appears to be working.
case connectionIndeterminate
The status of the connection is not known.
Overview
Topics
Constants
CFNetwork / CFNetDiagnosticStatusValues Deprecated
Enumeration
CFNetDiagnosticStatusValues Deprecated
Constants for diagnostic status values.
iOS 2.0–11.0 Deprecated
iPadOS 2.0–11.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.4–10.13 Deprecated
tvOS 9.0–11.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 4

case connectionDown
The connection does not appear to be working.
init?(rawValue: Int32)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
func CFNetDiagnosticCopyNetworkStatusPassively(CFNetDiagnostic, Unsafe
MutablePointer<Unmanaged<CFString>?>?) -> CFNetDiagnosticStatus
Gets a network status value.
Deprecated
func CFNetDiagnosticCreateWithStreams(CFAllocator?, CFReadStream?,
CFWriteStream?) -> Unmanaged<CFNetDiagnostic>
Creates a network diagnostic object from a pair of CFStreams.
Deprecated
Initializers
Relationships
Conforms To
See Also
Network Diagnostics


## Page 5

func CFNetDiagnosticCreateWithURL(CFAllocator, CFURL) -> Unmanaged<CFNe
Diagnostic>
Creates a CFNetDiagnosticRef from a CFURLRef.
Deprecated
func CFNetDiagnosticDiagnoseProblemInteractively(CFNetDiagnostic) ->
CFNetDiagnosticStatus
Opens a Network Diagnostics window.
Deprecated
func CFNetDiagnosticSetName(CFNetDiagnostic, CFString)
Overrides the displayed application name.
Deprecated


## Page 6

details
CFNetDiagnosticRef, created by CFNetDiagnosticCreateWithStreams(_:_:_:) or
CFNetDiagnosticCreateWithURL(_:_:), for which the Network Diagnostics status is t
be obtained.
description
If not NULL, upon return contains a localized string containing a description of the current
network status. Ownership follows the The Create Rule.
A network status value.
Parameters
Return Value
Discussion
CFNetwork / CFNetDiagnosticCopyNetworkStatusPassively(_:_:) Deprecated
Function
CFNetDiagnosticCopyNetworkStatus
Passively(_:_:) Deprecated
Gets a network status value.
iOS 2.0–11.0 Deprecated
iPadOS 2.0–11.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.4–10.13 Deprecated
tvOS 9.0–11.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 7

This function returns a status value that can be used to display basic information about the
connection, and optionally gets a localized string containing a description of the current network
status.
This function is guaranteed not to generate network activity.
This function is thread safe as long as another thread does not alter the same CFNetDiagnosticRe
at the same time.
class CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
enum CFNetDiagnosticStatusValues
Constants for diagnostic status values.
Deprecated
func CFNetDiagnosticCreateWithStreams(CFAllocator?, CFReadStream?,
CFWriteStream?) -> Unmanaged<CFNetDiagnostic>
Creates a network diagnostic object from a pair of CFStreams.
Deprecated
func CFNetDiagnosticCreateWithURL(CFAllocator, CFURL) -> Unmanaged<CFNe
Diagnostic>
Creates a CFNetDiagnosticRef from a CFURLRef.
Deprecated
func CFNetDiagnosticDiagnoseProblemInteractively(CFNetDiagnostic) ->
CFNetDiagnosticStatus
Opens a Network Diagnostics window.
Deprecated
func CFNetDiagnosticSetName(CFNetDiagnostic, CFString)
Overrides the displayed application name.
Special Considerations
See Also
Network Diagnostics


## Page 8

Deprecated


## Page 9

alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocatorDefau
to use the current default allocator.
readStream
Reference to a read stream whose connection has failed, or NULL if you do not want the
CFNetDiagnosticRef to have a read stream.
writeStream
Reference to a write stream whose connection has failed, or NULL if you do not want the
CFNetDiagnosticRef to have a write stream.
Parameters
Discussion
CFNetwork / CFNetDiagnosticCreateWithStreams(_:_:_:) Deprecated
Function
CFNetDiagnosticCreateWithStreams(_:_:
_:) Deprecated
Creates a network diagnostic object from a pair of CFStreams.
iOS 2.0–11.0 Deprecated
iPadOS 2.0–11.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.4–10.13 Deprecated
tvOS 9.0–11.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 10

This function uses references to a read steam and a write stream (or just a read stream or just a
write stream) to create a reference to an instance of a CFNetDiagnostic object. You can pass the
reference to CFNetDiagnosticDiagnoseProblemInteractively(_:) to open a Network
Diagnostics window or to CFNetDiagnosticCopyNetworkStatusPassively(_:_:) to get
description of the connection referenced by readStream and writeStream.
This function is thread safe as long as another thread does not alter the same CFNetDiagnosticRe
at the same time.
class CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
enum CFNetDiagnosticStatusValues
Constants for diagnostic status values.
Deprecated
func CFNetDiagnosticCopyNetworkStatusPassively(CFNetDiagnostic, Unsafe
MutablePointer<Unmanaged<CFString>?>?) -> CFNetDiagnosticStatus
Gets a network status value.
Deprecated
func CFNetDiagnosticCreateWithURL(CFAllocator, CFURL) -> Unmanaged<CFNe
Diagnostic>
Creates a CFNetDiagnosticRef from a CFURLRef.
Deprecated
func CFNetDiagnosticDiagnoseProblemInteractively(CFNetDiagnostic) ->
CFNetDiagnosticStatus
Opens a Network Diagnostics window.
Deprecated
func CFNetDiagnosticSetName(CFNetDiagnostic, CFString)
Overrides the displayed application name.
Special Considerations
See Also
Network Diagnostics


## Page 11

Deprecated


## Page 12

alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocatorDefau
to use the current default allocator.
url
CFURLRef that refers to the failed connection.
CFNetDiagnosticRef that you can pass to CFNetDiagnosticDiagnoseProblem
Interactively(_:) or CFNetDiagnosticCopyNetworkStatusPassively(_:_:).
Ownership follows the The Create Rule.
Parameters
Return Value
Discussion
CFNetwork / CFNetDiagnosticCreateWithURL(_:_:) Deprecated
Function
CFNetDiagnosticCreateWithURL(_:
_:) Deprecated
Creates a CFNetDiagnosticRef from a CFURLRef.
iOS 2.0–11.0 Deprecated
iPadOS 2.0–11.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.4–10.13 Deprecated
tvOS 9.0–11.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 13

This function uses a URL to create a reference to an instance of a CFNetDiagnostic object. You ca
pass the reference to CFNetDiagnosticDiagnoseProblemInteractively(_:) to open a
Network Diagnostics window or to CFNetDiagnosticCopyNetworkStatusPassively(_:_
to get a description of the connection referenced by readStream and writeStream.
This function is thread safe as long as another thread does not alter the same CFNetDiagnosticRe
at the same time.
class CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
enum CFNetDiagnosticStatusValues
Constants for diagnostic status values.
Deprecated
func CFNetDiagnosticCopyNetworkStatusPassively(CFNetDiagnostic, Unsafe
MutablePointer<Unmanaged<CFString>?>?) -> CFNetDiagnosticStatus
Gets a network status value.
Deprecated
func CFNetDiagnosticCreateWithStreams(CFAllocator?, CFReadStream?,
CFWriteStream?) -> Unmanaged<CFNetDiagnostic>
Creates a network diagnostic object from a pair of CFStreams.
Deprecated
func CFNetDiagnosticDiagnoseProblemInteractively(CFNetDiagnostic) ->
CFNetDiagnosticStatus
Opens a Network Diagnostics window.
Deprecated
func CFNetDiagnosticSetName(CFNetDiagnostic, CFString)
Overrides the displayed application name.
Deprecated
Special Considerations
See Also
Network Diagnostics


## Page 14



## Page 15

details
A network diagnostics object, created by CFNetDiagnosticCreateWithStreams(_:_:
_:) or CFNetDiagnosticCreateWithURL(_:_:), for which the window is to be opened
CFNetDiagnosticNoErr if no error occurred, or CFNetDiagnosticErr if an error occurred
that prevented this call from completing successfully.
This function opens the Network Diagnostics window and returns immediately once the window is
open.
Parameters
Return Value
Discussion
Special Considerations
CFNetwork / CFNetDiagnosticDiagnoseProblemInteractively(_:) Deprecated
Function
CFNetDiagnosticDiagnoseProblem
Interactively(_:) Deprecated
Opens a Network Diagnostics window.
iOS 2.0–11.0 Deprecated
iPadOS 2.0–11.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.4–10.13 Deprecated
tvOS 9.0–11.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 16

This function is thread safe as long as another thread does not alter the same CFNetDiagnosticRe
at the same time.
class CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
enum CFNetDiagnosticStatusValues
Constants for diagnostic status values.
Deprecated
func CFNetDiagnosticCopyNetworkStatusPassively(CFNetDiagnostic, Unsafe
MutablePointer<Unmanaged<CFString>?>?) -> CFNetDiagnosticStatus
Gets a network status value.
Deprecated
func CFNetDiagnosticCreateWithStreams(CFAllocator?, CFReadStream?,
CFWriteStream?) -> Unmanaged<CFNetDiagnostic>
Creates a network diagnostic object from a pair of CFStreams.
Deprecated
func CFNetDiagnosticCreateWithURL(CFAllocator, CFURL) -> Unmanaged<CFNe
Diagnostic>
Creates a CFNetDiagnosticRef from a CFURLRef.
Deprecated
func CFNetDiagnosticSetName(CFNetDiagnostic, CFString)
Overrides the displayed application name.
Deprecated
See Also
Network Diagnostics


## Page 17

details
The network diagnostics object for which the application name is to be set.
name
Name that is to be set.
Frameworks requiring that an application name be displayed to the user derive the application
name from the bundle identifier of the currently running application, in that application’s
localization. If you want to override the derived application name, use this function to set the nam
that is displayed.
This function is thread safe as long as another thread does not alter the same CFNetDiagnosticRe
at the same time.
Parameters
Discussion
Special Considerations
CFNetwork / CFNetDiagnosticSetName(_:_:) Deprecated
Function
CFNetDiagnosticSetName(_:_:) Deprecated
Overrides the displayed application name.
iOS 2.0–11.0 Deprecated
iPadOS 2.0–11.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.4–10.13 Deprecated
tvOS 9.0–11.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 18

class CFNetDiagnostic
An opaque reference representing a CFNetDiagnostic.
enum CFNetDiagnosticStatusValues
Constants for diagnostic status values.
Deprecated
func CFNetDiagnosticCopyNetworkStatusPassively(CFNetDiagnostic, Unsafe
MutablePointer<Unmanaged<CFString>?>?) -> CFNetDiagnosticStatus
Gets a network status value.
Deprecated
func CFNetDiagnosticCreateWithStreams(CFAllocator?, CFReadStream?,
CFWriteStream?) -> Unmanaged<CFNetDiagnostic>
Creates a network diagnostic object from a pair of CFStreams.
Deprecated
func CFNetDiagnosticCreateWithURL(CFAllocator, CFURL) -> Unmanaged<CFNe
Diagnostic>
Creates a CFNetDiagnosticRef from a CFURLRef.
Deprecated
func CFNetDiagnosticDiagnoseProblemInteractively(CFNetDiagnostic) ->
CFNetDiagnosticStatus
Opens a Network Diagnostics window.
Deprecated
See Also
Network Diagnostics


