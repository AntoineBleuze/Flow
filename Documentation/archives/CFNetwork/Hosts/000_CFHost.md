# 000_CFHost.pdf

## Page 1

Equatable, Hashable
enum CFHostInfoType
Values indicating the type of data that is to be resolved or the type of data that was resolved
struct CFHostClientContext
A structure containing user-defined data and callbacks for CFHost objects.
func CFHostCancelInfoResolution(CFHost, CFHostInfoType)
Cancels the resolution of a host.
Deprecated
func CFHostCreateCopy(CFAllocator?, CFHost) -> Unmanaged<CFHost>
Relationships
Conforms To
See Also
Hosts
CFNetwork / CFHost
Class
CFHost
An opaque reference representing an CFHost object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

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


## Page 3

Starts resolution for a host object.
Deprecated
func CFHostUnscheduleFromRunLoop(CFHost, CFRunLoop, CFString)
Unschedules a CFHost from a run loop.
Deprecated


