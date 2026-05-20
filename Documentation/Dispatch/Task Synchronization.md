# Task Synchronization.pdf

## Page 1

A dispatch semaphore is an efficient implementation of a traditional counting semaphore. Dispatc
semaphores call down to the kernel only when the calling thread needs to be blocked. If the callin
semaphore does not need to block, no kernel call is made.
You increment a semaphore count by calling the signal() method, and decrement a semaphore
count by calling wait() or one of its variants that specifies a timeout.
init(value: Int)
Creates new counting semaphore with an initial value.
func signal() -> Int
Signals (increments) a semaphore.
Overview
Topics
Creating a Semaphore
Signaling the Semaphore
Dispatch / DispatchSemaphore
Class
DispatchSemaphore
An object that controls access to a resource across multiple execution contexts
through use of a traditional counting semaphore.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func wait()
Waits for, or decrements, a semaphore.
func wait(timeout: DispatchTime) -> DispatchTimeoutResult
Waits for, or decrements, a semaphore.
func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult
Waits for, or decrements, a semaphore.
DispatchObject
CVarArg
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Dispatch Semaphore
An object that controls access to a resource across multiple execution contexts through use
of a traditional counting semaphore.
Dispatch Barrier
Blocking on the Semaphore
Relationships
Inherits From
Conforms To
See Also
Task Synchronization


## Page 3

A synchronization point for tasks executing in a concurrent dispatch queue.


## Page 4

A dispatch semaphore is an efficient implementation of a traditional counting semaphore. Dispatc
semaphores call down to the kernel only when the calling thread needs to be blocked. If the callin
semaphore does not need to block, no kernel call is made.
You increment a semaphore count by calling the signal() method, and decrement a semaphore
count by calling dispatch_semaphore_wait or one of its variants that specifies a timeout.
init(value: Int)
Creates new counting semaphore with an initial value.
typealias dispatch_semaphore_t
A dispatch semaphore object.
Overview
Topics
Creating a Semaphore
See Also
Task Synchronization
Dispatch / Dispatch Semaphore
API Collection
Dispatch Semaphore
An object that controls access to a resource across multiple execution contexts
through use of a traditional counting semaphore.


## Page 5

class DispatchSemaphore
An object that controls access to a resource across multiple execution contexts through use
of a traditional counting semaphore.
Dispatch Barrier
A synchronization point for tasks executing in a concurrent dispatch queue.


## Page 6

Use a barrier to synchronize the execution of one or more tasks in your dispatch queue. When yo
add a barrier to a concurrent dispatch queue, the queue delays the execution of the barrier block
(and any tasks submitted after the barrier) until all previously submitted tasks finish executing.
After the previous tasks finish executing, the queue executes the barrier block by itself. Once the
barrier block finishes, the queue resumes its normal execution behavior.
class DispatchSemaphore
An object that controls access to a resource across multiple execution contexts through use
of a traditional counting semaphore.
Dispatch Semaphore
An object that controls access to a resource across multiple execution contexts through use
of a traditional counting semaphore.
Overview
See Also
Task Synchronization
Dispatch / Dispatch Barrier
API Collection
Dispatch Barrier
A synchronization point for tasks executing in a concurrent dispatch queue.


