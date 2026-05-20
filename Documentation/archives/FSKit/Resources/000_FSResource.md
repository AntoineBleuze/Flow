# 000_FSResource.pdf

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


