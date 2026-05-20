# 001_OSRequiredCast.pdf

## Page 1

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


## Page 2

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


