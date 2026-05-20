# 012_CFHostSetClient________.pdf

## Page 1

Deprecated
Use Network framework instead, see deprecation notice in <CFNetwork/CFHost.h>
theHost
The host to modify. The value must not be NULL.
clientCB
The callback function to associate with theHost. The callback function will be called when a
resolution completes or is cancelled. If you are calling this function to disassociate a client
context and callback from theHost, pclientCBass NULL.
clientContext
A CFHostClientContext structure whose info field will be passed to the callback functio
specified by clientCB when clientCB is called. This value must not be NULL when setting
Parameters
CFNetwork / CFHostSetClient(_:_:_:) Deprecated
Function
CFHostSetClient(_:_:_:) Deprecated
Associates a client context and a callback function with a CFHost object or
disassociates a client context and callback function that were previously set.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.3–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

an association.
Pass NULL when disassociating a client context and a callback from a host.
TRUE if the association could be set or unset, otherwise FALSE.
The callback function specified by clientCB will be called when a resolution completes or is
cancelled.
This function is thread safe.
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
Return Value
Discussion
Special Considerations
See Also
Hosts


## Page 3

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
func CFHostStartInfoResolution(CFHost, CFHostInfoType, UnsafeMutable
Pointer<CFStreamError>?) -> Bool
Starts resolution for a host object.
Deprecated
func CFHostUnscheduleFromRunLoop(CFHost, CFRunLoop, CFString)
Unschedules a CFHost from a run loop.
Deprecated


