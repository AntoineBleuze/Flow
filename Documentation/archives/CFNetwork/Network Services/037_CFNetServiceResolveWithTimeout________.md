# 037_CFNetServiceResolveWithTimeout________.pdf

## Page 1

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService to resolve; cannot be NULL. The resolution will fail if the service doesn’t
have a domain, a type, and a name.
timeout
Value of type CFTimeInterval specifying the maximum amount of time allowed to perform
the resolution. If the resolution is not performed within the specified amount of time, a timeou
error will be returned. If timeout is less than or equal to zero, an infinite amount of time is
allowed.
error
Parameters
CFNetwork / CFNetServiceResolveWithTimeout(_:_:_:) Deprecated
Function
CFNetServiceResolveWithTimeout(_:_:
_:) Deprecated
Gets the IP address or addresses for a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

Pointer to a CFStreamError structure that will be set to an error code and the error code’s
domain if an error occurs; or NULL if you don’t want to receive the error code and its domain.
TRUE if an asynchronous service resolution was started or if a synchronous service resolution
updated the CFNetService; FALSE if an asynchronous or synchronous resolution failed or timed
out, or if a synchronous resolution was canceled.
This function updates the specified CFNetService with the IP address or addresses associated wi
the service. Call CFNetServiceGetAddressing(_:) to get the addresses.
When resolving a service that runs in asynchronous mode, this function returns TRUE if the
CFNetService has a domain, type, and name, and the underlying resolution process was started.
Otherwise, this function returns FALSE. Once started, the resolution continues until it is canceled
by calling CFNetServiceCancel(_:).
When resolving a service that runs in synchronous mode, this function blocks until the
CFNetService is updated with at least one IP address, until an error occurs, or until CFNetServi
Cancel(_:) is called.
This function is thread safe.
If the service will be used in asynchronous mode, you must call CFNetServiceSetClient(_:_
_:) before calling this function.
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 3

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


## Page 4

Searches a domain for services of a specified type.
Deprecated
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


