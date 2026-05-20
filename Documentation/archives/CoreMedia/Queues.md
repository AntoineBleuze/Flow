# Queues.pdf

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


## Page 4

Buffer queues are Core Foundation objects that implement a queue of timed buffers. The buffers
can be of any Core Foundation-based type (CFTypeRef), but must have a concept of duration.
When you create a buffer queue, you pass a set of callbacks, one of which is a required callback
that returns the duration of the Core Foundation-based buffer object. The system invokes these
callbacks synchronously on the thread that called the API.
Buffer queues support reading and writing data from different threads in a producer-consumer
model. While this model typically has two threads (a producer and a consumer), a buffer queue c
service any number of threads to enqueue and dequeue buffers. The system makes all operations
atomic by use of a single mutex (one mutex per created queue object).
By default, a CMBufferQueue is a FIFO queue, but you can change that order by providing a
comparison callback. For example, you might create a buffer queue where you enqueue buffers in
decode order, and dequeue them in presentation order, by providing a comparison callback that
sorts by presentation timestamp.
A buffer queue retains its enqueued buffers. When you call CMBufferQueueDequeue(_:), the
system retains the buffer on behalf of the app, and the queue releases it. The retain count remain
the same, but the app takes ownership of the buffer.
If you provide a buffer-readiness callback, an instance of CMBufferQueue can check for buffer
readiness when calling the CMBufferQueueDequeueIfDataReady(_:) function. If you don’t
provide that callback, the system assumes all buffers are ready, and there’s no difference betwee
CMBufferQueueDequeue(_:) and CMBufferQueueDequeueIfDataReady(_:).
Buffer queues also provide the CMBufferQueueIsEmpty(_:) and CMBufferQueueTest
Trigger(_:triggerToken:) functions that, with the help of optional callbacks, get decode
and presentation timestamps from a buffer. The system returns a value of invalid if you don’t
provide these callbacks.
Overview
Core Media / CMBufferQueue
API Collection
CMBufferQueue
A queue of timed buffers.


## Page 5

You can set an end-of-data marker on a buffer queue, which causes further enqueues to fail. Afte
the queue has dequeued all buffers, the queue is permanently empty (“at end of data”) until you
call the CMBufferQueueReset(_:)function. Reset empties the queue and undoes the end-of-
data marking.
You can interrogate the current status of a buffer queue. For example, you can test for emptiness
(CMBufferQueueCreate(allocator:capacity:callbacks:queueOut:)), current queu
duration (Inspecting Buffer Queues), and end-of-data status (CMBufferQueueContain
EndOfData(_:) and CMBufferQueueIsAtEndOfData(_:)).
You can install trigger callbacks by calling the CMBufferQueueInstallTriggerHandler(_:
_:_:_:_:) function to get notifications of various queue state transitions, such as when the
duration becomes less than a second. You can inspect a buffer queue during trigger callback, but
you can’t modify it. You can test trigger conditions explicitly as well. You can invoke trigger
callbacks from any buffer queue API that modifies the total duration of the queue, such as
enqueuing, dequeuing, or resetting the queue. The system invokes trigger callbacks synchronous
on the thread that called the API.
You can’t modify the state of the queue from within a trigger callback. The operation fails, returnin
a kCMBufferQueueError_CannotModifyQueueFromTriggerCallback error. Attempting 
enqueue a buffer when the queue is full, or dequeue from an empty queue, immediately returns a
error (or a NULL buffer).
Install triggers to observe the queue’s fullness rather than repeatedly polling the queue to get this
state.
func CMBufferQueueCreateWithHandlers(CFAllocator?, CMItemCount, Opaque
Pointer, UnsafeMutablePointer<CMBufferQueue?>) -> OSStatus
Creates a buffer queue with handlers to inspect buffers.
func CMBufferQueueCreate(allocator: CFAllocator?, capacity: CMItemCount
callbacks: UnsafePointer<CMBufferCallbacks>, queueOut: UnsafeMutable
Pointer<CMBufferQueue?>) -> OSStatus
Creates a buffer queue with callbacks to inspect buffers.
struct CMBufferCallbacks
A structure that stores the callbacks that perform buffer operations.
Topics
Creating a Queue
Managing a Queue


## Page 6

func CMBufferQueueEnqueue(CMBufferQueue, buffer: CMBuffer) -> OSStatus
Enqueues a buffer onto a queue.
func CMBufferQueueCallForEachBuffer(CMBufferQueue, callback: (CMBuffer,
UnsafeMutableRawPointer?) -> OSStatus, refcon: UnsafeMutableRawPointer?
-> OSStatus
Calls a function for every buffer in a queue.
func CMBufferQueueDequeue(CMBufferQueue) -> CMBuffer?
Dequeues a buffer from a queue.
func CMBufferQueueDequeueIfDataReady(CMBufferQueue) -> CMBuffer?
Dequeues a buffer from a queue, if it’s ready.
func CMBufferQueueMarkEndOfData(CMBufferQueue) -> OSStatus
Sets a marker to indicate this queue doesn’t allow enqueuing new buffers.
func CMBufferQueueReset(CMBufferQueue) -> OSStatus
Resets a buffer queue, which allows it to enqueue new buffers.
func CMBufferQueueResetWithCallback(CMBufferQueue, callback: (CMBuffer,
UnsafeMutableRawPointer?) -> Void, refcon: UnsafeMutableRawPointer?) ->
OSStatus
A callback that invokes a function for every buffer in a queue and then resets the queue.
func CMBufferQueueRemoveTrigger(CMBufferQueue, triggerToken: CMBuffer
QueueTriggerToken) -> OSStatus
Removes a previously installed trigger from a buffer queue.
func CMBufferQueueInstallTriggerHandler(CMBufferQueue, CMBufferQueue
TriggerCondition, CMTime, UnsafeMutablePointer<CMBufferQueueTriggerToke
?>?, CMBufferQueueTriggerHandler?) -> OSStatus
Installs a trigger with a handler on a buffer queue.
func CMBufferQueueInstallTriggerHandlerWithIntegerThreshold(CMBuffer
Queue, CMBufferQueueTriggerCondition, CMItemCount, UnsafeMutablePointer
CMBufferQueueTriggerToken?>?, CMBufferQueueTriggerHandler?) -> OSStatus
Installs a trigger with a handler and threshold on a buffer queue.
typealias CMBufferQueueTriggerHandler
A type alias for a trigger handler.
Managing Triggers


## Page 7

typealias CMBufferQueueTriggerToken
A type alias for a trigger token.
Buffer Trigger Conditions
The trigger conditions the framework supports.
func CMBufferQueueTestTrigger(CMBufferQueue, triggerToken: CMBufferQueu
TriggerToken) -> Bool
Tests whether the trigger condition is true for the specified buffer queue.
func CMBufferQueueInstallTrigger(CMBufferQueue, callback: CMBufferQueue
TriggerCallback?, refcon: UnsafeMutableRawPointer?, condition: CMBuffer
QueueTriggerCondition, time: CMTime, triggerTokenOut: UnsafeMutable
Pointer<CMBufferQueueTriggerToken?>?) -> OSStatus
Installs a trigger with a callback on a buffer queue.
func CMBufferQueueInstallTriggerWithIntegerThreshold(CMBufferQueue,
callback: CMBufferQueueTriggerCallback?, refcon: UnsafeMutableRawPointe
?, condition: CMBufferQueueTriggerCondition, threshold: CMItemCount,
triggerTokenOut: UnsafeMutablePointer<CMBufferQueueTriggerToken?>?) ->
OSStatus
Installs a trigger with a callback and threshold on a buffer queue.
typealias CMBufferQueueTriggerCallback
A callback for the system to invoke when a trigger condition becomes true.
typealias CMBufferQueueTriggerCondition
A type to specify conditions to associate with a buffer queue trigger.
func CMBufferQueueGetDuration(CMBufferQueue) -> CMTime
Gets the duration of a buffer queue.
func CMBufferQueueGetMinDecodeTimeStamp(CMBufferQueue) -> CMTime
Gets the earliest decode timestamp of a buffer queue.
func CMBufferQueueGetFirstDecodeTimeStamp(CMBufferQueue) -> CMTime
Gets the decode timestamp of the first buffer in a buffer queue.
func CMBufferQueueGetMinPresentationTimeStamp(CMBufferQueue) -> CMTime
Gets the earliest presentation timestamp of a buffer queue.
Inspecting Duration and Timing


## Page 8

func CMBufferQueueGetFirstPresentationTimeStamp(CMBufferQueue) -> CMTim
Gets the presentation timestamp of the first buffer in a buffer queue.
func CMBufferQueueGetEndPresentationTimeStamp(CMBufferQueue) -> CMTime
Gets the greatest end presentation timestamp of a buffer queue.
func CMBufferQueueGetMaxPresentationTimeStamp(CMBufferQueue) -> CMTime
Gets the greatest presentation timestamp of a buffer queue.
func CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS() ->
UnsafePointer<CMBufferCallbacks>
Returns a pointer to a structure that contains callbacks to sort sample buffers by output
presentation timestamp.
func CMBufferQueueGetCallbacksForUnsortedSampleBuffers() -> Unsafe
Pointer<CMBufferCallbacks>
Returns a pointer to a callback structure for unsorted sample buffers.
func CMBufferQueueIsEmpty(CMBufferQueue) -> Bool
Returns a Boolean value that indicates whether a buffer queue is empty.
func CMBufferQueueGetBufferCount(CMBufferQueue) -> CMItemCount
Gets the number of buffers in the queue.
func CMBufferQueueGetTotalSize(CMBufferQueue) -> Int
Gets the total size of all sample buffers of a buffer queue.
func CMBufferQueueGetHead(CMBufferQueue) -> CMBuffer?
Retrieves the next buffer from a queue, but doesn’t remove it.
Deprecated
func CMBufferQueueContainsEndOfData(CMBufferQueue) -> Bool
Returns a Boolean value that indicates whether a buffer queue has its end-of-data marker se
func CMBufferQueueIsAtEndOfData(CMBufferQueue) -> Bool
Returns a Boolean value that indicates whether a buffer queue has its end-of-data marker se
and is now empty.
Inspecting a Queue
Validating a Queue


## Page 9

func CMBufferQueueSetValidationHandler(CMBufferQueue, CMBufferValidatio
Handler) -> OSStatus
A validation handler for the queue to call before enqueuing buffers.
typealias CMBufferValidationHandler
A type alias for a handler that tests whether a buffer is in a valid state to add to a queue.
func CMBufferQueueSetValidationCallback(CMBufferQueue, callback:
CMBufferValidationCallback, refcon: UnsafeMutableRawPointer?) ->
OSStatus
A validation callback for the queue to call before enqueuing buffers.
typealias CMBufferValidationCallback
A type alias for a callback that tests whether a buffer is in a valid state to add to a queue.
func CMBufferQueueGetTypeID() -> CFTypeID
Returns the type identifier of buffer queue objects.
class CMBufferQueue
A reference to a buffer queue instance.
Buffer Queue Error Codes
Error codes that framework operations produce.
CMSimpleQueue
A simple, lockless FIFO queue of elements.
CMMemoryPool
Accessing the Type Identifier
Data Types
Error Codes
See Also
Queues


## Page 10

An object that optimizes memory allocation when working with large blocks of memory.


## Page 11

An instance of CMMemoryPool is a memory allocation service that holds a pool of recently
deallocated memory. Its purpose is to speed up subsequent allocations of the same size. Use this
API in cases where you need to repeatedly allocate large blocks of memory, such as a video
encoding app that outputs compressed data.
This object allocates memory by page. It doesn’t suballocate memory within pages, so don’t use 
to allocate small blocks. For example, when calling the CMBlockBufferCreateWithMemory
Block(allocator:memoryBlock:blockLength:blockAllocator:customBlock
Source:offsetToData:dataLength:flags:blockBufferOut:) function, you can use it
as the blockAllocator argument, but not as the structureAllocator argument (use k
CFAllocatorDefault instead).
When you no longer need to allocate memory from the pool, invalidate it by calling the CMMemory
PoolInvalidate(_:) function, which tells the pool to stop holding memory for reuse.
Note
A pool’s CFAllocator can outlive the pool itself. After you invalidate a memory pool, its
CFAllocator instance allocates and deallocates with no pooling behavior.
A memory pool deallocates memory if it isn’t reused in 0.5 seconds, so that short-term peak
usage doesn’t cause persistent bloat. You can override this period by specifying a value for k
CMMemoryPoolOption_AgeOutPeriod. The system does this “aging out” during the pool’s
CFAllocatorAllocate(_:_:_:) and CFAllocatorDeallocate(_:_:) calls.
Overview
Core Media / CMMemoryPool
API Collection
CMMemoryPool
An object that optimizes memory allocation when working with large blocks of
memory.


## Page 12

func CMMemoryPoolCreate(options: CFDictionary?) -> CMMemoryPool
Creates a memory pool.
func CMMemoryPoolGetAllocator(CMMemoryPool) -> CFAllocator
Returns the allocator for the memory pool.
func CMMemoryPoolFlush(CMMemoryPool)
Deallocates all memory the pool holds.
func CMMemoryPoolInvalidate(CMMemoryPool)
Invalidates the memory pool, which causes its allocator to stop recycling memory.
func CMMemoryPoolGetTypeID() -> CFTypeID
Returns the type identifier of memory pool objects.
class CMMemoryPool
An instance that optimizes memory allocation when working with large blocks of memory.
var kCMMemoryPoolError_AllocationFailed: OSStatus
An error that indicates the system failed to allocate an internal data structure.
var kCMMemoryPoolError_InvalidParameter: OSStatus
An error that indicates you called an API with an invalid parameter.
Topics
Creating a Memory Pool
Managing a Memory Pool
Accessing the Type Identifier
Data Types
Errors


## Page 13

CMSimpleQueue
A simple, lockless FIFO queue of elements.
CMBufferQueue
A queue of timed buffers.
See Also
Queues


