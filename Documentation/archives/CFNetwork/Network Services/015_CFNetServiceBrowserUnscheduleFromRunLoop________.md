# 015_CFNetServiceBrowserUnscheduleFromRunLoop________.pdf

## Page 1

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
browser
The CFNetServiceBrowser that is to be unscheduled; cannot be NULL.
runLoop
The run loop; cannot be NULL.
runLoopMode
The mode from which the browser is to be unscheduled; cannot be NULL.
Parameters
Discussion
CFNetwork / CFNetServiceBrowserUnscheduleFromRunLoop(_:_:_:) Deprecated
Function
CFNetServiceBrowserUnscheduleFrom
RunLoop(_:_:_:) Deprecated
Unschedules a CFNetServiceBrowser from a run loop and mode.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

Call this function to shut down a browser that is running asynchronously. To complete the
shutdown, call CFNetServiceBrowserInvalidate(_:) followed by CFNetServiceBrowse
StopSearch(_:_:).
This function is thread safe.
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
struct CFNetServiceRegisterFlags
Options to use when registering a service on the network.
enum CFNetServicesError
Error codes that may be returned by CFNetServices functions or passed to CFNetServices
callback functions.
func CFNetServiceBrowserInvalidate(CFNetServiceBrowser)
Invalidates an instance of a Network Service browser object.
Deprecated
Special Considerations
See Also
Network Services


## Page 3

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


