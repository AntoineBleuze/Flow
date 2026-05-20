# 015_CFFileDescriptor.pdf

## Page 1

The CFFileDescriptor provides an opaque type to monitor file descriptors for read and write activi
via CFRunLoop.
You use CFFileDescriptor to monitor file descriptors for read and write activity via CFRunLoop usi
callbacks. Each call back is one-shot, and must be re-enabled if you want to get another one.
You can re-enable the callback in the callback function itself, but you must completely service the
file descriptor before doing so. For example, if you create a CFFileDescriptor for a pipe and get a
callback because there are bytes to be read, then if you don’t read all of the bytes but nevertheles
re-enable the CFFileDescriptor for read activity, you’ll get called back again immediately.
You can monitor kqueue file descriptors for read activity to find out when an event the kqueue is
filtering for has occurred. You are responsible for understanding the use of the kevent() API and
inserting and removing filters from the kqueue file descriptor yourself.
The following example takes a UNIX process ID as argument, and watches up to 20 seconds, and
reports if the process terminates in that time:
Overview
Core Foundation / CFFileDescriptor
Class
CFFileDescriptor
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFFileDescriptorCreate(CFAllocator!, CFFileDescriptorNative
Descriptor, Bool, CFFileDescriptorCallBack!, UnsafePointer<CFFile
DescriptorContext>!) -> CFFileDescriptor!
Creates a new CFFileDescriptor.
func CFFileDescriptorGetNativeDescriptor(CFFileDescriptor!) -> CFFile
DescriptorNativeDescriptor
Returns the native file descriptor for a given CFFileDescriptor.
func CFFileDescriptorIsValid(CFFileDescriptor!) -> Bool
Returns a Boolean value that indicates whether the native file descriptor for a given
CFFileDescriptor is valid.
Topics
Creating a CFFileDescriptor
Getting Information About a File Descriptor


## Page 3

func CFFileDescriptorGetContext(CFFileDescriptor!, UnsafeMutablePointer
CFFileDescriptorContext>!)
Gets the context for a given CFFileDescriptor.
func CFFileDescriptorInvalidate(CFFileDescriptor!)
Invalidates a CFFileDescriptor object.
func CFFileDescriptorEnableCallBacks(CFFileDescriptor!, CFOptionFlags)
Enables callbacks for a given CFFileDescriptor.
func CFFileDescriptorDisableCallBacks(CFFileDescriptor!, CFOptionFlags)
Disables callbacks for a given CFFileDescriptor.
func CFFileDescriptorCreateRunLoopSource(CFAllocator!, CFFileDescriptor
!, CFIndex) -> CFRunLoopSource!
Creates a new runloop source for a given CFFileDescriptor.
func CFFileDescriptorGetTypeID() -> CFTypeID
Returns the type identifier for the CFFileDescriptor opaque type.
typealias CFFileDescriptorNativeDescriptor
Defines a type for the native file descriptor.
typealias CFFileDescriptorCallBack
Defines a structure for a callback for a CFFileDescriptor.
struct CFFileDescriptorContext
Defines a structure for the context of a CFFileDescriptor.
Invalidating a File Descriptor
Managing Callbacks
Creating a Run Loop Source
Getting the CFFileDescriptor Type ID
Data Types


## Page 4

Callback Identifiers
Constants that identify the read and write callbacks.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 5

class CFDictionary
class CFError


