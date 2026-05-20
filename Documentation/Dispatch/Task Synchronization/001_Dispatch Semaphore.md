# 001_Dispatch Semaphore.pdf

## Page 1

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


## Page 2

class DispatchSemaphore
An object that controls access to a resource across multiple execution contexts through use
of a traditional counting semaphore.
Dispatch Barrier
A synchronization point for tasks executing in a concurrent dispatch queue.


