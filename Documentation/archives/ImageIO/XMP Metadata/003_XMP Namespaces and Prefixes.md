# 003_XMP Namespaces and Prefixes.pdf

## Page 1

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


## Page 2

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


## Page 3

class CGImageMetadataTag
An immutable type that contains information about a single piece of image metadata.
let kCFErrorDomainCGImageMetadata: CFString
The domain for metadata-related errors that originate in the Image I/O framework.
enum CGImageMetadataErrors
Constants for errors that occur when getting or setting metadata information.


