# Spatial activities.pdf

## Page 1

SharePlay in visionOS helps people share activities together — for example, viewing a movie,
listening to music, playing a game, or sketching ideas on a whiteboard. Starting in visionOS 26,
SharePlay supports inviting nearby people who are wearing Apple Vision Pro to join a group activi
The system presents participants differently based on how they join the activity:
Nearby participants appear naturally via passthrough.
FaceTime participants who are wearing Apple Vision Pro appear as spatial Personas.
Participants on other devices appear in a standard FaceTime window.
Both nearby participants and spatial Personas can move spatially, make eye contact, and referenc
virtual content during an activity, enhancing the feeling of being together in the same room. Get
your visionOS app ready for sharing with people nearby by reviewing the APIs below that help you
create seamless connections among people — whether they’re in the same room or on FaceTime.
Note
If you’re new to SharePlay in visionOS, see Building a guessing game for visionOS for a
complete guide to building a visionOS SharePlay app.
SharePlay doesn’t require apps to distinguish between nearby and FaceTime participants. The
GroupActivities APIs you use to manage group sessions, exchange messages, and position
Overview
Verify your app’s nearby-sharing behavior
Group Activities / Configure your visionOS app for sharing with people nearby
Article
Configure your visionOS app for sharing
with people nearby
Create shared experiences for people wearing Vision Pro in the same room and
those on FaceTime.


## Page 2

content treat all participants the same. Your app doesn’t need separate code to support nearby
participants, so it typically already works when sharing with people nearby, but confirm the
following during testing:
Spatial assumptions
Confirm that your app doesn’t rely on the system to position nearby participants in specific
locations. SharePlay can dynamically reposition spatial Personas (FaceTime participants), but
not physical people (nearby participants). If your app requires participants to be in specific
locations, guide nearby participants to move to those locations using visual cues, like position
markers.
Share Window menu
Confirm that your activity is listed in the new Share Window menu located next to the window
bar. This is critical for the discovery of your app’s SharePlay activity. The easiest way to add
your activity to the Share Window menu is to include a hidden ShareLink in your app.
For more information, see Presenting SharePlay activities from your app’s UI.
Activity activation
If your app implements a custom SharePlay button, confirm that your app supports initiating 
activity when there isn’t an active FaceTime call. For visionOS, update the button’s action
handler to always call activate(), which now presents the new Share Window menu, and
remove any checks for isEligibleForGroupSession that guard activating the activity.
Important
To start your activity from the system’s Share Window menu, you need to donate it. If you don’t
donate your activity, the system defaults to window mirroring instead of SharePlay.
To observe when participants join and leave an activity use activeParticipants. To determin
if a Participant is nearby, use isNearbyWithLocalParticipant:
Distinguish between nearby and FaceTime participants


## Page 3

Because nearby participants can join a group activity, you can no longer assume a spatial
participant’s pose (position and orientation) matches their seat’s pose. When SharePlay applies a
SpatialTemplate, it moves FaceTime participants using their spatial Persona to their assigned
seats so their pose matches their seat’s pose. SharePlay can’t move a nearby participant, so the
participant’s pose can be different from their seat’s pose.
To observe the state of remote FaceTime and nearby participants use remoteParticipant
States.
To observe the state of the local participant, who is wearing Vision Pro, use local
ParticipantStates.
To position content relative to a participant, position the content relative to Participant
State.pose.
To position content relative to a participant’s seat, position the content relative to Participan
State.seat.pose.
Note
A participant’s pose and seat pose are snapshots, not continuous tracking data. They are
updated by the system at various points throughout a session, for example, when a new
SpatialTemplate is applied by the system or when a participant recenters.
To achieve consistent positioning of RealityKit entities across multiple devices in an immersive
space during a SharePlay session, enable support for a group immersive space using System
Coordinator.Configuration.supportsGroupImmersiveSpace. When enabled, visionO
automatically ensures entities with identical transforms appear in the same relative location for al
participants, including both nearby and remote participants.
Group immersive spaces handle this spatial consistency for entities with identical transforms, but
keep in mind that SharePlay doesn’t automatically synchronize changes to your app’s state. Your
app needs to maintain visual consistency across participants’ devices and you have full control
over what actions are synchronized. For example, if your app displays a cube with a position of [0
1, 0] at launch, the shared coordinate system causes everyone to see that cube at the same
position. However, if a participant creates a new cube, your app needs to use the GroupSession
Messenger to notify the other participants to reflect this change.
Position content relative to participants
Synchronize entity transforms across devices


## Page 4

When you’re sharing with people who are nearby, you may want to anchor shared virtual content t
objects in the real world. Unlike remote SharePlay with spatial Personas, when you’re sharing with
someone nearby, the real world is part of your shared context. To enable this, ARKit has support f
sharing world anchors that appear in the exact same place for all nearby participants.
To make a WorldAnchor shareable with nearby participants, initialize the anchor with the is
SharedWithNearbyParticipants property set to true with the init(originFromAncho
Transform:sharedWithNearbyParticipants:) initializer. ARKit then shares that anchor
with all nearby SharePlay participants via the anchorUpdates async sequence.
Your app can then attach an entity to that anchor to place it in the exact same world location for a
nearby participants.
Incorporate the real world in your app’s shared context


## Page 5

Important
ARKit does not share world anchors with remote participants. Apps still need to use Group
SessionMessenger to fully synchronize the position of these entities with all spatial
participants.
Adding spatial Persona support to an activity
Update your SharePlay activities to support spatial Personas and the shared context when
running in visionOS.
class SystemCoordinator
A type you use to coordinate your interface’s behavior when an active SharePlay session
supports spatial placement of content.
struct ParticipantState
A structure that tells you whether a participant supports a shared simulation space for the
current activity.
func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Specifies how a view should be associated with the current SharePlay group activity.
class GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.
See Also
Spatial activities


## Page 6

A person who participates in SharePlay activities on Apple Vision Pro has the option to participate
using their spatial Persona. The system arranges spatial Personas around the activity content,
giving each person a clear view of the content and each other. Each person sees the facial
expressions of other participants, what they’re looking at, and where they’re pointing. This
experience creates the feeling that they’re in the same physical space interacting with shared
content and each other.
To maintain the experience when spatial Personas are visible, apps share additional information to
maintain the shared context for the activity. Because participants can see where others are lookin
your app’s content must look the same for everyone. Share any additional information you need to
keep everyone’s content in sync visually. For example, synchronize your window’s scroll position t
ensure everyone sees the same portion of that window.
You don’t need to define new GroupActivity types specifically to support spatial Personas. Th
system automatically displays spatial Personas for existing activities that take place in a window o
volume. However, if you support activities in a Full Space, you need to do additional work to
support spatial Personas for your experience. For information about how to define activities in you
app, see Defining your app’s SharePlay activities.
You use scenes to manage the content for your app’s windows, volumes, and immersive spaces.
You also use scenes to display any activity-related content. When a participant joins an activity, th
system selects or opens the scene that supports the activity. If your app has only one scene and
Overview
Associate SharePlay activities with your app’s scenes
Group Activities / Adding spatial Persona support to an activity
Article
Adding spatial Persona support to an
activity
Update your SharePlay activities to support spatial Personas and the shared
context when running in visionOS.


## Page 7

one window, the system has only one choice. However, if your app has multiple scenes, you need 
help the system choose the correct one.
For each of your app’s scenes, activation conditions tell the system how to handle your app’s
SharePlay activities. You also use activation conditions to specify how to handle NSUserActivit
objects, and other incoming events. To specify activation conditions for one of your scenes:
For SwiftUI, add the handlesExternalEvents(preferring:allowing:) modifier to you
scene type.
For UIKit, configure the scene’s activationConditions property in the scene(_:will
ConnectTo:options:) method of your scene delegate.
When you add an activation condition to a scene, you specify a string that uniquely identifies you
SharePlay activity. The string can be anything you want, as long as it creates a unique connection
between the activity and the specific scene. When there is a one-to-one correspondence betwee
an activity and scene, the string in the activityIdentifier property of your activity object is
good choice. When there isn’t a one-to-one correspondence between scene and activity, you mu
create a string that uniquely identifies the scene. For example, in a document-based app, you
might specify the name of a document to direct the system to the scene that contains the
document.
The following code defines a SwiftUI scene for a window, and associates two activities with that
window. Because the app uses the same scene to display content for two different activities, the
activation conditions contain the identifiers for the two GroupActivity types. When either
activity starts, the system directs the activity to the window containing the scene. If no such
window is open, the system launches the app and creates the window as needed.
In addition to configuring your scene, you need to update your activity object’s metadata with the
appropriate string. Specify the string using the sceneAssociationBehavior property of your
activity object’s GroupActivityMetadata structure. Assign the default value to this propert
if you use the activity identifier as the string. For any custom strings, assign the content(_:)
value and specify your string. To disable scene association for the activity and handle the
presentation of activity-related UI yourself, specify the none value.
Configure your app’s support for spatial Personas


## Page 8

The system provides some default behaviors to make it easier for you to adopt spatial Personas in
your app. For activities that take place in a window or volume, the system chooses a default
arrangement of the spatial Personas around your scene. The system also adorns the scene with a
Share menu, which provides a visual indication when sharing is active and contains controls to sta
activities. The system doesn’t display spatial Personas in a Full Space by default.
To change the default behavior of your app, update the SystemCoordinator of your Group
Session before you call the session’s join() method. Use the SystemCoordinator to:
Specify a different arrangement for spatial Personas.
Specify whether your app supports spatial Personas when a Full Space is visible.
The following example changes the arrangement of spatial Personas to be side by side facing the
app’s content. The code also tells the system that the app supports spatial Personas when a Full
Space is open.
Spatial template preferences tell the system whether to arrange participants side by side, in a
circle, or in an arrangement that supports conversation. For each template, the system uses the
size of your content to determine how far away to place spatial Personas. For example, the system
moves them farther away when your content is larger, and brings them closer together when your
content is small. To override this distance, add the contentExtent(_:) modifier to your
template preference. That modifier tells the system to use the distance you specify, instead of the
content size.
If you enable support for spatial Personas in a Full Space, you must do additional work to support
that experience. When an activity moves to a Full Space, the system creates a shared coordinate
system for all participants and the content. In this new coordinate system, participants are no
longer at the center of the coordinate system, which might require you to update the position of
your content. For more information, see Place content relative to a participant in an immersive
space.
Synchronize additional data when spatial Personas are
visible


## Page 9

When spatial Personas are visible, it’s your responsibility to maintain the shared context for your
activity. The shared context includes both the content you display and how that content appears t
each participant. People can gesture or look at content using their spatial Persona, so it’s importa
that everyone sees the same thing when that happens. For example, Freeform synchronizes both
the page content and the current scroll position to ensure everyone sees the same portion of the
page.
When defining an activity, define additional data messages to synchronize any information you
need to maintain the shared context. When the current participant shows their spatial Persona,
send the extra messages when the participant makes relevant changes to the activity. For examp
send them when the person scrolls the activity window. Similarly, receive those messages and
incorporate the results into your app when the spatial Persona is visible.
Note
Make sure you separate the messages that all participants require from the ones that only
make sense when spatial Personas are visible. Maintaining the shared context is necessary
when spatial Personas are visible, but isn’t always necessary at other times. For example,
Freeform doesn’t synchronize the scroll position for someone without a spatial Persona.
To determine when someone’s spatial Persona is visible, monitor the localParticipantState
of your session’s SystemCoordinator object. The AsyncSequence in this property reports
participant-related state changes, including changes to the visibility of their spatial Persona. Get
the isSpatial property of the returned SystemCoordinator.ParticipantState structur
and use it to configure your app’s behavior. The following example uses a task to update the gam
state to accommodate spatial Personas. When the current participant is spatial, the game sends
additional messages to maintain the shared context.
Update the immersion level automatically for a Full Space


## Page 10

If one participant opens an immersive space as part of an activity, the system doesn’t automatica
open the same immersive space for other participants. Making a transition to an immersive space
a significant change, and some participants might not want to make the transition right away. For
example, if a participant is on a phone call, they might not want another app to open an immersive
space and hide their call. Instead, the system reports when transitions to immersive spaces occur
and lets you decide when to transition other participants automatically.
To determine when any participant transitions to an immersive space, monitor the group
ImmersionStyle property of your SystemCoordinator object. This property contains an
AsyncSequence that reports the most recent immersion style that a participant adopts. When a
participant presents an immersive space, or when they change the immersion style of the current
space, the system updates the sequence with the new value. The following example shows a task
that opens the immersive space with the same style as the group immersion style.
The system reports nil for the immersion style when a participant dismisses their open immersiv
space. Use that option to dismiss the space for other participants and return to a window or
volume.
Note
If a participant presses the Digital Crown while an immersive space is open, the system
dismisses the space without notifying the rest of the group. Someone might use this feature to
temporarily leave the activity and perform another task. After they perform that task, they can
use the system-provided UI to rejoin the activity and return to the group immersive space.
When an activity takes place in an immersive space, the system creates a shared coordinate
system for the participants and content. In this new coordinate space, the origin of the coordinate
space is not the same as the origin of any of the participants. If an activity-related window or
Place content relative to a participant in an immersive
space


## Page 11

volume is visible, the system places the window or volume at the new origin. If the activity doesn’
use a window or volume, the system arranges the participants in a circle and sets the origin of the
coordinate space to the circle’s center. The following figure shows the origin of the shared
coordinate system for a window, volume, and immersive space relative to several spatial Personas
In a side-by-side arrangement
with a window, the origin is
under the window.
In a surround arrangement with
a volume, the origin is under
the volume.
When no window or volume i
present, the system uses the
surround presentation style
and places the origin at the
center of the group.
If you place content directly into your immersive space, you must adjust the position of that conte
to account for the modified coordinate space. To do that, you first determine the person’s location
in the new coordinate system. Read the person’s location in the scene using a GeometryProxy3
The proxy for this reader contains a
doc://com.apple.documentation/documentation/swiftui/geometryproxy3d/immersivespacedisplac
ment(in:) method, which you can use to locate the origin of the shared coordinate space. Call the
method using the global value as a parameter to get the displacement of the coordinate space’
origin, relative to the person’s location. Invert that displacement value to get the location of the
participant relative in the new coordinate space. The following example shows how to use a
GeometryProxy3D to get the offset to the current participant and use that information to place 
custom view:
The displacement between a person and the origin of the scene doesn’t change during the cours
of your activity even when the participant moves. The system sets the origin of an immersive spac
when you first present it, and updates it only once when changing it to a shared coordinate space
See Also


## Page 12

Configure your visionOS app for sharing with people nearby
Create shared experiences for people wearing Vision Pro in the same room and those on
FaceTime.
class SystemCoordinator
A type you use to coordinate your interface’s behavior when an active SharePlay session
supports spatial placement of content.
struct ParticipantState
A structure that tells you whether a participant supports a shared simulation space for the
current activity.
func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Specifies how a view should be associated with the current SharePlay group activity.
class GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.
Spatial activities


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

Specifies how a view should be associated with the current SharePlay group activity.
class GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.


## Page 17

Adding spatial Persona support to an activity
A SystemCoordinator.ParticipantState structure reports the current person’s ability to
display a spatial Persona when joined to a group activity. A person can display a spatial Persona
only if the device supports it, and only if they configured that spatial Persona in advance.
When someone’s spatial Persona is active, SharePlay positions the person in the scene relative to
the shared content. When that happens, share any extra activity-related details that preserve the
shared context of the scene. For example, when one person scrolls the content in a shared windo
communicate the new scroll position as an activity update. When your app receives those extra
updates, apply them only if the current spatial Persona is also active.
Observe the participant’s spatial state from the localParticipantState property of your
session’s SystemCoordinator object. Spatial state information can change, so update your
app’s presentation to reflect the person’s current support for the activity.
Mentioned in
Overview
Topics
Group Activities / SystemCoordinator / SystemCoordinator.ParticipantState
Structure
SystemCoordinator.ParticipantState
A structure that tells you whether a participant supports a shared simulation spac
for the current activity.
visionOS 1.0+


## Page 18

let isSpatial: Bool
A Boolean value that indicates whether the person supports being in a shared simulation
space for an activity.
struct Seat
A seat assigned to a single participant in a spatial template.
let pose: Pose3D?
The position and rotation of the participant – at the time the system coordinator state last
changed.
let role: (any SpatialTemplateRole)?
The role assigned to this participant, if any.
let seat: SystemCoordinator.ParticipantState.Seat?
The seat assigned to this participant.
Equatable, Sendable, SendableMetatype
Configure your visionOS app for sharing with people nearby
Getting the participant details
Structures
Instance Properties
Relationships
Conforms To
See Also
Spatial activities


## Page 19

Create shared experiences for people wearing Vision Pro in the same room and those on
FaceTime.
Adding spatial Persona support to an activity
Update your SharePlay activities to support spatial Personas and the shared context when
running in visionOS.
class SystemCoordinator
A type you use to coordinate your interface’s behavior when an active SharePlay session
supports spatial placement of content.
func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Specifies how a view should be associated with the current SharePlay group activity.
class GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.


## Page 20

kind
If given, the kind of group activity association.
When a group of people join a SharePlay activity with their spatial Personas, the system selects a
common, primary scene to arrange their spatial Personas around. This association between the
group activity and a primary scene in your app creates a shared space for the spatial Personas to
interact in; enabling participants to gesture at the associated scene and understand each other. F
more information about spatial Personas and SharePlay on visionOS, see doc:adding-spatial-
persona-support-to-an-activity.
By default, the system uses your scene’s activation conditions in concert with your activity’s Scen
AssociationBehavior to select a scene to associate with the activity. You can specify a
different scene or dynamically change the associated scene by using this modifier to set a view’s
group activity association to GroupActivityAssociationKind/primary.
Parameters
Discussion
SwiftUI / View / groupActivityAssociation(_:)
Instance Method
groupActivityAssociation(_:)
Specifies how a view should be associated with the current SharePlay group
activity.
GroupActivities
SwiftUI
visionOS 26.0+


## Page 21

Tip
When building a custom SpatialTemplate, the scene with the primary association is the
SpatialTemplateElementPosition/app that each seat’s position is relative to.
If there are multiple scenes that are simultaneously configured with the primary group activity
association, the most recently associated scene will be used. For example, if your app defines two
windows and both contain views with the primary association kind, the most recently opened one
will be used as the primary scene. If that second window is subsequently closed, the original
window will be used again.
You can dynamically remove the group activity’s association with a view by setting the given kind 
nil instead of .primary.


## Page 22

When a group of people join a SharePlay activity with their spatial Personas, the system selects a
common, primary scene to arrange their spatial Personas around. This association between the
group activity and a scene in your app creates a shared space for the spatial Personas to interact
in; enabling participants to gesture at the associated scene and understand each other. For more
information about spatial Personas and SharePlay on visionOS, see Adding spatial Persona suppo
to an activity.
By default, the system uses your scene’s activation conditions in concert with your activity’s Scen
AssociationBehavior to select a primary scene to associate with the activity. You can specify
a different scene or dynamically change the primary associated scene by adding this interaction t
a view and specifying that view as the GroupActivityAssociationKind/primary group
activity association.
Tip
When building a custom SpatialTemplate, the primary associated scene is the app that
each seat’s position is relative to.
To add the interaction to a view, use addInteraction(_:).
Overview
Group Activities / GroupActivityAssociationInteraction
Class
GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group
activity.
GroupActivities
UIKit
visionOS 26.0+


## Page 23

If there are multiple scenes that are simultaneously configured with the primary group activity
association, the most recently associated scene will be used. For example, if your app defines two
windows and both contain views with the primary association kind, the most recently opened one
will be used as the primary scene. If that second window is subsequently closed, the original
window will be used again.
You can dynamically disable the group activity association of a view by setting the optional
associationKind property to nil. You can later re-associate it by setting the association
Kind to .primary.
init(associationKind: GroupActivityAssociationKind?)
Creates a group activity association interaction.
var associationKind: GroupActivityAssociationKind?
An optional value that indicates the kind of group activity association, if any.
Topics
Initializers
Instance Properties


## Page 24

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
UIInteraction
Configure your visionOS app for sharing with people nearby
Create shared experiences for people wearing Vision Pro in the same room and those on
FaceTime.
Adding spatial Persona support to an activity
Update your SharePlay activities to support spatial Personas and the shared context when
running in visionOS.
class SystemCoordinator
A type you use to coordinate your interface’s behavior when an active SharePlay session
supports spatial placement of content.
struct ParticipantState
A structure that tells you whether a participant supports a shared simulation space for the
current activity.
Relationships
Inherits From
Conforms To
See Also
Spatial activities


## Page 25

func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Specifies how a view should be associated with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.


## Page 26

Use values of this type in conjunction with the SwiftUI/View/groupActivity
Association(_:) view modifier or GroupActivityAssociationInteraction UI
interaction to set the scene associated with the current SharePlay activity.
static func primary(String) -> GroupActivityAssociationKind
A primary association with a SharePlay group activity that is identified by a given string value
Equatable
Hashable
Overview
Topics
Type Methods
Relationships
Conforms To
Group Activities / GroupActivityAssociationKind
Structure
GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity
visionOS 26.0+


## Page 27

Sendable
SendableMetatype
Configure your visionOS app for sharing with people nearby
Create shared experiences for people wearing Vision Pro in the same room and those on
FaceTime.
Adding spatial Persona support to an activity
Update your SharePlay activities to support spatial Personas and the shared context when
running in visionOS.
class SystemCoordinator
A type you use to coordinate your interface’s behavior when an active SharePlay session
supports spatial placement of content.
struct ParticipantState
A structure that tells you whether a participant supports a shared simulation space for the
current activity.
func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Specifies how a view should be associated with the current SharePlay group activity.
class GroupActivityAssociationInteraction
An interaction configures a view’s association with the current SharePlay group activity.
See Also
Spatial activities


