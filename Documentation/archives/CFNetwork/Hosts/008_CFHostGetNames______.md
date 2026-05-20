# 008_CFHostGetNames______.pdf

## Page 1

Deprecated
Use Network framework instead, see deprecation notice in <CFNetwork/CFHost.h>
theHost
The host to examine. The host must have been previously resolved. (To resolve a host, call
CFHostStartInfoResolution(_:_:_:).) This value must not be NULL.
hasBeenResolved
On return, contains TRUE if names were available, otherwise FALSE. This value may be NULL
An array containing the of names of theHost, or NULL if no names were available.
Parameters
Return Value
Discussion
CFNetwork / CFHostGetNames(_:_:) Deprecated
Function
CFHostGetNames(_:_:) Deprecated
Gets the names from a CFHost.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.3–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

This function gets the names in a thread-safe way, but the resulting data is not thread-safe. The
data is returned as a “get” as opposed to a copy, so the data is not safe if the CFHost is altered
from another thread.
class CFHost
An opaque reference representing an CFHost object.
enum CFHostInfoType
Values indicating the type of data that is to be resolved or the type of data that was resolved
struct CFHostClientContext
A structure containing user-defined data and callbacks for CFHost objects.
func CFHostCancelInfoResolution(CFHost, CFHostInfoType)
Cancels the resolution of a host.
Deprecated
func CFHostCreateCopy(CFAllocator?, CFHost) -> Unmanaged<CFHost>
Creates a new host object by copying.
Deprecated
func CFHostCreateWithAddress(CFAllocator?, CFData) -> Unmanaged<CFHost>
Uses an address to create an instance of a host object.
Deprecated
func CFHostCreateWithName(CFAllocator?, CFString) -> Unmanaged<CFHost>
Uses a name to create an instance of a host object.
Deprecated
func CFHostGetAddressing(CFHost, UnsafeMutablePointer<DarwinBoolean>?) 
> Unmanaged<CFArray>?
Gets the addresses from a host.
Deprecated
func CFHostGetReachability(CFHost, UnsafeMutablePointer<DarwinBoolean>?
-> Unmanaged<CFData>?
Gets reachability information from a host.
See Also
Hosts


## Page 3

Deprecated
func CFHostGetTypeID() -> CFTypeID
Gets the Core Foundation type identifier for the CFHost opaque type.
Deprecated
func CFHostScheduleWithRunLoop(CFHost, CFRunLoop, CFString)
Schedules a CFHost on a run loop.
Deprecated
func CFHostSetClient(CFHost, CFHostClientCallBack?, UnsafeMutablePointe
<CFHostClientContext>?) -> Bool
Associates a client context and a callback function with a CFHost object or disassociates a
client context and callback function that were previously set.
Deprecated
func CFHostStartInfoResolution(CFHost, CFHostInfoType, UnsafeMutable
Pointer<CFStreamError>?) -> Bool
Starts resolution for a host object.
Deprecated
func CFHostUnscheduleFromRunLoop(CFHost, CFRunLoop, CFString)
Unschedules a CFHost from a run loop.
Deprecated


