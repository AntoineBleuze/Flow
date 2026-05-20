# Reference.pdf

## Page 1

This document describes the generic CFStream functions, data types, and constants. See also
CFReadStream and CFWriteStream for functions and constants specific to read and write
streams respectively.
Note
When you use the CFStream API for networking, read and write operations on sockets can
block. To prevent blocking:
1. Call CFReadStreamSetClient(_:_:_:_:) and CFWriteStreamSetClient(_:_:_:
_:) to register to receive stream-related event notifications.
2. Call CFReadStreamScheduleWithRunLoop(_:_:_:) and CFWriteStreamSchedule
WithRunLoop(_:_:_:) to schedule the stream on a run loop for receiving stream-related
event notifications.
3. Call CFReadStreamOpen(_:) and CFWriteStreamOpen(_:) to open each stream.
4. Read only after receiving a hasBytesAvailable notification. Write only after receiving a
canAcceptBytes notification.
Overview
Topics
Creating Streams
Core Foundation / CFStream
API Collection
CFStream


## Page 2

func CFStreamCreatePairWithPeerSocketSignature(CFAllocator!, Unsafe
Pointer<CFSocketSignature>!, UnsafeMutablePointer<Unmanaged<CFReadStrea
>?>!, UnsafeMutablePointer<Unmanaged<CFWriteStream>?>!)
Creates readable and writable streams connected to a socket.
Deprecated
func CFStreamCreatePairWithSocketToHost(CFAllocator!, CFString!, UInt32
UnsafeMutablePointer<Unmanaged<CFReadStream>?>!, UnsafeMutablePointer<
Unmanaged<CFWriteStream>?>!)
Creates readable and writable streams connected to a TCP/IP port of a particular host.
Deprecated
func CFStreamCreatePairWithSocket(CFAllocator!, CFSocketNativeHandle,
UnsafeMutablePointer<Unmanaged<CFReadStream>?>!, UnsafeMutablePointer<
Unmanaged<CFWriteStream>?>!)
Creates readable and writable streams connected to a socket.
Deprecated
func CFStreamCreateBoundPair(CFAllocator!, UnsafeMutablePointer<
Unmanaged<CFReadStream>?>!, UnsafeMutablePointer<Unmanaged<CFWriteStrea
>?>!, CFIndex)
Creates a bound pair of read and write streams.
func CFStreamCreatePairWithSocketToCFHost(CFAllocator?, CFHost, Int32,
UnsafeMutablePointer<Unmanaged<CFReadStream>?>?, UnsafeMutablePointer<
Unmanaged<CFWriteStream>?>?)
Creates readable and writable streams connected to a given `CFHost` object.
func CFStreamCreatePairWithSocketToNetService(CFAllocator?, CFNetServic
, UnsafeMutablePointer<Unmanaged<CFReadStream>?>?, UnsafeMutablePointer
Unmanaged<CFWriteStream>?>?)
Creates a pair of streams for a CFNetService.
func CFSocketStreamSOCKSGetError(UnsafePointer<CFStreamError>) -> Int32
This function gets error codes in the `kCFStreamErrorDomainSOCKS` domain from the
`CFStreamError` returned by a stream operation.
func CFSocketStreamSOCKSGetErrorSubdomain(UnsafePointer<CFStreamError>)
-> Int32
Obtaining Errors


## Page 3

Gets the error subdomain associated with errors in the `kCFStreamErrorDomainSOCKS`
domain from the `CFStreamError` returned by a stream operation.
func CFReadStreamSetProperty(CFReadStream!, CFStreamPropertyKey!, CFTyp
Ref!) -> Bool
Sets the value of a property for a stream.
func CFWriteStreamSetProperty(CFWriteStream!, CFStreamPropertyKey!,
CFTypeRef!) -> Bool
Sets the value of a property for a stream.
CFStream Socket Security Level Constants
Constants for setting the security level of a socket stream.
struct CFStreamError
The structure returned by CFReadStreamGetError(_:) and CFWriteStreamGet
Error(_:).
struct CFStreamClientContext
A structure that contains program-defined data and callbacks with which you can configure 
stream’s client behavior.
enum CFStreamStatus
Constants that describe the status of a stream.
enum CFStreamErrorDomain
Defines constants for values returned in the domain field of the CFStreamError structure.
CFStream Error Domain Constants (CFHost)
Defines constants for values returned in the domain field of the CFStreamError structure.
Error Subdomains
Subdomains used to determine how to interpret an error in the kCFStreamErrorDomain
SOCKS domain.
Secure Sockets (SOCKS) Errors
Setting the Security Protocol
Data Types
Constants


## Page 4

Error codes returned by the `kCFStreamErrorDomainSOCKS` error domain.
struct CFStreamEventType
Defines constants for stream-related events.
Stream Properties
Stream property names that can be set or copied.
CFStream Property SSL Settings Constants
Constants for use in a CFDictionary object that is the value of the kCFStreamProperty
SSLSettings stream property key.
CFStream Socket Security Level Constants
Constants for setting the security level of a socket stream.
CFStream SOCKS Proxy Key Constants
Constants for SOCKS Proxy CFDictionary keys.
Stream Service Types
String constants that specify the service type of a stream.
Getting Started with Networking, Internet, and Web
CFNetwork Programming Guide
Core Foundation Structures
Core Foundation Enumerations
Core Foundation Constants
Core Foundation Functions
Core Foundation Data Types
See Also
Related Documentation
Reference


## Page 5

Core Foundation Macros


## Page 6

struct CGAffineTransform
struct CGAffineTransformComponents
struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGRect
struct CGSize
A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.
CFStream
Core Foundation Enumerations
Core Foundation Constants
Topics
Structures
See Also
Reference
Core Foundation / Core Foundation Structures
API Collection
Core Foundation Structures


## Page 7

Core Foundation Functions
Core Foundation Data Types
Core Foundation Macros


## Page 8

struct CFFileSecurityClearOptions
struct CFISO8601DateFormatOptions
enum CFRunLoopRunResult
struct CFURLEnumeratorOptions
Options for controlling enumerator behavior.
enum CFURLEnumeratorResult
Result codes from the CFURLEnumeratorGetNextURL(_:_:_:) function.
enum CGRectEdge
CFStream
Core Foundation Structures
Core Foundation Constants
Core Foundation Functions
Core Foundation Data Types
Topics
Enumerations
See Also
Reference
Core Foundation / Core Foundation Enumerations
API Collection
Core Foundation Enumerations


## Page 9

Core Foundation Macros


## Page 10

var CFByteOrderBigEndian: __CFByteOrder
Multi-byte values are stored with the most-significant bytes stored first. PowerPC CPUs are
big endian.
var CFByteOrderLittleEndian: __CFByteOrder
Multi-byte values are stored with the least-significant bytes stored first. Pentium CPUs are
little endian.
var CFByteOrderUnknown: __CFByteOrder
The byte order is unknown.
var kCFCoreFoundationVersionNumber10_10: Double
var kCFCoreFoundationVersionNumber10_10_1: Double
var kCFCoreFoundationVersionNumber10_10_2: Int32
var kCFCoreFoundationVersionNumber10_10_3: Double
var kCFCoreFoundationVersionNumber10_10_4: Double
var kCFCoreFoundationVersionNumber10_10_5: Double
var kCFCoreFoundationVersionNumber10_10_Max: Int32
var kCFCoreFoundationVersionNumber10_11: Int32
var kCFCoreFoundationVersionNumber10_11_1: Double
var kCFCoreFoundationVersionNumber10_11_2: Double
Topics
Constants
Core Foundation / Core Foundation Constants
API Collection
Core Foundation Constants


## Page 11

var kCFCoreFoundationVersionNumber10_11_3: Double
var kCFCoreFoundationVersionNumber10_11_4: Double
var kCFCoreFoundationVersionNumber10_11_Max: Int32
var kCFCoreFoundationVersionNumber10_7_5: Double
var kCFCoreFoundationVersionNumber10_8: Double
var kCFCoreFoundationVersionNumber10_8_1: Double
var kCFCoreFoundationVersionNumber10_8_2: Double
var kCFCoreFoundationVersionNumber10_8_3: Double
var kCFCoreFoundationVersionNumber10_8_4: Double
var kCFCoreFoundationVersionNumber10_9: Double
var kCFCoreFoundationVersionNumber10_9_1: Double
var kCFCoreFoundationVersionNumber10_9_2: Double
var kCFCoreFoundationVersionNumber_iOS_6_0: Double
var kCFCoreFoundationVersionNumber_iOS_6_1: Double
var kCFCoreFoundationVersionNumber_iOS_7_0: Double
var kCFCoreFoundationVersionNumber_iOS_7_1: Double
var kCFCoreFoundationVersionNumber_iOS_8_0: Double
var kCFCoreFoundationVersionNumber_iOS_8_1: Double
var kCFCoreFoundationVersionNumber_iOS_8_2: Double
var kCFCoreFoundationVersionNumber_iOS_8_3: Double
var kCFCoreFoundationVersionNumber_iOS_8_4: Double
var kCFCoreFoundationVersionNumber_iOS_8_x_Max: Int32
var kCFCoreFoundationVersionNumber_iOS_9_0: Double
var kCFCoreFoundationVersionNumber_iOS_9_1: Double
var kCFCoreFoundationVersionNumber_iOS_9_2: Double
var kCFCoreFoundationVersionNumber_iOS_9_3: Double
var kCFCoreFoundationVersionNumber_iOS_9_4: Double
var kCFCoreFoundationVersionNumber_iOS_9_x_Max: Int32


## Page 12

let kCFNotFound: CFIndex
A constant that indicates that a search operation did not succeed in locating the target value
let kCFURLAddedToDirectoryDateKey: CFString!
let kCFURLApplicationIsScriptableKey: CFString!
let kCFURLCanonicalPathKey: CFString!
let kCFURLDocumentIdentifierKey: CFString!
let kCFURLFileProtectionComplete: CFString!
let kCFURLFileProtectionCompleteUnlessOpen: CFString!
let kCFURLFileProtectionCompleteUntilFirstUserAuthentication: CFString!
let kCFURLFileProtectionKey: CFString!
let kCFURLFileProtectionNone: CFString!
let kCFURLGenerationIdentifierKey: CFString!
let kCFURLIsApplicationKey: CFString!
let kCFURLQuarantinePropertiesKey: CFString!
let kCFURLTagNamesKey: CFString!
let kCFURLUbiquitousItemDownloadingErrorKey: CFString!
let kCFURLUbiquitousItemDownloadingStatusCurrent: CFString!
let kCFURLUbiquitousItemDownloadingStatusDownloaded: CFString!
let kCFURLUbiquitousItemDownloadingStatusKey: CFString!
let kCFURLUbiquitousItemDownloadingStatusNotDownloaded: CFString!
let kCFURLUbiquitousItemUploadingErrorKey: CFString!
let kCFURLVolumeIsEncryptedKey: CFString!
let kCFURLVolumeIsRootFileSystemKey: CFString!
let kCFURLVolumeSupportsCompressionKey: CFString!
let kCFURLVolumeSupportsExclusiveRenamingKey: CFString!
let kCFURLVolumeSupportsFileCloningKey: CFString!
let kCFURLVolumeSupportsSwapRenamingKey: CFString!
var CGFLOAT_EPSILON: Double


## Page 13

var CGFLOAT_IS_DOUBLE: Int32
var CGFLOAT_MAX: Double
var CGFLOAT_MIN: Double
var COREFOUNDATION_CFPLUGINCOM_SEPARATE: Int32
var ISA_PTRAUTH_DISCRIMINATOR: Int32
let kCFErrorLocalizedFailureKey: CFString!
let kCFURLDirectoryEntryCountKey: CFString!
let kCFURLFileContentIdentifierKey: CFString!
let kCFURLFileIdentifierKey: CFString!
let kCFURLFileProtectionCompleteWhenUserInactive: CFString!
let kCFURLIsPurgeableKey: CFString!
let kCFURLIsSparseKey: CFString!
let kCFURLMayHaveExtendedAttributesKey: CFString!
let kCFURLMayShareFileContentKey: CFString!
let kCFURLUbiquitousItemIsExcludedFromSyncKey: CFString!
let kCFURLVolumeAvailableCapacityForImportantUsageKey: CFString!
let kCFURLVolumeAvailableCapacityForOpportunisticUsageKey: CFString!
let kCFURLVolumeMountFromLocationKey: CFString!
let kCFURLVolumeSubtypeKey: CFString!
let kCFURLVolumeSupportsAccessPermissionsKey: CFString!
let kCFURLVolumeSupportsFileProtectionKey: CFString!
let kCFURLVolumeSupportsImmutableFilesKey: CFString!
let kCFURLVolumeTypeNameKey: CFString!
let kCFUserNotificationAlertTopMostKey: CFString!
let kCFUserNotificationKeyboardTypesKey: CFString!
See Also


## Page 14

CFStream
Core Foundation Structures
Core Foundation Enumerations
Core Foundation Functions
Core Foundation Data Types
Core Foundation Macros
Reference


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

typealias CFAllocatorTypeID
struct CFCalendarIdentifier
struct CFDateFormatterKey
typealias CFErrorDomain
struct CFLocaleIdentifier
struct CFLocaleKey
struct CFNotificationName
struct CFNumberFormatterKey
struct CFRunLoopMode
struct CFStreamPropertyKey
typealias CFTypeRef
An untyped “generic” reference to any Core Foundation object.
Topics
Data Types
See Also
Reference
Core Foundation / Core Foundation Data Types
API Collection
Core Foundation Data Types


## Page 20

CFStream
Core Foundation Structures
Core Foundation Enumerations
Core Foundation Constants
Core Foundation Functions
Core Foundation Macros


## Page 21

var CF_HAS_TYPED_ALLOCATOR: Int32
var CGFLOAT_DEFINED: Int32
var COREFOUNDATION_CFPLUGINCOM_SEPARATE: Int32
CFStream
Core Foundation Structures
Core Foundation Enumerations
Core Foundation Constants
Core Foundation Functions
Core Foundation Data Types
Topics
Macros
See Also
Reference
Core Foundation / Core Foundation Macros
API Collection
Core Foundation Macros


