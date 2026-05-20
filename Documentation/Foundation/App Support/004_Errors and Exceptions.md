# 004_Errors and Exceptions.pdf

## Page 1

protocol Error
A type representing an error value that can be thrown.
class NSError
Information about an error condition including a domain, a domain-specific error code, and
application-specific information.
protocol LocalizedError
A specialized error that provides localized messages describing the error and why it occurre
protocol RecoverableError
A specialized error that may be recoverable by presenting several potential recovery options
to the user.
protocol CustomNSError
A specialized error that provides a domain, error code, and user-info dictionary.
class NSAssertionHandler
An object that logs an assertion to the console.
Topics
User-Relevant Errors
Assertions
Foundation / Errors and Exceptions
API Collection
Errors and Exceptions
Respond to problem situations in your interactions with APIs, and fine-tune your
app for better debugging.


## Page 2

class NSException
An object that represents a special condition that interrupts the normal flow of program
execution.
func NSLogv(String, CVaListPointer)
Logs an error message to the Apple System Log facility.
func NSLog(String, any CVarArg...)
Logs an error message to the Apple System Log facility.
Task Management
Manage your app’s work and how it interacts with system services like Handoff and Shortcut
Resources
Access assets and other data bundled with your app.
Notifications
Design patterns for broadcasting information and for subscribing to broadcasts.
App Extension Support
Manage the interaction between an app extension and its hosting app.
Scripting Support
Allow users to control your app with AppleScript and other automation technologies, or run
scripts from within your app.
Exceptions
Diagnostics and Debugging
See Also
App Support


