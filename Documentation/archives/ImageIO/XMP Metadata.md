# XMP Metadata.pdf

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


## Page 4

Create a CGMutableImageMetadata opaque type when you want to modify the metadata in an
image. You may pass this type to any functions that take a CGImageMetadata type as a
parameter. This object stores the tag information as XMP data, which you can write back to the
image.
When you access or modify EXIF or IPTC properties, the metadata functions automatically bridge
those properties to appropriate XMP properties. This bridging behavior fills in any fields that are
present only in the XMP data. For example, it fills in the namespace, prefix, and XMP type
information in the corresponding CGImageMetadataTag object.
func CGImageMetadataCreateMutable() -> CGMutableImageMetadata
Creates an empty, mutable image metdata opaque type.
func CGImageMetadataCreateMutableCopy(CGImageMetadata) -> CGMutableImag
Metadata?
Creates a deep, mutable copy of the specified metadata information.
Discussion
Topics
Creating a Mutable Metadata Type
Image I/O / CGMutableImageMetadata
Class
CGMutableImageMetadata
An opaque type for adding or modifying image metadata.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 5

func CGImageMetadataSetValueWithPath(CGMutableImageMetadata, CGImage
MetadataTag?, CFString, CFTypeRef) -> Bool
Update the value of an existing metadata tag, or create a new tag using the specified
information.
func CGImageMetadataSetValueMatchingImageProperty(CGMutableImageMetadat
, CFString, CFString, CFTypeRef) -> Bool
Updates the value of the metadata tag assigned to the specified image property.
func CGImageMetadataSetTagWithPath(CGMutableImageMetadata, CGImage
MetadataTag?, CFString, CGImageMetadataTag) -> Bool
Sets the tag at the specified path in the metadata object.
func CGImageMetadataRemoveTagWithPath(CGMutableImageMetadata, CGImage
MetadataTag?, CFString) -> Bool
Removes the tag at the specified path from the metadata object.
func CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadata,
CFString, CFString, UnsafeMutablePointer<Unmanaged<CFError>?>?) -> Bool
Registers the specified namespace and prefix with the metadata object.
CGImageMetadata
Equatable, Hashable
Setting the Values of Tags
Registering a Custom Namespace
Relationships
Inherits From
Conforms To


## Page 6

class CGImageMetadata
An immutable object that contains the XMP metadata associated with an image.
class CGImageMetadataTag
An immutable type that contains information about a single piece of image metadata.
XMP Namespaces and Prefixes
Discover the public namespaces and prefixes that exist in XMP metadata tags.
let kCFErrorDomainCGImageMetadata: CFString
The domain for metadata-related errors that originate in the Image I/O framework.
enum CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.
See Also
XMP Metadata


## Page 7

Each CGImageMetadataTag opaque type contains a single EXIF, IPTC, or XMP property. The
namespace, prefix, name, type, and value of the tag identify different portions of the tag’s conten
For example, the namespace specifies whether the tag is part of the EXIF metadata or a different
set of metadata.
You retrieve existing metadata tags from an CGImageMetadata opaque type. You may also crea
new tags and add them to a CGMutableImageMetadata type, before you assign the updated
metadata to an image.
func CGImageMetadataTagCreate(CFString, CFString?, CFString, CGImage
MetadataType, CFTypeRef) -> CGImageMetadataTag?
Creates a new image metadata tag, and fills it with the specified information.
Overview
Topics
Creating a Metadata Tag
Getting the Attributes of the Tag
Image I/O / CGImageMetadataTag
Class
CGImageMetadataTag
An immutable type that contains information about a single piece of image
metadata.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 8

func CGImageMetadataTagCopyNamespace(CGImageMetadataTag) -> CFString?
Returns an immutable copy of the tag’s XMP namespace.
func CGImageMetadataTagCopyPrefix(CGImageMetadataTag) -> CFString?
Returns an immutable copy of the tag’s prefix.
func CGImageMetadataTagCopyName(CGImageMetadataTag) -> CFString?
Returns an immutable copy of the tag’s name.
func CGImageMetadataTagCopyValue(CGImageMetadataTag) -> CFTypeRef?
Returns a shallow copy of the tag’s value, which is suitable only for reading.
func CGImageMetadataTagCopyQualifiers(CGImageMetadataTag) -> CFArray?
Returns a shallow copy of the metadata tags that act as qualifiers for the current tag.
func CGImageMetadataTagGetType(CGImageMetadataTag) -> CGImageMetadata
Type
Returns the type of the metadata tag’s value.
enum CGImageMetadataType
Constants that indicate the XMP type for a metadata tag.
func CGImageMetadataTagGetTypeID() -> CFTypeID
Returns the type identifier for the image metadata tag opaque type
Equatable, Hashable
Getting the Tag Type
Getting the Core Foundation Type
Relationships
Conforms To
See Also


## Page 9

class CGImageMetadata
An immutable object that contains the XMP metadata associated with an image.
class CGMutableImageMetadata
An opaque type for adding or modifying image metadata.
XMP Namespaces and Prefixes
Discover the public namespaces and prefixes that exist in XMP metadata tags.
let kCFErrorDomainCGImageMetadata: CFString
The domain for metadata-related errors that originate in the Image I/O framework.
enum CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.
XMP Metadata


## Page 10

let kCGImageMetadataNamespaceDublinCore: CFString
The namespace for the Dublin Core Metadata Element Set.
let kCGImageMetadataNamespaceExif: CFString
The namespace for the Exchangeable Image File (EXIF) format.
let kCGImageMetadataNamespaceExifAux: CFString
The namespace for EXIF auxiliary keys.
let kCGImageMetadataNamespaceExifEX: CFString
The namespace for the exifEX format.
let kCGImageMetadataNamespaceIPTCCore: CFString
The namespace for the IPTC format.
let kCGImageMetadataNamespacePhotoshop: CFString
The namespace for Photoshop image metadata.
let kCGImageMetadataNamespaceTIFF: CFString
The namespace for TIFF image metadata.
let kCGImageMetadataNamespaceXMPBasic: CFString
The namespace for the Extensible Metadata Platform (XMP) format.
let kCGImageMetadataNamespaceXMPRights: CFString
Topics
Public Namespaces
Image I/O / XMP Namespaces and Prefixes
API Collection
XMP Namespaces and Prefixes
Discover the public namespaces and prefixes that exist in XMP metadata tags.


## Page 11

The namespace for XMP metadata that conveys legal restrictions associated with a resource
let kCGImageMetadataPrefixDublinCore: CFString
The prefix string for tags in the Dublin Core Metadata Element Set.
let kCGImageMetadataPrefixExif: CFString
The prefix string for tags in the Exchangeable Image File (EXIF) metadata.
let kCGImageMetadataPrefixExifAux: CFString
The prefix string for tags in the EXIF auxiliary metadata collection.
let kCGImageMetadataPrefixExifEX: CFString
The prefix string for tags in the exifEX metadata.
let kCGImageMetadataPrefixIPTCCore: CFString
The prefix string for tags in the IPTC metadata.
let kCGImageMetadataPrefixPhotoshop: CFString
The prefix string for tags in the Photoshop image metadata.
let kCGImageMetadataPrefixTIFF: CFString
The prefix string for tags in the TIFF image metadata.
let kCGImageMetadataPrefixXMPBasic: CFString
The prefix string for tags in the XMP metadata.
let kCGImageMetadataPrefixXMPRights: CFString
The prefix string for tags in the XMP metadata that convey legal restrictions for the resource
class CGImageMetadata
An immutable object that contains the XMP metadata associated with an image.
class CGMutableImageMetadata
An opaque type for adding or modifying image metadata.
Public Prefixes
See Also
XMP Metadata


## Page 12

class CGImageMetadataTag
An immutable type that contains information about a single piece of image metadata.
let kCFErrorDomainCGImageMetadata: CFString
The domain for metadata-related errors that originate in the Image I/O framework.
enum CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.


## Page 13

class CGImageMetadata
An immutable object that contains the XMP metadata associated with an image.
class CGMutableImageMetadata
An opaque type for adding or modifying image metadata.
class CGImageMetadataTag
An immutable type that contains information about a single piece of image metadata.
XMP Namespaces and Prefixes
Discover the public namespaces and prefixes that exist in XMP metadata tags.
enum CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.
See Also
XMP Metadata
Image I/O / kCFErrorDomainCGImageMetadata
Global Variable
kCFErrorDomainCGImageMetadata
The domain for metadata-related errors that originate in the Image I/O framework
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 14

case unknown
An error that indicates an unknown condition occurred.
case unsupportedFormat
An error that indicates the metadata was in an unsupported format.
case badArgument
An error that indicates a parameter was malformed or contained invalid data.
case conflictingArguments
An error that indicates an attempt to save conflicting metadata values.
case prefixConflict
An error that indicates an attempt to register a namespace with a prefix that is different than
the namespace’s existing prefix.
Topics
Error Codes
Initializers
Image I/O / CGImageMetadataErrors
Enumeration
CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 15

init?(rawValue: Int32)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class CGImageMetadata
An immutable object that contains the XMP metadata associated with an image.
class CGMutableImageMetadata
An opaque type for adding or modifying image metadata.
class CGImageMetadataTag
An immutable type that contains information about a single piece of image metadata.
XMP Namespaces and Prefixes
Discover the public namespaces and prefixes that exist in XMP metadata tags.
let kCFErrorDomainCGImageMetadata: CFString
The domain for metadata-related errors that originate in the Image I/O framework.
Relationships
Conforms To
See Also
XMP Metadata


