# 013_CFNetServiceBrowserSearchForServices__________.pdf

## Page 1

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
browser
The CFNetServiceBrowser, obtained by previously calling CFNetServiceBrowser
Create(_:_:_:), that is to perform the search; cannot be NULL.
domain
The domain to search for the service type; cannot be NULL. To get the domains that are
available for searching, call CFNetServiceBrowserSearchForDomains(_:_:_:).
error
Parameters
CFNetwork / CFNetServiceBrowserSearchForServices(_:_:_:_:) Deprecated
Function
CFNetServiceBrowserSearchFor
Services(_:_:_:_:) Deprecated
Searches a domain for services of a specified type.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

A pointer to a CFStreamError structure, that, if an error occurs, will be set to the error and
the error’s domain and passed to your callback function. Pass NULL if you don’t want to
receive the error that may occur as a result of this particular call.
TRUE if the search was started (asynchronous mode); FALSE if another search is already in
progress for this CFNetServiceBrowser or if an error occurred.
This function searches the specified domain for services that match the specified service type. T
search continues until the search is canceled by calling CFNetServiceBrowserStop
Search(_:_:). When a match is found, the callback function specified when the
CFNetServiceBrowser was created is called and passed an instance of a CFNetService
representing the service that was found.
In asynchronous mode, this function returns TRUE if the search was started. Otherwise, it returns
FALSE.
In synchronous mode, this function blocks until the search is stopped by calling CFNetService
BrowserStopSearch(_:_:) from another thread, in which case this function returns FALSE, o
until an error occurs.
This function is thread safe.
For any one CFNetServiceBrowser, only one domain search or one service search can be in
progress at the same time.
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 3

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


## Page 4

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


