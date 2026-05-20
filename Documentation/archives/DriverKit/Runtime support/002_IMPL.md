# 002_IMPL.pdf

## Page 1

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


## Page 2

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


## Page 3

C++ Runtime Support
Examine low-level types that DriverKit uses to support kernel-level operations.


