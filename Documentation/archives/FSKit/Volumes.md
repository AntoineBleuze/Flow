# Volumes.pdf

## Page 1

A file system, depending on its type, provides one or more volumes to clients. The FSUnaryFile
System by definition provides only one volume, while an FSFileSystem supports multiple
volumes.
You implement a volume for your file system type by subclassing this class, and also conforming t
the FSVolume.Operations and FSVolume.PathConfOperations protocols. This protocol
defines the minimum set of operations supported by a volume, such as mounting, activating,
creating and removing items, and more.
Your volume can provide additional functionality by conforming to other volume operations
protocols. These protocols add support for operations like open and close, read and write,
extended attribute (Xattr) manipulation, and more.
init(volumeID: FSVolume.Identifier, volumeName: FSFileName)
Creates a volume with the given identifier and name.
class Identifier
Overview
Topics
Creating a volume
FSKit / FSVolume
Class
FSVolume
A directory structure for files and folders.
macOS 15.4+


## Page 2

A type that identifies a volume.
class FSFileName
The name of a file, expressed as a data buffer.
var volumeID: FSVolume.Identifier
An identifier that uniquely identifies the volume.
var name: FSFileName
The name of the volume.
protocol Operations
Methods that all volumes implement to provide required capabilities.
protocol PathConfOperations
Properties implemented by volumes that support providing the values of system limits or
options.
protocol OpenCloseOperations
Methods and properties implemented by volumes that want to receive open and close calls f
each item.
protocol ReadWriteOperations
Methods implemented for read and write operations that deliver data to and from the
extension.
protocol AccessCheckOperations
Methods and properties implemented by volumes that want to enforce access check
operations.
protocol RenameOperations
Methods and properties implemented by volumes that support renaming the volume.
protocol FSVolumeKernelOffloadedIOOperations
Methods and properties implemented by volumes that use kernel-offloaded I/O to achieve
higher file transfer performance.
Accessing volume properties
Implementing required operations
Implementing optional operations


## Page 3

protocol PreallocateOperations
Methods and properties implemented by volumes that want to offer preallocation functions.
protocol XattrOperations
Methods and properties implemented by volumes that natively or partially support extended
attributes.
protocol ItemDeactivation
Methods and properties implemented by volumes that support deactivating items.
NSObject
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Identifiable
NSObjectProtocol
Relationships
Inherits From
Conforms To


