# Runtime support.pdf

## Page 1

type
The name of the desired class type as a raw token, not as a string or macro.
inst
The object to cast to the specified type.
The object cast to the specified type, or NULL if the cast could not be performed safely.
Use this macro instead of the standard C++ RTTI type-casting operator to cast objects to specific
types. The following example shows how to cast some object to the OSString class. If the objec
cannot be cast to a string, the macro sets the string variable to NULL.
Parameters
Return Value
Discussion
See Also
DriverKit / OSDynamicCast
Macro
OSDynamicCast
Casts an object safely to the specified type, if possible.
DriverKit
iOS
iPadOS
macOS


## Page 2

OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.
Runtime support


## Page 3

type
The name of the desired class type as a raw token, not as a string or macro.
inst
The object to cast to the specified type.
The object cast to the specified type.
Use this macro when you require the object to be the specified type, and you are sure that it’s the
specified type. The following example shows how to cast some object to the OSString class. If
the object cannot be cast to a string, the macro terminates the process.
Parameters
Return Value
Discussion
DriverKit / OSRequiredCast
Macro
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of
the correct type.
DriverKit
iOS
iPadOS
macOS


## Page 4

OSDynamicCast
Casts an object safely to the specified type, if possible.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.
See Also
Runtime support


## Page 5

classname
The name of your custom class.
name
The name of the DriverKit method you are overriding in your custom subclass.
Creating a Driver Using the DriverKit SDK
Use this macro when overriding any methods that are adorned directly (or indirectly via their class
with the IIG_KERNEL macro. For example, use it to define the implementation of custom Start
and Stop methods in an IOService subclass. The macro tells the compiler to add binding code
between the method running locally in your driver extension’s process space and the superclass
method running in the kernel. Don’t add this macro when overriding methods declared with the
LOCAL or LOCALONLY macros.
When using the IMPL macro to define your method, don’t include the method parameters as part
of your definition. The compiler automatically inserts the appropriate parameters using informatio
Parameters
Mentioned in
Discussion
DriverKit / IMPL
Macro
IMPL
Tells the system that the superclass implementation of this method runs in the
kernel.
DriverKit
iOS
iPadOS
macOS


## Page 6

from the superclass’ definition. For example, the following code shows how to declare a custom
implementation of the Start method:
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
See Also
Runtime support


## Page 7

C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 8

p
The class and method name to which the method conforms. Specify this value using the
format <class>::<method>. Specify the class and method names directly, and do not use
string.
Creating a Driver Using the DriverKit SDK
Typically, you use this macro to implement DriverKit callbacks using your own custom methods.
The macro lets you ignore the original method’s name and choose any name you want. Your
method must still declare the same parameters and return type as the original method. For
example, the following code shows how to declare a custom version of the DataAvailable
method of IODataQueueDispatchSource in your header file.
Parameters
Mentioned in
Discussion
DriverKit / TYPE
Macro
TYPE
Annotates a method declaration to indicate that it conforms to an existing method
signature.
DriverKit
iOS
iPadOS
macOS


## Page 9

This macro generates the following convenient symbols that you can use when configuring action
involving your custom method:
A message ID constant you can pass to the Create method of OSAction. The constant takes
the form <ClassName>_<MethodName>_ID. For example, if you add the TYPE macro to the
ReceiveData method of your custom MyDriver class, the corresponding message ID
constant is MyDriver_ReceiveData_ID.
A CreateAction_<Method> function that creates an OSAction object targeting your custo
method. For example, if the name of your custom method is HandleTimer, the name of the
generated function is CreateActionHandleTimer.
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
See Also
Runtime support


## Page 10

Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 11

name
The name of the instance variable that contains an IODispatchQueue object.
Add this macro to the end of your method declaration in the .iig file of your class. When this
macro is present, DriverKit executes your method on the dispatch queue with the specified name
You must register the dispatch queues your driver uses by calling the SetDispatchQueue
method as part of your driver’s configuration. The following code listing shows the declaration of 
method that handles asynchronous I/O for a USB pipe. DriverKit executes the method on a
previously registered dispatch queue with the name tx_pipe_dq.
Parameters
Discussion
DriverKit / QUEUENAME
Macro
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified
name.
DriverKit
iOS
iPadOS
macOS


## Page 12

OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.
See Also
Runtime support


## Page 13

Creating a Driver Using the DriverKit SDK
When calling the DriverKit implementation of a method that runs in the kernel, use this macro to
bridge from your driver extension’s process space to the superclass’ version of the method. You
must use this macro to call inherited DriverKit methods annotated with the IIG_KERNEL macro.
To use this macro, call the original method without the super prefix and insert this macro as the
final parameter in the parameter list. For example, the following code shows how to call the
inherited version of the Start method from a custom IOService subclass.
Mentioned in
Discussion
DriverKit / SUPERDISPATCH
Macro
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method
in the kernel.
DriverKit
iOS
iPadOS
macOS


## Page 14

Don’t use this macro when calling the inherited version of a DriverKit method marked with the
LOCALONLY macro.
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.
See Also
Runtime support


## Page 15

DriverKit adds this macro to methods that must run inside the kernel’s process space. When
overriding a method tagged with this macro, you must define your method using the IMPL macro
which creates the necessary binding to bridge from your driver’s process space to the kernel
implementation. When applied to a class, this macro affects all methods of the class.
Don’t apply this macro to your own classes and methods.
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
Discussion
See Also
Runtime support
DriverKit / IIG_KERNEL
Macro
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
DriverKit
iOS
iPadOS
macOS


## Page 16

TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 17

DriverKit adds this macro to methods that must run locally in your driver extension. A method
tagged with this macro may still be called by a remote process such as the kernel. Don’t add this
macro to your own methods.
This macro applies only to methods.
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
Discussion
See Also
Runtime support
DriverKit / LOCAL
Macro
LOCAL
Tells the system that the method runs locally in the driver extension’s process
space.
DriverKit
iOS
iPadOS
macOS


## Page 18

TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 19

DriverKit adds this macro to classes and methods that cannot be called remotely by the kernel or
other processes. Instead, you call the methods locally from your driver’s process space. When
applied to a class, the macro affects all methods of that class.
When calling the superclass implementation of a local-only method, call super like you normally
would. Don’t use the SUPERDISPATCH macro to call the inherited implementation.
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Discussion
See Also
Runtime support
DriverKit / LOCALONLY
Macro
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s
process space.
DriverKit
iOS
iPadOS
macOS


## Page 20

Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
Error Codes
Determine the reason an operation fails.
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 21

kIOReturnSuccess
kIOReturnAborted
kIOReturnBadArgument
kIOReturnBadMedia
kIOReturnBadMessageID
kIOReturnBusy
kIOReturnCannotLock
kIOReturnCannotWire
kIOReturnDeviceError
kIOReturnDMAError
kIOReturnError
kIOReturnExclusiveAccess
kIOReturnInternalError
kIOReturnInvalid
Topics
No Error
Errors
DriverKit / Error Codes
API Collection
Error Codes
Determine the reason an operation fails.


## Page 22

kIOReturnIOError
kIOReturnIPCError
kIOReturnIsoTooNew
kIOReturnIsoTooOld
kIOReturnLockedRead
kIOReturnLockedWrite
kIOReturnMessageTooLarge
kIOReturnNoBandwidth
kIOReturnNoChannels
kIOReturnNoCompletion
kIOReturnNoDevice
kIOReturnNoFrames
kIOReturnNoInterrupt
kIOReturnNoMedia
kIOReturnNoMemory
kIOReturnNoPower
kIOReturnNoResources
kIOReturnNoSpace
kIOReturnNotAligned
kIOReturnNotAttached
kIOReturnNotFound
kIOReturnNotOpen
kIOReturnNotPermitted
kIOReturnNotPrivileged
kIOReturnNotReadable
kIOReturnNotReady
kIOReturnNotResponding
kIOReturnNotWritable


## Page 23

kIOReturnOffline
kIOReturnOverrun
kIOReturnPortExists
kIOReturnRLDError
kIOReturnStillOpen
kIOReturnTimeout
kIOReturnUnderrun
kIOReturnUnformattedMedia
kIOReturnUnsupported
kIOReturnUnsupportedMode
kIOReturnVMError
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
See Also
Runtime support


## Page 24

Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 25

OSObjectAllocate
Helper function for OSTypeAlloc(). Not to be called directly.
OSObjectRetain
OSObjectRelease
IOReturn
IOOptionBits
integer_t
natural_t
kern_return_t
IOItemCount
IOVersion
OSObjectLog
IOLogBuffer
Topics
Object Support
Additional Types
Log Support
DriverKit / C++ Runtime Support
API Collection
C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


## Page 26

crc32
OSMetaClass
Base class for DriverKit runtime class system. Not called directly.
OSMetaClassBase
Base class for DriverKit objects.
IORPC
IORPCMessage
IORPCMessageMach
IORPCMessageErrorReturn
OSClassLoadInformation
OSClassDescription
OSDispatchMethod
RPC Message ID
RPC Message Types
RPC Capabilities
RPC Version
IORPCMessageFromMach
mach_port_name_t
mach_port_t
mach_absolute_time
Returns current value of a clock that increments monotonically in tick units (starting at an
arbitrary point), this clock does not increment while the system is asleep.
Base Classes
RPC Support
Mach Ports
Mach Timebase


## Page 27

mach_continuous_time
Returns current value of a clock that increments monotonically in tick units (starting at an
arbitrary point), including while the system is asleep.
mach_timebase_info
Returns fraction to multiply a value in mach tick units with to convert it to nanoseconds.
mach_timebase_info_t
Time Scales
mach_msg_bits_t
mach_msg_copy_options_t
mach_msg_descriptor_type_t
mach_msg_id_t
mach_msg_size_t
mach_msg_type_name_t
mach_msg_body_t
mach_msg_header_t
mach_msg_max_trailer_t
mach_msg_ool_descriptor_t
mach_msg_port_descriptor_t
mach_timebase_info_data_t
Raw Mach Time API In general prefer to use the <time.h> API clock_gettime_nsec_np(3),
which deals in the same clocks (and more) in ns units. Conversion of ns to (resp. from) tick
units as returned by the mach time APIs is performed by division (resp. multiplication) with t
fraction returned by mach_timebase_info().
IOParseBootArgNumber
Parses any boot arguments in the macOS kernel boot-args.
IOParseBootArgString
Mach Messages
Boot Support


## Page 28

Parses any boot arguments in the macOS kernel boot-args.
IODelay
Sleep the calling thread for a number of microseconds.
IOSleep
Sleep the calling thread for a number of milliseconds.
OSReportWithBacktrace
Generates a backtrace and message for debugging.
OSSynchronizeIO
Performs an mfence instruction on Intel-based Mac computers.
OSDynamicCast
Casts an object safely to the specified type, if possible.
OSRequiredCast
Casts the object to the specified type, stopping the process if the object isn’t of the correct
type.
IMPL
Tells the system that the superclass implementation of this method runs in the kernel.
TYPE
Annotates a method declaration to indicate that it conforms to an existing method signature
QUEUENAME
Tells the system to execute a method on the dispatch queue with the specified name.
SUPERDISPATCH
Thread Utilities
Additional Utilities
See Also
Runtime support


## Page 29

Tells the system to execute the superclass’ implementation of the current method in the
kernel.
IIG_KERNEL
Tells the system that the class or method runs inside the kernel.
LOCAL
Tells the system that the method runs locally in the driver extension’s process space.
LOCALONLY
Tells the system that the class or method runs locally in the driver extension’s process space
Error Codes
Determine the reason an operation fails.


