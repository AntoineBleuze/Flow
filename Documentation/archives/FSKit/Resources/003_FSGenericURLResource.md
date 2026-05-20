# 003_FSGenericURLResource.pdf

## Page 1

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


## Page 2

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


## Page 3

A resource that represents a path in the system file space.


