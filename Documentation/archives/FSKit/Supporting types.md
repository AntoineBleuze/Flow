# Supporting types.pdf

## Page 1

This type is an option set in Swift. In Objective-C, you use the cases of this enumeration to create
bit field.
static var read: FSBlockmapFlags
A flag that describes a read operation.
static var write: FSBlockmapFlags
A flag that describes a write operation.
init(rawValue: UInt)
Overview
Topics
Declaring block map behaviors
Working with raw values
FSKit / FSBlockmapFlags
Structure
FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
macOS 15.4+


## Page 2

BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSExtentType
An enumeration of types of extents.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
class FSProbeResult
Relationships
Conforms To
See Also
Supporting types


## Page 3

An object that represents the results of a specific probe.


## Page 4

This type is an option set in Swift. In Objective-C, the cases of this enumeration combine to creat
a bit field.
static var read: FSCompleteIOFlags
A flag that describes a read operation.
static var write: FSCompleteIOFlags
A flag that describes a write operation.
static var async: FSCompleteIOFlags
A flag that requests that the file system module flush metadata I/O asynchronously.
Overview
Topics
Declaring I/O completion behaviors
Working with raw values
FSKit / FSCompleteIOFlags
Structure
FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
macOS 15.4+


## Page 5

init(rawValue: UInt)
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSExtentType
An enumeration of types of extents.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
Relationships
Conforms To
See Also
Supporting types


## Page 6

class FSProbeResult
An object that represents the results of a specific probe.


## Page 7

An FSEntityIdentifier is a UUID to identify a container or volume, optionally with eight byte
of qualifying (differentiating) data. You use the qualifiers in cases in which a file server can receive
multiple connections from the same client, which differ by user credentials. In this case, the
identifier for each client is the server’s base UUID, and a unique qualifier that differs by client.
Important
Don’t subclass this class.
init()
Creates an entity identifier with a random UUID.
init(uuid: UUID)
Creates an entity identifier with the given UUID.
Overview
Topics
Creating an entity identifier
FSKit / FSEntityIdentifier
Class
FSEntityIdentifier
A base type that identifies containers and volumes.
macOS 15.4+


## Page 8

init(uuid: UUID, data: Data)
Creates an entity identifier with the given UUID and qualifier data.
init(uuid: UUID, qualifier: UInt64)
Creates an entity identifier with the given UUID and qualifier data as a 64-bit unsigned integ
var uuid: UUID
A UUID to uniquely identify this entity.
var qualifier: Data?
An optional piece of data to distinguish entities that otherwise share the same UUID.
NSObject
FSContainerIdentifier, FSVolume.Identifier
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Identifiable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
Inspecting identifier properties
Relationships
Inherits From
Inherited By
Conforms To


## Page 9

SendableMetatype
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSExtentType
An enumeration of types of extents.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
class FSProbeResult
An object that represents the results of a specific probe.
See Also
Supporting types


## Page 10

Extents provide the kernel the logical-to-physical mapping of a given file. An extent describes a
physical offset on disk, and a length and a logical offset within the file. Rather than working with
extents directly, you use this type’s methods to provide or “pack” extent information, which FSKit
then passes to the kernel.
func packExtent(resource: FSBlockDeviceResource, type: FSExtentType,
logicalOffset: off_t, physicalOffset: off_t, length: Int) -> Bool
Packs a single extent to send to the kernel.
enum FSExtentType
An enumeration of types of extents.
Overview
Topics
Packing extents
FSKit / FSExtentPacker
Class
FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by
this file system.
macOS 15.4+


## Page 11

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
enum FSExtentType
An enumeration of types of extents.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
class FSProbeResult
Relationships
Inherits From
Conforms To
See Also
Supporting types


## Page 12

An object that represents the results of a specific probe.


## Page 13

case data
An extent type to indicate valid data.
case zeroFill
An extent type to indicate uninitialized data.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
Topics
Working with extent types
Working with raw values
Relationships
Conforms To
FSKit / FSExtentType
Enumeration
FSExtentType
An enumeration of types of extents.
macOS 15.4+


## Page 14

RawRepresentable
Sendable
SendableMetatype
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
class FSProbeResult
An object that represents the results of a specific probe.
See Also
Supporting types


## Page 15

case usable
The probe recognizes the resource and is ready to use it.
case usableButLimited
The probe recognizes the resource and is ready to use it, but only in a limited capacity.
case recognized
The probe recognizes the resource but can’t use it.
case notRecognized
The probe doesn’t recognize the resource.
init?(rawValue: Int)
Topics
Working with match results
Working with raw values
Relationships
FSKit / FSMatchResult
Enumeration
FSMatchResult
A type that represents the recognition and usability of a probed resource.
macOS 15.4+


## Page 16

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSExtentType
An enumeration of types of extents.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
class FSProbeResult
An object that represents the results of a specific probe.
Conforms To
See Also
Supporting types


## Page 17

This type represents a range that begins at startOffset and ends at startOffset +
segmentLength * segmentCount. Each segment in the range represents a single block in th
resource’s buffer cache.
For example, given an FSMetadataRange with the following properties:
startOffset = 0
segmentLength = 512
segmentCount = 8
The range represents eight segments: from 0 to 511, then from 512 to 1023, and so on until a fina
segment of 3584 to 4095.
Ensure that each metadata segment represents a range that’s already present in the resource’s
buffer cache. Similarly, ensure that each segment’s offset and length matches the offset and leng
of the corresponding block in the buffer cache.
Overview
Topics
Creating a metadata range
FSKit / FSMetadataRange
Class
FSMetadataRange
A range that describes contiguous metadata segments on disk.
macOS 15.4+


## Page 18

init(offset: off_t, segmentLength: UInt64, segmentCount: UInt64)
Initializes a metadata range with the given properties.
var startOffset: off_t
The start offset of the range in bytes.
var segmentLength: UInt64
The segment length in bytes.
var segmentCount: UInt64
The number of segments in the range.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
Accessing range properties
Relationships
Inherits From
Conforms To
See Also
Supporting types


## Page 19

struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSExtentType
An enumeration of types of extents.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSProbeResult
An object that represents the results of a specific probe.


## Page 20

For any result value other than FSMatchResult.notRecognized, ensure the name and
containerID values are non-nil. When a container or volume format doesn’t use a name, retu
an empty string. Also use an empty string in the case in which the format supports a name, but th
value isn’t set yet.
Some container or volume formats may lack a durable UUID on which to base a container identifie
This situation is only valid for unary file systems. In such a case, return a random UUID.
With a block device resource, a probe operation may successfully get a result but encounter an
error reading the name or UUID. If this happens, use whatever information is available, and provid
an empty string or random UUID for the name or container ID, respectively.
class func recognized(name: String, containerID: FSContainerIdentifier)
-> Self
Creates a probe result for a recognized file system.
Overview
Topics
Working with results
FSKit / FSProbeResult
Class
FSProbeResult
An object that represents the results of a specific probe.
macOS 15.4+


## Page 21

class func usable(name: String, containerID: FSContainerIdentifier) ->
Self
Creates a probe result for a recognized and usable file system.
class func usableButLimited(name: String, containerID: FSContainer
Identifier) -> Self
Creates a probe result for a recognized file system that is usable, but with limited capabilities
class var usableButLimited: FSProbeResult
A probe result for a recognized file system that is usable, but with limited capabilities.
class var notRecognized: FSProbeResult
A probe result for an unrecognized file system.
var containerID: FSContainerIdentifier?
The container identifier, as found during the probe operation.
var name: String?
The resource name, as found during the probe operation.
var result: FSMatchResult
The match result, representing the recognition and usability of a probed resource.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Working with result properties
Relationships
Inherits From
Conforms To


## Page 22

Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
struct FSBlockmapFlags
Flags that describe the behavior of a blockmap operation.
struct FSCompleteIOFlags
Flags that describe the behavior of an I/O completion operation.
class FSEntityIdentifier
A base type that identifies containers and volumes.
class FSExtentPacker
A type that directs the kernel to map space on disk to a specific file managed by this file
system.
enum FSExtentType
An enumeration of types of extents.
enum FSMatchResult
A type that represents the recognition and usability of a probed resource.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
See Also
Supporting types


