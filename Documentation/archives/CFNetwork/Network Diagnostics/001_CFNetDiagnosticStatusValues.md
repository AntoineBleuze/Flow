# 001_CFNetDiagnosticStatusValues.pdf

## Page 1

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


## Page 2

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


## Page 3

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


