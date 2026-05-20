# 003_CMTypedTag.pdf

## Page 1

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


## Page 2

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


## Page 3

enum CMPackingType
The type of packing within each video frame, if any.


