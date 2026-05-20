# 000_FSContainerIdentifier.pdf

## Page 1

The identifier is either a UUID or a UUID with additional differentiating bytes. Some network
protocols evaluate access based on a user ID when connecting. In this situation, when a file serve
receives multiple client connections with different user IDs, the server provides different file
hierarchies to each. For such systems, represent the container identifier as the UUID associated
with the server, followed by four or eight bytes to differentiate connections.
Important
Don’t subclass this class.
var volumeIdentifier: FSVolume.Identifier
The volume identifier associated with the container.
Overview
Topics
Accessing identifier properties
FSKit / FSContainerIdentifier
Class
FSContainerIdentifier
A type that identifies a container.
macOS 15.4+


## Page 2

FSEntityIdentifier
CVarArg
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
SendableMetatype
class FSContainerStatus
A type that represents a container’s status.
Relationships
Inherits From
Conforms To
See Also
Containers


