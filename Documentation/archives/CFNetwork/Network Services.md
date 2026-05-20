# Network Services.pdf

## Page 1

Equatable, Hashable
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
class CFNetServiceMonitor
An opaque reference for a service monitor.
enum CFNetServiceMonitorType
Record type specifier used to tell a service monitor the type of record changes to watch for.
Relationships
Conforms To
See Also
Network Services
CFNetwork / CFNetService
Class
CFNetService
An opaque reference representing a CFNetService.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)


## Page 3

Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 4

Equatable, Hashable
class CFNetService
An opaque reference representing a CFNetService.
struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
class CFNetServiceMonitor
An opaque reference for a service monitor.
enum CFNetServiceMonitorType
Record type specifier used to tell a service monitor the type of record changes to watch for.
Relationships
Conforms To
See Also
Network Services
CFNetwork / CFNetServiceBrowser
Class
CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 5

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)


## Page 6

Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 7

init(rawValue: CFOptionFlags)
Initializes a flag value with the specified bitfield.
static var isDefault: CFNetServiceBrowserFlags
Specifies whether the resulting domain is the default registration or browse domain.
static var isDomain: CFNetServiceBrowserFlags
Specifies whether the result pertains to a search for domains or services.
static var isRegistrationDomain: CFNetServiceBrowserFlags
Deprecated
static var moreComing: CFNetServiceBrowserFlags
A hint that the system will call the client’s callback function again soon.
static var remove: CFNetServiceBrowserFlags
Specifies whether the client should remove the result instead of adding it.
Topics
Constants
Type Properties
CFNetwork / CFNetServiceBrowserFlags
Structure
CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 8

static var isRegistrationDomain: CFNetServiceBrowserFlags
Deprecated
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
class CFNetServiceMonitor
An opaque reference for a service monitor.
enum CFNetServiceMonitorType
Record type specifier used to tell a service monitor the type of record changes to watch for.
struct CFNetServiceClientContext
A structure provided when a CFNetService is associated with a callback function or when a
CFNetServiceBrowser is created.
struct CFNetServiceRegisterFlags
Options to use when registering a service on the network.
Relationships
Conforms To
See Also
Network Services


## Page 9

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 10



## Page 11

Service monitor references are used to monitor record changes on a CFNetServiceRef.
Equatable, Hashable
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
Discussion
Relationships
Conforms To
See Also
Network Services
CFNetwork / CFNetServiceMonitor
Class
CFNetServiceMonitor
An opaque reference for a service monitor.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 12

struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
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


## Page 13

Searches a domain for services of a specified type.
Deprecated
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 14

case TXT
Watch for TXT record changes.
init?(rawValue: Int32)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
Topics
Constants
Initializers
Relationships
Conforms To
CFNetwork / CFNetServiceMonitorType
Enumeration
CFNetServiceMonitorType
Record type specifier used to tell a service monitor the type of record changes to
watch for.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 15

SendableMetatype
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Flags that the system passes to net service browser callbacks.
class CFNetServiceMonitor
An opaque reference for a service monitor.
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
See Also
Network Services


## Page 16

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
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 21

init(rawValue: CFOptionFlags)
Initializes a flag value with the specified bitfield.
static var noAutoRename: CFNetServiceRegisterFlags
Causes registrations to fail if a name conflict occurs.
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
Topics
Creating Register Flags
Constants
Relationships
Conforms To
CFNetwork / CFNetServiceRegisterFlags
Structure
CFNetServiceRegisterFlags
Options to use when registering a service on the network.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 22

RawRepresentable
Sendable
SendableMetatype
SetAlgebra
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
See Also
Network Services


## Page 23

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
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 24

case unknown
An unknown CFNetService error occurred.
case collision
An attempt was made to use a name that is already in use.
case notFound
Not used.
case inProgress
A search is already in progress.
case badArgument
A required argument was not provided.
case cancel
The search or service was canceled.
case invalid
Topics
Constants
CFNetwork / CFNetServicesError
Enumeration
CFNetServicesError
Error codes that may be returned by CFNetServices functions or passed to
CFNetServices callback functions.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 25

Invalid data was passed to a CFNetServices function.
case timeout
Resolution failed because the timeout was reached.
case missingRequiredConfiguration
A required configuration for local network access is missing.
init?(rawValue: Int32)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
struct CFNetServiceBrowserFlags
Enumeration Cases
Initializers
Relationships
Conforms To
See Also
Network Services


## Page 26

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


## Page 27

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 28

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
browser
The CFNetServiceBrowser to invalidate, obtained by a previous call to CFNetService
BrowserCreate(_:_:_:).
This function invalidates the specified instance of a Network Service browser object. Any searche
using the specified instance that are in progress when this function is called are stopped. An
invalidated browser cannot be scheduled on a run loop and its callback function is never called.
This function is thread safe as long as another thread does not alter the same
CFNetServiceBrowserRef at the same time.
Parameters
Discussion
Special Considerations
CFNetwork / CFNetServiceBrowserInvalidate(_:) Deprecated
Function
CFNetServiceBrowser
Invalidate(_:) Deprecated
Invalidates an instance of a Network Service browser object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 29

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
func CFNetServiceBrowserCreate(CFAllocator?, CFNetServiceBrowserClient
CallBack, UnsafeMutablePointer<CFNetServiceClientContext>) -> Unmanaged
CFNetServiceBrowser>
Creates an instance of a Network Service browser object.
Deprecated
See Also
Network Services


## Page 30

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
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 31

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
browser
The CFNetServiceBrowser that is to be scheduled on a run loop; cannot be NULL.
runLoop
The run loop on which the browser is to be scheduled; cannot be NULL.
runLoopMode
The mode on which to schedule the browser; cannot be NULL.
Parameters
Discussion
CFNetwork / CFNetServiceBrowserScheduleWithRunLoop(_:_:_:) Deprecated
Function
CFNetServiceBrowserScheduleWithRun
Loop(_:_:_:) Deprecated
Schedules a CFNetServiceBrowser on a run loop.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 32

This function schedules the specified CFNetServiceBrowser on the run loop, thereby placing the
browser in asynchronous mode. The run loop will call the browser’s callback function to deliver th
results of domain and service searches. The caller is responsible for ensuring that at least one of
the run loops on which the browser is scheduled is being run.
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
Special Considerations
See Also
Network Services


## Page 33

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
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 34

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


## Page 35

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


## Page 36

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


## Page 37

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 38

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
The type ID.
This function is thread safe.
class CFNetService
An opaque reference representing a CFNetService.
Return Value
Discussion
See Also
Network Services
CFNetwork / CFNetServiceBrowserGetTypeID() Deprecated
Function
CFNetServiceBrowserGetTypeID() Deprecated
Gets the Core Foundation type identifier for the Network Service browser object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 39

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
func CFNetServiceBrowserCreate(CFAllocator?, CFNetServiceBrowserClient
CallBack, UnsafeMutablePointer<CFNetServiceClientContext>) -> Unmanaged
CFNetServiceBrowser>
Creates an instance of a Network Service browser object.
Deprecated
func CFNetServiceBrowserSearchForDomains(CFNetServiceBrowser, Bool,
UnsafeMutablePointer<CFStreamError>?) -> Bool
Searches for domains.
Deprecated


## Page 40

func CFNetServiceBrowserSearchForServices(CFNetServiceBrowser, CFString
CFString, UnsafeMutablePointer<CFStreamError>?) -> Bool
Searches a domain for services of a specified type.
Deprecated
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 41

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
browser
The CFNetServiceBrowser, obtained by previously calling CFNetServiceBrowser
Create(_:_:_:), that is to perform the search; cannot be NULL.
registrationDomains
TRUE to search for only registration domains; FALSE to search for domains that can be
browsed for services. For this version of the CFNetServices API, the registration domain is th
local domain maintained by the mDNS responder running on the same machine as the calling
application.
error
Parameters
CFNetwork / CFNetServiceBrowserSearchForDomains(_:_:_:) Deprecated
Function
CFNetServiceBrowserSearchFor
Domains(_:_:_:) Deprecated
Searches for domains.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 42

A pointer to a CFStreamError structure, that, if an error occurs, will be set to the error and
the error’s domain and passed to your callback function. Pass NULL if you don’t want to
receive the error that may occur as a result of this particular call.
TRUE if the search was started (asynchronous mode); FALSE if another search is already in
progress for this CFNetServiceBrowser or if an error occurred.
This function uses a CFNetServiceBrowser to search for domains. The search continues until the
search is canceled by calling CFNetServiceBrowserStopSearch(_:_:). If registration
Domains is TRUE, this function searches only for domains in which services can be registered. If
registrationDomains is FALSE, this function searches for domains that can be browsed for
services. When a domain is found, the callback function specified when the CFNetServiceBrowse
was created is called and passed an instance of a CFStringRef containing the domain that was
found.
In asynchronous mode, this function returns TRUE if the search was started. Otherwise, it returns
FALSE.
In synchronous mode, this function blocks until the search is stopped by calling CFNetService
BrowserStopSearch(_:_:) from another thread, in which case it returns FALSE, or until an
error occurs.
This function is thread safe.
For any one CFNetServiceBrowser, only one domain search or one service search can be in
progress at the same time.
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
An opaque reference representing a CFNetServiceBrowser.
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 43

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
func CFNetServiceBrowserCreate(CFAllocator?, CFNetServiceBrowserClient
CallBack, UnsafeMutablePointer<CFNetServiceClientContext>) -> Unmanaged
CFNetServiceBrowser>
Creates an instance of a Network Service browser object.
Deprecated
func CFNetServiceBrowserGetTypeID() -> CFTypeID
Gets the Core Foundation type identifier for the Network Service browser object.
Deprecated
func CFNetServiceBrowserSearchForServices(CFNetServiceBrowser, CFString
CFString, UnsafeMutablePointer<CFStreamError>?) -> Bool
Searches a domain for services of a specified type.
Deprecated


## Page 44

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 45

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


## Page 46

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


## Page 47

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


## Page 48

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated
func CFNetServiceBrowserUnscheduleFromRunLoop(CFNetServiceBrowser, CFRu
Loop, CFString)
Unschedules a CFNetServiceBrowser from a run loop and mode.
Deprecated


## Page 49

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


## Page 50

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


## Page 51

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


## Page 52



## Page 53

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


## Page 54

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


## Page 55

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


## Page 56

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService, obtained by previously calling CFNetServiceCreate(_:_:_:_:_:), f
which a registration or a resolution is to be canceled.
This function cancels service registrations, started by CFNetServiceRegister, thereby makin
the service unavailable. It also cancels service resolutions, started by CFNetServiceResolve.
If you are shutting down an asynchronous service, you should first call CFNetService
UnscheduleFromRunLoop(_:_:_:) and CFNetServiceSetClient(_:_:_:) with clien
CB set to NULL. Then call this function.
If you are shutting down a synchronous service, call this function from another thread.
This function also cancels service resolutions. You would want to cancel a service resolution if yo
callback function has received an IP address that you’ve successfully used to connect to the
Parameters
Discussion
CFNetwork / CFNetServiceCancel(_:) Deprecated
Function
CFNetServiceCancel(_:) Deprecated
Cancels a service registration or a service resolution.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 57

service. In addition, you might want to cancel a service resolution if the resolution is taking longer
than a user would want to wait or if the user canceled the operation.
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


## Page 58

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


## Page 59

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocator
Default to use the current default allocator.
domain
The domain in which the CFNetService is to be registered; cannot be NULL. Call CFNet
ServiceBrowserCreate(_:_:_:) and CFNetServiceBrowserSearchFor
Domains(_:_:_:) to get the registration domain.
name
Parameters
CFNetwork / CFNetServiceCreate(_:_:_:_:_:) Deprecated
Function
CFNetServiceCreate(_:_:_:_:_:) Deprecated
Creates an instance of a Network Service object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 60

A unique name if the instance will be used to register a service. The name will become part o
the instance name in the DNS records that will be created when the service is registered. If th
instance will be used to resolve a service, the name should be the name of the machine or
service that will be resolved.
port
Local IP port, in host byte order, on which this service accepts connections. Pass zero to get
placeholder service. With a placeholder service, the service will not be discovered by
browsing, but a name conflict will occur if another client tries to register the same name. Mos
applications do not need to use placeholder service.
A new net service object, or NULL if the instance could not be created. Ownership follows the The
Create Rule.
If the service depends on information in DNS TXT records, call CFNetServiceSetProtocol
SpecificInformation.
If the CFNetService is to run in asynchronous mode, call CFNetServiceSetClient(_:_:_:) 
prepare the service for running in asynchronous mode. Then call CFNetServiceScheduleWith
RunLoop(_:_:_:) to schedule the service on a run loop. Then call CFNetServiceRegister 
make the service available.
If the CFNetService is to run in synchronous mode, call CFNetServiceRegister.
To terminate a service that is running in asynchronous mode, call CFNetServiceCancel(_:)
and CFNetServiceUnscheduleFromRunLoop(_:_:_:).
To terminate a service that is running in synchronous mode, call CFNetServiceCancel(_:).
This function is thread safe.
class CFNetService
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 61

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


## Page 62

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


## Page 63

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocator
Default to use the current default allocator.
service
CFNetServiceRef to be copied; cannot be NULL. If service is not a valid CFNetServiceRef,
the behavior of this function is undefined.
Copy of service, including all previously resolved data, or NULL if service could not be copied
Ownership follows the The Create Rule.
Parameters
Return Value
CFNetwork / CFNetServiceCreateCopy(_:_:) Deprecated
Function
CFNetServiceCreateCopy(_:_:) Deprecated
Creates a copy of a CFNetService object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.3–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 64

This function creates a copy of the CFNetService specified by service.
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
Discussion
Special Considerations
See Also
Network Services


## Page 65

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


## Page 66

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocator
Default to use the current default allocator.
txtRecord
TXT record data as returned by CFNetServiceGetTXTData(_:).
A dictionary containing the key/value pairs parsed from txtRecord, or NULL if txtRecord cann
be parsed. Each key in the dictionary is a CFString object, and each value is a CFData object.
Parameters
Return Value
CFNetwork / CFNetServiceCreateDictionaryWithTXTData(_:_:) Deprecated
Function
CFNetServiceCreateDictionaryWith
TXTData(_:_:) Deprecated
Uses TXT record data to create a dictionary.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 67

Ownership follows the The Create Rule.
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
Discussion
See Also
Network Services


## Page 68

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


## Page 69

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocator
Default to use the current default allocator.
keyValuePairs
CFDictionaryRef containing the key/value pairs that are to be placed in a TXT record. Each ke
must be a CFStringRef and each value should be a CFDataRef or a CFStringRef. (See the
discussion below for additional information about values that are CFStringRefs.) This function
fails if any other data types are provided. The length of a key and its value should not exceed
255 bytes.
Parameters
CFNetwork / CFNetServiceCreateTXTDataWithDictionary(_:_:) Deprecated
Function
CFNetServiceCreateTXTDataWith
Dictionary(_:_:) Deprecated
Flattens a set of key/value pairs into a CFDataRef suitable for passing to CFNet
ServiceSetTXTData(_:_:).
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 70

A CFData object containing the flattened form of keyValuePairs, or NULL if the dictionary cou
not be flattened. Ownership follows the The Create Rule.
This function flattens the key/value pairs in the dictionary specified by keyValuePairs into a
CFDataRef suitable for passing to CFNetServiceSetTXTData(_:_:). Note that this function 
not a general purpose function for flattening CFDictionaryRefs.
The keys in the dictionary referenced by keyValuePairs must be CFStringRefs and the values
must be CFDataRefs. Any values that are CFStringRefs are converted to CFDataRefs representing
the flattened UTF-8 bytes of the string. The types of the values are not encoded in the CFDataRe
so any CFStringRefs that are converted to CFDataRefs remain CFDataRefs when the CFDataRef
produced by this function is processed by CFNetServiceCreateDictionaryWith
TXTData(_:_:).
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
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 71

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)


## Page 72

Stops a search for domains or services.
Deprecated


## Page 73

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService whose IP addressing is to be obtained; cannot be NULL.
A CFArray containing a CFDataRef for each IP address returned, or NULL. Each CFDataRef consis
of a sockaddr structure containing the IP address of the service. This function returns NULL if th
service’s addressing is unknown because CFNetServiceResolve has not been called for the
Service.
This function gets the IP addressing from a CFNetService. Typically, the CFNetService was
obtained by calling CFNetServiceBrowserSearchForServices(_:_:_:_:). Before calling
this function, call CFNetServiceResolve to update the CFNetService with its IP addressing.
Parameters
Return Value
Discussion
CFNetwork / CFNetServiceGetAddressing(_:) Deprecated
Function
CFNetServiceGetAddressing(_:) Deprecated
Gets the IP addressing from a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 74

This function gets the data in a thread-safe way, but the data itself is not safe if the service is
altered from another thread.
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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Special Considerations
See Also
Network Services


## Page 75

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


## Page 76

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService whose domain is to be obtained; cannot be NULL.
A CFString object containing the domain of the CFNetService.
This function gets the domain from a CFNetService.
This function is thread safe. The function gets the data in a thread-safe way, but the data is not
safe if the service is altered from another thread.
Parameters
Return Value
Discussion
Special Considerations
CFNetwork / CFNetServiceGetDomain(_:) Deprecated
Function
CFNetServiceGetDomain(_:) Deprecated
Gets the domain from a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 77

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
See Also
Network Services


## Page 78

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


## Page 79

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService whose name is to be obtained; cannot be NULL.
A CFString object containing the name of the service represented by the CFNetService.
This function gets the name from a CFNetService.
This function is thread safe. The function gets the data in a thread-safe way, but the data is not
safe if the service is altered from another thread.
Parameters
Return Value
Discussion
Special Considerations
CFNetwork / CFNetServiceGetName(_:) Deprecated
Function
CFNetServiceGetName(_:) Deprecated
Gets the name from a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 80

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
See Also
Network Services


## Page 81

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


## Page 82

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService whose protocol-specific information is to be obtained; cannot be NULL.
Note that in order to get protocol-specific information, you must resolve theService by
calling CFNetServiceResolve or CFNetServiceResolveWithTimeout(_:_:_:)
before calling this function.
The port number of the service.
Parameters
Return Value
See Also
Network Services
CFNetwork / CFNetServiceGetPortNumber(_:) Deprecated
Function
CFNetServiceGetPortNumber(_:) Deprecated
This function gets the port number from a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.5–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 83

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


## Page 84

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


## Page 85

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
Reference for the network service whose TXT record data is to be obtained; cannot be NULL
Note that in order to get TXT record data, you must resolve theService by calling CFNet
ServiceResolve or CFNetServiceResolveWithTimeout(_:_:_:) before calling this
function.
CFDataRef object containing the requested TXT data and suitable for passing to CFNetService
CreateDictionaryWithTXTData(_:_:), or NULL if the service’s TXT data has not been
resolved.
This function gets the data from the service’s TXT records.
Parameters
Return Value
Discussion
CFNetwork / CFNetServiceGetTXTData(_:) Deprecated
Function
CFNetServiceGetTXTData(_:) Deprecated
Queries a network service for the contents of its TXT records.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 86

This function gets the data in a thread-safe way, but the data itself is not safe if the service is
altered from another thread.
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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Special Considerations
See Also
Network Services


## Page 87

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


## Page 88

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
Network service to be queried.
The target host name of the machine providing the service or NULL is of the service’s target host 
not known. (The target host will not be known if it has not been resolved.)
This function is thread safe, but the target host name is not safe if the service is altered from
another thread.
Parameters
Return Value
Discussion
CFNetwork / CFNetServiceGetTargetHost(_:) Deprecated
Function
CFNetServiceGetTargetHost(_:) Deprecated
Queries a CFNetService for its target hosts.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 89

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
See Also
Network Services


## Page 90

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


## Page 91

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService whose type is to be obtained; cannot be NULL.
A CFString object containing the type from a CFNetService.
This function gets the type of a CFNetService.
This function is thread safe. The function gets the data in a thread-safe way, but the data is not
safe if the service is altered from another thread.
Parameters
Return Value
Discussion
Special Considerations
CFNetwork / CFNetServiceGetType(_:) Deprecated
Function
CFNetServiceGetType(_:) Deprecated
Gets the type from a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 92

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
See Also
Network Services


## Page 93

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


## Page 94

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
The type ID.
This function is thread safe.
class CFNetService
An opaque reference representing a CFNetService.
Return Value
Discussion
See Also
Network Services
CFNetwork / CFNetServiceGetTypeID() Deprecated
Function
CFNetServiceGetTypeID() Deprecated
Gets the Core Foundation type identifier for the Network Service object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 95

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


## Page 96

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


## Page 97

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocator
Default to use the current default allocator.
theService
CFNetService to be monitored.
clientCB
Parameters
CFNetwork / CFNetServiceMonitorCreate(_:_:_:_:) Deprecated
Function
CFNetServiceMonitorCreate(_:_:_:
_:) Deprecated
Creates an instance of a NetServiceMonitor object that watches for record
changes.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 98

Pointer to callback function that is to be called when a record associated with theService
changes; cannot be NULL.
clientContext
Pointer to user-defined contextual information that is to be passed to the callback specified b
clientCB when the callback is called; cannot be NULL. For details, see CFNetService
ClientContext.
A new instance of a CFNetServiceMonitor, or NULL if the monitor could not be created. Ownershi
follows the The Create Rule.
This function creates a CFNetServiceMonitor that watches for changes in records associated with
theService.
If the CFNetServiceMonitor is to run in asynchronous mode, call CFNetServiceMonitor
ScheduleWithRunLoop(_:_:_:) to schedule the monitor on a run loop. Then call CFNet
ServiceMonitorStart(_:_:_:) to start monitoring. When a change occurs, the callback
function specified by clientCB will be called. For details, see CFNetServiceMonitorClient
CallBack.
If the CFNetServiceMonitor is to run in synchronous mode, call CFNetServiceMonitor
Start(_:_:_:).
To stop a monitor that is running in asynchronous mode, call CFNetServiceMonitorStop(_:
_:) and CFNetServiceMonitorUnscheduleFromRunLoop(_:_:_:).
To stop a monitor that is running in synchronous mode, call CFNetServiceMonitorStop(_:
_:).
If you no longer need to monitor record changes, call CFNetServiceMonitorStop(_:_:) to
stop the monitor and then call CFNetServiceMonitorInvalidate(_:)to invalidate the
monitor so it cannot be used again. Then call CFRelease to release the memory associated with
CFNetServiceMonitorRef.
This function is thread safe.
Return Value
Discussion
Special Considerations
See Also


## Page 99

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
func CFNetServiceBrowserCreate(CFAllocator?, CFNetServiceBrowserClient
CallBack, UnsafeMutablePointer<CFNetServiceClientContext>) -> Unmanaged
CFNetServiceBrowser>
Creates an instance of a Network Service browser object.
Deprecated
Network Services


## Page 100

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


## Page 101

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
The type ID.
This function is thread safe.
Introduced in OS X v10.4.
Return Value
Discussion
Version-Notes
See Also
CFNetwork / CFNetServiceMonitorGetTypeID() Deprecated
Function
CFNetServiceMonitorGetTypeID() Deprecated
Gets the Core Foundation type identifier for all CFNetServiceMonitor instances.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 102

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
func CFNetServiceBrowserCreate(CFAllocator?, CFNetServiceBrowserClient
CallBack, UnsafeMutablePointer<CFNetServiceClientContext>) -> Unmanaged
CFNetServiceBrowser>
Creates an instance of a Network Service browser object.
Deprecated
Network Services


## Page 103

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


## Page 104

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
monitor
CFNetServiceMonitor to invalidate; cannot be NULL.
This function invalidates the specified Network Service monitor so that it cannot be used again.
Before you call this function, you should call CFNetServiceMonitorStop(_:_:). If the monit
has not already been stopped, this function stops the monitor for you.
This function is thread safe.
Parameters
Discussion
Special Considerations
CFNetwork / CFNetServiceMonitorInvalidate(_:) Deprecated
Function
CFNetServiceMonitorInvalidate(_:) Deprecate
Invalidates an instance of a Network Service monitor object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 105

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
func CFNetServiceBrowserScheduleWithRunLoop(CFNetServiceBrowser, CFRun
Loop, CFString)
Schedules a CFNetServiceBrowser on a run loop.
Deprecated
See Also
Network Services


## Page 106

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


## Page 107

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
runLoop
The run loop on which the monitor is to be scheduled; cannot be NULL.
runLoopMode
The mode on which to schedule the monitor; cannot be NULL.
Schedules the specified monitor on a run loop, which places the monitor in asynchronous mode.
The caller is responsible for ensuring that at least one of the run loops on which the monitor is
Parameters
Discussion
CFNetwork / CFNetServiceMonitorScheduleWithRunLoop(_:_:_:) Deprecated
Function
CFNetServiceMonitorScheduleWithRun
Loop(_:_:_:) Deprecated
Schedules a CFNetServiceMonitor on a run loop.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 108

scheduled is being run.
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


## Page 109

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


## Page 110

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


## Page 111

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


## Page 112

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


## Page 113

func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


## Page 114

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
monitor
CFNetServiceMonitor, started by calling CFNetServiceMonitorStart(_:_:_:), that is t
be stopped.
error
Pointer to a CFStreamError structure or NULL. For synchronous monitors, set the error
field of this structure to the non-zero value you want to be set in the CFStreamError
structure when CFNetServiceMonitorStart(_:_:_:) returns. Note that when it return
CFNetServiceMonitorStart(_:_:_:) returns FALSE. If the monitor was started
asynchronously, set the error field to the non-zero value you want the monitor’s callback to
receive when it is called. If this parameter is NULL, default values for the CFStreamError
structure are used: the domain is set to kCFStreamErrorDomainNetServices and the
error code is set to kCFNetServicesErrorCancel.
Parameters
CFNetwork / CFNetServiceMonitorStop(_:_:) Deprecated
Function
CFNetServiceMonitorStop(_:_:) Deprecated
Stops a CFNetServiceMonitor.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 115

This function stops the specified monitor. Call CFNetServiceMonitorStart(_:_:_:) if you
want to start monitoring again.
If you want to stop monitoring and no longer need to monitor record changes, call CFNetServic
MonitorInvalidate(_:) instead of this function.
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
Discussion
Special Considerations
See Also
Network Services


## Page 116

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


## Page 117

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
monitor
The CFNetServiceMonitor that is to be unscheduled; cannot be NULL.
runLoop
The run loop; cannot be NULL.
runLoopMode
The mode from which the monitor is to be unscheduled; cannot be NULL.
Parameters
Discussion
CFNetwork / CFNetServiceMonitorUnscheduleFromRunLoop(_:_:_:) Deprecated
Function
CFNetServiceMonitorUnscheduleFrom
RunLoop(_:_:_:) Deprecated
Unschedules a CFNetServiceMonitor from a run loop.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 118

Unschedules the specified monitor from the specified run loop and mode. Call this function to shu
down a monitor that is running asynchronously.
To change a monitor so that it cannot be scheduled and so that its callback will never be called, c
CFNetServiceMonitorInvalidate(_:).
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
Special Considerations
See Also
Network Services


## Page 119

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


## Page 120

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
Network service to register; cannot be NULL. The registration will fail if the service doesn’t
have a domain, a type, a name, and an IP address.
options
Bit flags for specifying registration options. Currently, the only registration option is kCFNet
ServiceFlagNoAutoRename. For details, see CFNetService Registration Option
error
Pointer to a CFStreamError structure that will be set to an error code and the error code’s
domain if an error occurs; or NULL if you don’t want to receive the error code and its domain.
Parameters
CFNetwork / CFNetServiceRegisterWithOptions(_:_:_:) Deprecated
Function
CFNetServiceRegisterWithOptions(_:_:
_:) Deprecated
Makes a CFNetService available on the network.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 121

TRUE if an asynchronous service registration was started; FALSE if an asynchronous or
synchronous registration failed or if a synchronous registration was canceled.
If the service is to run in asynchronous mode, you must call CFNetServiceSetClient(_:_:
_:) to associate a callback function with this CFNetService before calling this function.
When registering a service that runs in asynchronous mode, this function returns TRUE if the
service contains all of the required attributes and the registration process can start. If the
registration process completes successfully, the service is available on the network until you shut
down the service by calling CFNetServiceUnscheduleFromRunLoop(_:_:_:), CFNet
ServiceSetClient(_:_:_:), and CFNetServiceCancel(_:). If the service does not
contain all of the required attributes or if the registration process does not complete successfully,
this function returns FALSE.
When registering a service that runs in synchronous mode, this function blocks until an error
occurs, in which case this function returns FALSE. Until this function returns FALSE, the service i
available on the network. To force this function to return FALSE, thereby shutting down the servic
call CFNetServiceCancel(_:) from another thread.
The options parameter is a bit flag for specifying service registration options. Currently, kCFNe
ServiceFlagNoAutoRename is the only supported registration option. If this bit is set and a
service of the same name is running, the registration will fail. If this bit is not set and a service of
the same name is running, the service that is being registered will be renamed automatically by
appending (n) to the service name, where n is a number that is incremented until the service can
be registered with a unique name.
This function is thread safe.
class CFNetService
An opaque reference representing a CFNetService.
class CFNetServiceBrowser
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 122

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


## Page 123

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


## Page 124

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


## Page 125

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


## Page 126

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


## Page 127

Searches a domain for services of a specified type.
Deprecated
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


## Page 128

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService; cannot be NULL.
clientCB
The callback function that is to be associated with this CFNetService. If you are shutting dow
the service, set clientCB to NULL to disassociate from this CFNetService the callback
function that was previously associated.
clientContext
Context information to be used when clientCB is called; cannot be NULL.
Parameters
CFNetwork / CFNetServiceSetClient(_:_:_:) Deprecated
Function
CFNetServiceSetClient(_:_:_:) Deprecated
Associates a callback function with a CFNetService or disassociates a callback
function from a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 129

TRUE if the client was set; otherwise, FALSE.
The callback function specified by clientCB will be called to report IP addresses (in the case of
CFNetServiceResolve) or to report registration errors (in the case of CFNetService
Register).
This function is thread safe.
For a CFNetService that will operate asynchronously, call this function and then call CFNet
ServiceScheduleWithRunLoop(_:_:_:) to schedule the service on a run loop. Then call
CFNetServiceRegister or CFNetServiceResolve.
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
Return Value
Discussion
Special Considerations
See Also
Network Services


## Page 130

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


## Page 131

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
CFNetServiceRef for which a TXT record is to be set; cannot be NULL.
txtRecord
Contents of the TXT record that is to be set. The contents must not exceed 1450 bytes.
TRUE if the TXT record was set; otherwise, FALSE.
Parameters
Return Value
Discussion
CFNetwork / CFNetServiceSetTXTData(_:_:) Deprecated
Function
CFNetServiceSetTXTData(_:_:) Deprecated
Sets the TXT record for a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.4–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 132

This function sets a TXT record for the specified service. If the service is currently registered on
the network, the record is broadcast. Setting a TXT record on a service that is still being resolved
not allowed.
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


## Page 133

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


## Page 134

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService that is to be unscheduled; cannot be NULL.
runLoop
The run loop; cannot be NULL.
runLoopMode
The mode from which the service is to be unscheduled; cannot be NULL.
Parameters
Discussion
CFNetwork / CFNetServiceUnscheduleFromRunLoop(_:_:_:) Deprecated
Function
CFNetServiceUnscheduleFromRun
Loop(_:_:_:) Deprecated
Unschedules a CFNetService from a run loop.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 135

Unschedules the specified service from the specified run loop and mode. Call this function to shu
down a service that is running asynchronously. To complete the shutdown, call CFNetService
SetClient(_:_:_:) and set clientCB to NULL. Then call CFNetServiceCancel(_:).
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


## Page 136

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


## Page 137

Deprecated
Use nw_browser_t or nw_listener_t in Network framework instead
theService
The CFNetService that is to be scheduled on a run loop; cannot be NULL.
runLoop
The run loop on which the service is to be scheduled; cannot be NULL.
runLoopMode
The mode on which to schedule the service; cannot be NULL.
Parameters
Discussion
CFNetwork / CFNetServiceScheduleWithRunLoop(_:_:_:) Deprecated
Function
CFNetServiceScheduleWithRunLoop(_:_:
_:) Deprecated
Schedules a CFNetService on a run loop.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.2–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 138

Schedules the specified service on a run loop, which places the service in asynchronous mode.
The caller is responsible for ensuring that at least one of the run loops on which the service is
scheduled is being run.
This function is thread safe.
Before calling this function, call CFNetServiceSetClient(_:_:_:) to prepare a CFNetServic
for use in asynchronous mode.
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
Special Considerations
See Also
Network Services


## Page 139

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
func CFNetServiceBrowserStopSearch(CFNetServiceBrowser, UnsafeMutable
Pointer<CFStreamError>?)
Stops a search for domains or services.
Deprecated


