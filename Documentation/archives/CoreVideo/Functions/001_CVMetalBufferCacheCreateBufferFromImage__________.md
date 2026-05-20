# 001_CVMetalBufferCacheCreateBufferFromImage__________.pdf

## Page 1

allocator
The CFAllocatorRef to use for allocating the CVMetalBuffer object. May be NULL.
bufferCache
The buffer cache object that will manage the buffer.
bufferOut
The newly created buffer object will be placed here.
Returns kCVReturnSuccess on success
Creates a CVMetalBuffer object from an existing CVImageBuffer
Parameters
Return Value
Discussion
Core Video / CVMetalBufferCacheCreateBufferFromImage(_:_:_:_:)
Function
CVMetalBufferCacheCreateBufferFrom
Image(_:_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 2

Creates or returns a cached CVMetalBuffer object mapped to the CVImageBuffer. This creates a
live binding between the CVImageBuffer and underlying CVMetalBuffer buffer object.


