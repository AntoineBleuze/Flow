# 005_CFNetDiagnosticDiagnoseProblemInteractively____.pdf

## Page 1

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


## Page 2

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


