# 005_CMProjectionType.pdf

## Page 1

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


## Page 2

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


## Page 3

Create a set of stereo view interpretation options from a constant.
enum CMPackingType
The type of packing within each video frame, if any.


