# 000_CMSimpleQueue.pdf

## Page 1

Simple queues are Core Foundation-based objects that implement a simple, lockless FIFO queue 
(void *) elements. The elements in the queue can be pointers or simple pointer-sized numeric
values (NULL or 0 elements aren’t allowed). If the elements are pointers to allocated memory
buffers, handle lifetime management externally.
A simple queue can safely handle one enqueueing thread and one dequeueing thread. Simple
queues are lockless, so enqueues and dequeues can occur on the Core Audio ioProc thread,
where the system forbids locking and blocking.
You can query the state of a simple queue to get the current number of elements and the maximu
capacity of the queue. You can also determine the queue’s fullness, which the system provides as
percentage of its capacity.
You can reset a simple queue, which returns it to its newly created state, with no elements in the
queue (but with the maximum capacity unchanged).
func CMSimpleQueueCreate(allocator: CFAllocator?, capacity: Int32, queu
Out: UnsafeMutablePointer<CMSimpleQueue?>) -> OSStatus
Creates a queue that has the specified capacity.
Overview
Topics
Creating a Queue
Managing Queues
Core Media / CMSimpleQueue
API Collection
CMSimpleQueue
A simple, lockless FIFO queue of elements.


## Page 2

func CMSimpleQueueEnqueue(CMSimpleQueue, element: UnsafeRawPointer) ->
OSStatus
Enqueues an element in the queue.
func CMSimpleQueueDequeue(CMSimpleQueue) -> UnsafeRawPointer?
Dequeues an element from the queue.
func CMSimpleQueueReset(CMSimpleQueue) -> OSStatus
Resets the queue.
func CMSimpleQueueGetHead(CMSimpleQueue) -> UnsafeRawPointer?
Returns the element at the head of the queue.
func CMSimpleQueueGetCapacity(CMSimpleQueue) -> Int32
Returns the number of elements that the queue can hold.
func CMSimpleQueueGetCount(CMSimpleQueue) -> Int32
Returns the number of elements currently in the queue.
func CMSimpleQueueGetTypeID() -> CFTypeID
Returns the type identifier of sample buffer objects.
class CMSimpleQueue
A reference to an instance that provides a simple lockless queue of elements.
Simple Queue Error Codes
Error codes that simple queue operations generate.
Inspecting Queues
Accessing the Type Identifier
Data Types
Errors
See Also


## Page 3

CMBufferQueue
A queue of timed buffers.
CMMemoryPool
An object that optimizes memory allocation when working with large blocks of memory.
Queues


