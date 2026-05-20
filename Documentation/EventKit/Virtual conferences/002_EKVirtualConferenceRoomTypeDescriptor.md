# 002_EKVirtualConferenceRoomTypeDescriptor.pdf

## Page 1

To present a list of rooms where a virtual conference takes place, your virtual conference provide
creates one or more room type descriptors. Each descriptor contains a user-visible title and an
identifier of your choosing. When users create events using one of the rooms you provide, EventK
calls fetchVirtualConference(identifier:completionHandler:) and passes the
room’s identifier.
init(title: String, identifier: EKVirtualConferenceRoomTypeIdentifier)
Creates an object that describes a location where a virtual conference takes place.
var title: String
The user-visible name of a room where virtual conferences take place, such as Personal Roo
or Team Room.
Overview
Topics
Creating Room Type Descriptors
Configuring Room Type Descriptors
EventKit / EKVirtualConferenceRoomTypeDescriptor
Class
EKVirtualConferenceRoomTypeDescripto
Details about a room where virtual conferences take place.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+
watchOS 8.0+


## Page 2

var identifier: EKVirtualConferenceRoomTypeIdentifier
A unique string you choose that identifies the room.
typealias EKVirtualConferenceRoomTypeIdentifier
The type for a room type identifier.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class EKVirtualConferenceProvider
An object that associates virtual conferencing details with an event object in a user’s calend
class EKVirtualConferenceDescriptor
Details about a virtual conference that uses a custom room type.
Relationships
Inherits From
Conforms To
See Also
Virtual conferences


