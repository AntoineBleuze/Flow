# 002_SystemCoordinator.pdf

## Page 1

Adding spatial Persona support to an activity
A SystemCoordinator object helps you coordinate the presentation of your app’s content whe
spatial placement is active. In visionOS, the system can present a SharePlay activity as if the
participants were together in the same room with the content. Each participant views the content
from a particular vantage point, and sees the changes that others make. The system handles the
placement of each participant’s spatial Persona relative to the content, but you handle any chang
to the content itself with the help of the SystemCoordinator object.
You don’t create a SystemCoordinator object directly. After you receive a GroupSession
object for an activity, retrieve the system coordinator from the session’s systemCoordinator
property. When you first retrieve the object, update its configuration property to tell the
system how you want to arrange participants in the scene. After that, use the information in the
system coordinator’s properties to keep your app’s interface up to date. When participants suppo
spatial placement, send additional data to synchronize your content for those participants. For
example, when one person scrolls the contents of a window, update the scroll position in the
window of other spatially aware participants to preserve the shared context for everyone.
You choose what information to share among participants, and you choose how to manage the
corresponding updates. A system coordinator object only helps you know when to make those
Mentioned in
Overview
Group Activities / SystemCoordinator
Class
SystemCoordinator
A type you use to coordinate your interface’s behavior when an active SharePlay
session supports spatial placement of content.
visionOS 1.0+


## Page 2

changes. Observe the object’s published properties to receive automatic updates when the value
change.
var configuration: SystemCoordinator.Configuration
The current configuration of the system coordinator.
struct Configuration
A structure that specifies your app’s support for activities that take place in a shared
simulation space.
var remoteParticipantStates: [Participant : SystemCoordinator.
ParticipantState]
var localParticipantState: SystemCoordinator.ParticipantState
The current participant’s level of support for an activity that takes place in a shared simulatio
space.
var localParticipantStates: SystemCoordinator.ParticipantStates
An asynchronous sequence that reports changes to the local participant’s state.
struct ParticipantStates
An asynchronous sequence that reports the current person’s ability to participate in a shared
context.
var groupImmersionStyle: SystemCoordinator.GroupImmersionStyles
The presentation style to apply to an immersive space for the current activity.
struct GroupImmersionStyles
An asynchronous sequence that contains one or more incoming immersion styles for you to
process.
Topics
Configuring the system coordinator
Getting the participant state
Getting the current immersion level
Assigning the local participant role


## Page 3

func assignRole(some SpatialTemplateRole)
Assigns the given spatial template role to the local participant.
func resignRole()
Resigns the local participant from their current spatial template role.
struct ParticipantState
A structure that tells you whether a participant supports a shared simulation space for the
current activity.
Observable, Sendable, SendableMetatype
Configure your visionOS app for sharing with people nearby
Create shared experiences for people wearing Vision Pro in the same room and those on
FaceTime.
Adding spatial Persona support to an activity
Update your SharePlay activities to support spatial Personas and the shared context when
running in visionOS.
struct ParticipantState
A structure that tells you whether a participant supports a shared simulation space for the
current activity.
func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Structures
Relationships
Conforms To
See Also
Spatial activities


## Page 4

Specifies how a view should be associated with the current SharePlay group activity.
class GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.


