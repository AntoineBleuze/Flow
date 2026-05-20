# Kernel events.pdf

## Page 1

kq
A file descriptor that identifies a kernel queue.
changelist
An array of changes to make to the kernel queue.
nchanges
The number of items in the changelist array.
eventlist
An array of kernel events that this function fills on return, if any matching events are on the
queue.
nevents
The number of items in the eventlist array.
Parameters
BrowserEngineCore / be_kevent(_:_:_:_:_:_:)
Function
be_kevent(_:_:_:_:_:_:)
Registers for kernel events on the specified queue, and returns events that are
pending on the queue, using 32-bit data types.
iOS 18.4+
iPadOS 18.4+


## Page 2

be_flags
Configuration flags that control how be_kevent waits for kernel events.
The number of events or errors that the function places in eventlist, up to nevents. If an erro
occurs and there isn’t space in eventlist to write the error, be_kevent returns -1 and sets
errno to indicate the error.
Important
To use 64-bit data types, call be_kevent64.
Call kqueue() to create a kernel queue file descriptor that you pass to this function in the kq
parameter. kqueue() returns a file descriptor on success; otherwise, it returns -1 and sets errn
to indicate the error.
Use the EV_SET macro to fill out struct kevent structures with information about the events
you want to receive, and store these structures in the changelist array.
If be_kevent encounters an error when there are fewer than nevents events written to the
eventlist array, it adds an event that has the EV_ERROR flag set in its flags field, and the err
information in its data field. The be_kevent function only returns -1 if it encounters an error th
there isn’t space for it to record in eventlist.
You can poll for events on kq by passing BE_KEVENT_RETURN_IMMEDIATELY in the be_flags
argument. Otherwise, be_kevent64 waits until nevents matching events occur on the queue.
func be_kevent64(Int32, UnsafePointer<kevent64_s>!, Int32, UnsafeMutabl
Pointer<kevent64_s>!, Int32, UInt32) -> Int32
Registers for kernel events on the specified queue, and returns events that are pending on th
queue, using 64-bit data types.
var BE_KEVENT_NO_FLAGS: Int32
Return Value
Discussion
See Also
Kernel events


## Page 3

Indicates that no flags are set in a request to receive kernel events.
var BE_KEVENT_RETURN_IMMEDIATELY: Int32
Indicates that a request to receive kernel events needs to return without waiting for events.


## Page 4

kq
A file descriptor that identifies a kernel queue.
changelist
An array of changes to make to the kernel queue.
nchanges
The number of items in the changelist array.
eventlist
An array of kernel events that this function fills on return, if any matching events are on the
queue.
nevents
The number of items in the eventlist array.
Parameters
BrowserEngineCore / be_kevent64(_:_:_:_:_:_:)
Function
be_kevent64(_:_:_:_:_:_:)
Registers for kernel events on the specified queue, and returns events that are
pending on the queue, using 64-bit data types.
iOS 18.4+
iPadOS 18.4+


## Page 5

flags
Configuration flags that control how be_kevent64 waits for kernel events.
The number of events or errors that the function places in eventlist, up to nevents. If an erro
occurs and there isn’t space in eventlist to write the error, be_kevent returns -1 and sets
errno to indicate the error.
Important
To use 32-bit data types, call be_kevent.
Call kqueue() to create a kernel queue file descriptor that you pass to this function in the kq
parameter. kqueue() returns a file descriptor on success; otherwise, it returns -1 and sets errn
to indicate the error.
Use the EV_SET64 macro to fill out struct kevent64_s structures with information about the
events you want to receive, that you store in the changelist array.
If be_kevent64 encounters an error when there are fewer than nevents events written to the
eventlist array, it adds an event that has the EV_ERROR flag set in its flags field, and the err
information in its data field. The be_kevent64 function only returns -1 if it encounters an error
that there isn’t space for it to record in eventlist.
You can poll for events on kq by passing BE_KEVENT_RETURN_IMMEDIATELY in the be_flags
argument. Otherwise, be_kevent64 waits until nevents matching events occur on the queue.
func be_kevent(Int32, UnsafePointer<kevent>!, Int32, UnsafeMutable
Pointer<kevent>!, Int32, UInt32) -> Int32
Registers for kernel events on the specified queue, and returns events that are pending on th
queue, using 32-bit data types.
var BE_KEVENT_NO_FLAGS: Int32
Return Value
Discussion
See Also
Kernel events


## Page 6

Indicates that no flags are set in a request to receive kernel events.
var BE_KEVENT_RETURN_IMMEDIATELY: Int32
Indicates that a request to receive kernel events needs to return without waiting for events.


## Page 7

Use this constant in the be_flags parameter of be_kevent(_:_:_:_:_:_:), or the flags
parameter of be_kevent64(_:_:_:_:_:_:).
func be_kevent(Int32, UnsafePointer<kevent>!, Int32, UnsafeMutable
Pointer<kevent>!, Int32, UInt32) -> Int32
Registers for kernel events on the specified queue, and returns events that are pending on th
queue, using 32-bit data types.
func be_kevent64(Int32, UnsafePointer<kevent64_s>!, Int32, UnsafeMutabl
Pointer<kevent64_s>!, Int32, UInt32) -> Int32
Registers for kernel events on the specified queue, and returns events that are pending on th
queue, using 64-bit data types.
var BE_KEVENT_RETURN_IMMEDIATELY: Int32
Discussion
See Also
Kernel events
BrowserEngineCore / BE_KEVENT_NO_FLAGS
Global Variable
BE_KEVENT_NO_FLAGS
Indicates that no flags are set in a request to receive kernel events.
iOS 17.4+
iPadOS 17.4+


## Page 8

Indicates that a request to receive kernel events needs to return without waiting for events.


## Page 9

Use this constant in the be_flags parameter of be_kevent(_:_:_:_:_:_:), or the flags
parameter of be_kevent64(_:_:_:_:_:_:), to poll for kernel events.
func be_kevent(Int32, UnsafePointer<kevent>!, Int32, UnsafeMutable
Pointer<kevent>!, Int32, UInt32) -> Int32
Registers for kernel events on the specified queue, and returns events that are pending on th
queue, using 32-bit data types.
func be_kevent64(Int32, UnsafePointer<kevent64_s>!, Int32, UnsafeMutabl
Pointer<kevent64_s>!, Int32, UInt32) -> Int32
Registers for kernel events on the specified queue, and returns events that are pending on th
queue, using 64-bit data types.
var BE_KEVENT_NO_FLAGS: Int32
Overview
See Also
Kernel events
BrowserEngineCore / BE_KEVENT_RETURN_IMMEDIATELY
Global Variable
BE_KEVENT_RETURN_IMMEDIATELY
Indicates that a request to receive kernel events needs to return without waiting fo
events.
iOS 17.4+
iPadOS 17.4+


## Page 10

Indicates that no flags are set in a request to receive kernel events.


