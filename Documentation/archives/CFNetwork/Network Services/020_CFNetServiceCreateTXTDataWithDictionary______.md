# 020_CFNetServiceCreateTXTDataWithDictionary______.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

Stops a search for domains or services.
Deprecated


