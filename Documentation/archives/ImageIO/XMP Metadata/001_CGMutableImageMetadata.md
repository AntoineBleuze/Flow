# 001_CGMutableImageMetadata.pdf

## Page 1

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


## Page 2

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


## Page 3

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


