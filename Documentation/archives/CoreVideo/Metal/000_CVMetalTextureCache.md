# 000_CVMetalTextureCache.pdf

## Page 1

A Core Video Metal texture cache creates and manages CVMetalTexture textures. You use a
CVMetalTextureCache object to directly read from or write to GPU-based Core Video image buffe
in rendering, or for sharing data with Metal kernels. For example, you can use a Metal texture cach
to present live output from a device’s camera in a 3D scene rendered with Metal.
func CVMetalTextureCacheCreate(CFAllocator?, CFDictionary?, any
MTLDevice, CFDictionary?, UnsafeMutablePointer<CVMetalTextureCache?>) -
CVReturn
Creates a new texture cache.
func CVMetalTextureCacheCreateTextureFromImage(CFAllocator?, CVMetal
TextureCache, CVImageBuffer, CFDictionary?, MTLPixelFormat, Int, Int,
Int, UnsafeMutablePointer<CVMetalTexture?>) -> CVReturn
Creates a Core Video Metal texture buffer from an existing image buffer.
func CVMetalTextureCacheFlush(CVMetalTextureCache, CVOptionFlags)
Manually flushes the contents of the provided texture cache.
func CVMetalTextureCacheGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier for a Core Video Metal texture cache.
Overview
Topics
Functions
Core Video / CVMetalTextureCache
API Collection
CVMetalTextureCache
A cache used to create and manage Metal texture objects.


## Page 2

class CVMetalTextureCache
A reference to a Core Video Metal texture cache.
Cache Attributes
Attributes specifying texture cache behavior, used with the CVMetalTextureCache
Create(_:_:_:_:_:) function.
Setting up a command structure
Discover how Metal executes commands on a GPU.
CVMetalTexture
A texture-based image buffer that supplies source image data for use with the Metal
framework.
Data Types
Constants
Related Documentation
See Also
Metal


