# 006_CFNetDiagnosticSetName______.pdf

## Page 1

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


## Page 2

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


