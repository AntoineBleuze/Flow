# 006_GroupActivityAssociationKind.pdf

## Page 1

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


## Page 2

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


