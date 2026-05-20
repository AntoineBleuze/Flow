# Utilities.pdf

## Page 1

Core Foundation defines a number of miscellaneous symbols that are either used by many differe
opaque types, such as CFIndex, or apply to Core Foundation as a whole, such as kCFCore
FoundationVersionNumber. These symbols are collected together and documented here.
func CFRangeMake(CFIndex, CFIndex) -> CFRange
Declares and initializes a CFRange structure.
typealias CFComparatorFunction
Callback function that compares two values. You provide a pointer to this callback in certain
Core Foundation sorting functions.
typealias CFIndex
Priority values used for kAXPriorityKey
typealias CFOptionFlags
A bitfield used for passing special allocation and other requests into Core Foundation
functions.
Overview
Topics
Core Foundation Base Utilities Miscellaneous Functions
Callbacks
Data Types
Core Foundation / Base Utilities
API Collection
Base Utilities


## Page 2

struct CFRange
A structure representing a range of sequential items in a container, such as characters in a
buffer or elements in a collection.
enum CFComparisonResult
Constants returned by comparison functions, indicating whether a value is equal to, less tha
or greater than another value.
Value Not Found
Special value returned when a Core Foundation function cannot locate a requested value.
Current Framework Version Number
Current version number of the Core Foundation framework.
Framework Version Numbers
Version numbers of the Core Foundation framework.
Core Foundation Design Concepts
Byte-Order Utilities
Core Foundation URL Access Utilities
Preferences Utilities
Socket Name Server Utilities
Time Utilities
Constants
See Also
Related Documentation
Utilities


## Page 3

When handling binary data transmitted or shared across platforms, you need be concerned with
how each platform stores numerical values. A platform stores values either in big-endian or little-
endian format. On big-endian machines, such as PowerPC machines, values are stored with the
most-significant bytes first in memory; on little-endian machines, such as Pentium machines,
values are stored with the least-significant bytes first. A multibyte value transmitted to a platform
with a different format will be misinterpreted if it is not converted properly by one of the compute
You identify the native format of the current platform using the CFByteOrderGetCurrent()
function. Use functions such as CFSwapInt32BigToHost(_:) and CFConvertFloat32Host
ToSwapped(_:) to convert values between different byte order formats.
func CFByteOrderGetCurrent() -> CFByteOrder
Returns the byte order of the current computer.
func CFConvertDoubleHostToSwapped(Double) -> CFSwappedFloat64
Converts a 64-bit double from the host’s native byte order to a platform-independent forma
func CFConvertDoubleSwappedToHost(CFSwappedFloat64) -> Double
Converts a 64-bit double from a platform-independent format to the host’s native byte orde
func CFConvertFloat32HostToSwapped(Float32) -> CFSwappedFloat32
Converts a 32-bit float from the host’s native byte order to a platform-independent format.
Overview
Topics
Core Foundation Byte Order Utilities Miscellaneous Functions
Core Foundation / Byte-Order Utilities
API Collection
Byte-Order Utilities


## Page 4

func CFConvertFloat32SwappedToHost(CFSwappedFloat32) -> Float32
Converts a 32-bit float from a platform-independent format to the host’s native byte order.
func CFConvertFloat64HostToSwapped(Float64) -> CFSwappedFloat64
Converts a 64-bit float from the host’s native byte order to a platform-independent format.
func CFConvertFloat64SwappedToHost(CFSwappedFloat64) -> Float64
Converts a 64-bit float from a platform-independent format to the host’s native byte order.
func CFConvertFloatHostToSwapped(Float) -> CFSwappedFloat32
Converts a 32-bit float from the host’s native byte order to a platform-independent format.
func CFConvertFloatSwappedToHost(CFSwappedFloat32) -> Float
Converts a 32-bit float from a platform-independent format to the host’s native byte order.
func CFSwapInt16(UInt16) -> UInt16
Swaps the bytes of a 16-bit integer.
func CFSwapInt16BigToHost(UInt16) -> UInt16
Converts a 16-bit integer from big-endian format to the host’s native byte order.
func CFSwapInt16HostToBig(UInt16) -> UInt16
Converts a 16-bit integer from the host’s native byte order to big-endian format.
func CFSwapInt16HostToLittle(UInt16) -> UInt16
Converts a 16-bit integer from the host’s native byte order to little-endian format.
func CFSwapInt16LittleToHost(UInt16) -> UInt16
Converts a 16-bit integer from little-endian format to the host’s native byte order.
func CFSwapInt32(UInt32) -> UInt32
Swaps the bytes of a 32-bit integer.
func CFSwapInt32BigToHost(UInt32) -> UInt32
Converts a 32-bit integer from big-endian format to the host’s native byte order.
func CFSwapInt32HostToBig(UInt32) -> UInt32
Converts a 32-bit integer from the host’s native byte order to big-endian format.
func CFSwapInt32HostToLittle(UInt32) -> UInt32
Converts a 32-bit integer from the host’s native byte order to little-endian format.
func CFSwapInt32LittleToHost(UInt32) -> UInt32


## Page 5

Converts a 32-bit integer from little-endian format to the host’s native byte order.
func CFSwapInt64(UInt64) -> UInt64
Swaps the bytes of a 64-bit integer.
func CFSwapInt64BigToHost(UInt64) -> UInt64
Converts a 64-bit integer from big-endian format to the host’s native byte order.
func CFSwapInt64HostToBig(UInt64) -> UInt64
Converts a 64-bit integer from the host’s native byte order to big-endian format.
func CFSwapInt64HostToLittle(UInt64) -> UInt64
Converts a 64-bit integer from the host’s native byte order to little-endian format.
func CFSwapInt64LittleToHost(UInt64) -> UInt64
Converts a 64-bit integer from little-endian format to the host’s native byte order.
struct CFSwappedFloat32
Structure holding a 32-bit float value in a platform-independentbyte order.
struct CFSwappedFloat64
Structure holding a 64-bit float value in a platform-independentbyte order.
typealias CFByteOrder
Flags that identify byte order.
Memory Management Programming Guide for Core Foundation
Base Utilities
Data Types
Constants
See Also
Related Documentation
Utilities


## Page 6

Core Foundation URL Access Utilities
Preferences Utilities
Socket Name Server Utilities
Time Utilities


## Page 7

Core Foundation URL Access Utilities give you convenient system-independent methods of
creating, reading, updating, or deleting a URL resource.
Given a CFURL object that holds either a file or http URL, you can read the resource’s data with th
CFURLCreateDataAndPropertiesFromResource(_:_:_:_:_:_:) function. You can write
data to the URL resource, possibly creating a new file, with the CFURLWriteDataAnd
PropertiesToResource(_:_:_:_:) function. Finally, you can destroy, or delete, the resourc
pointed to by the URL with the CFURLDestroyResource(_:_:) function.
func CFURLCreateDataAndPropertiesFromResource(CFAllocator!, CFURL!,
UnsafeMutablePointer<Unmanaged<CFData>?>!, UnsafeMutablePointer<
Unmanaged<CFDictionary>?>!, CFArray!, UnsafeMutablePointer<Int32>!) ->
Bool
Loads the data and properties referred to by a given URL.
Deprecated
func CFURLCreatePropertyFromResource(CFAllocator!, CFURL!, CFString!,
UnsafeMutablePointer<Int32>!) -> CFTypeRef!
Returns a given property specified by a given URL and property string.
Deprecated
func CFURLDestroyResource(CFURL!, UnsafeMutablePointer<Int32>!) -> Bool
Overview
Topics
Core Foundation URL Access Utilities Miscellaneous Functions
Core Foundation / Core Foundation URL Access Utilities
API Collection
Core Foundation URL Access Utilities


## Page 8

Destroys a resource indicated by a given URL.
Deprecated
func CFURLWriteDataAndPropertiesToResource(CFURL!, CFData!, CFDictionar
!, UnsafeMutablePointer<Int32>!) -> Bool
Writes the given data and properties to a given URL.
Deprecated
enum CFURLError
CFURL error codes.
Deprecated
File URL Properties
Properties for file URL resources.
HTTP URL Properties
Properties for HTTP URL resources.
Base Utilities
Byte-Order Utilities
Preferences Utilities
Socket Name Server Utilities
Time Utilities
Constants
See Also
Utilities


## Page 9

Several functions return a preference value as a Core Foundation property list object.
You can use the function CFGetTypeID(_:) to determine the value’s type. For more information
about property lists, see Property List Programming Topics for Core Foundation.
Core Foundation provides a simple, standard way to manage user (and application) preferences.
Core Foundation stores preferences as key-value pairs that are assigned a scope using a
combination of user name, application ID, and host (computer) names. This makes it possible to
save and retrieve preferences that apply to different classes of users. Core Foundation preference
is useful to all applications that support user preferences. Note that modification of some
preferences domains (those not belonging to the “Current User”) requires root privileges (or Adm
privileges prior to OS X v10.6)—see Authorization Services Programming Guide for information on
how to gain suitable privileges.
Unlike some other Core Foundation types, CFPreferences is not toll-free bridged to its
corresponding Cocoa Foundation framework class (NSUserDefaults). CFPreferences is thread
safe.
func CFPreferencesCopyAppValue(CFString, CFString) -> CFPropertyList?
Obtains a preference value for the specified key and application.
Overview
Overview
Topics
Getting Preference Values
Core Foundation / Preferences Utilities
API Collection
Preferences Utilities


## Page 10

func CFPreferencesCopyKeyList(CFString, CFString, CFString) -> CFArray?
Constructs and returns the list of all keys set in the specified domain.
func CFPreferencesCopyMultiple(CFArray?, CFString, CFString, CFString) 
> CFDictionary
Returns a dictionary containing preference values for multiple keys.
func CFPreferencesCopyValue(CFString, CFString, CFString, CFString) ->
CFPropertyList?
Returns a preference value for a given domain.
func CFPreferencesGetAppBooleanValue(CFString, CFString, UnsafeMutable
Pointer<DarwinBoolean>?) -> Bool
Convenience function that directly obtains a Boolean preference value for the specified key.
func CFPreferencesGetAppIntegerValue(CFString, CFString, UnsafeMutable
Pointer<DarwinBoolean>?) -> CFIndex
Convenience function that directly obtains an integer preference value for the specified key.
func CFPreferencesSetAppValue(CFString, CFPropertyList?, CFString)
Adds, modifies, or removes a preference.
func CFPreferencesSetMultiple(CFDictionary?, CFArray?, CFString,
CFString, CFString)
Convenience function that allows you to set and remove multiple preference values.
func CFPreferencesSetValue(CFString, CFPropertyList?, CFString, CFStrin
, CFString)
Adds, modifies, or removes a preference value for the specified domain.
func CFPreferencesAppSynchronize(CFString) -> Bool
Writes to permanent storage all pending changes to the preference data for the application,
and reads the latest preference data from permanent storage.
func CFPreferencesSynchronize(CFString, CFString, CFString) -> Bool
For the specified domain, writes all pending changes to preference data to permanent
storage, and reads latest preference data from permanent storage.
Setting Preference Values
Synchronizing Preferences


## Page 11

func CFPreferencesAddSuitePreferencesToApp(CFString, CFString)
Adds suite preferences to an application’s preference search chain.
func CFPreferencesRemoveSuitePreferencesFromApp(CFString, CFString)
Removes suite preferences from an application’s search chain.
func CFPreferencesAppValueIsForced(CFString, CFString) -> Bool
Determines whether or not a given key has been imposed on the user.
func CFPreferencesCopyApplicationList(CFString, CFString) -> CFArray?
Constructs and returns the list of all applications that have preferences in the scope of the
specified user and host.
Deprecated
Application, Host, and User Keys
Keys used to specify the common preference domains.
Preferences Programming Topics for Core Foundation
Base Utilities
Byte-Order Utilities
Core Foundation URL Access Utilities
Socket Name Server Utilities
Adding and Removing Suite Preferences
Miscellaneous Functions
Constants
See Also
Related Documentation
Utilities


## Page 12

Time Utilities


## Page 13

Name server functionality is currently inoperable in macOS.
func CFSocketCopyRegisteredSocketSignature(UnsafePointer<CFSocket
Signature>!, CFTimeInterval, CFString!, UnsafeMutablePointer<CFSocket
Signature>!, UnsafeMutablePointer<Unmanaged<CFData>?>!) -> CFSocketErro
Returns a socket signature registered with a CFSocket name server.
func CFSocketCopyRegisteredValue(UnsafePointer<CFSocketSignature>!,
CFTimeInterval, CFString!, UnsafeMutablePointer<Unmanaged<CFPropertyLis
>?>!, UnsafeMutablePointer<Unmanaged<CFData>?>!) -> CFSocketError
Returns a value registered with a CFSocket name server.
func CFSocketGetDefaultNameRegistryPortNumber() -> UInt16
Returns the default port number with which to connect to a CFSocket name server.
func CFSocketRegisterSocketSignature(UnsafePointer<CFSocketSignature>!,
CFTimeInterval, CFString!, UnsafePointer<CFSocketSignature>!) ->
CFSocketError
Registers a socket signature with a CFSocket name server.
Overview
Topics
Core Foundation Socket Name Server Utilities Miscellaneous
Functions
Core Foundation / Socket Name Server Utilities
API Collection
Socket Name Server Utilities


## Page 14

func CFSocketRegisterValue(UnsafePointer<CFSocketSignature>!, CFTime
Interval, CFString!, CFPropertyList!) -> CFSocketError
Registers a property-list value with a CFSocket name server.
func CFSocketSetDefaultNameRegistryPortNumber(UInt16)
Sets the default port number with which to connect to a CFSocket name server.
func CFSocketUnregister(UnsafePointer<CFSocketSignature>!, CFTime
Interval, CFString!) -> CFSocketError
Unregisters a value or socket signature with a CFSocket name server.
CFSocket Name Server Keys
Not used.
Base Utilities
Byte-Order Utilities
Core Foundation URL Access Utilities
Preferences Utilities
Time Utilities
Constants
See Also
Utilities


## Page 15

Core Foundation measures time in units of seconds. The base data type is the CFTimeInterval
which measures the difference in seconds between two times. Fixed times, or dates, are defined 
the CFAbsoluteTime data type, which measures the time interval between a particular date and
the absolute reference date of Jan 1 2001 00:00:00 GMT.
The CFGregorianDate structure represents absolute times in terms of the Gregorian calendar.
Functions such as CFAbsoluteTimeGetGregorianDate(_:_:) use a CFTimeZone object to
obtain the local time in a particular time zone.
The CFDate opaque type wraps an absolute time into a CFTypeRef-base object, allowing you to
put time objects into collections and property lists and to be handled by other object-oriented pa
of Core Foundation.
func CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime, CFTimeZone!,
CFGregorianUnits) -> CFAbsoluteTime
Adds a time interval, expressed as Gregorian units, to a given absolute time.
Deprecated
func CFAbsoluteTimeGetCurrent() -> CFAbsoluteTime
Returns the current system absolute time.
func CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime, CFTimeZone!) -> Int32
Returns an integer representing the day of the week indicated by the specified absolute time
Overview
Topics
Core Foundation Time Utilities Miscellaneous Functions
Core Foundation / Time Utilities
API Collection
Time Utilities


## Page 16

Deprecated
func CFAbsoluteTimeGetDayOfYear(CFAbsoluteTime, CFTimeZone!) -> Int32
Returns an integer representing the day of the year indicated by the specified absolute time.
Deprecated
func CFAbsoluteTimeGetDifferenceAsGregorianUnits(CFAbsoluteTime,
CFAbsoluteTime, CFTimeZone!, CFOptionFlags) -> CFGregorianUnits
Computes the time difference between two specified absolute times and returns the result a
an interval in Gregorian units.
Deprecated
func CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime, CFTimeZone!) ->
CFGregorianDate
Converts an absolute time value into a Gregorian date.
Deprecated
func CFAbsoluteTimeGetWeekOfYear(CFAbsoluteTime, CFTimeZone!) -> Int32
Returns an integer representing the week of the year indicated by the specified absolute tim
Deprecated
func CFGregorianDateGetAbsoluteTime(CFGregorianDate, CFTimeZone!) ->
CFAbsoluteTime
Converts a Gregorian date value into an absolute time value.
Deprecated
func CFGregorianDateIsValid(CFGregorianDate, CFOptionFlags) -> Bool
Checks the specified fields of a CFGregorianDate structure for valid values.
Deprecated
typealias CFAbsoluteTime
Type used to represent a specific point in time relative to the absolute reference date of 1 Ja
2001 00:00:00 GMT.
struct CFGregorianDate
Structure used to represent a point in time using the Gregorian calendar.
Deprecated
struct CFGregorianUnits
Structure used to represent a time interval in Gregorian units.
Data Types


## Page 17

Deprecated
typealias CFTimeInterval
Type used to represent elapsed time in seconds.
struct CFGregorianUnitFlags
These option flags are used as a mask to indicate a specific set of fields in the
CFGregorianDate or CFGregorianUnits structures.
Predefined Time Interval Values
Time intervals between the absolute reference date and certain other dates.
Date and Time Programming Guide for Core Foundation
Base Utilities
Byte-Order Utilities
Core Foundation URL Access Utilities
Preferences Utilities
Socket Name Server Utilities
Constants
See Also
Related Documentation
Utilities


