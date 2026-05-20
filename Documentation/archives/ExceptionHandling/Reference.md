# Reference.pdf

## Page 1

Logging and Handling Constants
Use one or more of the following constants in the parameter of setExceptionHandling
Mask(_:) to specify the types of exceptions that the exception handler should monitor and
whether it should handle or log them.
System Hang Constants
Use one or more of the following constants in the parameter of setExceptionHanging
Mask(_:) to specify the types of exceptions that cause the exception to halt execution so a
debugger can be attached.
ExceptionHandling Constants
ExceptionHandling Functions
Topics
Enumerations
See Also
Reference
Exception Handling / ExceptionHandling Enumerations
ExceptionHandling Enumerations


## Page 2

let NSStackTraceKey: String
The key for fetching the stack trace (an NSString object) in the userInfo dictionary of th
NSException object passed into one of the delegate methods described in
NSExceptionHandlerDelegate.
let NSUncaughtRuntimeErrorException: String
Identifies an Objective-C runtime error.
let NSUncaughtSystemExceptionException: String
Identifies an uncaught system exception.
ExceptionHandling Enumerations
ExceptionHandling Functions
Topics
Constants
See Also
Reference
Exception Handling / ExceptionHandling Constants
API Collection
ExceptionHandling Constants


## Page 3

func NSExceptionHandlerResume()
ExceptionHandling Enumerations
ExceptionHandling Constants
Topics
Functions
See Also
Reference
Exception Handling / ExceptionHandling Functions
API Collection
ExceptionHandling Functions


