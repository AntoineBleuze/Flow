# 001_IOSurface Constants.pdf

## Page 1

let kIOSurfaceAllocSize: CFString
CFNumber of the total allocation size of the buffer including all planes.
let kIOSurfaceBytesPerElement: CFString
The total number of bytes in an element.
let kIOSurfaceBytesPerRow: CFString
The bytes per row of the buffer.
let kIOSurfaceCacheMode: CFString
The CPU cache mode to be used for the allocation.
let kIOSurfaceColorSpace: CFString
let kIOSurfaceElementHeight: CFString
CFNumber for how many pixels high each element is.
let kIOSurfaceElementWidth: CFString
CFNumber for how many pixels wide each element is.
let kIOSurfaceHeight: CFString
The height of the IOSurface buffer in pixels.
let kIOSurfaceICCProfile: CFString
let kIOSurfaceIsGlobal: CFString
CFBoolean If true, the IOSurface may be looked up by any task in the system by its ID.
Topics
Constants
IOSurface / IOSurface Constants
API Collection
IOSurface Constants


## Page 2

Deprecated
let kIOSurfaceName: CFString
let kIOSurfaceOffset: CFString
The starting offset into the buffer.
let kIOSurfacePixelFormat: CFString
A 32-bit unsigned integer that stores the traditional macOS buffer format.
let kIOSurfacePixelSizeCastingAllowed: CFString
let kIOSurfacePlaneBase: CFString
The base offset into the buffer for this plane.
let kIOSurfacePlaneBitsPerElement: CFString
let kIOSurfacePlaneBytesPerElement: CFString
The bytes per element of this plane.
let kIOSurfacePlaneBytesPerRow: CFString
The bytes per row of this plane.
let kIOSurfacePlaneComponentBitDepths: CFString
let kIOSurfacePlaneComponentBitOffsets: CFString
let kIOSurfacePlaneComponentNames: CFString
let kIOSurfacePlaneComponentRanges: CFString
let kIOSurfacePlaneComponentTypes: CFString
let kIOSurfacePlaneElementHeight: CFString
The element height of this plane.
let kIOSurfacePlaneElementWidth: CFString
The element width of this plane.
let kIOSurfacePlaneHeight: CFString
The height of this plane in pixels.
let kIOSurfacePlaneInfo: CFString
CFArray describing each image plane in the buffer as a CFDictionary.
let kIOSurfacePlaneOffset: CFString
The offset into the buffer for this plane.


## Page 3

let kIOSurfacePlaneSize: CFString
The total data size of this plane.
let kIOSurfacePlaneWidth: CFString
The width of this plane in pixels.
let kIOSurfaceSubsampling: CFString
var kIOSurfaceSuccess: Int32
let kIOSurfaceWidth: CFString
The width of the IOSurface buffer in pixels.
IOSurface Structures
IOSurface Functions
See Also
Reference


