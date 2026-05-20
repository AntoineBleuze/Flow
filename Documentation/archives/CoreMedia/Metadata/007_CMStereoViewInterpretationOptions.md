# 007_CMStereoViewInterpretationOptions.pdf

## Page 1

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


## Page 2

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


