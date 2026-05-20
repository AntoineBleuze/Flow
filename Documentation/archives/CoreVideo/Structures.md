# Structures.pdf

## Page 1

init?(rawValue: CVReturn)
Creates CVError with the given error code. Returns nil if rawValue is kCVReturnSucces
var errorDescription: String?
Localized messages describing the error.
static let allocationFailed: CVError
The allocation for a buffer or buffer pool failed. Most likely because of lack of resources.
static let internalError: CVError
Error with an undetermined cause.
Topics
Initializers
Instance Properties
Type Properties
Core Video / CVError
Structure
CVError
CVError wraps CVReturn values to present them as Swift Error values. This typ
is used for all errors thrown in the CoreVideo framework. All CVReturn values are
provided as static constants.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

static let invalidArgument: CVError
At least one of the arguments passed in is not valid. Either out of range or the wrong type.
static let invalidPixelBufferAttributes: CVError
A CVBuffer cannot be created with the given attributes.
static let invalidPixelFormat: CVError
The requested pixel format is not supported for the CVBuffer type.
static let invalidPoolAttributes: CVError
A CVBufferPool cannot be created with the given attributes.
static let invalidSize: CVError
The requested size (most likely too big) is not supported for the CVBuffer type.
static let pixelBufferNotMetalCompatible: CVError
The Buffer cannot be used with Metal as either its size, pixel format or attributes are not
supported by Metal.
static let poolAllocationFailed: CVError
The allocation for the buffer pool failed. Most likely because of lack of resources. Check if
your parameters are in range.
static let retry: CVError
A scan hasn’t completely traversed the CVBufferPool due to a concurrent operation. The
client can retry the scan.
static let unsupported: CVError
This operation is unsupported on this data type.
static let wouldExceedAllocationThreshold: CVError
The allocation request failed because it would have exceeded a specified allocation threshol
(see kCVPixelBufferPoolAllocationThresholdKey).
static func check(CVReturn) throws(CVError)
Throws an instance of CVError if status is not kCVReturnSuccess
Type Methods
Relationships


## Page 3

BitwiseCopyable
Copyable
CustomStringConvertible
Equatable
Error
Hashable
RawRepresentable
Sendable
SendableMetatype
Conforms To


## Page 4

This should be used when the sizes must be specified as exact integer width & height. Otherwise
prefer CGSize as it is more widely used.
init(CGSize, rounded: FloatingPointRoundingRule)
Convert CGSize to CVImageSize using the given rounding rule.
init(width: Int, height: Int)
Create an instance with given width and height
var height: Int
Image height in pixels
var width: Int
Overview
Topics
Initializers
Instance Properties
Core Video / CVImageSize
Structure
CVImageSize
Size of image buffer expressed as pixel count.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 5

Image width in pixels
static let zero: CVImageSize
Size with zero width and height
Equatable
Hashable
Sendable
SendableMetatype
Type Properties
Relationships
Conforms To


## Page 6

class Pool
Manage and recycle pixel buffer backings.
init(CVPixelBufferCreationAttributes) throws
Creates a CVPixelBuffer with given attributes. It allocates the necessary memory based on th
dimensions, pixel format and extended pixels described in the CVPixel
Buffer/Attributes.
init(unsafeBacking: IOSurface, matching: CVPixelBufferCreationAttribute
) throws
Creates a CVPixelBuffer backed by the given ioSurface. The CVPixelBuffer will retain the i
Surface. IMPORTANT If you are using IOSurface to share CVPixelBuffers between
processes and those CVPixelBuffers are allocated via a CVPixelBufferPool, it is important tha
the CVPixelBufferPool does not reuse CVPixelBuffers whose IOSurfaces are still in use in oth
processes. CoreVideo and IOSurface will take care of this for if you use
Topics
Classes
Initializers
Core Video / CVMutablePixelBuffer
Structure
CVMutablePixelBuffer
CVMutablePixelBuffer provides read-write access to the pixel data and
attachments.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 7

IOSurfaceCreateMachPort and IOSurfaceLookupFromMachPort, but NOT if you pass
IOSurfaceIDs.
init(unsafeBuffer: sending CVPixelBuffer)
Initialize a mutable pixel buffer by transferring existing CVPixelBuffer value.
func accessUnsafeMutableRawPlaneBytes<R>(([(properties: CVPixelBuffer
PlaneProperties, bytes: UnsafeMutableRawBufferPointer)]) throws ->
sending R) rethrows -> sending R
Access the pixels in the planes contained within this buffer. The base address is locked for
writing during the execution of the block.
func fillExtendedPixels() -> Bool
Fills the extended pixels of the pixel buffer. This method replicates the edge pixels to fill the
entire extended region of the image.
func withUnsafeBuffer<R>((CVPixelBuffer) throws -> sending R) rethrows 
> sending R
CVBufferRepresentable
CVImageBufferRepresentable
CVPixelBufferRepresentable
Sendable
SendableMetatype
Instance Methods
Relationships
Conforms To


## Page 8

init(CVPixelBufferCreationAttributes)
Convert CreationAttributes to Attributes
init?(merging: [CVPixelBufferAttributes])
Resolve multiple attribute specifications into a single instance.
init(pixelFormatTypes: [CVPixelFormatType]?, size: CVImageSize?,
compatibility: CVPixelFormatDescription.Compatibility, bytesPerRow
Alignment: Int?, planeAlignment: Int?, extendedPixels: CVPixelBuffer
Padding?)
init(rawAttributes: [String : any Sendable])
Create an instance using a freeform attribute dictionary
Topics
Initializers
Instance Properties
Core Video / CVPixelBufferAttributes
Structure
CVPixelBufferAttributes
A partial set of pixel buffer creation attributes. This struct is useful for conveying
partial requirements for pixel buffers to clients. This struct makes all properties of
CVPixelBuffer/CreationAttributes optional.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 9

var pixelFormatTypes: [CVPixelFormatType]?
Allow multiple pixel formats to be specified in attributes
var rawAttributes: [String : any Sendable]
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, Int?>) -> Int?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelFormatDescription?>) -> CVPixelFormatDescription?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelBufferPadding?>) -> CVPixelBufferPadding?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelFormatDescription.Compatibility>) -> CVPixelFormat
Description.Compatibility
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelFormatType>) -> CVPixelFormatType?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, Bool>) -> Bool?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVImageSize>) -> CVImageSize?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelBufferCreationAttributes.Backing>) -> CVPixelBuffer
CreationAttributes.Backing
Sendable, SendableMetatype
Subscripts
Relationships
Conforms To


## Page 10

init?(CVPixelBufferAttributes)
Convert Attributes to CreationAttributes. This init will fail if pixelFormatType or size
properties are absent.
init(pixelFormatType: CVPixelFormatType, size: CVImageSize,
compatibility: CVPixelFormatDescription.Compatibility, bytesPerRow
Alignment: Int?, planeAlignment: Int?, extendedPixels: CVPixelBuffer
Padding?)
var backing: CVPixelBufferCreationAttributes.Backing
Defines how the memory for the pixel buffer backing is allocated. IOSurface backed pixel
buffers can be shared between CPU and GPU also across process boundaries. Defaults to
Backing.ioSurface.
var bytesPerRowAlignment: Int?
The number of bytes per row in the pixel buffer must be a multiple of this number.
var compatibility: CVPixelFormatDescription.Compatibility
Topics
Initializers
Instance Properties
Core Video / CVPixelBufferCreationAttributes
Structure
CVPixelBufferCreationAttributes
Attributes needed for creating a pixel buffer.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 11

Defines interoperability of pixel buffers with other frameworks
var extendedPixels: CVPixelBufferPadding?
Sets the amount of extended pixel padding in the pixel buffer.
var pixelFormatType: CVPixelFormatType
Format of the pixel buffer bytes
var planeAlignment: Int?
Planes start on a byte number that’s a multiple of this value.
var size: CVImageSize
Size of the buffer in pixels
enum Backing
Type of backing storage used by the pixel buffer
Equatable, Sendable, SendableMetatype
Enumerations
Relationships
Conforms To


## Page 12

init(left: Int, right: Int, top: Int, bottom: Int)
var bottom: Int
Pixel row padding at the bottom
var left: Int
Pixel column padding to the left
var right: Int
Pixel column padding to the right
var top: Int
Pixel row padding at the top
Topics
Initializers
Instance Properties
Type Properties
Core Video / CVPixelBufferPadding
Structure
CVPixelBufferPadding
Padding pixels around the CVPixelBuffer
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 13

static let zero: CVPixelBufferPadding
BitwiseCopyable
Copyable
Equatable
Hashable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 14

init(size: CVImageSize, bytesPerRow: Int)
var bytesPerRow: Int
Number of bytes in each row of the plane. Note that this may be greater than the bytes
required for all pixels in the row.
var size: CVImageSize
Size of the plane in pixels
Equatable
Topics
Initializers
Instance Properties
Relationships
Conforms To
Core Video / CVPixelBufferPlaneProperties
Structure
CVPixelBufferPlaneProperties
Properties of a plane of pixels in pixel buffer
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 15

Hashable
Sendable
SendableMetatype


## Page 16

The Core Video pixel format description API defines functions and types for defining custom pixe
formats. You should only use pixel format descriptions if you need to define a custom pixel format
func CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocator?,
OSType) -> CFDictionary?
Creates a pixel format description from a given OSType identifier.
func CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(
CFDictionary, OSType)
Registers a pixel format description with Core Video.
func CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes(
CFAllocator?) -> CFArray?
Returns all the pixel format descriptions known to Core Video.
Overview
Topics
Creating Format Descriptions
Retrieving Format Descriptions
Data Types
Core Video / CVPixelFormatDescription
API Collection
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.


## Page 17

struct CVFillExtendedPixelsCallBackData
A structure for holding information that describes a custom extended pixel fill algorithm.
typealias CVFillExtendedPixelsCallBack
Defines a pointer to a custom extended pixel-fill function, which is called whenever the syste
needs to pad a buffer holding your custom pixel format.
Pixel Format Description Keys
The attributes of a pixel format.
Pixel Format Identifiers
Core Video does not provide support for all of these formats; this list defines only their name
CVBuffer
An abstract base class that defines how to interact with data buffers.
CVImageBuffer
An interface for managing different types of image data.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
Callbacks
Constants
See Also
Data Processing


## Page 18

var isCompressionAvailable: Bool
True if any of the planes of this format are compressed and hardware support is available.
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Topics
Instance Properties
Relationships
Conforms To
Core Video / CVPixelFormatType
Structure
CVPixelFormatType
Identifier for a pixel format type
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


