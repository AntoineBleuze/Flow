# Metadata.pdf

## Page 1

The Core Media framework provides two services: Metadata Identifier Services and the Metadata
Data Type Registry.
Metadata Identifier Services provide a means of encoding the metadata identifying tuple (four-by
key namespace and N-byte key value) into CFString, and back again.
The Metadata Data Type Registry allows a process to register metadata data types that conform t
a base data type and (optionally) other registered data types. The registry simplifies the process 
creating format descriptions for nontrivial metadata values and allowing clients to indicate how to
interpret metadata.
func CMMetadataCreateIdentifierForKeyAndKeySpace(allocator: CFAllocator
?, key: CFTypeRef, keySpace: CFString, identifierOut: UnsafeMutable
Pointer<CFString?>) -> OSStatus
Creates a URL-like string identifier that represents a key or keyspace tuple.
func CMMetadataCreateKeyFromIdentifier(allocator: CFAllocator?,
identifier: CFString, keyOut: UnsafeMutablePointer<CFTypeRef?>) ->
OSStatus
Creates a copy of the key by using an identifier.
Overview
Topics
Creating Metadata Identifiers
Core Media / CMMetadata
API Collection
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and
Metadata Data Type Registry.


## Page 2

func CMMetadataCreateKeyFromIdentifierAsCFData(allocator: CFAllocator?,
identifier: CFString, keyOut: UnsafeMutablePointer<CFData?>) -> OSStatu
Creates a copy of the key by using an identifier, and results in a core foundation data object.
func CMMetadataCreateKeySpaceFromIdentifier(allocator: CFAllocator?,
identifier: CFString, keySpaceOut: UnsafeMutablePointer<CFString?>) ->
OSStatus
Creates a copy of the keyspace by using an identifier.
func CMMetadataDataTypeRegistryRegisterDataType(CFString, description:
CFString, conformingDataTypes: CFArray) -> OSStatus
Register a data type with the data type registry.
func CMMetadataDataTypeRegistryDataTypeIsRegistered(CFString) -> Bool
Returns a Boolean value that indicates the registration status of a data type identifier.
func CMMetadataDataTypeRegistryGetDataTypeDescription(CFString) ->
CFString
Returns the data type description if it exists.
func CMMetadataDataTypeRegistryGetConformingDataTypes(CFString) ->
CFArray
Returns the conforming data types for the data type, if any.
func CMMetadataDataTypeRegistryDataTypeConformsToDataType(CFString,
conformsTo: CFString) -> Bool
Returns a Boolean value that indicates whether a data type conforms to another data type.
func CMMetadataDataTypeRegistryDataTypeIsBaseDataType(CFString) -> Bool
Returns a Boolean value that indicates whether a data type identifier represents a base data
type.
func CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(
CFString) -> CFString
Returns the base data type identifier that a data type conforms to.
func CMMetadataDataTypeRegistryGetBaseDataTypes() -> CFArray?
Returns an array of base data type identifiers.
Registering Metadata
Inspecting Metadata


## Page 3

Metadata Identifier Error Codes
Error codes that indicate metadata identifier errors.
Metadata Registry Error Codes
Error codes that indicate metadata registry errors.
Metadata Identifier Keyspaces
Constants that describe metadata identifier keyspaces.
Metadata Identifiers
Constants that describe metadata identifiers.
Metadata Base Data Types
Constants that describe metadata base data types.
Metadata Data Types
Constants that describe metadata data types.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
Constants
See Also
Metadata


## Page 4

struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
enum CMPackingType
The type of packing within each video frame, if any.


## Page 5

class CMTag
A tag to set additional metadata on media buffers.
Tag Values
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
Topics
Types
Constants
See Also
Metadata
Core Media / CMTag
API Collection
CMTag
Types and interfaces for working with Core Media tags.


## Page 6

CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
enum CMPackingType
The type of packing within each video frame, if any.


## Page 7

The Core Media framework uses tags to describe the properties of media channels. Each tag
consists of a category and a value, both of which are 64 bits in size.
Important
Tag data can only contain values that can be safely stored on disk. In particular, CMTag values
can’t contain a pointer. If you need to refer to another media element or in-memory data as
part of a tag, use a buffer index or other constant.
It’s recommended to use CMTypedTag instances where possible to preserve type safety.
static func channelID(Int64) -> CMTypedTag<Int64>
Creates a new channel ID tag from an integer.
Overview
Topics
Creating Tags
Core Media / CMTag
Class
CMTag
A tag to set additional metadata on media buffers.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 8

static func mediaSubType(CMFormatDescription.MediaSubType) -> CMTypedTa
<CMFormatDescription.MediaSubType>
Creates a tag containing media subtype metadata.
static func mediaType(CMFormatDescription.MediaType) -> CMTypedTag<
CMFormatDescription.MediaType>
Creates a tag containing media type metadata.
static func packingType(CMPackingType) -> CMTypedTag<CMPackingType>
Creates a tag containing frame-packing information.
static func pixelFormat(OSType) -> CMTypedTag<OSType>
Creates a tag containing pixel format information.
static func projectionType(CMProjectionType) -> CMTypedTag<CMProjection
Type>
Creates a tag containing projection surface information.
static func stereoView(CMStereoViewComponents) -> CMTypedTag<CMStereo
ViewComponents>
Creates a tag containing eye information for 3D video.
static func stereoViewInterpretation(CMStereoViewInterpretationOptions)
-> CMTypedTag<CMStereoViewInterpretationOptions>
Creates a tag containing information on how to interpret stereo view metadata.
static func trackID(CMPersistentTrackID) -> CMTypedTag<CMPersistentTrac
ID>
Creates a tag containing a track ID.
static func videoLayerID(Int64) -> CMTypedTag<Int64>
Creates a tag containing a video layer ID.
init(rawCategory: CMTag.RawCategory, rawTagValue: CMTag.Value)
Creates a new tag from a category and value.
let rawCategory: CMTag.RawCategory
The raw 64-bit representation of the tag’s category.
let rawTagValue: CMTag.Value
The tag’s contained value.
Inspecting Tags


## Page 9

func value<T>(onlyIfMatching: CMTypedTag<T>.Category) -> T?
Retrieves a tag’s value as a specific type, if and only if it matches a category.
enum Value
A wrapper type for a value associated with a tag.
typealias RawCategory
The raw 64-bit representation of a tag’s category.
CMTypedTag
CustomStringConvertible
Equatable
Sendable
SendableMetatype
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Wrapped Values
Type Aliases
Relationships
Inherited By
Conforms To
See Also
Metadata


## Page 10

Types and interfaces for working with Core Media tags.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
enum CMPackingType
The type of packing within each video frame, if any.


## Page 11

init(category: CMTypedTag<TypedValue>.Category, value: TypedValue)
Creates a new instance with the given category and value.
let category: CMTypedTag<TypedValue>.Category
The category of the tag.
var value: TypedValue
The value of the tag, represented as its appropriate type.
struct Category
An identifier for a media tag category.
Topics
Creating Typed Tags
Inspecting Typed Tags
Typed Tag Categories
Core Media / CMTypedTag
Class
CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type f
its value.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 12

CMTag
CustomStringConvertible
Equatable
Sendable
SendableMetatype
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
Relationships
Inherits From
Conforms To
See Also
Metadata


## Page 13

enum CMPackingType
The type of packing within each video frame, if any.


## Page 14

CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
enum CMPackingType
See Also
Metadata
Core Media / CMTagCollection
API Collection
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.


## Page 15

The type of packing within each video frame, if any.


## Page 16

case rectangular
Video content displays on a flat, rectangular 2D surface.
case equirectangular
Video content displays as a 360 degree equirectangular projection.
case halfEquirectangular
Video content displays as a 180 degree equirectangular projection.
case fisheye
Video content displays as a fisheye projection.
case parametricImmersive
Topics
Projection Surfaces
Enumeration Cases
Initializers
Core Media / CMProjectionType
Enumeration
CMProjectionType
Constants describing the projection surface information in a 3D video buffer or
channel.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 17

init?(rawValue: UInt64)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Relationships
Conforms To
See Also
Metadata


## Page 18

Create a set of stereo view interpretation options from a constant.
enum CMPackingType
The type of packing within each video frame, if any.


## Page 19

When no stereo view components are available on a video track, even if it’s encoded for multiview
video, any video content in the associated data is single-track 2D.
static var leftEye: CMStereoViewComponents
The stereo video track includes a left eye layer.
static var rightEye: CMStereoViewComponents
The stereo video track includes a right eye layer.
init(rawValue: UInt64)
Overview
Topics
Eye Layer
Initializers
Core Media / CMStereoViewComponents
Structure
CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 20

BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
Relationships
Conforms To
See Also
Metadata


## Page 21

enum CMPackingType
The type of packing within each video frame, if any.


## Page 22

static var additionalViews: CMStereoViewInterpretationOptions
A flag indicating that the video content contains additional views beyond the left or right eye
static var stereoOrderReversed: CMStereoViewInterpretationOptions
Changes the default ordering of eye data, switching it from left-to-right to right-to-left.
init(rawValue: UInt64)
Create a new option set with a given value.
BitwiseCopyable
Topics
Stereo View Options
Initializers
Relationships
Conforms To
Core Media / CMStereoViewInterpretationOptions
Structure
CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 23

Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
enum CMPackingType
The type of packing within each video frame, if any.
See Also
Metadata


## Page 24

Frame-packed video contains both the left and right eye images on a single video track. With
frame-packed video, use the appropriate Frame Arrangement.
case none
Each frame contains only a single image, and isn’t frame-packed.
case sideBySide
The video contains packed frames that have a left eye image on the left and right eye image
on the right.
case overUnder
The video contains packed frames that have a left eye image on the top and right eye image
on the bottom.
Overview
Topics
Frame Arrangement
Initializers
Core Media / CMPackingType
Enumeration
CMPackingType
The type of packing within each video frame, if any.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 25

init?(rawValue: UInt64)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and Metadata Data
Type Registry.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
struct CMStereoViewComponents
Relationships
Conforms To
See Also
Metadata


## Page 26

Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.


