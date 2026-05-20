# 002_BE_KEVENT_NO_FLAGS.pdf

## Page 1

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


## Page 2

Indicates that a request to receive kernel events needs to return without waiting for events.


