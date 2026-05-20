# 033_CFNetServiceMonitorStart________.pdf

## Page 1

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
monitor
CFNetServiceMonitor, created by calling CFNetServiceMonitorCreate(_:_:_:_:), tha
is to be started.
recordType
CFNetServiceMonitorType that specified the type of record to monitor. For possible values, s
CFNetServiceMonitorType.
error
Pointer to a CFStreamError structure. If an error occurs, on output, the structure’s domain
field will be set to the error code’s domain and the error field will be set to an appropriate
Parameters
CFNetwork / CFNetServiceMonitorStart(_:_:_:) Deprecated
Function
CFNetServiceMonitorStart(_:_:_:) Deprecated
Starts monitoring.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

error code. Set this parameter to NULL if you don’t want to receive the error code and its
domain.
TRUE if an asynchronous monitor was started successfully. FALSE if an error occurred when
starting an asynchronous or synchronous monitor, or if CFNetServiceMonitorStop(_:_:)
was called for an synchronous monitor.
This function starts monitoring for changes to records of the type specified by recordType. If a
monitor is already running for the service associated with the specified CFNetServiceMonitorRef,
this function returns FALSE.
For synchronous monitors, this function blocks until the monitor is stopped by calling CFNet
ServiceMonitorStop(_:_:), in which case, this function returns FALSE.
For asynchronous monitors, this function returns TRUE or FALSE, depending on whether
monitoring starts successfully.
This function is thread safe.
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
class CFNetServiceMonitor
An opaque reference for a service monitor.
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 3

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


## Page 4

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


