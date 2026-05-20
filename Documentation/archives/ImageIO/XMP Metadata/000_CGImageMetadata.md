# 000_CGImageMetadata.pdf

## Page 1

A CGImageMetadata object stores the metadata associated with an image. Create this object
from your image’s associated XMP data, and use it to fetch individual metadata tags. You can
search for specific tags, or enumerate all of the tags present for the image.
func CGImageMetadataCreateFromXMPData(CFData) -> CGImageMetadata?
Creates a collection of metadata tags from the specified XMP data.
func CGImageMetadataCopyTagWithPath(CGImageMetadata, CGImageMetadataTag
?, CFString) -> CGImageMetadataTag?
Searches for a specific metadata tag within a metadata collection.
func CGImageMetadataCopyTags(CGImageMetadata) -> CFArray?
Returns an array of root-level metadata tags from the specified metadata object.
Overview
Topics
Creating an Image Metadata Type
Getting the Metadata Tags
Image I/O / CGImageMetadata
Class
CGImageMetadata
An immutable object that contains the XMP metadata associated with an image.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

func CGImageMetadataCopyTagMatchingImageProperty(CGImageMetadata,
CFString, CFString) -> CGImageMetadataTag?
Searches for the specified image property and, if found, returns the corresponding tag objec
func CGImageMetadataCopyStringValueWithPath(CGImageMetadata, CGImage
MetadataTag?, CFString) -> CFString?
Searches the metadata for the specified tag, and returns its string value if it exists.
func CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadata, CFString?,
CFDictionary?, CGImageMetadataTagBlock)
Enumerates the tags of a metadata object and executes the specified block on each tag.
typealias CGImageMetadataTagBlock
The block to execute when enumerating the tags of a metadata object.
let kCGImageMetadataEnumerateRecursively: CFString
An option to enumerate recursively through a set of metadata tags.
func CGImageMetadataCreateXMPData(CGImageMetadata, CFDictionary?) ->
CFData?
Returns a data object that contains the metadata object’s contents serialized into the XMP
format.
func CGImageMetadataGetTypeID() -> CFTypeID
Returns the type identifier for metadata objects.
CGMutableImageMetadata
Enumerating the Metadata Tags
Generating XMP Data
Getting the Core Foundation Type
Relationships
Inherited By


## Page 3

Equatable, Hashable
class CGMutableImageMetadata
An opaque type for adding or modifying image metadata.
class CGImageMetadataTag
An immutable type that contains information about a single piece of image metadata.
XMP Namespaces and Prefixes
Discover the public namespaces and prefixes that exist in XMP metadata tags.
let kCFErrorDomainCGImageMetadata: CFString
The domain for metadata-related errors that originate in the Image I/O framework.
enum CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.
Conforms To
See Also
XMP Metadata


