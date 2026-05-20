# Functions.pdf

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


## Page 3

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


## Page 4

Creates or returns a cached CVMetalBuffer object mapped to the CVImageBuffer. This creates a
live binding between the CVImageBuffer and underlying CVMetalBuffer buffer object.


## Page 5

bufferCache
The buffer cache object to flush
options
Currently unused, set to 0.
Performs internal housekeeping/recycling operations
This call must be made periodically to give the buffer cache a chance to do internal housekeeping
operations.
Parameters
Discussion
Core Video / CVMetalBufferCacheFlush(_:_:)
Function
CVMetalBufferCacheFlush(_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 6

Core Video / CVMetalBufferCacheGetTypeID()
Function
CVMetalBufferCacheGetTypeID()
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 7

buffer
Target CVMetalBuffer
Metal buffer
Returns the Metal MTLBuffer object of the CVMetalBufferRef
Parameters
Return Value
Discussion
Core Video / CVMetalBufferGetBuffer(_:)
Function
CVMetalBufferGetBuffer(_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 8

Core Video / CVMetalBufferGetTypeID()
Function
CVMetalBufferGetTypeID()
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 9

pixelBuffer
PixelBuffer to check for compatibility.
attributes
Creation attributes which pixel buffer should have.
Returns true if given pixel buffer is compatible with pixelBufferAttributes dictionary.
Parameters
Discussion
Core Video / CVPixelBufferIsCompatibleWithAttributes(_:_:)
Function
CVPixelBufferIsCompatibleWith
Attributes(_:_:)
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 4.0+
visionOS 1.0+
watchOS 1.0+


## Page 10

pixelFormat
The pixel format to convert
A string with a user displayable conversion of a pixel format.
Creates a string with a formatted representation of a pixel format
Parameters
Return Value
Discussion
Core Video / CVPixelFormatTypeCopyFourCharCodeString(_:)
Function
CVPixelFormatTypeCopyFourCharCode
String(_:)
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


