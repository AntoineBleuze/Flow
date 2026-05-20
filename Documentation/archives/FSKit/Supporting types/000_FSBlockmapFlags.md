# 000_FSBlockmapFlags.pdf

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


