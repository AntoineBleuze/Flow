# 004_IODispatchSource.pdf

## Page 1

init
Handles the basic initialization of the dispatch source.
free
Performs any final cleanup for the dispatch source.
Cancel
Cancel all callbacks from the dispatch source.
SetEnable
Enables or disables the delivery of events to your code.
SetEnableWithCompletion
Enables or disables the dispatch source.
Topics
Configuring the Dispatch Source
Enabling and Disabling the Source
Checking the State of the Source
DriverKit / IODispatchSource
Class
IODispatchSource
The common base class for dispatch sources.
DriverKit
iOS
iPadOS
macOS


## Page 2

CheckForWork
Checks for events to handle.
OSObject
IODataQueueDispatchSource
IOInterruptDispatchSource
IOServiceNotificationDispatchSource
IOServiceStateNotificationDispatchSource
IOTimerDispatchSource
IODispatchQueue
An object that manages the serial execution of blocks.
IOInterruptDispatchSource
A dispatch source that reports hardware-related interrupt events to your driver.
IOTimerDispatchSource
A dispatch source that notifies your driver at a specific time.
IODataQueueDispatchSource
A dispatch source that manages a shared-memory data queue.
OSAction
An object that executes your driver’s custom behavior.
Relationships
Inherits From
Inherited By
See Also
Event management


## Page 3



