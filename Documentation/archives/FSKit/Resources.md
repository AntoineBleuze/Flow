# Resources.pdf

## Page 1

FSResource is a base class to represent the various possible sources of data for a file system.
These range from dedicated storage devices like hard drives and flash storage to network
connections, and beyond. Subclasses define behavior specific to a given kind of resource, such a
FSBlockDeviceResource for disk partition (IOMedia) file systems. These file systems are
typical disk file systems such as HFS, APFS, ExFAT, ext2fs, or NTFS.
A resource’s type also determines its life cycle. Resources based on block storage devices come
into being when the system probes the media underlying the volumes and container. Other kinds 
resources, like those based on URLs, might have different life cycles. For example, a resource
based on a file:// URL might iniitalize when a person uses the “Connect to server” command 
the macOS Finder.
Some resources, like FSBlockDeviceResource, come in proxy and non-proxy variants. This
addresses the issue that opening an external device like /dev/disk2s1 requires an entitlement.
Proxy resources allow unentitled clients of FSKit to describe which disk an FSBlockDevice
Resource should represent. This allows, for example, the mount(8) tool to mount FSKit file
systems on block devices when run as root. The tool uses a proxy when executing a command lik
mount -t ffs /dev/disk2s1 /some/path, which prevents leaking privileged resource
access.
Overview
Proxying resources
FSKit / FSResource
Class
FSResource
An abstract resource a file system uses to provide data for a volume.
macOS 15.4+


## Page 2

func makeProxy() -> Self
Creates a proxy object of this resource.
func revoke()
Revokes the resource.
var isRevoked: Bool
A Boolean value that indicates whether the resource is revoked.
NSObject
FSBlockDeviceResource, FSGenericURLResource, FSPathURLResource
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Topics
Creating proxies
Revoking the resource
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

class FSBlockDeviceResource
A resource that represents a block storage disk partition.
class FSPathURLResource
A resource that represents a path in the system file space.
class FSGenericURLResource
A resource that represents an abstract URL.
See Also
Resources


## Page 4

A FSBlockDeviceResource can exist in either a proxied or nonproxied version. Only the
fskitd daemon creates “real” (nonproxied) instances of this class. Client applications and
daemons create proxy objects for requests, and fskitd opens the underlying device during the
processing of the request.
This class wraps a file descriptor for a disk device or partition. Its fundamental identifier is the BS
disk name (bsdName) for the underlying IOMedia object. However, FSBlockDeviceResource
doesn’t expose the underlying file descriptor. Instead, it provides accessor methods that can read
from and write to the partition, either directly or using the kernel buffer cache.
When you use a FSBlockDeviceResource, your file system implementation also conforms to a
maintenance operation protocol. These protocols add support for checking, repairing, and
optionally formatting file systems. The system doesn’t mount block device file systems until they
pass a file system check. For an FSUnaryFileSystem that uses FSBlockDeviceResource,
conform to FSManageableResourceMaintenanceOperations.
var bsdName: String
Overview
Topics
Accessing resource properties
FSKit / FSBlockDeviceResource
Class
FSBlockDeviceResource
A resource that represents a block storage disk partition.
macOS 15.4+


## Page 5

The device name of the resource.
var isWritable: Bool
A Boolean property that indicates whether the resource can write data to the device.
var blockCount: UInt64
The block count on this resource.
var blockSize: UInt64
The logical block size, the size of data blocks used by the file system.
var physicalBlockSize: UInt64
The sector size of the device.
func read(into: UnsafeMutableRawBufferPointer, startingAt: off_t, lengt
: Int) throws -> Int
Synchronously reads data from the resource into a buffer.
func read(into: UnsafeMutableRawBufferPointer, startingAt: off_t, lengt
: Int) async throws -> Int
Asychronously reads data from the resource into a buffer.
func read(into: UnsafeMutableRawBufferPointer, startingAt: off_t, lengt
: Int, completionHandler: (Int, (any Error)?) -> Void)
Reads data from the resource into a buffer and executes a closure afterwards.
func write(from: UnsafeRawBufferPointer, startingAt: off_t, length: Int
throws -> Int
Synchronously writes data from from a buffer to the resource and executes a block
afterwards.
func write(from: UnsafeRawBufferPointer, startingAt: off_t, length: Int
async throws -> Int
Asynchronously writes data from from a buffer to the resource.
func write(from: UnsafeRawBufferPointer, startingAt: off_t, length: Int
completionHandler: (Int, (any Error)?) -> Void)
Writes data from from a buffer to the resource and executes a closure afterwards.
Reading and writing data
Reading and writing data with kernel buffer cache


## Page 6

func metadataRead(into: UnsafeMutableRawBufferPointer, startingAt: off_
, length: Int) throws
Synchronously reads file system metadata from the resource into a buffer.
func metadataWrite(from: UnsafeRawBufferPointer, startingAt: off_t,
length: Int) throws
Synchronously writes file system metadata from a buffer to the resource.
func delayedMetadataWrite(from: UnsafeRawBufferPointer, startingAt: off
_t, length: Int) throws
Writes file system metadata from a buffer to a cache, prior to flushing it to the resource.
func metadataFlush() throws
Synchronously flushes the resource’s buffer cache.
func asynchronousMetadataFlush() throws
Asynchronously flushes the resource’s buffer cache.
func metadataClear([FSMetadataRange], withDelayedWrites: Bool) throws
Clears the given ranges within the buffer cache.
func metadataPurge([FSMetadataRange]) throws
Synchronously purges the given ranges from the buffer cache.
class FSMetadataRange
A range that describes contiguous metadata segments on disk.
FSResource
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Relationships
Inherits From
Conforms To


## Page 7

NSCoding
NSObjectProtocol
NSSecureCoding
class FSResource
An abstract resource a file system uses to provide data for a volume.
class FSPathURLResource
A resource that represents a path in the system file space.
class FSGenericURLResource
A resource that represents an abstract URL.
See Also
Resources


## Page 8

The URL passed to FSPathURLResource may be a security-scoped URL. If the URL is a securit
scoped URL, FSKit transports it intact from a client application to your extension.
init(url: URL, writable: Bool)
Creates a path URL resource.
var url: URL
The URL represented by the resource.
var isWritable: Bool
Overview
Topics
Creating a path URL resource
Accessing resource properties
FSKit / FSPathURLResource
Class
FSPathURLResource
A resource that represents a path in the system file space.
macOS 26.0+


## Page 9

A Boolean value that indicates whether the file system supports writing to the contents of th
path URL.
FSResource
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class FSResource
An abstract resource a file system uses to provide data for a volume.
class FSBlockDeviceResource
A resource that represents a block storage disk partition.
class FSGenericURLResource
A resource that represents an abstract URL.
Relationships
Inherits From
Conforms To
See Also
Resources


## Page 10

An FSGenericURLResource is a completely abstract resource. The only reference to its conten
is a single URL, the contents of which are arbitrary. This URL might represent a PCI locator string
like /pci@f0000000/usb@5, or some sort of network address for a remote file system. FSKit
leaves interpretation of the URL and its contents entirely up to your implementation.
Use the Info.plist key FSSupportedSchemes to provide an array of case-insensitive URL
schemes that your implementation supports. The following example shows how a hypothetical
FSGenericURLResource implementation declares support for the rsh and ssh URL schemes:
init(url: URL)
Overview
Topics
Creating a generic URL resource
FSKit / FSGenericURLResource
Class
FSGenericURLResource
A resource that represents an abstract URL.
macOS 26.0+


## Page 11

Creates a generic URL resource with the given URL.
var url: URL
The URL represented by the resource.
FSResource
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class FSResource
An abstract resource a file system uses to provide data for a volume.
class FSBlockDeviceResource
A resource that represents a block storage disk partition.
class FSPathURLResource
Accessing resource properties
Relationships
Inherits From
Conforms To
See Also
Resources


## Page 12

A resource that represents a path in the system file space.


