# 002_Core Foundation URL Access Utilities.pdf

## Page 1

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


## Page 2

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


