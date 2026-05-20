# 003_BE_KEVENT_RETURN_IMMEDIATELY.pdf

## Page 1

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


## Page 2

Indicates that no flags are set in a request to receive kernel events.


