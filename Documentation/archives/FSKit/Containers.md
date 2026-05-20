# Containers.pdf

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


## Page 3

This type contains two properties:
The state value that indicates the state of the container, such as FSContainerState.read
or FSContainerState.blocked.
The status is an error (optional in Swift, nullable in Objective-C) that provides further
information about the state, such as why the container is blocked.
Examples of statuses that require intervention include errors that indicate the container isn’t read
(POSIX EAGAIN or ENOTCONN), the container needs authentication (ENEEDAUTH), or that
authentication failed (EAUTH). The status can also be an informative error, such as the FSKit error
FSError.Code.statusOperationInProgress.
class func active(status: any Error) -> Self
Returns a active container status instance with the provided error status.
class func blocked(status: any Error) -> Self
Overview
Topics
Creating a container status instance
FSKit / FSContainerStatus
Class
FSContainerStatus
A type that represents a container’s status.
macOS 15.4+


## Page 4

Returns a blocked container status instance with the provided error status.
class func notReady(status: any Error) -> Self
Returns a not-ready container status instance with the provided error status.
class func ready(status: any Error) -> Self
Returns a ready container status instance with the provided error status.
var state: FSContainerState
A value that represents the container state, such as ready, active, or blocked.
enum FSContainerState
An enumeration of container state values.
var status: (any Error)?
An optional error that provides further information about the state.
class var active: FSContainerStatus
A status that represents an active container with no error.
class var ready: FSContainerStatus
A status that represents a ready container with no error.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Inspecting status properties
Using common status values
Relationships
Inherits From
Conforms To


## Page 5

Hashable
NSCopying
NSObjectProtocol
class FSContainerIdentifier
A type that identifies a container.
See Also
Containers


