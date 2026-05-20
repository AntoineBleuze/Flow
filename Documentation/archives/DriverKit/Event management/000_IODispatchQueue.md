# 000_IODispatchQueue.pdf

## Page 1

An IODispatchQueue object is a FIFO queue that you use to execute tasks serially in your drive
You submit tasks as code blocks, and the system dequeues one block at a time, executing them
sequentially.
Important
Always use an IODispatchQueue instead of a dispatch_queue_t structure to schedule
tasks for your driver.
Create
Creates a new dispatch queue object.
init
Initializes the dispatch queue object.
Overview
Topics
Creating a Dispatch Queue
DriverKit / IODispatchQueue
Class
IODispatchQueue
An object that manages the serial execution of blocks.
DriverKit
iOS
iPadOS
macOS


## Page 2

free
Performs any final cleanup for the dispatch queue object.
DispatchAsync
Schedule a block for asynchronous execution on the current queue.
DispatchAsync_f
Schedule a C-style function for asynchrous execution on the current queue.
IODispatchBlock
A block to execute on a dispatch queue.
IODispatchFunction
A C-style function to execute on a dispatch queue.
DispatchSync
Schedule a block for synchronous execution on the current queue.
DispatchSync_f
Schedule a C-style function for synchronous execution on the current queue.
Cancel
Stops the queue from dequeueing any further tasks, and notifies the specified handler when
all in-flight tasks finish.
IODispatchQueueCancelHandler
A block to execute when a canceled dispatch queue stops executing tasks.
GetName
Returns the name of the queue as a C string.
OnQueue
Executing a Task Asynchronously
Executing a Task Synchronously
Stopping the Queue
Getting Queue Information


## Page 3

Returns a Boolean value that indicates whether the current thread matches the dispatch
queue’s thread.
IODispatchQueueName
A buffer for specifying the name of a dispatch queue.
Log
Log the current execution context with respect to any queues the current thread holds.
IODispatchLogFunction
A function that logs content.
DispatchConcurrent
DispatchConcurrent_f
RunAction
Sleep
SleepWithDeadline
SleepWithTimeout
Wakeup
WakeupWithOptions
OSObject
Logging Dispatch Information
Instance Methods
Relationships
Inherits From
See Also


## Page 4

IOInterruptDispatchSource
A dispatch source that reports hardware-related interrupt events to your driver.
IOTimerDispatchSource
A dispatch source that notifies your driver at a specific time.
IODataQueueDispatchSource
A dispatch source that manages a shared-memory data queue.
IODispatchSource
The common base class for dispatch sources.
OSAction
An object that executes your driver’s custom behavior.
Event management


