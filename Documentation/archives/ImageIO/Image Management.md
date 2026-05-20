# Image Management.pdf

## Page 1

Use a CGImageSource type to read data efficiently for most image file formats. The image sourc
object manages the data buffers needed to load the image data and performs any operations on
that data to turn it into a usable image. For example, it decompresses data stored in a compresse
format. You can also use an image source to fetch or create thumbnail images and access
metadata stored with the image.
Create an image source object from a CFURL, CFData, or CGDataProvider data type. The ima
source object reads data from the specified type and extracts the image information for you.
For more information, see Image I/O Programming Guide.
func CGImageSourceCreateWithURL(CFURL, CFDictionary?) -> CGImageSource?
Creates an image source that reads from a location specified by a URL.
func CGImageSourceCreateWithData(CFData, CFDictionary?) -> CGImageSourc
?
Overview
Topics
Creating an Image Source
Image I/O / CGImageSource
Class
CGImageSource
An opaque type that you use to read image data from a URL, data object, or data
consumer.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

Creates an image source that reads from a Core Foundation data object.
func CGImageSourceCreateWithDataProvider(CGDataProvider, CFDictionary?)
-> CGImageSource?
Creates an image source that reads data from the specified data provider.
func CGImageSourceCreateIncremental(CFDictionary?) -> CGImageSource
Creates an empty image source that you can use to accumulate incremental image data.
func CGImageSourceCreateImageAtIndex(CGImageSource, Int, CFDictionary?)
-> CGImage?
Creates an image object from the data at the specified index in an image source.
func CGImageSourceCreateThumbnailAtIndex(CGImageSource, Int,
CFDictionary?) -> CGImage?
Creates a thumbnail version of the image at the specified index in an image source.
func CGImageSourceGetPrimaryImageIndex(CGImageSource) -> Int
Returns the index of the primary image for an High Efficiency Image File Format (HEIF) image
func CGImageSourceGetTypeID() -> CFTypeID
Returns the unique type identifier of an image source opaque type.
func CGImageSourceGetType(CGImageSource) -> CFString?
Returns the uniform type identifier of the source container.
func CGImageSourceCopyTypeIdentifiers() -> CFArray
Returns an array of uniform type identifiers that are supported for image sources.
func CGImageSourceGetCount(CGImageSource) -> Int
Returns the number of images (not including thumbnails) in the image source.
func CGImageSourceCopyProperties(CGImageSource, CFDictionary?) ->
CFDictionary?
Returns the properties of the image source.
func CGImageSourceCopyPropertiesAtIndex(CGImageSource, Int, CFDictionar
?) -> CFDictionary?
Extracting Images From an Image Source
Getting Information From an Image Source


## Page 3

Returns the properties of the image at a specified location in an image source.
func CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSource, Int,
CFString) -> CFDictionary?
Returns auxiliary data, such as mattes and depth information, that accompany the image.
func CGImageSourceUpdateData(CGImageSource, CFData, Bool)
Updates the data in an incremental image source.
func CGImageSourceUpdateDataProvider(CGImageSource, CGDataProvider, Boo
)
Updates an incremental image source with a new data provider.
func CGImageSourceGetStatus(CGImageSource) -> CGImageSourceStatus
Return the status of an image source.
func CGImageSourceGetStatusAtIndex(CGImageSource, Int) -> CGImageSource
Status
Returns the current status of an image at the specified location in the image source.
enum CGImageSourceStatus
The set of status values for images and image sources.
let kCGImageSourceTypeIdentifierHint: CFString
The uniform type identifier that represents your best guess for the image’s type.
let kCGImageSourceShouldAllowFloat: CFString
A Boolean that indicates whether to use floating-point values in returned images.
let kCGImageSourceShouldCache: CFString
A Boolean value that indicates whether to cache the decoded image.
let kCGImageSourceShouldCacheImmediately: CFString
A Boolean value that indicates whether image decoding and caching happens at image
creation time.
Updating an Incremental Image
Getting the Image Status
Specifying the Read Options


## Page 4

let kCGImageSourceCreateThumbnailFromImageIfAbsent: CFString
A Boolean value that indicates whether to create a thumbnail image automatically if the data
source doesn’t contain one.
let kCGImageSourceCreateThumbnailFromImageAlways: CFString
A Boolean value that indicates whether to always create a thumbnail image.
let kCGImageSourceThumbnailMaxPixelSize: CFString
The maximum width and height of a thumbnail image, specified in pixels.
let kCGImageSourceCreateThumbnailWithTransform: CFString
A Boolean value that indicates whether to rotate and scale the thumbnail image to match the
image’s orientation and aspect ratio.
let kCGImageSourceSubsampleFactor: CFString
The factor by which to scale down any returned images.
Equatable, Hashable
class CGImageDestination
An opaque type that you use to write image data to a URL, data object, or data consumer.
Relationships
Conforms To
See Also
Image Management


## Page 5

A CGImageDestination object provides an abstract interface for saving image data. Use an
image destination to represent a single image, or multiple images packaged together. For example
you might create an image that also contains a thumbnail. You can also use the image destination
to add metadata to your images.
An image destination outputs data to a URL, a CFData object, or a CGDataConsumer object,
which you specify at creation time. After you create the image destination, add the image data an
properties. When you are done, call CGImageDestinationFinalize(_:) to finalize the imag
data and write it to the output location.
For more information, see Image I/O Programming Guide.
func CGImageDestinationCreateWithURL(CFURL, CFString, Int, CFDictionary
?) -> CGImageDestination?
Creates an image destination that writes image data to the specified URL.
Overview
Topics
Creating an Image Destination
Image I/O / CGImageDestination
Class
CGImageDestination
An opaque type that you use to write image data to a URL, data object, or data
consumer.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 6

func CGImageDestinationCreateWithData(CFMutableData, CFString, Int,
CFDictionary?) -> CGImageDestination?
Creates an image destination that writes to a Core Foundation mutable data object.
func CGImageDestinationCreateWithDataConsumer(CGDataConsumer, CFString,
Int, CFDictionary?) -> CGImageDestination?
Creates an image destination that writes to the specified data consumer.
func CGImageDestinationAddImage(CGImageDestination, CGImage,
CFDictionary?)
Adds an image to an image destination.
func CGImageDestinationAddImageFromSource(CGImageDestination, CGImage
Source, Int, CFDictionary?)
Adds an image from an image source to an image destination.
func CGImageDestinationSetProperties(CGImageDestination, CFDictionary?)
Applies one or more properties to all images in an image destination.
func CGImageDestinationAddAuxiliaryDataInfo(CGImageDestination, CFStrin
, CFDictionary)
Sets the auxiliary data, such as mattes and depth information, that accompany the image.
func CGImageDestinationFinalize(CGImageDestination) -> Bool
Writes image data and properties to the data, URL, or data consumer associated with the
image destination.
func CGImageDestinationCopyTypeIdentifiers() -> CFArray
Returns an array of the uniform type identifiers that are supported for image destinations.
func CGImageDestinationGetTypeID() -> CFTypeID
Returns the unique type identifier of an image destination opaque type.
Adding Images to the Destination
Adding Metadata to the Image
Finalizing the Image Data
Getting the Image Types


## Page 7

let kCGImageDestinationLossyCompressionQuality: CFString
The desired compression quality to use when writing the image data.
let kCGImageDestinationBackgroundColor: CFString
The background color to use when the image has an alpha component, but the destination
format doesn’t support alpha.
let kCGImageDestinationDateTime: CFString
The date and time information to associate with the image.
let kCGImageDestinationEmbedThumbnail: CFString
A Boolean value that indicates whether to embed a thumbnail for JPEG and HEIF images.
let kCGImageDestinationImageMaxPixelSize: CFString
The maximum width and height of the image, in pixels.
let kCGImageDestinationMetadata: CFString
The metadata tags to include with the image.
let kCGImageDestinationMergeMetadata: CFString
A Boolean value that indicates whether to merge new metadata with the image’s existing
metadata.
let kCGImageDestinationOptimizeColorForSharing: CFString
A Boolean value that indicates whether to create the image using a colorspace.
let kCGImageDestinationOrientation: CFString
The orientation of the image, specified as an EXIF value in the range 1 to 8.
let kCGImageDestinationPreserveGainMap: CFString
A Boolean value that indicates whether to include a HEIF-embedded gain map in the image
data.
let kCGImageMetadataShouldExcludeGPS: CFString
A Boolean value that indicates whether to exclude GPS metadata from EXIF data or the
corresponding XMP tags.
let kCGImageMetadataShouldExcludeXMP: CFString
A Boolean value that indicates whether to exclude XMP data from the destination.
Configuring the Image Behaviors


## Page 8

Equatable, Hashable
class CGImageSource
An opaque type that you use to read image data from a URL, data object, or data consumer.
Relationships
Conforms To
See Also
Image Management


