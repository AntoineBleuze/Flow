# 002_FSPathURLResource.pdf

## Page 1

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


## Page 2

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


