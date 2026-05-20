# 001_FSCompleteIOFlags.pdf

## Page 1

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


## Page 2

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


## Page 3

class FSProbeResult
An object that represents the results of a specific probe.


