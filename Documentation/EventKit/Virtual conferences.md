# Virtual conferences.pdf

## Page 1

EKVirtualConferenceProvider lets apps that offer virtual conferencing services to integrat
directly with events in users’ calendars. To add this support to your app, add a virtual conference
extension. The principal class of the app extension is a custom subclass of EKVirtual
ConferenceProvider that you create that provides the following:
A list of room types where events take place, such as Personal Room or Team Room
A descriptor for a virtual conference, including a user-visible title, one or more URLs, and
additional details
To provide a list of rooms, you provide one or more room type descriptors that contain details
about where a virtual conference takes place. Each room type descriptor includes a user-visible
title and an identifier that you choose. EventKit calls fetchAvailableRoomTypes(completio
Handler:) on your virtual conference provider to retrieve an array of EKVirtualConference
RoomTypeDescriptor objects.
After EventKit has the room type descriptors, users can add an event that specifies one of your
rooms as the location. To identify the virtual conference event, your virtual conference provider
Overview
Providing Room Details
Providing Conference Details
EventKit / EKVirtualConferenceProvider
Class
EKVirtualConferenceProvider
An object that associates virtual conferencing details with an event object in a
user’s calendar.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+
watchOS 8.0+


## Page 2

creates a virtual conference descriptor that contains details about the virtual conference. The
conference descriptor contains the following:
One or more EKVirtualConferenceURLDescriptor objects to specify how the user joins
the virtual conference
An optional user-visible title that EventKit may display
An optional user-visible string with details about the virtual conference that EventKit displays
EventKit calls fetchVirtualConference(identifier:completionHandler:) on your
virtual conference provider to retrieve an instance of EKVirtualConferenceDescriptor.
Important
Events that use your virtual conference descriptors may sync to other devices where your app
isn’t installed. To support links to your virtual conference regardless of whether your app is
installed, adopt universal links in your app. Universal links let you specify HTTP URLs that open
your app if it’s installed or open a corresponding web page if it’s not. For more information
about adopting universal links in your app, see Supporting universal links in your app.
func fetchAvailableRoomTypes(completionHandler: ([EKVirtualConference
RoomTypeDescriptor]?, (any Error)?) -> Void)
Provides an array of room types where events take place.
func fetchVirtualConference(identifier: EKVirtualConferenceRoomType
Identifier, completionHandler: (EKVirtualConferenceDescriptor?, (any
Error)?) -> Void)
Provides details about a virtual conference that takes place in a room the user selects.
Topics
Providing Rooms
Providing Virtual Conferences
Relationships
Inherits From


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSExtensionRequestHandling
NSObjectProtocol
class EKVirtualConferenceDescriptor
Details about a virtual conference that uses a custom room type.
class EKVirtualConferenceRoomTypeDescriptor
Details about a room where virtual conferences take place.
Conforms To
See Also
Virtual conferences


## Page 4

When users add events to their calendars and use one of the room types that your provider
defines, EventKit requests a virtual conference descriptor from your provider. Each virtual
conference descriptor contains:
A user-visible name for the virtual conference
One or more URLs that the users open to join the virtual conference
Optional details about the conference that may be helpful to users
Calendar uses the first URL that you provide as the preferred way for users to join a virtual
conference and displays additional URLs as links in the virtual conference details.
Important
Events that use your virtual conference descriptors may sync to other devices where your app
isn’t installed. To support links to your virtual conference regardless of whether your app is
installed, adopt universal links in your app. Universal links let you specify HTTP URLs that open
your app if it’s installed or open a corresponding web page if it’s not. For more information
about adopting universal links in your app, see Supporting universal links in your app.
Overview
Topics
EventKit / EKVirtualConferenceDescriptor
Class
EKVirtualConferenceDescriptor
Details about a virtual conference that uses a custom room type.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+
watchOS 8.0+


## Page 5

init(title: String?, urlDescriptors: [EKVirtualConferenceURLDescriptor]
conferenceDetails: String?)
Creates an object that describes a virtual conference, including a name and URL to join the
conference.
var title: String?
The user-visible name of the virtual conference.
var urlDescriptors: [EKVirtualConferenceURLDescriptor]
An array that contains objects with details about where to join the virtual conference.
class EKVirtualConferenceURLDescriptor
Details about how users join a virtual conference, including a title and URL.
var conferenceDetails: String?
Additional information about the conference that users may find helpful.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating Conference Descriptors
Configuring Virtual Conferences
Relationships
Inherits From
Conforms To


## Page 6

class EKVirtualConferenceProvider
An object that associates virtual conferencing details with an event object in a user’s calend
class EKVirtualConferenceRoomTypeDescriptor
Details about a room where virtual conferences take place.
See Also
Virtual conferences


## Page 7

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


## Page 8

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


