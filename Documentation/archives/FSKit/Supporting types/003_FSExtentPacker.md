# 003_FSExtentPacker.pdf

## Page 1

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


## Page 2

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


## Page 3

An object that represents the results of a specific probe.


