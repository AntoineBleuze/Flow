# 004_Participant.pdf

## Page 1

Configure your visionOS app for sharing with people nearby
Synchronizing data during a SharePlay activity
Use a Participant object to differentiate among users in a session. A participant object doesn
contain any sensitive data about the user, but provides a unique identifier to distinguish the user
while the session is active.
You don’t create participant objects directly. The system creates a participant object for each use
that joins an activity. Access the current set of participants from the activeParticipants
property of the GroupSession object associated with the activity.
let id: UUID
A globally unique identifier for the session participant.
Mentioned in
Overview
Topics
Getting the unique identifier
Group Activities / Participant
Structure
Participant
An active participant in a group session.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

var isNearbyWithLocalParticipant: Bool
A Boolean value that indicates whether the participant is physically nearby with the local
participant.
Copyable
CustomStringConvertible
Equatable
Hashable
Identifiable
Sendable
SendableMetatype
Joining and managing a shared activity
Configure the session when a SharePlay activity starts, and handle events that occur during
the lifetime of the activity.
Drawing content in a group session
Invite your friends to draw on a shared canvas while on a FaceTime call.
class GroupSession
A session for an in-progress activity that synchronizes content among participant devices.
protocol CustomMessageIdentifiable
A type that assigns a custom ID string to messages you send to other devices.
Instance Properties
Relationships
Conforms To
See Also
Session management


## Page 3



