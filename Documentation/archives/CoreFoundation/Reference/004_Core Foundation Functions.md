# 004_Core Foundation Functions.pdf

## Page 1

func CFAllocatorAllocateBytes(CFAllocator!, CFIndex, CFOptionFlags) ->
UnsafeMutableRawPointer!
func CFAllocatorAllocateTyped(CFAllocator!, CFIndex, CFAllocatorTypeID,
CFOptionFlags) -> UnsafeMutableRawPointer!
func CFAllocatorReallocateBytes(CFAllocator!, UnsafeMutableRawPointer!,
CFIndex, CFOptionFlags) -> UnsafeMutableRawPointer!
func CFAllocatorReallocateTyped(CFAllocator!, UnsafeMutableRawPointer!,
CFIndex, CFAllocatorTypeID, CFOptionFlags) -> UnsafeMutableRawPointer!
func CFAttributedStringGetBidiLevelsAndResolvedDirections(CFAttributed
String!, CFRange, Int8, UnsafeMutablePointer<UInt8>!, UnsafeMutable
Pointer<UInt8>!) -> Bool
func CFBundleCopyLocalizedStringForLocalizations(CFBundle!, CFString!,
CFString!, CFString!, CFArray!) -> CFString!
Returns a localized string from a bundle’s strings file.
func CFBundleIsArchitectureLoadable(cpu_type_t) -> Bool
func CFBundleIsExecutableLoadable(CFBundle!) -> Bool
func CFBundleIsExecutableLoadableForURL(CFURL!) -> Bool
func CFCopyHomeDirectoryURL() -> CFURL!
func CFDateFormatterCreateISO8601Formatter(CFAllocator!, CFISO8601Date
FormatOptions) -> CFDateFormatter!
Topics
Functions
Core Foundation / Core Foundation Functions
API Collection
Core Foundation Functions


## Page 2

func CFFileSecurityClearProperties(CFFileSecurity!, CFFileSecurityClear
Options) -> Bool
Clears properties from a CFFileSecurityRef object.
func CFFileSecurityCopyAccessControlList(CFFileSecurity!, UnsafeMutable
Pointer<acl_t?>!) -> Bool
Copies the access control list associated with a CFFileSecurityRef object.
func CFFileSecurityCopyGroupUUID(CFFileSecurity!, UnsafeMutablePointer<
Unmanaged<CFUUID>?>!) -> Bool
Copies the group UUID associated with a CFFileSecurityRef object.
func CFFileSecurityCopyOwnerUUID(CFFileSecurity!, UnsafeMutablePointer<
Unmanaged<CFUUID>?>!) -> Bool
Copies the owner UUID associated with a CFFileSecurityRef object.
func CFFileSecurityCreate(CFAllocator!) -> CFFileSecurity!
Creates a CFFileSecurityRef object.
func CFFileSecurityCreateCopy(CFAllocator!, CFFileSecurity!) -> CFFile
Security!
Creates a copy of a CFFileSecurityRef object.
func CFFileSecurityGetGroup(CFFileSecurity!, UnsafeMutablePointer<gid_t
>!) -> Bool
Gets the group ID associated with a CFFileSecurityRef object
func CFFileSecurityGetMode(CFFileSecurity!, UnsafeMutablePointer<mode_t
>!) -> Bool
Gets the file mode associated with a CFFileSecurityRef object.
func CFFileSecurityGetOwner(CFFileSecurity!, UnsafeMutablePointer<uid_t
>!) -> Bool
Gets the owner ID associated with a CFFileSecurityRef object.
func CFFileSecurityGetTypeID() -> CFTypeID
Returns the type identifier for the CFFileSecurityRef opaque type.
func CFFileSecuritySetAccessControlList(CFFileSecurity!, acl_t!) -> Boo
Sets the access control list associated with a CFFileSecurityRef object.
func CFFileSecuritySetGroup(CFFileSecurity!, gid_t) -> Bool
Sets the group ID associated with a CFFileSecurityRef object.


## Page 3

func CFFileSecuritySetGroupUUID(CFFileSecurity!, CFUUID!) -> Bool
Sets the group UUID associated with a CFFileSecurityRef object.
func CFFileSecuritySetMode(CFFileSecurity!, mode_t) -> Bool
Sets the file mode associated with a CFFileSecurityRef object.
func CFFileSecuritySetOwner(CFFileSecurity!, uid_t) -> Bool
Sets the owner ID associated with a CFFileSecurityRef object.
func CFFileSecuritySetOwnerUUID(CFFileSecurity!, CFUUID!) -> Bool
Sets the owner UUID associated with a CFFileSecurityRef object.
func CFReadStreamCopyDispatchQueue(CFReadStream!) -> dispatch_queue_t!
func CFReadStreamSetDispatchQueue(CFReadStream!, dispatch_queue_t!)
func CFRunLoopTimerGetTolerance(CFRunLoopTimer!) -> CFTimeInterval
func CFRunLoopTimerSetTolerance(CFRunLoopTimer!, CFTimeInterval)
func CFURLEnumeratorCreateForDirectoryURL(CFAllocator!, CFURL!,
CFURLEnumeratorOptions, CFArray!) -> CFURLEnumerator!
Creates and returns a directory enumerator with provided enumerator behavior options and
properties to be prefetched.
func CFURLEnumeratorCreateForMountedVolumes(CFAllocator!,
CFURLEnumeratorOptions, CFArray!) -> CFURLEnumerator!
Creates and returns a volume enumerator with provided enumerator behavior options and
properties to be prefetched.
func CFURLEnumeratorGetDescendentLevel(CFURLEnumerator!) -> CFIndex
Returns the number of levels a recursive directory enumerator has descended.
func CFURLEnumeratorGetNextURL(CFURLEnumerator!, UnsafeMutablePointer<
Unmanaged<CFURL>?>!, UnsafeMutablePointer<Unmanaged<CFError>?>!) ->
CFURLEnumeratorResult
Advances an enumerator to the next URL.
func CFURLEnumeratorGetSourceDidChange(CFURLEnumerator!) -> Bool
This function is unimplemented, so it performs no operation.
Deprecated
func CFURLEnumeratorGetTypeID() -> CFTypeID
Returns the opaque type identifier for the CFURLEnumerator opaque type.


## Page 4

func CFURLEnumeratorSkipDescendents(CFURLEnumerator!)
Tells a recursive enumerator not to descend into the directory at the URL that was returned b
the most recent call to the CFURLEnumeratorGetNextURL(_:_:_:) function.
func CFURLIsFileReferenceURL(CFURL!) -> Bool
func CFWriteStreamCopyDispatchQueue(CFWriteStream!) -> dispatch_queue_t
func CFWriteStreamSetDispatchQueue(CFWriteStream!, dispatch_queue_t!)
CFStream
Core Foundation Structures
Core Foundation Enumerations
Core Foundation Constants
Core Foundation Data Types
Core Foundation Macros
See Also
Reference


