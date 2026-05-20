# 014_CFNetServiceBrowserStopSearch______.pdf

## Page 1

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
browser
The CFNetServiceBrowser that was used to start the search; cannot be NULL.
error
A pointer to a CFStreamError structure that will be passed to the callback function
associated with this CFNetServiceBrowser (if the search is being conducted in asynchronous
mode) or that is pointed to by the error parameter when CFNetServiceBrowserSearch
ForDomains(_:_:_:) or CFNetServiceBrowserSearchForServices(_:_:_:_:)
returns (if the search is being conducted in synchronous mode). Set the domain field to k
CFStreamErrorDomainCustom and the error field to an appropriate value.
Parameters
CFNetwork / CFNetServiceBrowserStopSearch(_:_:) Deprecated
Function
CFNetServiceBrowserStopSearch(_:
_:) Deprecated
Stops a search for domains or services.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

This functions stops a search started by a previous call to CFNetServiceBrowserSearchFor
Domains(_:_:_:) or CFNetServiceBrowserSearchForServices(_:_:_:_:). For
asynchronous and synchronous searches, calling this function causes the callback function
associated with the CFNetServiceBrowser to be called once for each domain or service found. If
the search is asynchronous, error is passed to the callback function. If the search is synchronou
calling this function causes CFNetServiceBrowserSearchForDomains(_:_:_:) or CFNet
ServiceBrowserSearchForServices(_:_:_:_:) to return FALSE. If the error paramete
for either call pointed to a CFStreamError structure, the CFStreamError structure contains t
error code and the error code’s domain as set when this function was called.
This function is thread safe.
If you are stopping an asynchronous search, before calling this function, call CFNetService
BrowserUnscheduleFromRunLoop(_:_:_:), followed by CFNetServiceBrowser
Invalidate(_:).
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
class CFNetServiceMonitor
An opaque reference for a service monitor.
enum CFNetServiceMonitorType
Record type specifier used to tell a service monitor the type of record changes to watch for.
struct CFNetServiceClientContext
A structure provided when a CFNetService is associated with a callback function or when a
CFNetServiceBrowser is created.
Discussion
Special Considerations
See Also
Network Services


## Page 3

struct CFNetServiceRegisterFlags
Options to use when registering a service on the network.
enum CFNetServicesError
Error codes that may be returned by CFNetServices functions or passed to CFNetServices
callback functions.
func CFNetServiceBrowserInvalidate(CFNetServiceBrowser)
Invalidates an instance of a Network Service browser object.
Deprecated
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
func CFNetServiceBrowserCreate(CFAllocator?, CFNetServiceBrowserClient
CallBack, UnsafeMutablePointer<CFNetServiceClientContext>) -> Unmanaged
CFNetServiceBrowser>
Creates an instance of a Network Service browser object.
Deprecated
func CFNetServiceBrowserGetTypeID() -> CFTypeID
Gets the Core Foundation type identifier for the Network Service browser object.
Deprecated
func CFNetServiceBrowserSearchForDomains(CFNetServiceBrowser, Bool,
UnsafeMutablePointer<CFStreamError>?) -> Bool
Searches for domains.
Deprecated
func CFNetServiceBrowserSearchForServices(CFNetServiceBrowser, CFString
CFString, UnsafeMutablePointer<CFStreamError>?) -> Bool
Searches a domain for services of a specified type.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 4



