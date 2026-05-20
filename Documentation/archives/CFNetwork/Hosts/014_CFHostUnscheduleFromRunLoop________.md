# 014_CFHostUnscheduleFromRunLoop________.pdf

## Page 1

Deprecated
Use Network framework instead, see deprecation notice in <CFNetwork/CFHost.h>
runLoop
The run loop. This value must not be NULL.
runLoopMode
The mode from which the service is to be unscheduled. This value must not be NULL.
This function is thread safe.
Parameters
Discussion
CFNetwork / CFHostUnscheduleFromRunLoop(_:_:_:) Deprecated
Function
CFHostUnscheduleFromRunLoop(_:_:
_:) Deprecated
Unschedules a CFHost from a run loop.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.3–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

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
func CFHostGetNames(CFHost, UnsafeMutablePointer<DarwinBoolean>?) ->
Unmanaged<CFArray>?
Gets the names from a CFHost.
Deprecated
See Also
Hosts


## Page 3

func CFHostGetReachability(CFHost, UnsafeMutablePointer<DarwinBoolean>?
-> Unmanaged<CFData>?
Gets reachability information from a host.
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


