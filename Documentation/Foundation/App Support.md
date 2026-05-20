# App Support.pdf

## Page 1

class UndoManager
A general-purpose recorder of operations that enables undo and redo.
protocol ProgressReporting
An interface for objects that report progress using a single progress instance.
class Progress
An object that conveys ongoing progress to the user for a specified task.
class Operation
An abstract class that represents the code and data associated with a single task.
class OperationQueue
A queue that regulates the execution of operations.
class BlockOperation
An operation that manages the concurrent execution of one or more blocks.
Topics
Undo
Progress
Operations
Foundation / Task Management
API Collection
Task Management
Manage your app’s work and how it interacts with system services like Handoff
and Shortcuts.


## Page 2

class Timer
A timer that fires after a certain time interval has elapsed, sending a specified message to a
target object.
Share the user’s current activity with Handoff, Spotlight, and Siri Shortcuts.
Continuing User Activities with Handoff
Define and manage which of your app’s activities can be continued between devices.
Implementing Handoff in Your App
Create, send, and receive user activities directly.
class NSUserActivity
A representation of the state of your app at a moment in time.
protocol NSUserActivityDelegate
The interface through which a user activity instance notifies its delegate of updates.
class ProcessInfo
A collection of information about the current process.
class NSBackgroundActivityScheduler
A task scheduler suitable for low priority operations that can run in the background.
class NSUserNotification
A notification that can be scheduled for display in the notification center.
Deprecated
class NSUserNotificationAction
An action that the user can take in response to receiving a notification.
Deprecated
Scheduling
Activity Sharing
System Interaction
User Notifications


## Page 3

class NSUserNotificationCenter
An object that delivers notifications from apps to the user.
Deprecated
protocol NSUserNotificationCenterDelegate
An interface that enables customizing the behavior of the default notification center.
typealias Published
A type alias for the Combine framework’s type that publishes a property marked with an
attribute.
typealias ObservableObject
A type alias for the Combine framework’s type for an object with a publisher that emits befor
the object has changed.
Resources
Access assets and other data bundled with your app.
Notifications
Design patterns for broadcasting information and for subscribing to broadcasts.
App Extension Support
Manage the interaction between an app extension and its hosting app.
Errors and Exceptions
Respond to problem situations in your interactions with APIs, and fine-tune your app for bett
debugging.
Scripting Support
Allow users to control your app with AppleScript and other automation technologies, or run
scripts from within your app.
Combine Integration
See Also
App Support


## Page 4

class Bundle
A representation of the code and resources stored in a bundle directory on disk.
macro bundle() -> Bundle
Expands to a bundle instance that’s most likely to contain resources for the calling code.
class NSBundleResourceRequest
A resource manager you use to download content hosted on the App Store at the time your
app needs it.
Task Management
Manage your app’s work and how it interacts with system services like Handoff and Shortcut
Notifications
Design patterns for broadcasting information and for subscribing to broadcasts.
Topics
Bundle Resources
On-Demand Resources
See Also
App Support
Foundation / Resources
API Collection
Resources
Access assets and other data bundled with your app.


## Page 5

App Extension Support
Manage the interaction between an app extension and its hosting app.
Errors and Exceptions
Respond to problem situations in your interactions with APIs, and fine-tune your app for bett
debugging.
Scripting Support
Allow users to control your app with AppleScript and other automation technologies, or run
scripts from within your app.


## Page 6

NSKeyValueObserving
An informal protocol that objects adopt to be notified of changes to the specified properties 
other objects.
struct Notification
A container for information broadcast through a notification center to all registered observer
class NotificationCenter
A notification dispatch mechanism that enables the broadcast of information to registered
observers.
class NotificationQueue
A notification center buffer.
class DistributedNotificationCenter
A notification dispatch mechanism that enables the broadcast of notifications across task
boundaries.
Topics
Key-Value Observing
Notifications
Cross-Process Notifications
Foundation / Notifications
API Collection
Notifications
Design patterns for broadcasting information and for subscribing to broadcasts.


## Page 7

Task Management
Manage your app’s work and how it interacts with system services like Handoff and Shortcut
Resources
Access assets and other data bundled with your app.
App Extension Support
Manage the interaction between an app extension and its hosting app.
Errors and Exceptions
Respond to problem situations in your interactions with APIs, and fine-tune your app for bett
debugging.
Scripting Support
Allow users to control your app with AppleScript and other automation technologies, or run
scripts from within your app.
See Also
App Support


## Page 8

protocol NSExtensionRequestHandling
The interface an app extension uses to respond to a request from a host app.
class NSExtensionContext
The host app context from which an app extension is invoked.
Supporting suggestions in your app’s share extension
Make your messaging app available for share sheet suggestions and use SiriKit intents to
populate your app’s share extension.
class NSItemProvider
An item provider for conveying data or a file between processes during drag-and-drop or
copy-and-paste activities, or from a host app to an app extension.
class NSExtensionItem
An immutable collection of values representing different aspects of an item for an extension 
act upon.
Add Functionality to Finder with Action Extensions
Topics
Extension Support
Share Extensions
Attachments
Foundation / App Extension Support
API Collection
App Extension Support
Manage the interaction between an app extension and its hosting app.


## Page 9

Implement Action Extensions to provide quick access to commonly used features of your ap
class NSUserActivity
A representation of the state of your app at a moment in time.
protocol NSUserActivityDelegate
The interface through which a user activity instance notifies its delegate of updates.
Task Management
Manage your app’s work and how it interacts with system services like Handoff and Shortcut
Resources
Access assets and other data bundled with your app.
Notifications
Design patterns for broadcasting information and for subscribing to broadcasts.
Errors and Exceptions
Respond to problem situations in your interactions with APIs, and fine-tune your app for bett
debugging.
Scripting Support
Allow users to control your app with AppleScript and other automation technologies, or run
scripts from within your app.
Host App Interaction
See Also
App Support


## Page 10

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


## Page 11

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


## Page 12

class NSAppleScript
An object that provides the ability to load, compile, and execute scripts.
class NSAppleEventDescriptor
A wrapper for the Apple event descriptor data type.
class NSAppleEventManager
A mechanism for registering handler routines for specific types of Apple events and
dispatching events to those handlers.
class NSScriptCommand
A self-contained scripting statement.
class NSQuitCommand
A command that quits the specified app.
class NSSetCommand
A command that sets one or more attributes or relationships to one or more values.
Topics
Script Execution
Apple Event Handling
Script Commands
Foundation / Scripting Support
API Collection
Scripting Support
Allow users to control your app with AppleScript and other automation
technologies, or run scripts from within your app.


## Page 13

class NSMoveCommand
A command that moves one or more scriptable objects.
class NSCreateCommand
A command that creates a scriptable object.
class NSDeleteCommand
A command that deletes a scriptable object.
class NSExistsCommand
A command that determines whether a scriptable object exists.
class NSGetCommand
A command that retrieves a value or object from a scriptable object.
class NSCloneCommand
A command that clones one or more scriptable objects.
class NSCountCommand
A command that counts the number of objects of a specified class in the specified object
container.
class NSCloseCommand
A command that closes one or more scriptable objects.
class NSScriptObjectSpecifier
An abstract class used to represent natural language expressions.
class NSPropertySpecifier
A specifier for a simple attribute value, a one-to-one relationship, or all elements of a to-man
relationship.
class NSPositionalSpecifier
A specifier for an insertion point in a container relative to another object in the container.
class NSRandomSpecifier
A specifier for an arbitrary object in a collection or, if not a one-to-many relationship, the sol
object.
class NSRangeSpecifier
A specifier for a range of objects in a container.
Object Specifiers


## Page 14

class NSUniqueIDSpecifier
A specifier for an object in a collection (or container) by unique ID.
class NSWhoseSpecifier
A specifier that indicates every object in a collection matching a condition.
class NSNameSpecifier
A specifier for an object in a collection (or container) by name.
class NSMiddleSpecifier
A specifier indicating the middle object in a collection or, if not a one-to-many relationship, t
sole object.
class NSIndexSpecifier
A specifier representing an object in a collection (or container) with an index number.
class NSRelativeSpecifier
A specifier that indicates an object in a collection by its position relative to another object.
class NSScriptSuiteRegistry
The top-level repository of scriptability information for an app at runtime.
class NSScriptClassDescription
A scriptable class that a macOS app supports.
class NSClassDescription
An abstract class that provides the interface for querying the relationships and properties of
class.
class NSScriptCommandDescription
A script command that a macOS app supports.
class NSScriptWhoseTest
An abstract class that provides the basis for testing specifiers one at a time or in groups.
class NSSpecifierTest
A comparison between an object specifier and a test object.
Script Dictionary Description
Object Matching Tests


## Page 15

class NSLogicalTest
The logical combination of one or more specifier tests.
NSComparisonMethods
A collection of default comparison methods useful for performing specifier tests.
NSScriptingComparisonMethods
A collection of methods useful for comparing script objects.
NSScriptKeyValueCoding
A collection of methods that provide additional capabilities for working with key-value coding
NSScriptObjectSpecifiers
A collection of methods providing additional object specifier functionality.
class NSScriptCoercionHandler
A mechanism for converting one kind of scripting data to another.
class NSScriptExecutionContext
The context in which the current script command is executed.
Task Management
Manage your app’s work and how it interacts with system services like Handoff and Shortcut
Resources
Access assets and other data bundled with your app.
Notifications
Design patterns for broadcasting information and for subscribing to broadcasts.
App Extension Support
Manage the interaction between an app extension and its hosting app.
NSObject Script Support
See Also
App Support


## Page 16

Errors and Exceptions
Respond to problem situations in your interactions with APIs, and fine-tune your app for bett
debugging.


