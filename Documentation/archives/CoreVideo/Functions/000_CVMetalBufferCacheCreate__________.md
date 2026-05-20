# 000_CVMetalBufferCacheCreate__________.pdf

## Page 1

allocator
The CFAllocatorRef to use for allocating the cache. May be NULL.
cacheAttributes
A CFDictionaryRef containing the attributes of the cache itself. May be NULL.
metalDevice
The Metal device for which the buffer objects will be created.
cacheOut
The newly created buffer cache will be placed here
Returns kCVReturnSuccess on success
Parameters
Return Value
Discussion
Core Video / CVMetalBufferCacheCreate(_:_:_:_:)
Function
CVMetalBufferCacheCreate(_:_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 2

Creates a new Buffer Cache.


