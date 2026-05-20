# 000_Task Management.pdf

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


