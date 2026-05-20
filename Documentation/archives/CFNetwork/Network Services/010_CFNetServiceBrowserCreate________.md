# 010_CFNetServiceBrowserCreate________.pdf

## Page 1

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocator
Default to use the current default allocator.
clientCB
Callback function that is to be called when domains and services are found; cannot be NULL.
For details, see CFNetServiceBrowserClientCallBack.
clientContext
Context information to be used when clientCB is called; cannot be NULL. For details, see
CFNetServiceClientContext.
Parameters
CFNetwork / CFNetServiceBrowserCreate(_:_:_:) Deprecated
Function
CFNetServiceBrowserCreate(_:_:
_:) Deprecated
Creates an instance of a Network Service browser object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

A new browser object, or NULL if the instance could not be created. Ownership follows the The
Create Rule.
This function creates an instance of a Network Service browser object, called a
CFNetServiceBrowser, that can be used to search for domains and for services.
To use the resulting CFNetServiceBrowser in asynchronous mode, call CFNetServiceBrowser
ScheduleWithRunLoop(_:_:_:). Then call CFNetServiceBrowserSearchFor
Domains(_:_:_:) and CFNetServiceBrowserSearchForServices(_:_:_:_:) to use t
CFNetServiceBrowser to search for services and domains, respectively. The callback function
specified by clientCB is called from a run loop to pass search results to your application. The
search continues until you stop the search by calling CFNetServiceBrowserStopSearch(_:
_:).
If you do not call CFNetServiceBrowserScheduleWithRunLoop(_:_:_:), searches with t
resulting CFNetServiceBrowser are made in synchronous mode. Calls made to CFNetService
BrowserSearchForDomains(_:_:_:) and CFNetServiceBrowserSearchFor
Services(_:_:_:_:) block until there are search results, in which case the callback function
specified by clientCB is called, until the search is are stopped by calling CFNetService
BrowserStopSearch(_:_:) from another thread, or an error occurs.
To shut down a CFNetServiceBrowser that is running in asynchronous mode, call CFNetService
BrowserStopSearch(_:_:), followed by CFNetServiceBrowserUnscheduleFromRun
Loop(_:_:_:), and then CFNetServiceBrowserInvalidate(_:).
This function is thread safe.
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 3

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
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
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


