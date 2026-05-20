# 000_DispatchSemaphore.pdf

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


