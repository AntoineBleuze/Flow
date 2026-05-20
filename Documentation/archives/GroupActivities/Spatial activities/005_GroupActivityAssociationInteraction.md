# 005_GroupActivityAssociationInteraction.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

func groupActivityAssociation(GroupActivityAssociationKind?) -> some 
View
Specifies how a view should be associated with the current SharePlay group activity.
struct GroupActivityAssociationKind
An association a user-interface element can have with a SharePlay group activity.


