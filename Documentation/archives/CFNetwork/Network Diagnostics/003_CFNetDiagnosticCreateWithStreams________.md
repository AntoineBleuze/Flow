# 003_CFNetDiagnosticCreateWithStreams________.pdf

## Page 1

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


## Page 2

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


## Page 3

Deprecated


