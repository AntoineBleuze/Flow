# 005_CFNetServiceClientContext.pdf

## Page 1

init()
Creates an object that contains user-defined data and callbacks for net service browsers.
init(version: CFIndex, info: UnsafeMutableRawPointer?, retain:
CFAllocatorRetainCallBack?, release: CFAllocatorReleaseCallBack?, copy
Description: CFAllocatorCopyDescriptionCallBack?)
Creates an object that contains user-defined data and callbacks for net service browsers
using the specified values.
var copyDescription: CFAllocatorCopyDescriptionCallBack?
Callback used to create a descriptive string representation of the data pointed to by info. In
implementing this function, return a reference to a CFString object that describes your
allocator and some characteristics of your user-defined data, which is used by CFCopy
Description(). You can set this field to NULL, in which case Core Foundation will provide
rudimentary description.
Topics
Initializers
Instance Properties
CFNetwork / CFNetServiceClientContext
Structure
CFNetServiceClientContext
A structure provided when a CFNetService is associated with a callback function
or when a CFNetServiceBrowser is created.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

var info: UnsafeMutableRawPointer?
Arbitrary pointer to user-allocated memory containing user-defined data that is associated
with the service, browser, or monitor and is passed to their respective callback functions. Th
data must be valid for as long as the CFNetService, CFNetServiceBrowser, or
CFNetServiceMonitor is valid. Set this field to NULL if your callback function doesn’t want to
receive user-defined data.
var release: CFAllocatorReleaseCallBack?
Callback that removes a retain previously added for the service or browser on the info
pointer. This field can be NULL, but setting this field to NULL may result in memory leaks.
var retain: CFAllocatorRetainCallBack?
The callback used to add a retain for the service or browser using info for the life of the
service or browser. This callback may be used for temporary references the service or
browser needs to take. This callback returns the actual info pointer so it can be stored in th
service or browser. This field can be NULL.
var version: CFIndex
Version number for this structure. Currently the only valid value is zero.
BitwiseCopyable
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Relationships
Conforms To
See Also
Network Services


## Page 3

Flags that the system passes to net service browser callbacks.
class CFNetServiceMonitor
An opaque reference for a service monitor.
enum CFNetServiceMonitorType
Record type specifier used to tell a service monitor the type of record changes to watch for.
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
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


