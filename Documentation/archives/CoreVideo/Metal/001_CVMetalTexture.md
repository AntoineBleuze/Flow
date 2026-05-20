# 001_CVMetalTexture.pdf

## Page 1

A Core Video Metal Texture is a texture-based image buffer that supplies source image data for u
with the Metal framework.
func CVMetalTextureGetTexture(CVMetalTexture) -> (any MTLTexture)?
Returns the Metal texture object for the image buffer.
func CVMetalTextureGetCleanTexCoords(CVMetalTexture, UnsafeMutable
Pointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float
>, UnsafeMutablePointer<Float>)
Returns convenient normalized texture coordinates for the part of the image that should be
displayed.
func CVMetalTextureIsFlipped(CVMetalTexture) -> Bool
Returns a Boolean value indicating whether the texture image is vertically flipped.
func CVMetalTextureGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier for a CoreVideo Metal texture-based image buffe
Overview
Topics
Inspecting Textures
Data Types
Core Video / CVMetalTexture
API Collection
CVMetalTexture
A texture-based image buffer that supplies source image data for use with the
Metal framework.


## Page 2

typealias CVMetalTexture
A reference to a CoreVideo Metal texture-based image buffer.
CVMetalTextureCache
A cache used to create and manage Metal texture objects.
See Also
Metal


