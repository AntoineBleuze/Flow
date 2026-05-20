# 004_CFNetDiagnosticCreateWithURL______.pdf

## Page 1

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


## Page 2

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


## Page 3



