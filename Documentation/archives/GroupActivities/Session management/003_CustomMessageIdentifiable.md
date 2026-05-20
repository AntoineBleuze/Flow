# 003_CustomMessageIdentifiable.pdf

## Page 1

Adopt this protocol in the custom types you use to send and receive messages during a group
activity. You use a GroupSessionMessenger object to send custom messages between the
same app on different devices. In addition to the message data, GroupSessionMessenger
encodes your custom type name so that it can construct the correct type on those other devices.
Use this protocol to identify your custom message types using an app-specific string instead of t
type name.
Providing an app-specific string makes it possible to use different types to support messages.
When the message data contains a custom message ID, GroupSessionMessenger looks for a
type that conforms to the protocol with a messageIdentifier property that contains the
matching string. It then creates that type and decodes the message data into it.
Note
Custom types that adopt this protocol must also adopt the Codable protocol.
Overview
Topics
Type Properties
Group Activities / CustomMessageIdentifiable
Protocol
CustomMessageIdentifiable
A type that assigns a custom ID string to messages you send to other devices.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

static var messageIdentifier: String
A custom identification string for the current type.
Required
Joining and managing a shared activity
Configure the session when a SharePlay activity starts, and handle events that occur during
the lifetime of the activity.
Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
class GroupSession
A session for an in-progress activity that synchronizes content among participant devices.
struct Participant
An active participant in a group session.
See Also
Session management


