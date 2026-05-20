# Reference.pdf

## Page 1

struct IOSurfaceMemoryLedgerFlags
class IOSurfaceRef
Data type representing an IOSurface opaque object.
IOSurface Constants
IOSurface Functions
Topics
Structures
See Also
Reference
IOSurface / IOSurface Structures
API Collection
IOSurface Structures


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

func IOSurfaceAlignProperty(CFString, Int) -> Int
Returns the smallest aligned value greater than or equal to the specified value.
func IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef) -> Bool
func IOSurfaceCopyAllValues(IOSurfaceRef) -> CFDictionary?
func IOSurfaceCopyValue(IOSurfaceRef, CFString) -> CFTypeRef?
Retrieves a value from the dictionary associated with the buffer.
func IOSurfaceCreate(CFDictionary) -> IOSurfaceRef?
Creates a brand new IOSurface object
func IOSurfaceCreateMachPort(IOSurfaceRef) -> mach_port_t
Returns a mach_port_t that holds a reference to the IOSurface.
func IOSurfaceCreateXPCObject(IOSurfaceRef) -> xpc_object_t
Returns an xpc_object_t that holds a reference to the IOSurface.
func IOSurfaceDecrementUseCount(IOSurfaceRef)
Decrements the per-process usage count for an IOSurface.
func IOSurfaceGetAllocSize(IOSurfaceRef) -> Int
Returns the total allocation size of the buffer including all planes.
func IOSurfaceGetBaseAddress(IOSurfaceRef) -> UnsafeMutableRawPointer
Returns the address of the first byte of data in a particular buffer.
Topics
Functions
IOSurface / IOSurface Functions
API Collection
IOSurface Functions


## Page 6

func IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef, Int) -> UnsafeMutable
RawPointer
Returns the address of the first byte of data in the specified plane.
func IOSurfaceGetBitDepthOfComponentOfPlane(IOSurfaceRef, Int, Int) ->
Int
func IOSurfaceGetBitOffsetOfComponentOfPlane(IOSurfaceRef, Int, Int) ->
Int
func IOSurfaceGetBytesPerElement(IOSurfaceRef) -> Int
Returns the length (in bytes) of each element in a particular buffer.
func IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef, Int) -> Int
Returns the size of each element (in bytes) in the specified plane.
func IOSurfaceGetBytesPerRow(IOSurfaceRef) -> Int
Returns the length (in bytes) of each row in a particular buffer.
func IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef, Int) -> Int
Returns the size of each row (in bytes) in the specified plane.
func IOSurfaceGetElementHeight(IOSurfaceRef) -> Int
Returns the height (in pixels) of each element in a particular buffer.
func IOSurfaceGetElementHeightOfPlane(IOSurfaceRef, Int) -> Int
Returns the height (in pixels) of each element in the specified plane.
func IOSurfaceGetElementWidth(IOSurfaceRef) -> Int
Returns the width (in pixels) of each element in a particular buffer.
func IOSurfaceGetElementWidthOfPlane(IOSurfaceRef, Int) -> Int
Returns the width (in pixels) of each element in the specified plane.
func IOSurfaceGetHeight(IOSurfaceRef) -> Int
Returns the height of the IOSurface buffer in pixels.
func IOSurfaceGetHeightOfPlane(IOSurfaceRef, Int) -> Int
Returns the height of the specified plane (in pixels).
func IOSurfaceGetID(IOSurfaceRef) -> IOSurfaceID
Retrieves the unique IOSurfaceID value for an IOSurface.
func IOSurfaceGetNameOfComponentOfPlane(IOSurfaceRef, Int, Int) ->
IOSurfaceComponentName


## Page 7

func IOSurfaceGetNumberOfComponentsOfPlane(IOSurfaceRef, Int) -> Int
func IOSurfaceGetPixelFormat(IOSurfaceRef) -> OSType
Returns an unsigned integer that contains the traditional macOS buffer format.
func IOSurfaceGetPlaneCount(IOSurfaceRef) -> Int
func IOSurfaceGetPropertyAlignment(CFString) -> Int
Returns the alignment requirements for a property (if any).
func IOSurfaceGetPropertyMaximum(CFString) -> Int
Returns the maximum value for a given property that is guaranteed to be compatible with all
the current devices (GPUs, etc.) in the system.
func IOSurfaceGetRangeOfComponentOfPlane(IOSurfaceRef, Int, Int) ->
IOSurfaceComponentRange
func IOSurfaceGetSeed(IOSurfaceRef) -> UInt32
func IOSurfaceGetSubsampling(IOSurfaceRef) -> IOSurfaceSubsampling
func IOSurfaceGetTypeID() -> CFTypeID
func IOSurfaceGetTypeOfComponentOfPlane(IOSurfaceRef, Int, Int) ->
IOSurfaceComponentType
func IOSurfaceGetUseCount(IOSurfaceRef) -> Int32
Returns the per-process usage count for an IOSurface.
func IOSurfaceGetWidth(IOSurfaceRef) -> Int
Returns the width of the IOSurface buffer in pixels.
func IOSurfaceGetWidthOfPlane(IOSurfaceRef, Int) -> Int
Returns the width of the specified plane (in pixels).
func IOSurfaceIncrementUseCount(IOSurfaceRef)
Increments the per-process usage count for an IOSurface.
func IOSurfaceIsInUse(IOSurfaceRef) -> Bool
Returns true of an IOSurface is in use by any process in the system, otherwise false.
func IOSurfaceLock(IOSurfaceRef, IOSurfaceLockOptions, UnsafeMutable
Pointer<UInt32>?) -> kern_return_t
“Lock” an IOSurface for reading or writing.
func IOSurfaceLookup(IOSurfaceID) -> IOSurfaceRef?


## Page 8

Performs an atomic lookup and retain of an IOSurface by its IOSurfaceID.
func IOSurfaceLookupFromMachPort(mach_port_t) -> IOSurfaceRef?
Recreates an IOSurfaceRef from a mach port.
func IOSurfaceLookupFromXPCObject(xpc_object_t) -> IOSurfaceRef?
func IOSurfaceRemoveAllValues(IOSurfaceRef)
func IOSurfaceRemoveValue(IOSurfaceRef, CFString)
Deletes a value in the dictionary associated with the buffer.
func IOSurfaceSetOwnershipIdentity(IOSurfaceRef, task_id_token_t, Int32
UInt32) -> kern_return_t
func IOSurfaceSetPurgeable(IOSurfaceRef, UInt32, UnsafeMutablePointer<
UInt32>?) -> kern_return_t
func IOSurfaceSetValue(IOSurfaceRef, CFString, CFTypeRef)
Sets a value in the dictionary associated with the buffer.
func IOSurfaceSetValues(IOSurfaceRef, CFDictionary)
func IOSurfaceUnlock(IOSurfaceRef, IOSurfaceLockOptions, UnsafeMutable
Pointer<UInt32>?) -> kern_return_t
“Unlock” an IOSurface for reading or writing.
IOSurface Structures
IOSurface Constants
See Also
Reference


