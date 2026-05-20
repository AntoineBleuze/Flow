# 002_CFNetDiagnosticCopyNetworkStatusPassively______.pdf

## Page 1

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


## Page 2

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


## Page 3

Deprecated


